<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xst="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xst c map pn"
                version="3.0">

<xsl:import href="PubNote-pubmedin-xml2ixml.xsl"/>
<xsl:import href="../xsl/xlate/PubNote-xlate-en.xsl"/>

<xst:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="PubNote-pubmedin-xml2ixml.xsl" vocabulary="DocBook">
  <xst:title>Convert Pubmed XSD to iXML patterns per Crane-txt2xml</xst:title>
  <para>
    This automates the generation of iXML from a schema.
  </para>
</xst:doc>

<!--========================================================================-->
<xst:doc>
  <xst:title>Invocation parameters and input file</xst:title>
  <para>
    The input file is an XSD grammar in the Venetian Blind structure
  </para>
  <para>
    If the input has the description of mixed content, this is assumed to 
    be simple text.
  </para>
</xst:doc>

<xst:function>
  <para>
    This is the alternate transformation of the name ... which is overridden
    by the language importing stylesheet
  </para>
  <xst:param name="c:name">
    <para>The element name to look up</para>
  </xst:param>
</xst:function>
<xsl:function name="c:nameEntries" as="array(xs:string+)*">
  <xsl:param    name="c:name" as="xs:string"/>
  <xsl:variable name="c:nameSpacedOut" as="xs:string"
                select="replace( $c:name,'([a-z])([A-Z])','$1 $2')"/>
  <xsl:variable name="c:nameLanguage" as="xs:string?"
                select="$pn:xlateLookup/*[@lookup=$c:name]"/>
  <xsl:variable name="c:nameLanguageSpacedOut" as="xs:string?"
                select="replace( $c:nameLanguage,'([a-z])([A-Z])','$1 $2')"/>

  <xsl:variable name="c:allNames" as="xs:string+"
                select="distinct-values(($c:name,$c:nameSpacedOut,
                                  $c:nameLanguage,$c:nameLanguageSpacedOut))
                        [normalize-space(.)]"/>

  <xsl:for-each select="$c:allNames">
    <xsl:sequence select="array { tokenize(normalize-space(.),' ') }"/>
  </xsl:for-each>
</xsl:function>

<xst:function>
  <para>
    This returns the lookup entry for the given name 
  </para>
  <xst:param name="c:name">
    <para>The element name to look up</para>
  </xst:param>
</xst:function>
<xsl:function name="c:nameLookup" as="element()?">
  <xsl:param    name="c:name" as="xs:string"/>
  <xsl:sequence select="$pn:xlateLookup/*[@lookup=$c:name]"/>
</xsl:function>

<xst:function>
  <para>
    This returns all of the unique mixed content markdown introducer strings
  </para>
</xst:function>
<xsl:function name="c:markdownIntroducers" as="attribute()*">
  <xsl:sequence select="$pn:xlateLookup/*[empty(@replace)]/@markdown"/>
</xsl:function>

</xsl:stylesheet>
