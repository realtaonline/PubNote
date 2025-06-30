<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                xmlns="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="xs xsd"
                expand-text="yes"
                version="2.0">

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="PubNoteRender-en.xsl" vocabulary="DocBook">
  <xs:title>Render a PubMed instance, both input and output</xs:title>
  <para>
    This stylesheet creates an XSL-FO instance suitable for publishing to PDF
    and for downstream processes to render to HTML and DOCX.
  </para>
</xs:doc>

<xsl:include href="xlate/PubNote-xlate-en.xsl"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters, globals, and input file</xs:title>
  <para>
    The input file is assumed to be a Pubmed document, either input or output.
  </para>
</xs:doc>

<xs:variable>
  <para>Page dimension to be overridden when needed</para>
</xs:variable>
<xsl:variable name="pn:pageWidth" as="xsd:string" select="'210mm'"/>
  
<xs:variable>
  <para>Page dimension to be overridden when needed</para>
</xs:variable>
<xsl:variable name="pn:pageHeight" as="xsd:string" select="'297mm'"/>

<xs:key>
  <para>Quick index into the element name translation list</para>
</xs:key>
<xsl:key name="pn:xlateLookup" match="xlate" use="@lookup"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main logic</xs:title>
</xs:doc>

<xs:template>
  <para>Establish the page geometry and flow</para>
</xs:template>
<xsl:template match="/">
  <root font-family="Noto Serif" font-size="10pt" id="__top">
    <xsl:attribute name="pn:title">
      <xsl:choose>
        <!--the title is based on the document type via document element-->
        <xsl:when test="exists( /ArticleSet )">Article Set</xsl:when>
        <xsl:when test="exists( /Article )">
          <xsl:value-of select="/*/AritcleTitle"/>
        </xsl:when>
        <xsl:when test="exists(/PubmedArticle)">
          <xsl:value-of select="/*/MedlineCitation/Article/
                                (ArticleTitle, Journal/Title)[1]"/>
        </xsl:when>
      </xsl:choose>
    </xsl:attribute>
    <!--page geometries-->
    <layout-master-set>
      <simple-page-master master-name="report" 
                          page-height="{$pn:pageHeight}"
                          page-width="{$pn:pageWidth}" 
                          margin-top="15mm" margin-bottom="15mm" 
                          margin-left="15mm" margin-right="15mm">
        <region-body region-name="report-body"
                     margin-bottom="10mm"/>
        <region-after region-name="report-after" extent="10mm"
                      display-align="after"/>
      </simple-page-master>
    </layout-master-set>
    
    <page-sequence master-reference="report">
      <!--a simple page footer-->
      <static-content flow-name="report-after">
        <table width="100%" font-size=".8em" table-layout="fixed">
          <table-column column-width="43%"/>
          <table-column column-width="14%"/>
          <table-column column-width="43%"/>
          <table-body>
            <table-row pn:footerInformation="" pn:html="div*footerInformation">
              <table-cell>
                <block>
         <xsl:value-of select="format-dateTime(adjust-dateTime-to-timezone(
                               current-dateTime(),xsd:dayTimeDuration('PT0H')),
                               '[Y0001]-[M01]-[D01] [H01]:[m01]Z')"/>
                </block>
              </table-cell>
              <table-cell>
                <block text-align="center">
                  <page-number/> / <page-number-citation-last ref-id="__top"/>
                </block>
              </table-cell>
              <table-cell>
                <block text-align="end">
                  <basic-link external-destination="https://RealtaOnline.com"
                              text-decoration="underline" color="blue">
                    <xsl:text>&lt;PubNote></xsl:text>
                  </basic-link>
                  <xsl:text> - </xsl:text>
                  <basic-link external-destination="https://RealtaOnline.com"
                              text-decoration="underline" color="blue">
                    <xsl:text>https://RealtaOnline.com</xsl:text>
                  </basic-link>
                </block>
              </table-cell>
            </table-row>
          </table-body>
        </table>
      </static-content>
      <!--the main report body-->
      <flow flow-name="report-body">
        <xsl:apply-templates/>
      </flow>
    </page-sequence>
  </root>
</xsl:template>

