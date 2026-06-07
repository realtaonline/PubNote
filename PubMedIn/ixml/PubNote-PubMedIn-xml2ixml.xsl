<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xst="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xst c map"
                version="3.0">

<xsl:import href="../../Crane-txt2xml/xsl/Crane-xsd2ixml.xsl"/>

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

<!--========================================================================-->
<xst:doc>
  <xst:title>Main logic</xst:title>
</xst:doc>

<xst:variable>
  <para>List the target namespaces of the XSD files to ignore</para>
</xst:variable>
<xsl:variable name="c:ignoreXSDtargetNS" as="xs:string*"
              select="'http://www.w3.org/1998/Math/MathML'"/>

<xst:variable>
  <para>List the target namespaces of the XSD files to skip declarations</para>
</xst:variable>
<xsl:variable name="c:forceClosedElementQNames" as="xs:QName*"
              select="QName('','AffiliationInfo')"/>

<xst:template>
  <para>
    Declare the document element of the input schema with trailing white-space
  </para>
</xst:template>
<xsl:template name="c:preamble">
  -__document_element = ( ArticleSet | Article ), __WS*.

{ disable MathML }
  mml_math = #0.

</xsl:template>

<xst:function>
  <para>Return an array of all possible name conventions</para>
</xst:function>
<xsl:function name="c:nameEntries" as="array(xs:string+)*">
  <xsl:param    name="c:name" as="xs:string"/>
  <xsl:variable name="c:nameSpacedOut" as="xs:string"
                select="replace( $c:name,'([a-z])([A-Z])','$1 $2')"/>

  <xsl:variable name="c:allNames" as="xs:string+"
                select="distinct-values(($c:name,$c:nameSpacedOut))"/>

  <xsl:for-each select="$c:allNames">
    <xsl:sequence select="array { tokenize(normalize-space(.),' ') }"/>
  </xsl:for-each>
</xsl:function>

</xsl:stylesheet>
