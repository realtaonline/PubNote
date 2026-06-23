<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xst="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xs xst c pn"
                version="2.0">
  
<xsl:import href="PubNote-xml2txt-en.xsl"/>

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="PubNote-xml2txt.xsl" vocabulary="DocBook">
  <xs:title>Configure Crane-xml2txt for use with PubMed for XML labels</xs:title>
  <para>
    The off-the-shelf
    <ulink url="https://GitHub.com/CraneSoftwrights/Crane-txt2xml"
      >Crane-txt2xml</ulink> environment is configured for use with PubMed
    with English labels. 
  </para>
</xs:doc>

<xst:variable>
  <para>Populate info table using element names, not language aliases</para>
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
        <xsl:if test="empty(@markdown)">
          <alias><xsl:value-of select="@lookup"/></alias>
        </xsl:if>
      </labelInfo>
    </xsl:for-each>
  </xsl:document>
</xsl:variable>

</xsl:stylesheet>
