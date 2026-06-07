<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="../xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xst="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xst c"
                expand-text="yes"
                version="3.0">

<xst:doc info="https://github.com/CraneSoftwrights/Crane-txt2xml"
        filename="Pubnote-ixml2xml.xsl" vocabulary="DocBook">
  <xst:title>Convert the output of an iXML processor into a PubNote document</xst:title>
  <para>
    When there is special handling necessary, it will go here. Meanwhile, the
    off-the-shelf serialization of the iXML output is sufficient.
  </para>
</xst:doc>

<!--note this has to be included and not imported to avoid import precedence-->
<xsl:include href="../../Crane-txt2xml/xsl/Crane-ixml2xml.xsl"/>

<!--========================================================================-->
<xst:doc>
  <xst:title>No PubMed-specific handling</xst:title>
</xst:doc>

</xsl:stylesheet>
