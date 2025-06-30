<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
              xmlns:xv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary"
                exclude-result-prefixes="xs xv"
                version="1.0">

<!--the stylesheets implementing the XSLStyle&#x2122; semantics-->
<xsl:import href="xslstyle-core.xsl"/>

<xs:doc filename="xslstyle-xhtml-core.xsl" internal-ns="xv xs" 
        vocabulary="DocBook"
  info="$Id: xslstyle-xhtml-core.xsl,v 1.6 2010/08/17 01:29:05 admin Exp $">
  <xs:title>XHTML core for the XSLStyle&#x2122; environment</xs:title>
  <para>
    This core for XSLStyle&#x2122; assumes that the embedded constructs
    are in the HTML or XHTML vocabulary.  The output is simple HTML in
    no namespace.
  </para>
  <programlisting>
Copyright (C) - Crane Softwrights Ltd. 

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice, 
  this list of conditions and the following disclaimer. 
- Redistributions in binary form must reproduce the above copyright notice, 
  this list of conditions and the following disclaimer in the documentation 
  and/or other materials provided with the distribution. 
- The name of the author may not be used to endorse or promote products 
  derived from this software without specific prior written permission. 

THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR 
IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN 
NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Note: for your reference, the above is the "Modified BSD license", this text
      was obtained 2002-12-16 at http://www.xfree86.org/3.3.6/COPYRIGHT2.html#5
</programlisting>
</xs:doc>

<xs:variable>
  <para>Identification of the embedded vocabulary</para>
</xs:variable>
<xsl:variable name="xv:vocabulary" select="'XHTML'"/>

<xs:template>
  <para>Where things begin at the root node of the source tree.</para>
  <xs:param name="internal">
    <para>Indicates the root node is being pushed internally after
          all of the documentation has been harvested from the input.</para>
  </xs:param>
</xs:template>
<xsl:template match="/">
  <xsl:param name="internal" select="false()"/>
  <xsl:choose>
    <xsl:when test="xs:*">
      <!--acting internally, any imported stylesheets are irrelevant-->
      <xsl:apply-templates/>
    </xsl:when>
    <xsl:when test="$internal">
      <!--there are no formatting stylesheets, so simply copy to the result-->
      <xsl:apply-templates select="." mode="xs:strip-ns"/>
    </xsl:when>
    <xsl:otherwise>
      <!--first time through: harvest the documentation from the stylesheet-->
      <xsl:apply-templates select="*" mode="xs:body"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Using the HTML/XHTML vocabulary</xs:title>
  <para>
    The HTML/XHTML vocabulary is flat and as such there is no hieararchy
    of sections corresponding to the familiar HTML heading elements
    <literal>h1</literal>, <literal>h2</literal>, etc.  But such are needed,
    and thus are implemented here, for an environment such as XSLStyle, in
    order to get navigation constructs such as the table of contents and
    section numbers.
  </para>
  <para>
    When using HTML/XHTML with XSLStyle, avoid using the heading elements
    at all times possible.  Rather, use <literal>&lt;xs:section></literal>
    and <literal>&lt;xs:title</literal> instead, and these will produce
    the required headings while at the same time the required navigation
    constructs.
  </para>
  <para>
    See the <ulink url="xhtmlex.xsl"><literal>xhtmlex.xsl</literal></ulink>
    example to see this in use.
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>High-level elements of result tree</xs:title>
  <para>
    These templates handle the structuring of the higher-levels of the result
    tree.
  </para>
</xs:doc>

<xs:template>
  <para>The document element of the result.</para>
</xs:template>
<xsl:template name="xv:format-document">
  <html>
    <head>
      <title>
        <xsl:value-of select="xs:title"/>
      </title>
      <xsl:if test="normalize-space($xv:external-css)">
        <link rel="stylesheet" href="{$xv:external-css}"
              type="text/css"/>
      </xsl:if>
      <xsl:if test="normalize-space($xv:internal-css)">
        <style type="text/css">
          <xsl:copy-of select="$xv:internal-css"/>
        </style>
      </xsl:if>
    </head>
    <body>
      <h2>
        <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
      </h2>
      <hr/>
      <xsl:if test="normalize-space($xv:show-toc)='yes'"><xs:toc/></xsl:if>
      <xsl:call-template name="xs:process-body"/>
    </body>
  </html>
