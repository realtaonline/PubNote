<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="../xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xst="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xst xs c pn"
                version="2.0">

<xsl:import href="PubNote-xml2txt-en.xsl"/>
<xsl:import href="xlate/PubNote-xlate-fr.xsl"/>

<xs:doc info="https://GitHub.com/RealtaOnline/PubNote"
        filename="PubNote-xml2txt-fr.xsl" vocabulary="DocBook">
  <xs:title>Configure Crane-xml2txt for use with PubNote in French</xs:title>
  <para>
    The off-the-shelf
    <ulink url="https://GitHub.com/CraneSoftwrights/Crane-txt2xml"
      >Crane-txt2xml</ulink> environment is configured for use with PubNote. 
  </para>
</xs:doc>

</xsl:stylesheet>
