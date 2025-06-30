<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
              xmlns:xv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary"
                exclude-result-prefixes="xs xv"
                version="1.0">

<!--the stylesheets for formatting the embedded vocabulary-->
<xsl:import href="../docbook/xsl/html/docbook.xsl"/>

<!--the stylesheets implementing the XSLStyle&#x2122; semantics-->
<xsl:import href="xslstyle-core.xsl"/>

<xs:doc filename="xslstyle-docbook-core.xsl" internal-ns="xv" global-ns="xs"
info="$Id: xslstyle-docbook-core.xsl,v 1.23 2010/08/17 01:28:28 admin Exp $"
        vocabulary="DocBook">
  <xs:title>DocBook core for the XSLStyle&#x2122; environment</xs:title>
  <para>
    This core for XSLStyle&#x2122; assumes that the embedded constructs
    are in the <ulink url="http://www.DocBook.org">DocBook</ulink> vocabulary.
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
  <para>
    Identification of the embedded vocabulary recognized by these stylesheets.
  </para>
</xs:variable>
<xsl:variable name="xv:vocabulary" select="'DocBook'"/>

<xs:template>
  <para>
    Where things begin at the root node of both source and temporary trees.
  </para>
  <para>
    This is used internally to pass documentation to the imported stylesheets.
    Because this uses <literal>xsl:apply-imports</literal> this cannot go in
    the <literal>xslstyle.xsl</literal> stylesheet.
  </para>
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
      <!--now is the time to invoke the formatting stylesheets-->
      <xsl:apply-imports/>
    </xsl:when>
    <xsl:otherwise>
      <!--first time through: harvest the documentation from the stylesheet-->
      <xsl:apply-templates select="*" mode="xs:body"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Known problems</xs:title>
  <para>
    There is a bug in the DocBook stylesheets when a
    <literal>&lt;blockquote></literal> element is used by XSLStyle.  The
    <literal>role=</literal> used by XSLStyle is ignored by the DocBook
    stylesheets, replacing the reserved XSLStyle style with the generic
    "<literal>blockquote</literal>" style.  This means that those styles
    named after top-level constructs "<literal>xslstyle-detail-???</literal>"
    such as "<literal>xslstyle-detail-template</literal>" are ignored for
    DocBook but not ignored for XSLStyle environments such as DITA or XHTML.
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>DocBook properties</xs:title>
  <para>
    The DocBook stylesheet environment is heavily parameterized, providing a
    lot of control over the presentation of the information in a DocBook
    instance.  Various parameters being set by this environment are done here.
  </para>
</xs:doc>

<xs:variable ignore-ns="yes" internal="yes">
  <para>
    This is a DocBook-defined parameter that turns on the labelling of sections
    in the table of contents and in the body.
  </para>
</xs:variable>
<xsl:variable name="section.autolabel" select="'1'"/>

<xs:variable ignore-ns="yes" internal="yes">
  <para>Adjust the settings in the DocBook parameters for CSS</para>
</xs:variable>
<xsl:variable name="html.stylesheet.type">text/css</xsl:variable>

<xs:variable ignore-ns="yes" internal="yes">
  <para>Adjust the settings in the DocBook parameters for CSS</para>
</xs:variable>
<xsl:variable name="html.stylesheet" select="$xv:external-css"/>

<xs:variable ignore-ns="yes" internal="yes">
  <para>Reflect the XSLStyle setting for showing the TOC.</para>
</xs:variable>
<xsl:variable name="generate.toc">
  <xsl:if test="normalize-space($xv:show-toc)='yes'">
article   toc,title
  </xsl:if>
</xsl:variable>

<xs:template ignore-ns="yes">
  <para>
    This is a hook provided by the stylesheets for additional header content.
  </para>
</xs:template>
<xsl:template name="user.head.content">
  <xsl:if test="normalize-space($xv:internal-css)">
    <style type="text/css">
      <xsl:copy-of select="$xv:internal-css"/>
    </style>
  </xsl:if>