</xsl:template>

<xs:template>
  <para>The titling and presentation of the import tree.</para>
</xs:template>
<xsl:template name="xv:format-tree">
  <xsl:if test="normalize-space($xv:show-tree)='yes'">
    <p class="xsl-subtitle-import-include">
      <b>
        Import/include tree (in order of importance; reverse import order)
      </b>
    </p>
    <ul class="xsl-list-import-include">
      <li>
        <span class="xsl-list-import-include-item">
          <xsl:call-template name="xv:format-file-information"/>
        </span>
        <ul>
          <xsl:call-template name="xs:collect-and-format-tree-entries"/>
        </ul>
      </li>
    </ul>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>The formatting of a single entry in the import tree.</para>
  <xs:param name="href">
    <para>The URI used to access the module for this entry.</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:format-tree-entry">
  <xsl:param name="href"/>
  <li>
    <a href="#{generate-id(/)}">
      <xsl:choose>
        <xsl:when test="xs:doc[@info]">
          <span class="xsl-list-import-include-item">
            <xsl:call-template name="xv:format-file-information">
              <xsl:with-param name="href" select="$href"/>
            </xsl:call-template>
          </span>
        </xsl:when>
        <xsl:otherwise>
          <samp class="xsl-list-import-include-item">
            <xsl:value-of select="$href"/>
          </samp>
        </xsl:otherwise>
      </xsl:choose>
    </a>
    <xsl:variable name="list-contents">
      <xsl:if test="xs:doc[@info] or $xslstyle-force-full-import-tree">
        <xsl:call-template name="xs:collect-and-format-tree-entries"/>
      </xsl:if>
    </xsl:variable>
    <xsl:if test="string($list-contents)">
      <ul>
        <xsl:copy-of select="$list-contents"/>
      </ul>
    </xsl:if>
  </li>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Input parameter summary</xs:title>
  <para>
    These templates handle the presentation of the summary of input parameters.
  </para>
</xs:doc>

<xs:template>
  <para>The titling and presentation of the input params.</para>
  <xs:param name="params">
    <para>Collection of all invocation parameters found</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:format-input-params">
  <xsl:param name="params" select="/.."/>
  <xsl:if test="normalize-space($xv:show-params)='yes'">
    <p class="xsl-subtitle-invocation">
     <b>
      Available invocation parameter<xsl:if test="count($params)>1">s</xsl:if>
      <xsl:if test="$params/@required='yes'">
        ('**' indicates a required parameter)
      </xsl:if>
     </b>
    </p>
    <ul class="xsl-list-invocation">
      <xsl:call-template name="xs:order-params">
        <xsl:with-param name="params" select="$params"/>
      </xsl:call-template>
    </ul>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>The titling and presentation of the specialization params.</para>
  <xs:param name="params">
    <para>Collection of all specialization variables found</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:format-spec-params">
  <xsl:param name="params" select="/.."/>
  <xsl:if test="normalize-space($xv:show-spec-params)='yes'">
    <p class="xsl-subtitle-specialization">
      <b>
   Available specialization parameter<xsl:if test="count($params)>1">s</xsl:if>
      </b>
    </p>
    <ul class="xsl-list-specialization">
      <xsl:call-template name="xs:order-params">
        <xsl:with-param name="params" select="$params"/>
      </xsl:call-template>
    </ul>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>The formatting of a single entry in the input parameters.</para>
