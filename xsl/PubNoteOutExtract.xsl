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
        filename="PubNoteExtract.xsl" vocabulary="DocBook">
  <xs:title>
    Extract PubmedArticle instances from a PubmedArticleSet instance</xs:title>
  <para>
    PubMed articles are available in sets that can be downloaded from the 
    <ulink url="https://ftp.ncbi.nlm.nih.gov/pubmed/baseline/"
               >https://ftp.ncbi.nlm.nih.gov/pubmed/baseline/</ulink> site.
  </para>
  <para>
    When unzipped, each resource is a very large PubmedArticleSet instance.
  </para>
  <para>
    This stylesheet outputs the individual PubmedArticle instances from
    the one input PubmedArticleSet instance. A subdirectory is created from
    the base name of the input file, and the output files are suffixed
    with ordinal position numbers from where the excerpts were taken. The
    invocation arguments are in play.
  </para>
  <para>
    If a PubmedArticle is passed to this stylesheet, it is automatically
    indented and output to a subdirectory of the basename so as not to
    disturb the original. No invocation arguments are utilized.
  </para>
  <para>
    Sample invocations:
  </para>
  <programlisting>
 $ # extract the first five articles from the article set
 $ saxon12pe -s:/Users/admin/t/pubmed25n0001.xml -xsl:PubNoteExtract.xsl ordinal-end=5
 $ # indent the specified article
 $ saxon12pe -s:/Users/admin/t/pubmed25n0001/pubmed25n0001-00003.xml -xsl:PubNoteExtract.xsl
</programlisting>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file is assumed to be a PubmedArticleSet document or
    a PubmedArticle document.
  </para>
</xs:doc>

<xs:param ignore-ns='yes'>
  <para>
    At which embedded article to start.
  </para>
</xs:param>
<xsl:param name="ordinal-start" select="1" as="xsd:integer"/>

<xs:param ignore-ns='yes'>
  <para>
    At which embedded article to end.
  </para>
</xs:param>
<xsl:param name="ordinal-end" select="()" as="xsd:integer?"/>

<xs:param ignore-ns="yes">
  <para>
    Indicate that the resulting instances are to be indented (which
    can greatly increase the size of the files)
  </para>
</xs:param>
<xsl:param name="indent" select="'no'" as="xsd:string"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main logic</xs:title>
</xs:doc>

<xs:template>
  <para>This is an unexpected XML document</para>
</xs:template>
<xsl:template match="/*">
  <xsl:message terminate="yes"
    >Unexpected input XML document element {{{namespace-uri(.)}}}{name(.)}
</xsl:message>
</xsl:template>
  
<xs:template>
  <para>The logic is all self-contained here</para>
</xs:template>  
<xsl:template match="/PubmedArticle" priority="1">
  <xsl:variable name="baseDir"
                select="replace(base-uri(root(.)),'\.[^.]*$','')"/>
  <xsl:variable name="baseName"
                select="replace($baseDir,'^.*/','')"/>
  <xsl:result-document href="{$baseDir}/{$baseName
                             }{if( $indent='yes' ) then '.indent' else ''}.xml"
                       indent="{$indent}"
     doctype-system="http://dtd.nlm.nih.gov/ncbi/pubmed/out/pubmed_250101.dtd">
    <xsl:copy-of select="."/>
  </xsl:result-document>
</xsl:template>

<xs:template>
  <para>The logic is all self-contained here</para>
</xs:template>  
<xsl:template match="/PubmedArticleSet" priority="1">
  <xsl:iterate select="PubmedArticle">
    <xsl:param name="i" select="1"/>
    <xsl:if test="$i >= $ordinal-start and
                  ( empty($ordinal-end) or $i &lt;= $ordinal-end )">
      <xsl:variable name="baseDir"
                    select="replace(base-uri(root(.)),'\.[^.]*$','')"/>
      <xsl:variable name="baseName"
                    select="replace($baseDir,'^.*/','')"/>
      <xsl:result-document href="{$baseDir}/{$baseName
                                 }-{format-number($i,'00001')
                                 }{if( $indent='yes' ) then '.indent' else ''
                                 }.xml"
                           indent="{$indent}"
     doctype-system="http://dtd.nlm.nih.gov/ncbi/pubmed/out/pubmed_250101.dtd">
        <xsl:copy-of select="."/>
      </xsl:result-document>
    </xsl:if>
    <xsl:next-iteration>
      <xsl:with-param name="i" select="$i + 1"/>
    </xsl:next-iteration>
  </xsl:iterate>
</xsl:template>

</xsl:stylesheet>