</xsl:template>

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
  <article>
    <title><xsl:copy-of select="xs:title/node()"/></title>
    <xsl:call-template name="xs:process-body"/>
  </article>
</xsl:template>

<xs:template>
  <para>The titling and presentation of the import tree.</para>
</xs:template>
<xsl:template name="xv:format-tree">
 <xsl:if test="normalize-space($xv:show-tree)='yes'">
  <para role="xsl-subtitle-import-include">
    <emphasis role="bold">
      Import/include tree (in order of importance; reverse import order)
    </emphasis>
  </para>
  <itemizedlist spacing="compact" role="xsl-list-import-include">
    <listitem>
        <phrase role="xsl-list-import-include-item">
          <xsl:call-template name="xv:format-file-information"/>
        </phrase>
        <itemizedlist spacing="compact">
          <xsl:call-template name="xs:collect-and-format-tree-entries"/>
        </itemizedlist>
    </listitem>
  </itemizedlist>
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
  <listitem>
    <link linkend="{generate-id(.)}">
      <xsl:choose>
        <xsl:when test="xs:doc[@info]">
          <phrase role="xsl-list-import-include-item">
            <xsl:call-template name="xv:format-file-information">
              <xsl:with-param name="href" select="$href"/>
            </xsl:call-template>
          </phrase>
        </xsl:when>
        <xsl:otherwise>
          <phrase role="xsl-list-import-include-item">
            <literal><xsl:value-of select="$href"/></literal>
          </phrase>
        </xsl:otherwise>
      </xsl:choose>
    </link>
    <xsl:variable name="list-contents">
      <xsl:if test="xs:doc[@info] or $xslstyle-force-full-import-tree">
        <xsl:call-template name="xs:collect-and-format-tree-entries"/>
      </xsl:if>
    </xsl:variable>
    <xsl:if test="string($list-contents)">
      <itemizedlist spacing="compact">
        <xsl:copy-of select="$list-contents"/>
      </itemizedlist>
    </xsl:if>
  </listitem>
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
  <para role="xsl-subtitle-invocation">
    <emphasis role="bold">
      Available invocation parameter<xsl:if test="count($params)>1">s</xsl:if>
      <xsl:if test="$params/@required='yes'">
        ('**' indicates a required parameter)
      </xsl:if>
    </emphasis>
  </para>
  <itemizedlist spacing="compact" role="xsl-list-invocation">
    <xsl:call-template name="xs:order-params">
      <xsl:with-param name="params" select="$params"/>
    </xsl:call-template>
  </itemizedlist>
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
  <para role="xsl-subtitle-specialization">
    <emphasis role="bold">
   Available specialization parameter<xsl:if test="count($params)>1">s</xsl:if>
    </emphasis>
  </para>
  <itemizedlist spacing="compact" role="xsl-list-specialization">
    <xsl:call-template name="xs:order-params">
      <xsl:with-param name="params" select="$params"/>
    </xsl:call-template>
  </itemizedlist>
 </xsl:if>
</xsl:template>

<xs:template>
  <para>The formatting of a single entry in the input parameters.</para>
