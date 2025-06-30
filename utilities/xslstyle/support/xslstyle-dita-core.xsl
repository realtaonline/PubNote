<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
              xmlns:xv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary"
                exclude-result-prefixes="xs xv"
                version="1.0">

<!--the stylesheets for formatting the embedded vocabulary-->
<xsl:import href="../dita/xsl/xslhtml/dita2htmlImpl.xsl"/>
<xsl:import href="../dita/xsl/xslhtml/hi-d.xsl"/>
<xsl:import href="../dita/xsl/xslhtml/pr-d.xsl"/>
<xsl:import href="../dita/xsl/xslhtml/refdisplay.xsl"/>
<xsl:import href="../dita/xsl/xslhtml/rel-links.xsl"/>
<xsl:import href="../dita/xsl/xslhtml/sw-d.xsl"/>
<xsl:import href="../dita/xsl/xslhtml/syntax-braces.xsl"/>
<xsl:import href="../dita/xsl/xslhtml/taskdisplay.xsl"/>
<xsl:import href="../dita/xsl/xslhtml/ui-d.xsl"/>
<xsl:import href="../dita/xsl/xslhtml/ut-d.xsl"/>

<!--the synthesized stylesheet supporting DITA defaulted class attributes-->
<xsl:import href="xslstyle-ditadef.xsl"/>

<!--the stylesheets implementing the XSLStyle&#x2122; semantics-->
<xsl:import href="xslstyle-core.xsl"/>

<xs:doc filename="xslstyle-dita-core.xsl" internal-ns="xv xs" 
        vocabulary="DocBook"
  info="$Id: xslstyle-dita-core.xsl,v 1.22 2010/08/17 01:28:05 admin Exp $">
  <xs:title>DITA core for the XSLStyle&#x2122; environment</xs:title>
  <para>
    This core for XSLStyle&#x2122; assumes that the embedded constructs
    are in the <ulink url="http://www.oasis-open.org/committees/dita/">OASIS Darwin Information Typing Architecture (DITA)</ulink> vocabulary.
  </para>
  <para>
    This implementation assumes only the nested use of 
    <literal>&lt;topic></literal> elements and not any other information types.
  </para>
  <para>
    Class attributes may be specified on any DITA 1.1 vocabulary element, but
    this is not required as these stylesheets supply a defaulted class 
    attribute value for each harvested from the DITA 1.1 W3C Schema files.
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
<xsl:variable name="xv:vocabulary" select="'DITA'"/>

<xs:variable ignore-ns="yes">
  <para>Override toolkit variable specifying the stylesheet to use.</para>
</xs:variable>
<xsl:variable name="CSS" select="$xv:external-css"/>

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
  <xs:title>High-level elements of result tree</xs:title>
  <para>
    These templates handle the structuring of the higher-levels of the result
    tree.
  </para>
</xs:doc>

<xs:variable>
  <para>The base topic identifier needs to be remembered for 
        hyperlinking purposes.</para>
</xs:variable>
<xsl:variable name="xv:rootid" select="generate-id(/)"/>

<xs:template>
  <para>The document element of the result.</para>
</xs:template>
<xsl:template name="xv:format-document">
  <dita>
    <topic id="{$xv:rootid}">
      <title>
        <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
      </title>
      <body>
        <xsl:if test="normalize-space($xv:show-toc)='yes'"><xs:toc/></xsl:if>
        <xsl:call-template name="xs:process-body"/>
      </body>
    </topic>
  </dita>
</xsl:template>

<xs:template>
  <para>The titling and presentation of the import tree.</para>
