<?xml version="1.0" encoding="US-ASCII"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xs xsd c pn"
                version="2.0">

<xsl:import href="xlate/PubNote-xlate-en.xsl"/>

<xs:doc info="https://GitHub.com/CraneSoftwrights/Crane-txt2xml"
        filename="PubNoteIn-txt2xml.xsl" vocabulary="DocBook">
  <xs:title>Common declarations in Crane-txt2xml environment</xs:title>
  <para>
    This fragment manages common code between different processes.
  </para>
</xs:doc>

<xs:variable>
  <para>Define the lookup table of strings for natural-language tagging</para>
  <para>
    Because the PubNote environment existed before the Crane-txt2xml
    environment, the table lookup information was structured slightly
    differently. This variable rearranges (not very much) the PubNote
    definition of translation tables into the Crane-txt2xml definition.
  </para>
  <para>
    The expected structure for each has a mandatory element= indicating
    the name of the element, an optional markdownSymbol= indicating the
    symbol used in markdown to represent the element
  </para>
  <programlisting><![CDATA[
    <elementLabel element="nameOfElement" markdownSymbol="markdownSymbol"
                  mixed=""?
      >elementLabelHere</elementLabel>
]]></programlisting>
</xs:variable>
<xsl:variable name="c:xlateLookup" as="document-node()" xml:lang="en">
 <xsl:document>
   <xsl:for-each select="$pn:xlateLookup[empty(@pubmedin='ignore')]">
     <elementLabel element="{@lookup}">
       <xsl:copy-of select="@mixed"/>
       <xsl:copy-of select="@force-close"/>
       <xsl:for-each select="@markdown">
         <xsl:attribute name="markdownSymbol" select="."/>
       </xsl:for-each>
       <xsl:copy-of select="."/>
     </elementLabel>
   </xsl:for-each>
 </xsl:document>
</xsl:variable>

</xsl:stylesheet>