</xs:template>
<xsl:template name="xv:format-param">
  <listitem>
    <phrase role="xsl-input-parameter-link">
      <link linkend="{@idref}">
        <phrase role="xsl-input-parameter-name">
          <literal>
            <xsl:value-of select="@name"/>
          </literal>
        </phrase>
        <xsl:if test="@required='yes'"> ** </xsl:if>
        <xsl:text> (</xsl:text>
        <phrase role="xsl-input-parameter-module-title">
          <xsl:copy-of select="node()"/>
        </phrase>
        <xsl:text> - </xsl:text>
        <phrase role="xsl-input-parameter-module-name">
          <literal>
            <xsl:value-of select="@file"/>
          </literal>
        </phrase>
        <xsl:text>)</xsl:text>
      </link>
    </phrase>
  </listitem>
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
  <section id="{generate-id(.)}" role="xsl-section">
    <xsl:copy-of select="@id"/>
    <xsl:choose>
      <xsl:when test="not(xs:doc[@info])">
        <title>
          <literal><xsl:value-of select="$path"/></literal>
        </title>
        <para>
          This module has no embedded XSLStyle&#x2122; documentation 
          with an <literal>info=</literal> attribute.
        </para>
      </xsl:when>
      <xsl:when test="not( xs:doc[@info]/@vocabulary=$xv:vocabulary )">
        <xsl:for-each select="xs:doc[@info]">
          <title>
            <xsl:copy-of select="xs:title/node()"/>
            <xsl:text> - </xsl:text>
            <literal><xsl:value-of select="@filename"/></literal>
          </title>
        </xsl:for-each>
        <para>
          This module has embedded XSLStyle&#x2122; documentation 
          but the <literal>vocabulary=</literal> attribute  does not 
          match the stylesheets being used.
        </para>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="xs:doc[@info]">
          <title>
            <xsl:copy-of select="xs:title/node()"/>
            <xsl:text> - </xsl:text>
            <literal><xsl:value-of select="@filename"/></literal>
          </title>
          <!--some metadata-->
          <xsl:if test="string($path)">
            <para>
              Path: <literal><xsl:value-of select="$path"/></literal>
            </para>
          </xsl:if>
          <xsl:if test="$path != @filename">
            <para role="xsl-subtitle-filename">
              Filename: <literal role="xsl-subtitle-filename-name"
                                ><xsl:value-of select="@filename"/></literal>
            </para>
          </xsl:if>
          <!--list of imports and inclusions-->
          <xsl:if test="../xsl:import | ../xsl:include">
            <para role="xsl-subtitle-import">
              <xsl:if test="../xsl:import">
                <xsl:text>Import</xsl:text>
                <xsl:if test="../xsl:include"> and include</xsl:if>
              </xsl:if>
              <xsl:if test="../xsl:include">
                <xsl:if test="not(../xsl:import)">
                  <xsl:text>Include</xsl:text>
                </xsl:if>
              </xsl:if>
              <xsl:text> statement</xsl:text>
              <xsl:if test="count(../xsl:include | ../xsl:import)>1">s</xsl:if>              <xsl:text>:</xsl:text>
            </para>
            <itemizedlist spacing="compact" role="xsl-list-section-imports">
              <xsl:for-each select="( ../xsl:import | ../xsl:include )/@href">
                <xsl:variable name="href" select="."/>
                <xsl:for-each select="document(.,.)/xsl:*">
                  <listitem role="xsl-list-section-imports-item">
                      <xsl:call-template name="xv:format-file-information">
                        <xsl:with-param name="href" select="$href"/>
                      </xsl:call-template>
                  </listitem>
                </xsl:for-each>
              </xsl:for-each>
            </itemizedlist>
          </xsl:if>
          <!--more metadata-->
          <literallayout>
            <literal><xsl:value-of select="@info"/></literal>
          </literallayout>
          <!--sheet-wide documentation-->
          <xsl:copy-of select="*[not(self::xs:title)]"/>
        </xsl:for-each>
        <xsl:call-template name="xs:report-top-level-elements"/>
        <xsl:call-template name="xs:report-documented-groups"/>
      </xsl:otherwise>
    </xsl:choose>
  </section>
</xsl:template>

<xs:template>
  <para>
    A group delimits a set of top-level constructs for documentary purposes.
  </para>