</xs:template>
<xsl:template name="xv:format-tree">
  <xsl:if test="normalize-space($xv:show-tree)='yes'">
    <p outputclass="xsl-subtitle-import-include">
      <b>
        Import/include tree (in order of importance; reverse import order)
      </b>
      <ul outputclass="xsl-list-import-include">
        <li>
          <ph outputclass="xsl-list-import-include-item">
            <xsl:call-template name="xv:format-file-information"/>
          </ph>
          <ul>
            <xsl:call-template name="xs:collect-and-format-tree-entries"/>
          </ul>
        </li>
      </ul>
    </p>
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
    <xref href="#{generate-id(/)}">
      <xsl:choose>
        <xsl:when test="xs:doc[@info]">
          <ph outputclass="xsl-list-import-include-item">
            <xsl:call-template name="xv:format-file-information">
              <xsl:with-param name="href" select="$href"/>
            </xsl:call-template>
          </ph>
        </xsl:when>
        <xsl:otherwise>
          <codeph outputclass="xsl-list-import-include-item">
            <xsl:value-of select="$href"/>
          </codeph>
        </xsl:otherwise>
      </xsl:choose>
    </xref>
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
    <p outputclass="xsl-subtitle-invocation">
      <b>
      Available invocation parameter<xsl:if test="count($params)>1">s</xsl:if>
      <xsl:if test="$params/@required='yes'">
        ('**' indicates a required parameter)
      </xsl:if>
      </b>
      <ul outputclass="xsl-list-invocation">
        <xsl:call-template name="xs:order-params">
          <xsl:with-param name="params" select="$params"/>
        </xsl:call-template>
      </ul>
    </p>
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
    <p outputclass="xsl-subtitle-specialization">
      <b>
   Available specialization parameter<xsl:if test="count($params)>1">s</xsl:if>
      </b>
      <ul outputclass="xsl-list-specialization">
        <xsl:call-template name="xs:order-params">
          <xsl:with-param name="params" select="$params"/>
        </xsl:call-template>
      </ul>
    </p>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>The formatting of a single entry in the input parameters.</para>
</xs:template>
<xsl:template name="xv:format-param">
  <li>
    <xref href="#{$xv:rootid}/{@idref}" outputclass="xsl-input-parameter-link">
      <codeph outputclass="xsl-input-parameter-name">
        <xsl:value-of select="@name"/>
      </codeph>
      <xsl:if test="@required='yes'">
        **
      </xsl:if>
      <xsl:text> (</xsl:text>
      <ph outputclass="xsl-input-parameter-module-title">
        <xsl:apply-templates mode="xs:body" select="node()"/>
      </ph>
      <xsl:text> - </xsl:text>
      <codeph outputclass="xsl-input-parameter-module-name">
        <xsl:value-of select="@file"/>
      </codeph>
      <xsl:text>)</xsl:text>
    </xref>
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
  <topic id="{generate-id(.)}" outputclass="xsl-section">
    <xsl:copy-of select="@id"/>
    <xsl:choose>
      <xsl:when test="not(xs:doc[@info])">
        <title>
          <codeph>
            <xsl:value-of select="$path"/>
          </codeph>
        </title>
      </xsl:when>
      <xsl:when test="not( xs:doc[@info]/@vocabulary=$xv:vocabulary )">
        <xsl:for-each select="xs:doc[@info]">
          <title>
            <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
            <xsl:text> - </xsl:text>
            <codeph><xsl:value-of select="@filename"/></codeph>
          </title>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="xs:doc[@info]">
          <title>
            <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
            <xsl:text> - </xsl:text>
            <codeph><xsl:value-of select="@filename"/></codeph>
          </title>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
    <body>
    <xsl:choose>
      <xsl:when test="not(xs:doc[@info])">
        <p>
          This module has no embedded XSLStyle&#x2122; documentation 
          with an <codeph>info=</codeph> attribute.
        </p>
      </xsl:when>
      <xsl:when test="not( xs:doc[@info]/@vocabulary=$xv:vocabulary )">
        <p>
          This module has embedded XSLStyle&#x2122; documentation 
          but the <codeph>vocabulary=</codeph> attribute  does not 
          match the stylesheets being used.
      </p>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="xs:doc[@info]">
          <!--some metadata-->
          <xsl:if test="string($path)">
            <p>
              Path: <codeph><xsl:value-of select="$path"/></codeph>
            </p>
          </xsl:if>
          <xsl:if test="$path != @filename">
            <p outputclass="xsl-subtitle-filename">
              Filename: <codeph outputclass="xsl-subtitle-filename-name"
                               ><xsl:value-of select="@filename"/></codeph>
            </p>
          </xsl:if>
          <!--list of imports and inclusions-->
          <xsl:if test="../xsl:import | ../xsl:include">
            <p outputclass="xsl-subtitle-import">
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
              <ul outputclass="xsl-list-section-imports">
               <xsl:for-each select="( ../xsl:import | ../xsl:include )/@href">
                <xsl:variable name="href" select="."/>
                <xsl:for-each select="document(.,.)/xsl:*">
                  <li outputclass="xsl-list-section-imports-item">
                    <xsl:call-template name="xv:format-file-information">
                      <xsl:with-param name="href" select="$href"/>
                    </xsl:call-template>
                  </li>
                </xsl:for-each>
               </xsl:for-each>
              </ul>
            </p>
          </xsl:if>
          <!--more metadata-->
          <codeblock><xsl:value-of select="@info"/></codeblock>
          <!--sheet-wide documentation-->
          <xsl:apply-templates mode="xs:body"
                         select="*[not(self::xs:title)]"/>
        </xsl:for-each>
        <xsl:call-template name="xs:report-top-level-elements"/>
        <xsl:call-template name="xs:report-documented-groups"/>
      </xsl:otherwise>
    </xsl:choose>
    </body>
  </topic>