</xs:template>
<xsl:template name="xv:format-param">
  <li>
    <a href="#{@idref}" class="xsl-input-parameter-link">
      <samp class="xsl-input-parameter-name">
        <xsl:value-of select="@name"/>
      </samp>
      <xsl:if test="@required='yes'"> ** </xsl:if>
      <xsl:text> (</xsl:text>
      <span class="xsl-input-parameter-module-title">
        <xsl:apply-templates mode="xs:body" select="node()"/>
      </span>
      <xsl:text> - </xsl:text>
      <samp class="xsl-input-parameter-module-name">
        <xsl:value-of select="@file"/>
      </samp>
      <xsl:text>)</xsl:text>
    </a>
  </li>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Formatting of module and group information</xs:title>
</xs:doc>

<xs:template>
  <para>
    A module is an XSLT stylesheet.  Report the main xs:doc
    information (distinguished from group information).
  </para>
  <xs:param name="path">
    <para>The path used to address this stylesheet module.</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:format-module">
  <xsl:param name="path"/>
  <xs:section id="{generate-id(.)}" class="xsl-section">
    <xsl:copy-of select="@id"/>
    <xsl:choose>
      <xsl:when test="not(xs:doc[@info])">
        <xs:title>
          <samp>
            <xsl:value-of select="$path"/>
          </samp>
        </xs:title>
      </xsl:when>
      <xsl:when test="not( xs:doc[@info]/@vocabulary=$xv:vocabulary )">
        <xsl:for-each select="xs:doc[@info]">
          <xs:title>
              <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
              <xsl:text> - </xsl:text>
              <samp><xsl:value-of select="@filename"/></samp>
          </xs:title>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="xs:doc[@info]">
          <xs:title>
              <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
              <xsl:text> - </xsl:text>
              <samp><xsl:value-of select="@filename"/></samp>
          </xs:title>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
      <xsl:when test="not(xs:doc[@info])">
        <p>
          This module has no embedded XSLStyle&#x2122; documentation 
          with an <samp>info=</samp> attribute.
        </p>
      </xsl:when>
      <xsl:when test="not( xs:doc[@info]/@vocabulary=$xv:vocabulary )">
        <p>
          This module has embedded XSLStyle&#x2122; documentation 
          but the <samp>vocabulary=</samp> attribute  does not 
          match the stylesheets being used.
      </p>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="xs:doc[@info]">
          <!--some metadata-->
          <xsl:if test="string($path)">
            <p>
              Path: <samp><xsl:value-of select="$path"/></samp>
            </p>
          </xsl:if>
          <xsl:if test="$path != @filename">
            <p class="xsl-subtitle-filename">
              Filename: <samp class="xsl-subtitle-filename-name"
                             ><xsl:value-of select="@filename"/></samp>
            </p>
          </xsl:if>
          <!--list of imports and inclusions-->
          <xsl:if test="../xsl:import | ../xsl:include">
            <p class="xsl-subtitle-import">
              <xsl:if test="../xsl:import">
                <xsl:text>Import</xsl:text>
                <xsl:if test="../xsl:include"> and inclusion</xsl:if>
              </xsl:if>
              <xsl:if test="../xsl:include">
                <xsl:if test="not(../xsl:import)">
                  <xsl:text>Inclusion</xsl:text>
                </xsl:if>
              </xsl:if>
              <xsl:text> statement</xsl:text>
              <xsl:if test="count(../xsl:include | ../xsl:import)>1">s</xsl:if>              <xsl:text>:</xsl:text>
            </p>
            <ul class="xsl-list-section-imports">
              <xsl:for-each select="( ../xsl:import | ../xsl:include )/@href">
                <xsl:variable name="href" select="."/>
                <xsl:for-each select="document(.,.)/xsl:*">
                  <li class="xsl-list-section-imports-item">
                    <xsl:call-template name="xv:format-file-information">
                      <xsl:with-param name="href" select="$href"/>
                    </xsl:call-template>
                  </li>
                </xsl:for-each>
              </xsl:for-each>
            </ul>
          </xsl:if>
          <!--more metadata-->
          <pre><xsl:value-of select="@info"/></pre>
          <!--sheet-wide documentation-->
          <xsl:apply-templates mode="xs:body"
                         select="*[not(self::xs:title)]"/>
        </xsl:for-each>
        <xsl:call-template name="xs:report-top-level-elements"/>
        <xsl:call-template name="xs:report-documented-groups"/>
      </xsl:otherwise>
    </xsl:choose>
  </xs:section>
