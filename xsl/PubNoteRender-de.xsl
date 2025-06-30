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

<xs:doc info="BSD-3-Lizenz - Copyright © https://RealtaOnline.com"
        filename="PubNoteRender-fr.xsl" vocabulary="DocBook">
  <xs:title>PubMed-Instanz mit deutschen Namen rendern</xs:title>
  <para>
    Dieses Stylesheet ruft das Rendering-Stylesheet mit deutschen
    Elementnamen auf.
  </para>
</xs:doc>

<xsl:import href="PubNoteRender-en.xsl"/>
<xsl:import href="xlate/PubNote-xlate-de.xsl"/>

</xsl:stylesheet>