</xsl:template>

<xs:template>
  <para>
    A group delimits a set of top-level constructs for documentary purposes.
  </para>
</xs:template>
<xsl:template match="*" mode="xv:report-documented-group">
  <topic id="{generate-id(.)}" outputclass="xsl-subsection">
    <xsl:copy-of select="@id"/>
    <xsl:for-each select="xs:title">
      <title>
        <xsl:apply-templates mode="xs:body" select="node()"/>
      </title>
    </xsl:for-each>
    <body>
      <xsl:apply-templates mode="xs:body" select="*[not(self::xs:title)]"/>
      <xsl:call-template name="xs:report-top-level-elements"/>
    </body>
  </topic>
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
    <topic id="{generate-id(/)}" outputclass="xsl-index">
      <title>Index</title>
      <body>
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
      </body>
    </topic>
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
  <b outputclass="xsl-index-letter-title">
    <xref href="#index-{$letter}">
      <xsl:value-of select="$letter"/>
    </xref>
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
    <b outputclass="xsl-index-letter-section">
      <xsl:value-of select="$letter"/>
    </b>
    <ul>
      <xsl:call-template name="xs:sort-entries">
        <xsl:with-param name="entries" select="$entries"/>
      </xsl:call-template>
    </ul>
  </p>
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
    <ph outputclass="xsl-index-entry-link">
      <xref href="#{$xv:rootid}/{generate-id(.)}">
        <xsl:attribute name="outputclass">
          <xsl:text>xsl-index-top-level </xsl:text>
          <xsl:text/>xsl-<xsl:value-of select="local-name(.)"/>
        </xsl:attribute>
        <codeph outputclass="xsl-index-entry-name">
          <xsl:value-of select="@name"/>
          <xsl:if test="self::xsl:function">
            <i>
              <xsl:value-of select="concat('(',count(xsl:param),')')"/>
            </i>
          </xsl:if>
        </codeph>
      </xref>
      <xsl:text> (</xsl:text>
      <xsl:for-each select="$doc-node/xs:title | 
                            $doc-node/xs:doc[@info][1]/xs:title">
        <xref href="#{$xv:rootid}/{generate-id($doc-node)}"
              outputclass="xsl-index-entry-module-title">
          <xsl:apply-templates mode="xs:body" select="node()"/>
        </xref>
        <xsl:text> - </xsl:text>
      </xsl:for-each>
      <xref href="#{$xv:rootid}/{generate-id((ancestor::*)[1])}"
            outputclass="xsl-index-entry-module-name">
        <codeph>
          <xsl:value-of select="$filename"/>
        </codeph>
      </xref>
      <xsl:text>)</xsl:text>
    </ph>
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
  <topic id="{generate-id(/)}" outputclass="xsl-section">
    <title>Inconsistencies Detected!</title>
    <body>
      <xsl:copy-of select="$report-inconsistencies"/>
    </body>
  </topic>
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
  <topic id="{generate-id(/)}" outputclass="xsl-subsection">
    <title><xsl:copy-of select="$title"/></title>
    <body>
      <xsl:if test="string($reports)">
        <ul>
          <xsl:copy-of select="$reports"/>
        </ul>
      </xsl:if>
      <xsl:copy-of select="$subreports"/>
    </body>
  </topic>
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
    <xref href="#{$xv:rootid}/{generate-id(..)}">
      <xsl:choose>
        <xsl:when test="@filename">
          <codeph><xsl:value-of select="@filename"/></codeph>
        </xsl:when>
        <xsl:when test="xs:title">
          <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
        </xsl:when>
        <xsl:otherwise>
          <codeph><xsl:value-of select="@info"/></codeph>
        </xsl:otherwise>
      </xsl:choose>
    </xref>
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
    <xref href="#{$xv:rootid}/{generate-id(.)}">
      <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
    </xref>
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
              <xref href="#{$xv:rootid}/{generate-id(.)}">
                <xsl:value-of select="@name"/>
              </xref>
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
  <p id="{generate-id(.)}" outputclass="xsl-{local-name(.)} xsl-top-level">
    <xsl:copy-of select="@id"/>
    <codeph>
      <xsl:for-each select="@name">
        <b outputclass="xsl-block-name">
          <xsl:value-of select="."/>
        </b>
      </xsl:for-each>
      <xsl:if test="self::xsl:function">
        <i outputclass="xsl-block-function-param">
          <xsl:value-of select="concat('(',count(xsl:param),')')"/>
        </i>
      </xsl:if>
      <xsl:for-each select="@match">
        <xsl:text> </xsl:text>
        <b outputclass="xsl-block-match">
          <xsl:value-of select="concat(name(.),'=&quot;',.,'&quot;')"/>
        </b>
      </xsl:for-each>
      <xsl:for-each select="@*[name(.)!='name' and name(.)!='match']">
        <xsl:text> </xsl:text>
        <b outputclass="xsl-block-other">
          <xsl:value-of select="concat(name(.),'=&quot;',.,'&quot;')"/>
        </b>
      </xsl:for-each>
      <i outputclass="xsl-block-type">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="name(.)"/>
        <xsl:text>)</xsl:text>
      </i>
    </codeph>
    <xsl:for-each select="$doc">
      <!--use <dl> for indentation-->
      <dl>
        <dlentry>
          <dd outputclass="xsl-detail-{local-name(.)}">
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
    <p outputclass="xsl-template-parameter">
      <xsl:text>Parameter </xsl:text>
      <codeph>
        <b outputclass="xsl-template-parameter-name">
          <xsl:value-of select="@name"/>
        </b>
        <xsl:for-each select="$this/xsl:param[@name=current()/@name]">
          <!--only report the a few attributes-->
          <xsl:for-each select="@as | @required | @tunnel">
            <xsl:text> </xsl:text>
            <b outputclass="xsl-template-parameter-attributes">
              <xsl:value-of select="concat(name(.),'=&quot;',.,'&quot;')"/>
            </b>
          </xsl:for-each>
        </xsl:for-each>
      </codeph>
      <!--use <dl> for indentation-->
      <dl>
        <dlentry>
          <dd outputclass="xsl-template-detail-parameter">
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
  <xref href="#{$xv:rootid}/{generate-id(.)}"
        outputclass="xsl-file-reference-link">
    <xsl:choose>
      <xsl:when test="xs:doc[@info][1]">
        <xsl:for-each select="xs:doc[@info][1]">
          <ph outputclass="xsl-file-reference-title">
            <xsl:apply-templates mode="xs:body" select="xs:title/node()"/>
          </ph>
          <xsl:if test="normalize-space( concat( @filename, $href ) )">
            <xsl:text> - </xsl:text>
            <codeph outputclass="xsl-file-reference-name">
              <xsl:choose>
                <xsl:when test="@filename">
                  <xsl:value-of select="@filename"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="$href"/>
                </xsl:otherwise>
              </xsl:choose>
            </codeph>
          </xsl:if>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <codeph outputclass="xsl-file-reference-name">
          <xsl:value-of select="$href"/>
        </codeph>
      </xsl:otherwise>
    </xsl:choose>
  </xref>
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
  <codeph>
    <xsl:copy-of select="$text"/>
  </codeph>
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
<xsl:template match="xs:title">
  <title><xsl:apply-templates mode="xs:body"/></title>
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
          <xsl:for-each select="ancestor::dita/topic//topic/title
                          [count(ancestor::topic)&lt;$xslstyle-toc-depth + 2]">
            <dt>
              <!--indent once for each level-->
              <xsl:for-each select="ancestor::topic[../../../../self::*]">
          <xsl:text>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;</xsl:text>
              </xsl:for-each>
              <!--determine section number for exposure and linking-->
              <xsl:variable name="this">
                <xsl:number level="multiple" count="topic[not(parent::dita)]"
                            format="1.1."/>
              </xsl:variable>
              <xsl:value-of select="$this"/>
              <xsl:text> </xsl:text>
              <!--link to the section-->
              <xref href="#{$xv:rootid}/xslstyle-toc-{$this}">
                <xsl:for-each select="../@id">
                  <xsl:attribute name="href">
                    <xsl:text/>#<xsl:value-of select="$xv:rootid"/>
                    <xsl:text/>/<xsl:value-of select="."/>
                  </xsl:attribute>
                </xsl:for-each>
                <!--reproduce the title-->
                <xsl:copy-of select="node()"/>
              </xref>
            </dt>
          </xsl:for-each>
        </dlentry>
      </dl>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xs:template>
  <para>
    Any other <literal>xs:</literal> element has no recognized functionality,
    so just process the children.
  </para>