</xsl:template>

<xs:template>
  <para>
    A group delimits a set of top-level constructs for documentary purposes.
  </para>
</xs:template>
<xsl:template match="*" mode="xv:report-documented-group">
  <xs:section id="{generate-id(.)}" class="xsl-subsection">
    <xsl:copy-of select="@id"/>
    <xsl:apply-templates mode="xs:body" select="*"/>
    <xsl:call-template name="xs:report-top-level-elements"/>
  </xs:section>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Index-related templates</xs:title>
</xs:doc>

<xs:template>
  <para>Format the index section of the final report.</para>
  <xs:param name="top-level-elements">
    <para>The entire set of top-level elements from all modules.</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:format-index">
  <xsl:param name="top-level-elements"/>
  <xsl:if test="normalize-space($xv:show-index)='yes'">
    <xs:section id="{generate-id(/)}" class="xsl-index">
      <xs:title>
        <xsl:text>Index</xsl:text>
      </xs:title>
      <p>
        <xsl:call-template name="xs:index-entry-letters">
          <xsl:with-param name="top-level-elements" 
                          select="$top-level-elements"/>
        </xsl:call-template>
      </p>
      <xsl:call-template name="xs:index-entries">
        <xsl:with-param name="top-level-elements" 
                        select="$top-level-elements"/>
      </xsl:call-template>
    </xs:section>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>Format an entry in the letter summary</para>
  <xs:param name="letter">
    <para>The letter of the entry</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:format-entry-letter">
  <xsl:param name="letter"/>
  <b class="xsl-index-letter-title">
    <a href="#index-{$letter}">
      <xsl:value-of select="$letter"/>
    </a>
  </b>
  <xsl:text> </xsl:text>
</xsl:template>

<xs:template>
  <para>Report all the index entries for a given letter</para>
  <xs:param name="letter">
    <para>The letter being indexed.</para>
  </xs:param>
  <xs:param name="entries">
    <para>The entries for the given letter.</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:format-entries">
  <xsl:param name="letter"/>
  <xsl:param name="entries"/>
  <p id="index-{$letter}">
    <b class="xsl-index-letter-section">
      <xsl:value-of select="$letter"/>
    </b>
  </p>
  <ul>
    <xsl:call-template name="xs:sort-entries">
      <xsl:with-param name="entries" select="$entries"/>
    </xsl:call-template>
  </ul>
</xsl:template>

<xs:template>
  <para>Report a given entry in the index for the current letter</para>
  <xs:param name="filename">
    <para>The filename in which the index entry's referent is found.</para>
  </xs:param>
  <xs:param name="doc-node">
    <para>The document element node of the module for the filename.</para>
  </xs:param>