</xs:template>
<xsl:template match="*" mode="xv:report-documented-group">
  <section id="{generate-id(.)}" role="xsl-subsection">
    <xsl:copy-of select="@id"/>
    <xsl:for-each select="xs:title">
      <title><xsl:copy-of select="node()"/></title>
    </xsl:for-each>
    <xsl:copy-of select="*[not(self::xs:title)]"/>
    <xsl:call-template name="xs:report-top-level-elements"/>
  </section>
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
    <section id="index_" role="xsl-index">
      <title>Index</title>
      <para>
        <xsl:call-template name="xs:index-entry-letters">
          <xsl:with-param name="top-level-elements" 
                          select="$top-level-elements"/>
        </xsl:call-template>
      </para>
      <xsl:call-template name="xs:index-entries">
        <xsl:with-param name="top-level-elements" 
                        select="$top-level-elements"/>
      </xsl:call-template>
    </section>
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
  <link linkend="index-{$letter}">
    <emphasis role="bold xsl-index-letter-title">
      <xsl:value-of select="$letter"/>
    </emphasis>
  </link>
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
  <para id="index-{$letter}">
    <emphasis role="bold xsl-index-letter-section">
      <xsl:value-of select="$letter"/>
    </emphasis>
  </para>
  <itemizedlist spacing="compact">
    <xsl:call-template name="xs:sort-entries">
      <xsl:with-param name="entries" select="$entries"/>
    </xsl:call-template>
  </itemizedlist>
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
  <listitem>
    <phrase role="xsl-index-entry-link">
      <link linkend="{generate-id(.)}">
        <phrase>
          <xsl:attribute name="role">
            <xsl:text>xsl-index-top-level </xsl:text>
            <xsl:text/>xsl-<xsl:value-of select="local-name(.)"/>
          </xsl:attribute>
          <phrase role="xsl-index-entry-name">
            <literal>
              <xsl:value-of select="@name"/>
              <xsl:if test="self::xsl:function">
                <emphasis>
                  <xsl:value-of select="concat('(',count(xsl:param),')')"/>
                </emphasis>
              </xsl:if>
            </literal>
          </phrase>
        </phrase>
      </link>
      <xsl:text> (</xsl:text>
      <xsl:for-each select="$doc-node/xs:title | 
                            $doc-node/xs:doc[@info][1]/xs:title">
        <phrase role="xsl-index-entry-module-title">
          <link linkend="{generate-id($doc-node)}">
            <xsl:copy-of select="node()"/>
          </link>
        </phrase>
        <xsl:text> - </xsl:text>
      </xsl:for-each>
      <phrase role="xsl-index-entry-module-name">
        <link linkend="{generate-id((ancestor::*)[1])}">
          <literal>
            <xsl:value-of select="$filename"/>
          </literal>
        </link>
      </phrase>
      <xsl:text>)</xsl:text>
    </phrase>
  </listitem>
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
  <section role="xsl-section">
    <title>Inconsistencies Detected!</title>
    <xsl:copy-of select="$report-inconsistencies"/>
  </section>
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
  <section role="xsl-subsection">
    <title><xsl:copy-of select="$title"/></title>
    <xsl:if test="string($reports)">
      <itemizedlist spacing="compact">
        <xsl:copy-of select="$reports"/>
      </itemizedlist>
    </xsl:if>
    <xsl:copy-of select="$subreports"/>
  </section>
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
  <listitem>
      <xsl:copy-of select="$message"/>
      <xsl:for-each select="$element">
        <xsl:call-template name="xv:report-element-info">
          <xsl:with-param name="link-name" select="$link-name"/>
        </xsl:call-template>
      </xsl:for-each>
  </listitem>
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
    <link linkend="{generate-id(..)}">
      <xsl:choose>
        <xsl:when test="@filename">
          <literal><xsl:value-of select="@filename"/></literal>
        </xsl:when>
        <xsl:when test="xs:title">
          <xsl:copy-of select="xs:title/node()"/>
        </xsl:when>
        <xsl:otherwise>
          <literal><xsl:value-of select="@info"/></literal>
        </xsl:otherwise>
      </xsl:choose>
    </link>
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
    <link linkend="{generate-id(.)}">
      <xsl:copy-of select="xs:title/node()"/>
    </link>
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
              <link linkend="{generate-id(.)}">
                <xsl:value-of select="@name"/>
              </link>
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
  <para id="{generate-id(.)}" role="xsl-{local-name(.)} xsl-top-level">
    <xsl:copy-of select="@id"/>
    <literal>
      <xsl:for-each select="@name">
        <emphasis role="bold xsl-block-name">
          <xsl:value-of select="."/>
        </emphasis>
      </xsl:for-each>
      <xsl:if test="self::xsl:function">
        <emphasis role="xsl-block-function-param">
          <xsl:value-of select="concat('(',count(xsl:param),')')"/>
        </emphasis>
      </xsl:if>
      <xsl:for-each select="@match">
        <xsl:text> </xsl:text>
        <emphasis role="bold xsl-block-match">
          <xsl:value-of select="concat(name(.),'=&quot;',.,'&quot;')"/>
        </emphasis>
      </xsl:for-each>
      <xsl:for-each select="@*[name(.)!='name' and name(.)!='match']">
        <xsl:text> </xsl:text>
        <emphasis role="bold xsl-block-other">
          <xsl:value-of select="concat(name(.),'=&quot;',.,'&quot;')"/>
        </emphasis>
      </xsl:for-each>
      <emphasis>
        <phrase role="xsl-block-type">
          <xsl:text> (</xsl:text>
          <xsl:value-of select="name(.)"/>
          <xsl:text>)</xsl:text>
        </phrase>
      </emphasis>
    </literal>
    <xsl:for-each select="$doc">
      <blockquote role="xsl-detail-{local-name(.)}">
        <!--note the following <phrase> shouldn't be necessary, but the DocBook
            stylesheets do not respect the role= of <blockquote>; in fact it
            is invalid to include the <phrase> when the child constructs are
            block-level constructs, but this isn't being validated so it
            should be okay-->
        <phrase role="xsl-detail-{local-name(.)}">
          <xsl:copy-of select="*[not(self::xs:*)]"/>
          <xsl:apply-templates mode="xv:report-top-level-element-detail"
                               select="$element">
            <xsl:with-param name="doc" select="$doc"/>
          </xsl:apply-templates>
        </phrase>
      </blockquote>
    </xsl:for-each>
  </para>
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
    <para role="xsl-template-parameter">
      <xsl:text>Parameter </xsl:text>
      <literal>
        <emphasis role="bold xsl-template-parameter-name">
          <xsl:value-of select="@name"/>
        </emphasis>
        <xsl:for-each select="$this/xsl:param[@name=current()/@name]">
          <!--only report the a few attributes-->
          <xsl:for-each select="@as | @required | @tunnel">
            <xsl:text> </xsl:text>
            <emphasis role="bold xsl-template-parameter-attributes">
              <xsl:value-of select="concat(name(.),'=&quot;',.,'&quot;')"/>
            </emphasis>
          </xsl:for-each>
        </xsl:for-each>
      </literal>
      <blockquote role="xsl-template-detail-parameter">
        <xsl:copy-of select="*"/>
      </blockquote>
    </para>
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
  <phrase role="xsl-file-reference-link">
    <link linkend="{generate-id(.)}">
      <xsl:choose>
        <xsl:when test="xs:doc[@info][1]">
          <xsl:for-each select="xs:doc[@info][1]">
            <phrase role="xsl-file-reference-title">
              <xsl:apply-templates mode="xs:body"  select="xs:title/node()"/>
            </phrase>
            <xsl:if test="normalize-space( concat( @filename, $href ) )">
              <xsl:text> - </xsl:text>
              <phrase role="xsl-file-reference-name">
                <literal>
                  <xsl:choose>
                    <xsl:when test="@filename">
                      <xsl:value-of select="@filename"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="$href"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </literal>
              </phrase>
            </xsl:if>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <phrase role="xsl-file-reference-name">
            <literal>
              <xsl:value-of select="$href"/>
            </literal>
          </phrase>
        </xsl:otherwise>
      </xsl:choose>
    </link>
  </phrase>
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
  <literal><xsl:copy-of select="$text"/></literal>
</xsl:template>

<xs:template>
  <para>Translate the XSLStyle title to the native titling</para>
</xs:template>
<xsl:template match="xs:title">
  <title><xsl:apply-templates mode="xs:body"/></title>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Intermediate processing</xs:title>
</xs:doc>

<xs:template>
  <para>Strip all elements of their namespace for stylesheet processing.</para>
</xs:template>
<xsl:template match="*" mode="xs:intermediate">
  <xsl:element name="{local-name(.)}">
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates mode="xs:intermediate"/>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