<xs:function>
  <para>Limit the depth of ancestors in style names</para>
  <xs:param name="pn:node">
    <para>Counting from here</para>
  </xs:param>
</xs:function>
<xsl:function name="pn:depth" as="xsd:integer">
  <xsl:param name="pn:node" as="node()"/>
  <xsl:for-each select="$pn:node">
    <xsl:sequence select="for $d in count(ancestor::*) - 1
                          return if( $d > 9 ) then 9 else $d"/>
  </xsl:for-each>
</xsl:function>

<xs:template>
  <para>
    The handling of every element is the same, save for title formatting
    of the document element.
  </para>
</xs:template>
<xsl:template match="*">
  <block start-indent="2em * {pn:depth(.)}"
         pn:html="div*depth{pn:depth(.)}">
    <xsl:if test="empty(parent::*)">
      <!--the document element is formatted more like a report title-->
      <xsl:attribute name="start-indent">0em</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>
      <xsl:attribute name="space-after">1em</xsl:attribute>
      <xsl:attribute name="font-size">1.5em</xsl:attribute>
      <xsl:attribute name="pn:html" select="'div*heading'"/>
    </xsl:if>
    <xsl:variable name="displayName" as="xsd:string">
      <xsl:variable name="lookupName"
                 select="key('pn:xlateLookup',name(.),$pn:xlateLookup)"/>
      <xsl:choose>
        <xsl:when test="exists($lookupName)">
          <xsl:value-of select="$lookupName"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="name(.)"/>
          <xsl:message select="$pn:warningTranslate, name(.)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <inline font-weight="bold" pn:html="span*label">
      <xsl:value-of select="$displayName"/>
    </inline>
    <xsl:if test="normalize-space(.) and
                  empty(.//*[matches(name(.),'^[A-Z]')])">
      <inline font-family="Noto Sans">
        <xsl:if test="$pn:spaceBeforeColon"><xsl:text> </xsl:text></xsl:if>
        <xsl:text>: </xsl:text>
        <xsl:apply-templates/>
      </inline>
    </xsl:if>
    <xsl:if test="exists(@*)">
      <inline color="red" font-size=".7em" font-family="Noto Sans"
              pn:html="span*attributeInformation">
        <xsl:text> [</xsl:text>
        <xsl:for-each select="@*">
          <xsl:if test="position()>1"><xsl:text> </xsl:text></xsl:if>
          <xsl:value-of select='concat(name(.),"=","""",.,"""")'/>
        </xsl:for-each>
        <xsl:text>]</xsl:text>
      </inline>
    </xsl:if>
  </block>
  <!--process non-inline child elements next-->
  <xsl:apply-templates select="*[matches(name(.),'^[A-Z]')]"/>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Inline formatting</xs:title>
</xs:doc>

<xs:template>
  <para>Boldface text</para>
</xs:template>
<xsl:template match="b">
  <inline font-weight="bold"><xsl:apply-templates/></inline>
</xsl:template>

<xs:template>
  <para>Italicized text</para>
</xs:template>
<xsl:template match="i">
  <inline font-style="italic"><xsl:apply-templates/></inline>
</xsl:template>

<xs:template>
  <para>Subscripted text</para>
</xs:template>
<xsl:template match="sub">
  <inline font-size=".7em" baseline-shift="sub">
    <xsl:apply-templates/>
  </inline>
</xsl:template>

<xs:template>
  <para>Superscripted text</para>
</xs:template>
<xsl:template match="sup">
  <inline font-size=".7em" baseline-shift="super">
    <xsl:apply-templates/>
  </inline>
</xsl:template>

<xs:template>
  <para>Underscored text</para>
</xs:template>
<xsl:template match="u">
  <inline text-decoration="underline"><xsl:apply-templates/></inline>
</xsl:template>

<xs:template>
  <para>No documentation on this element can be found</para>
</xs:template>
<xsl:template match="inf">
  <xsl:apply-templates/>
</xsl:template>

<xs:variable>
  <para>Colons are presented after a space in some languages</para>
</xs:variable>
<xsl:variable name="pn:spaceBeforeColon" as="xsd:boolean" select="false()"/>

</xsl:stylesheet>