</xs:template>
<xsl:template match="*" mode="xv:format-entry">
  <xsl:param name="filename"/>
  <xsl:param name="doc-node"/>
  <li>
    <span class="xsl-index-entry-link">
      <a href="#{generate-id(.)}">
        <xsl:attribute name="class">
          <xsl:text>xsl-index-top-level </xsl:text>
          <xsl:text/>xsl-<xsl:value-of select="local-name(.)"/>
        </xsl:attribute>
        <xsl:for-each select="@id">
          <xsl:attribute name="href">
            <xsl:text/>#<xsl:value-of select="."/>
          </xsl:attribute>
        </xsl:for-each>
        <samp class="xsl-index-entry-name">
          <xsl:value-of select="@name"/>
          <xsl:if test="self::xsl:function">
            <i>
              <xsl:value-of select="concat('(',count(xsl:param),')')"/>
            </i>
          </xsl:if>
        </samp>
      </a>
      <xsl:text> (</xsl:text>
      <xsl:for-each select="$doc-node/xs:title | 
                            $doc-node/xs:doc[@info][1]/xs:title">
        <a href="#{generate-id($doc-node)}"
           class="xsl-index-entry-module-title">
          <xsl:apply-templates mode="xs:body" select="node()"/>
        </a>
        <xsl:text> - </xsl:text>
      </xsl:for-each>
      <a href="#{generate-id((ancestor::*)[1])}"
         class="xsl-index-entry-module-name">
        <xsl:for-each select="(ancestor::*)[1]/@id">
          <xsl:attribute name="href">
            <xsl:text/>#<xsl:value-of select="."/>
          </xsl:attribute>
        </xsl:for-each>
        <samp>
          <xsl:value-of select="$filename"/>
        </samp>
      </a>
      <xsl:text>)</xsl:text>
    </span>
  </li>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Inconsistency reporting</xs:title>
</xs:doc>

<xs:template>
  <para>Main header for the inconsistency report.</para>
  <xs:param name="report-inconsistencies">
    <para>Formatted list of inconsistencies.</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:report-detected-inconsistencies">
  <xsl:param name="report-inconsistencies"/>
  <xs:section id="{generate-id(/)}" class="xsl-section">
    <xs:title>
      <xsl:text>Inconsistencies Detected!</xsl:text>
    </xs:title>
    <xsl:copy-of select="$report-inconsistencies"/>
  </xs:section>
</xsl:template>

<xs:template>
  <para>Subsection header for the inconsistency report.</para>
  <xs:param name="title"><para>Title of the section.</para></xs:param>
  <xs:param name="reports"><para>Items of the section.</para></xs:param>
  <xs:param name="subreports">
    <para>Formatted subsections of this section.</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:report-inconsistencies">
  <xsl:param name="title"/>
  <xsl:param name="reports"/>
  <xsl:param name="subreports"/>
  <xs:section id="{generate-id(/)}" class="xsl-subsection">
    <xs:title>
      <xsl:copy-of select="$title"/>
    </xs:title>
      <xsl:if test="string($reports)">
        <ul>
          <xsl:copy-of select="$reports"/>
        </ul>
      </xsl:if>
      <xsl:copy-of select="$subreports"/>
  </xs:section>
</xsl:template>

<xs:template>
  <para>Format a single entry in the inconsistency report.</para>
  <xs:param name="link-name">
    <para>
      Set to <literal>false()</literal> to suppress linking the
      name of the construct to the construct's entry in the page.
    </para>
  </xs:param>
  <xs:param name="element">
    <para>
      Set to something other than the current element for identifying where
      there is an inconsistency.  This information tacks on to the end of
      the message.
    </para>
  </xs:param>
  <xs:param name="message">
    <para>
      This is the formatted content of the inconsistency report entry.
    </para>
  </xs:param>
</xs:template>
<xsl:template name="xv:report-inconsistency">
  <xsl:param name="link-name" select="true()"/>
  <xsl:param name="element" select="."/>
  <xsl:param name="message"/>
  <li>
    <xsl:copy-of select="$message"/>
    <xsl:for-each select="$element">
      <xsl:call-template name="xv:report-element-info">
        <xsl:with-param name="link-name" select="$link-name"/>
      </xsl:call-template>
    </xsl:for-each>
  </li>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Reporting of various constructs</xs:title>
</xs:doc>

<xs:template>
  <para>
    Report the information for a module being imported/included.  Take the
    information from the embedded xs:doc element used for the entire module.
  </para>
  <xs:param name="module">
    <para>Set to the module of which a report is being made.</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:report-module-info">
  <xsl:param name="module" select="/.."/>
  <xsl:for-each select="$module/xs:doc[@info][1]">
    <a href="#{generate-id(..)}">
      <xsl:choose>
        <xsl:when test="@filename">
          <samp><xsl:value-of select="@filename"/></samp>
        </xsl:when>
        <xsl:when test="xs:title">
          <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
        </xsl:when>
        <xsl:otherwise>
          <samp><xsl:value-of select="@info"/></samp>
        </xsl:otherwise>
      </xsl:choose>
    </a>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>
    Report the information for a group of top-level elements.  Take the
    information from the xs:doc being used to delimit a group.
  </para>
