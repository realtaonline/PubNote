<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                xmlns="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="xs xsd"
                expand-text="yes"
                version="2.0">

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="PubNoteRender.xsl" vocabulary="DocBook">
  <xs:title>Render a PubMed instance, both input and output</xs:title>
  <para>
    This stylesheet creates an XSL-FO instance suitable for publishing to PDF
    and for downstream processes to render to HTML and DOCX.
  </para>
</xs:doc>

<xsl:import href="PubNoteRender-en.xsl"/>
<xsl:import href="xlate/PubNote-xlate-short.xsl"/>

</xsl:stylesheet>
