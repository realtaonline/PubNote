<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xs xsd pn"
                expand-text="yes"
                version="3.0">

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="PubNoteIndent.xsl" vocabulary="DocBook">
  <xs:title>Indent the input document</xs:title>
  <para>
    Whatever the XML input, copy it to the output indented using the
    stylesheet processor's algorithm, but without any document type
    declaration that may be present.
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file is assumed to be any XML document
  </para>
</xs:doc>

<xs:output>
  <para>Indent the output</para>
</xs:output>
<xsl:output indent="yes"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main logic</xs:title>
</xs:doc>

<xs:template>
  <para>This is an unexpected XML document</para>
</xs:template>
<xsl:template match="/">
  <xsl:copy-of select="."/>
</xsl:template>
  
</xsl:stylesheet>