</xs:template>
<xsl:template name="xv:report-group-info">
  <xsl:for-each select="ancestor-or-self::*/
                        preceding-sibling::xs:doc[not(@info)][1]">
    <xsl:text> - </xsl:text>
    <a href="#{generate-id(.)}">
      <xsl:for-each select="@id">
        <xsl:attribute name="href">
          <xsl:text/>#<xsl:value-of select="."/>
        </xsl:attribute>
      </xsl:for-each>
      <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
    </a>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>
    Report the information for a given element in the stylesheet, using
    the name and group information for referencing purposes.
  </para>
  <xs:param name="element">
    <para>
      Set to other than the current element for which element is to be
      reported.
    </para>
  </xs:param>
  <xs:param name="link-name">
    <para>
      Set to <literal>false()</literal> to suppress the linking of the name
      to the named construct in the report.
    </para>
  </xs:param>
  <xs:param name="group-info">
    <para>
      Set to <literal>false()</literal> to suppress the group information.
    </para>
  </xs:param>
</xs:template>
<xsl:template name="xv:report-element-info">
  <xsl:param name="element" select="."/>
  <xsl:param name="link-name" select="true()"/>
  <xsl:param name="group-info" select="true()"/>
  <xsl:for-each select="$element">
    <xsl:call-template name="xv:report-monospaced-info">
      <xsl:with-param name="text">
        <xsl:text/>&lt;<xsl:value-of select="name(.)"/>
        <xsl:if test="@name">
          <xsl:text> name="</xsl:text>
          <xsl:choose>
            <xsl:when test="$link-name">
              <a href="#{generate-id(.)}">
                <xsl:for-each select="@id">
                  <xsl:attribute name="href">
                    <xsl:text/>#<xsl:value-of select="."/>
                  </xsl:attribute>
                </xsl:for-each>
                <xsl:value-of select="@name"/>
              </a>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="@name"/>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:text>"</xsl:text>
        </xsl:if>
        <xsl:text>></xsl:text>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:if test="$group-info">
      <xsl:call-template name="xv:report-group-info"/>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>Report the information found regarding any top-level element.</para>
  <xs:param name="doc">
    <para>
      This is the pointer to the XSLStyle&#x2122; documentation associated 
      with the element.
    </para>
  </xs:param>
  <xs:param name="element">
    <para>This is the element being reported.</para>
  </xs:param>
</xs:template>
<xsl:template mode="xv:report-top-level-element" match="*">
  <xsl:param name="doc" select="/.."/>
  <xsl:variable name="element" select="."/>
  <p id="{generate-id(.)}" class="xsl-{local-name(.)} xsl-top-level">
    <xsl:copy-of select="@id"/>
    <samp>
      <xsl:for-each select="@name">
        <b class="xsl-block-name">
          <xsl:value-of select="."/>
        </b>
      </xsl:for-each>
      <xsl:if test="self::xsl:function">
        <i class="xsl-block-function-param">
          <xsl:value-of select="concat('(',count(xsl:param),')')"/>
        </i>
      </xsl:if>
      <xsl:for-each select="@match">
        <xsl:text> </xsl:text>
        <b class="xsl-block-match">
          <xsl:value-of select="concat(name(.),'=&quot;',.,'&quot;')"/>
        </b>
      </xsl:for-each>
      <xsl:for-each select="@*[name(.)!='name' and name(.)!='match']">
        <xsl:text> </xsl:text>
        <b class="xsl-block-other">
          <xsl:value-of select="concat(name(.),'=&quot;',.,'&quot;')"/>
        </b>
      </xsl:for-each>
      <i class="xsl-block-type">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="name(.)"/>
        <xsl:text>)</xsl:text>
      </i>
    </samp>
    <xsl:for-each select="$doc">
      <!--use <dl> for indentation-->
      <dl>
        <dlentry>
          <dd class="xsl-detail-{local-name(.)}">
        <xsl:apply-templates mode="xs:body" select="node()[not(self::xs:*)]"/>
        <xsl:apply-templates mode="xv:report-top-level-element-detail"
                             select="$element">
          <xsl:with-param name="doc" select="$doc"/>
        </xsl:apply-templates>
          </dd>
        </dlentry>
      </dl>
    </xsl:for-each>
  </p>
