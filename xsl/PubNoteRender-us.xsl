<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                xmlns="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="xs xsd pn"
                expand-text="yes"
                version="2.0">

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="PubNoteRender-us.xsl" vocabulary="DocBook">
  <xs:title>Render a PubMed instance using US-letter page geometry</xs:title>
  <para>
    This stylesheet invokes the rendering stylesheet with US-letter page
    geometry.
  </para>
</xs:doc>

<xsl:import href="PubNoteRender-en.xsl"/>

<xs:variable>
  <para>Page dimension to be overridden when needed</para>
</xs:variable>
<xsl:variable name="pn:pageWidth" as="xsd:string" select="'8.5in'"/>
  
<xs:variable>
  <para>Page dimension to be overridden when needed</para>
</xs:variable>
<xsl:variable name="pn:pageHeight" as="xsd:string" select="'11in'"/>

</xsl:stylesheet>