</xs:template>
<xsl:template match="xs:*" mode="xs:intermediate">
  <xsl:apply-templates select="."/>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Intermediate processing of DITA constructs</xs:title>
  <para>Dress up the DITA with content and defaulted attributes</para>
  <para>
    Note that the synthesized stylesheet fragment 
    <literal>xslstyle-ditadef</literal> takes care of the DITA 1.1
    vocabulary.
  </para>
</xs:doc>

<xs:template>
 <para>Inject an <literal>id=</literal> attribute on topics without one.</para>
</xs:template>
<xsl:template match="topic/node()[1]" mode="xs:intermediate">
  <xsl:if test="not(../@id)">
    <xsl:attribute name="id">
      <xsl:text>xslstyle-toc-</xsl:text>
      <xsl:number level="multiple" count="topic[not(parent::dita)]"
                  format="1.1."/>
    </xsl:attribute>
  </xsl:if>
  <xsl:apply-imports/>
</xsl:template>

<xs:template>
  <para>Inject a section number at the start of topic titles</para>
</xs:template>
<xsl:template match="topic/title/node()[1]" mode="xs:intermediate">
  <xsl:if test="count(ancestor::topic)>1">
    <xsl:number level="multiple" count="topic[not(parent::dita)]"
                format="1.1."/>
    <xsl:text> </xsl:text>
  </xsl:if>
  <xsl:apply-imports/>
</xsl:template>

<xs:template>
  <para>All other DITA constructs should be handled just for their
        defaulted attributes.</para>
</xs:template>
<xsl:template match="*" mode="xs:intermediate">
  <xsl:apply-imports/>
</xsl:template>

</xsl:stylesheet>
