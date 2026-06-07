<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="../xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xst="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xst xs c pn"
                version="2.0">

<xsl:import href="../Crane-txt2xml/xsl/Crane-xml2txt.xsl"/>
<xsl:import href="xlate/PubNote-xlate-en.xsl"/>

<xs:doc info="https://GitHub.com/RealtaOnline/PubNote"
        filename="PubNote-xml2txt-en.xsl" vocabulary="DocBook">
  <xst:title>Configure Crane-xml2txt for use with PubNote in English</xst:title>
  <para>
    The off-the-shelf
    <ulink url="https://GitHub.com/CraneSoftwrights/Crane-txt2xml"
      >Crane-txt2xml</ulink> environment is configured for use with PubNote. 
  </para>
</xs:doc>

<xst:variable>
  <para>Populate info table from translation table</para>
  <para>
    The expected structure for each has a mandatory element= indicating
    the name of the element, an optional markdownSymbol= indicating the
    symbol used in mixed content to represent the element
  </para>
</xst:variable>
<xsl:variable name="c:infoLookup" as="document-node()" xml:lang="en">
  <xsl:document>
    <xsl:for-each select="$pn:xlateLookup/xlate">
      <labelInfo name="{@lookup}">
        <xsl:copy-of select="@mixed"/>
        <xsl:copy-of select="@replace"/>
        <xsl:copy-of select="@force-close"/>
        <xsl:for-each select="@markdown">
          <xsl:attribute name="markdownSymbol" select="."/>
        </xsl:for-each>
        <xsl:if test="normalize-space(.) and empty(@markdown)">
          <alias><xsl:value-of select="."/></alias>
        </xsl:if>
      </labelInfo>
    </xsl:for-each>
  </xsl:document>
</xsl:variable>

</xsl:stylesheet>
