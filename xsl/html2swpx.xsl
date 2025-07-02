<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:wp="urn:ns:wordinator:simplewpml"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xs xsd pn wp"
                xpath-default-namespace="http://www.w3.org/1999/xhtml"
                version="2.0">

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="pnfo2html.xsl" vocabulary="DocBook">
  <xs:title>Convert HTML markup into SWPX for DOCX</xs:title>
  <para>
    Convert the content of the HTML file into SWPX for DOCX
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>SWPX framework</xs:title>
</xs:doc>

<xs:template>
  <para>Everything needed to get started in the SWPX</para>
</xs:template>
<xsl:template match="/">
  <wp:document xmlns:wp="urn:ns:wordinator:simplewpml">
    <wp:body>
      <wp:section type="nextPage">
        <wp:page-sequence-properties>
          <wp:page-number-properties start="1"/>
          <wp:page-margins bottom="20mm" footer="10mm"
                           left="15mm" right="15mm" top="30mm"/>
          <wp:headers-and-footers>
            <wp:footer>
              <wp:p>
                <xsl:for-each select="html/body/div[@class='footer']">
                  <xsl:call-template name="pn:flattenDecorationText"/>
                </xsl:for-each>
              </wp:p>
            </wp:footer>
          </wp:headers-and-footers>
          <wp:page-size width="{
(html/body/div[@class='pageInformation']/span[@class='pageWidth'],'210mm')[1]}"
                        height="{
(html/body/div[@class='pageInformation']/span[@class='pageHeight'],'297mm')[1]}"
                        orient="portrait"/>
        </wp:page-sequence-properties>
        <wp:body>
          <xsl:apply-templates select="html/body/node() except
                                       html/body/div[@class='footer']"/>
        </wp:body>
      </wp:section>
    </wp:body>
  </wp:document>
</xsl:template>

<xs:template>
  <para>This has been accommodated in the page description</para>
</xs:template>
<xsl:template match="div[@class=('pageInformation','footerInformation')]"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Element handling</xs:title>
</xs:doc>

<xs:template>
  <para>Here is a block-level element to be translated into HTML</para>
</xs:template>
<xsl:template match="div">
  <wp:p style="{@class}">
    <xsl:call-template name="pn:flattenDecorationText"/>
  </wp:p>
</xsl:template>
  
<xs:template>
  <para>Here is an inline-level element to be translated into HTML</para>
</xs:template>
<xsl:template match="span">
  <xsl:choose>
    <xsl:when test="not(@class=$pn:textAttributes)">
      <xsl:call-template name="pn:flattenDecorationText"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates></xsl:apply-templates>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
  
<xs:template>
  <para>Handle a hyperlink</para>
</xs:template>
<xsl:template match="a">
  <wp:hyperlink href="{@href}">
    <wp:run style="link">
      <!--prohibit rich markup in a DOCX hyperlink-->
      <xsl:value-of select="."/>
    </wp:run>
  </wp:hyperlink>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Text handling</xs:title>
</xs:doc>

<xs:variable>
  <para>Record which properties are being handled at the text level</para>
</xs:variable>
<xsl:variable name="pn:textAttributes" as="xsd:string*"
              select="('b','i','sub','sup','u')"/>

<xs:template>
  <para>Flatten the text, accommodating leading and trailing indentation</para>
</xs:template>
<xsl:template name="pn:flattenDecorationText">
  <xsl:apply-templates select="(.//text() |
                                .//*[not(@class=$pn:textAttributes)] )
                except ( node()[1][self::text()][not(normalize-space(.))],
                         node()[last()][self::text()][not(normalize-space(.))],
                         .//*[not(@class=$pn:textAttributes)]//text() )"/>
</xsl:template>

<xs:template>
  <para>Handle the text of a span accommodating decorations</para>
</xs:template>
<xsl:template match="div//text()">
  <wp:run>
    <xsl:for-each select="(ancestor::span)">
      <xsl:choose>
        <xsl:when test="@class='b'">
          <xsl:attribute name="bold" select="'true'"/>
        </xsl:when>
        <xsl:when test="@class='i'">
          <xsl:attribute name="italic" select="'true'"/>
        </xsl:when>
        <xsl:when test="@class='sub'">
          <xsl:attribute name="vertical-alignment" select="'subscript'"/>
        </xsl:when>
        <xsl:when test="@class='sup'">
          <xsl:attribute name="vertical-alignment" select="'superscript'"/>
        </xsl:when>
        <xsl:when test="@class='u'">
          <xsl:attribute name="underline" select="'single'"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="style" select="@class"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <xsl:value-of select="replace( .,'\s+',' ')"/>
  </wp:run>
</xsl:template>

</xsl:stylesheet>