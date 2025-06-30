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
              <xsl:apply-templates select="html/body/div[@class='footer']"/>
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
<xsl:template match="div[@class=('pageInformation','footerInformation')]">
</xsl:template>

<xs:template>
  <para>Here is an element that is to be translated into HTML</para>
</xs:template>
<xsl:template match="div">
  <wp:p style="{@class}">
    <xsl:for-each select="node()">
      <xsl:choose>
        <xsl:when test="self::text()[normalize-space(.)]">
          <wp:run><xsl:copy-of select="."/></wp:run>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates select="."/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
  </wp:p>
</xsl:template>
  
<xs:template>
  <para>Handle a span</para>
</xs:template>
<xsl:template match="span">
  <wp:run style="{@class}">
    <xsl:apply-templates/>
  </wp:run>
</xsl:template>

<xs:template>
  <para>Handle a hyperlink</para>
</xs:template>
<xsl:template match="a">
  <wp:hyperlink href="{@href}">
    <wp:run style="link">
      <xsl:apply-templates/>
    </wp:run>
  </wp:hyperlink>
</xsl:template>

</xsl:stylesheet>