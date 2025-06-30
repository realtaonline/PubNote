<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="../utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:pn="http://www.RealtaOnline.com/ns/PubNote"
                xmlns="http://www.w3.org/1999/xhtml"
                xpath-default-namespace="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="xs xsd pn"
                version="2.0">

<xs:doc info="BSD-3 License - Copyright © https://RealtaOnline.com"
        filename="pnfo2html.xsl" vocabulary="DocBook">
  <xs:title>Convert PubNote markup in XSL-FO into HTML</xs:title>
  <para>
    Convert the content of the XSL-FO into XHTML
  </para>
</xs:doc>

<xs:output>
  <para>
    Override inferred HTML markup conventions to enable downstream processing.
  </para>
</xs:output>
<xsl:output method="xml" omit-xml-declaration="yes" indent="yes"
           doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
           doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>HTML framework</xs:title>
</xs:doc>

<xs:template>
  <para>Everything needed to get started in the HTML</para>
</xs:template>
<xsl:template match="/">
  <html>
   <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
     <title><xsl:value-of select="/*/@pn:title"/> - &lt;PubNote></title>
     <style type="text/css">
.attributeInformation {
  font-size: .7em;
  color: red;
}

.body {
  font-family: sans-serif;
}

.depth0 { margin-left: 0em }
.depth1 { margin-left: 2em }
.depth2 { margin-left: 4em }
.depth3 { margin-left: 6em }
.depth4 { margin-left: 8em }
.depth5 { margin-left: 10em }
.depth6 { margin-left: 12em }
.depth7 { margin-left: 14em }
.depth8 { margin-left: 16em }
.depth9 { margin-left: 18em }

.heading {
  font-weight: bold;
  font-size: 1.5em;
  margin-bottom: 1em;
}

.footer {
  margin-top: 1em;
  font-size: .8em;
}

.footerInformation {
  display: none;
}

.label {
  font-family: serif;
  font-weight:bold;
}

.pageInformation {
  display: none
}
     </style>
   </head>
   <body class="body">
     <!--needed downstream-->
     <div class="pageInformation">
       <span class="pageWidth">
         <xsl:value-of
              select="/*/layout-master-set/simple-page-master[1]/@page-width"/>
       </span>
       <span class="pageHeight">
         <xsl:value-of 
             select="/*/layout-master-set/simple-page-master[1]/@page-height"/>
       </span>
     </div>
     
     <!--handle the content of the document-->
     <xsl:apply-templates/>
     
     <!--handle the footer-->
     <div class="footer">
       <xsl:apply-templates select="/*/page-sequence[1]/static-content//
                                    *[@pn:footerInformation]/node()"/>
     </div>
   </body>
 </html>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Content handling</xs:title>
</xs:doc>

<xs:template>
  <para>Here is an element that is to be translated into HTML</para>
</xs:template>
<xsl:template match="*[@pn:html]">
  <xsl:element name="{substring-before(@pn:html,'*')}">
    <xsl:attribute name="class" select="substring-after(@pn:html,'*')"/>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xs:template>
  <para>The footers have hyperlinks to be accommodated</para>
</xs:template>
<xsl:template match="basic-link">
  <a href="{@external-destination}">
    <xsl:apply-templates/>
  </a>
</xsl:template>

</xsl:stylesheet>