</xsl:template>

<xs:template>
  <para>Report the information for an XSLT template rule.</para>
  <xs:param name="doc">
    <para>
      The XSLStyle&#x2122; documentation associated with the template.
    </para>
  </xs:param>
</xs:template>
<xsl:template mode="xv:report-top-level-element-detail"
              match="xsl:template | xsl:function">
  <xsl:param name="doc" select="/.."/>
  <xsl:variable name="this" select="."/>
  <xsl:for-each select="$doc/xs:param">
    <p class="xsl-template-parameter">
      <xsl:text>Parameter </xsl:text>
      <samp>
        <b class="xsl-template-parameter-name">
          <xsl:value-of select="@name"/>
        </b>
        <xsl:for-each select="$this/xsl:param[@name=current()/@name]">
          <!--only report the a few attributes-->
          <xsl:for-each select="@as | @required | @tunnel">
            <xsl:text> </xsl:text>
            <b class="xsl-template-parameter-attributes">
              <xsl:value-of select="concat(name(.),'=&quot;',.,'&quot;')"/>
            </b>
          </xsl:for-each>
        </xsl:for-each>
      </samp>
      <!--use <dl> for indentation-->
      <dl>
        <dlentry>
          <dd class="xsl-template-detail-parameter">
        <xsl:apply-templates mode="xs:body" select="*"/>
          </dd>
        </dlentry>
      </dl>
    </p>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>
    Produce no detailed information for other XSLT top-level elements.
  </para>
</xs:template>
<xsl:template mode="xv:report-top-level-element-detail" match="*">
  <!--no supplemental reporting for any other top-level element yet-->
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Utility formatting templates</xs:title>
</xs:doc>

<xs:template>
  <para>
    Format the information regarding the file for the current node, assuming
    the current node is the document element of the stylesheet.
  </para>
  <xs:param name="href">
    <para>
      The <literal>href=</literal> used to find the file being reported.
    </para>
  </xs:param>
</xs:template>
<xsl:template name="xv:format-file-information">
  <xsl:param name="href"/>
  <a href="#{generate-id(.)}" class="xsl-file-reference-link">
    <xsl:choose>
      <xsl:when test="xs:doc[@info][1]">
        <xsl:for-each select="xs:doc[@info][1]">
          <span class="xsl-file-reference-title">
            <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
          </span>
          <xsl:if test="normalize-space( concat( @filename, $href ) )">
            <xsl:text> - </xsl:text>
            <samp class="xsl-file-reference-name">
              <xsl:choose>
                <xsl:when test="@filename">
                  <xsl:value-of select="@filename"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$href"/>
                </xsl:otherwise>
              </xsl:choose>
            </samp>
          </xsl:if>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <samp class="xsl-file-reference-name">
          <xsl:value-of select="$href"/>
        </samp>
      </xsl:otherwise>
    </xsl:choose>
  </a>
</xsl:template>

<xs:template>
  <para>
    Format the given text in a monospaced font.  This is used typically for
    the formatting of markup and other fixed-sized font information, and not
    typically for prose.
  </para>
  <xs:param name="text">
    <para>The text to be formatted.</para>
  </xs:param>
</xs:template>
<xsl:template name="xv:report-monospaced-info">
  <xsl:param name="text"/>
  <samp>
    <xsl:copy-of select="$text"/>
  </samp>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Match the XSLStyle constructs encountered</xs:title>
