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
  <xst:title>Convert an ISS document into a PubNote document</xst:title>
  <para>
    The Intermediate Sentence Syntax in Crane-txt2xml is the glue
    between an arbitrary sentence parser and the vocabulary-specific
    structure generator.
  </para>
  <para>
    This stylesheet follows the UBL serialization rules regarding
    aggregate and basic components, based on the presence of child text
    nodes or absence of child element nodes.
  </para>
</xst:doc>

<!--note this has to be included and not imported to avoid import precedence-->
<xsl:include href="../Crane-txt2xml/xsl/Crane-ixml2xml.xsl"/>

<!--========================================================================-->
<xst:doc>
  <xst:title>No PubMed-specific handling</xst:title>
</xst:doc>



</xsl:stylesheet>
