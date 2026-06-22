<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xst="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xst c map pn"
                version="3.0">

<xsl:import href="PubNote-pubmedin-en2ixml.xsl"/>
<xsl:import href="../xsl/xlate/PubNote-xlate-fr.xsl"/>

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
    The input file is an XSD grammar in the Garden of Eden structure
  </para>
  <para>
    If the input has the description of mixed content, this is assumed to 
    be simple text.
  </para>
</xst:doc>

</xsl:stylesheet>