</xs:doc>

<xs:template>
  <para>Translate the XSLStyle title to the native titling</para>
  <para>
    Note this is happening on the first pass of the embedded documentation
    and not the intermediate pass.
  </para>
</xs:template>
<xsl:template match="xs:doc" mode="xs:body">
  <xs:section>
    <xsl:apply-templates mode="xs:body"/>
  </xs:section>
</xsl:template>

<xs:param ignore-ns='yes'>
  <para>
    The maximum depth of table of contents entries
  </para>
</xs:param>
<xsl:param name="xslstyle-toc-depth" select="2"/>

<xs:template>
  <para>Add a synthesized TOC to the end report.</para>
  <para>Limit the table of contents</para>
  <para>Using <literal>dl</literal> is most compact.</para>
</xs:template>
<xsl:template match="xs:toc" mode="xs:intermediate">
  <xsl:call-template name="xs:rtf2nodesIntermediate">
    <xsl:with-param name="rtf">
      <p><b>Table of contents</b></p>
      <dl>
        <dlentry>
          <xsl:for-each select="ancestor::body//xs:title
                      [count(ancestor::xs:section) &lt;= $xslstyle-toc-depth]">
            <dt>
              <!--indent once for each level-->
              <xsl:for-each select="ancestor::xs:section">
          <xsl:text>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;</xsl:text>
              </xsl:for-each>
              <!--determine section number for exposure and linking-->
              <xsl:variable name="this">
                <xsl:number level="multiple" count="xs:section"
                             format="1.1."/>
              </xsl:variable>
              <!--link to the section-->
              <a href="#{generate-id(..)}">
                <xsl:for-each select="../@id">
                  <xsl:attribute name="href">
                    <xsl:text/>#<xsl:value-of select="."/>
                  </xsl:attribute>
                </xsl:for-each>
                <xsl:value-of select="$this"/>
                <xsl:text> </xsl:text>
                <!--reproduce the title-->
                <xsl:copy-of select="node()"/>
              </a>
            </dt>
          </xsl:for-each>
        </dlentry>
      </dl>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xs:template>
  <para>
    Change sections into divs
  </para>
</xs:template>
<xsl:template match="xs:section" mode="xs:intermediate">
  <div>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates mode="xs:intermediate"/>
  </div>
</xsl:template>

<xs:template>
  <para>
    Change titles into headings
  </para>
</xs:template>
<xsl:template match="xs:title" mode="xs:intermediate">
  <xsl:variable name="depth">
    <xsl:choose>
      <xsl:when test="count(ancestor::xs:section) > 6">6</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="count(ancestor::xs:section)"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:element name="h{$depth + 1}">
    <xsl:number level="multiple" count="xs:section" format="1.1."/>
    <xsl:text> </xsl:text>
    <xsl:apply-templates mode="xs:intermediate"/>
  </xsl:element>
</xsl:template>

<xs:template>
  <para>
    Any other <literal>xs:</literal> element has no recognized functionality,
    so just process the children.
  </para>
</xs:template>
<xsl:template match="xs:*" mode="xs:intermediate">
  <xsl:apply-templates mode="xs:intermediate"/>
</xsl:template>

<xs:template>
 <para>All other XHTML constructs may have to be stripped of namespaces.</para>
</xs:template>
<xsl:template match="*" mode="xs:intermediate">
  <xsl:element name="{local-name(.)}">
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates mode="xs:intermediate"/>
  </xsl:element>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Final processing</xs:title>
</xs:doc>

<xs:template>
  <para>
    Strip the namespace from the element (thus allowing both 
    namespace-qualified XHTML and no-namespace HTML to be input.
  </para>
</xs:template>
<xsl:template mode="xs:strip-ns" match="*">
  <xsl:element name="{local-name(.)}" namespace="">
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates mode="xs:strip-ns" select="node()"/>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
