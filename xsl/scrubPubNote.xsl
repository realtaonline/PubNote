<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                exclude-result-prefixes="xs xsd pn"
                version="2.0">

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="scrubPubNote.xsl" vocabulary="DocBook">
  <xs:title>Scrub PubNote markup from the input</xs:title>
  <para>
    A conforming processor is tolerant of foreign namespaces in XSL-FO XML
    instances. FOP is not tolerant, and so requires all non-XSL-FO constructs
    from the instance to be removed. This scrubs the PubNote constructs.
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Straightforward exclusion from identity model</xs:title>
  <para>
    Scrub undesirables and keep everything else.
  </para>
  <para>
    This is better than keeping only XSL-FO because sometimes XSL-FO has
    MathML, SVG, or other vocabularies recognized by a conforming processor.
  </para>
</xs:doc>

<xs:template>
  <para>
    The identity template is used to copy all nodes not already being handled
    by other template rules.
  </para>
</xs:template>
<xsl:template match="pn:* | @pn:*" mode="#all">
  <!--scrub anything in the PubNote namespace-->
</xsl:template>

<xs:template>
  <para>
    The identity template is used to copy all nodes not already being handled
    by other template rules.
  </para>
</xs:template>
<xsl:template match="@*|node()" mode="#all">
  <xsl:copy>
    <xsl:apply-templates mode="#current" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>