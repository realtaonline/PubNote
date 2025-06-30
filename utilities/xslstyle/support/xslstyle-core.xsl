<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-docbook.xsl"?>
<!DOCTYPE xsl:stylesheet
[
<!ENTITY XS "XSLStyle&#x2122;">
<!ENTITY no-name "0123456789._:">
<!ENTITY upper "ABCDEFGHIJKLMNOPQRSTUVWXYZ">
<!ENTITY lower "abcdefghijklmnopqrstuvwxyz">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
              xmlns:xv="http://www.CraneSoftwrights.com/ns/xslstyle/vocabulary"
                exclude-result-prefixes="xs xv"
                version="1.0">

<!--use a generic module for converting result tree fragments to node sets-->
<xsl:import href="xslstyle-nodes.xsl"/>

<xs:doc info="$Id: xslstyle-core.xsl,v 1.44 2010/08/17 01:24:08 admin Exp $"
        filename="xslstyle-core.xsl" global-ns="xs" internal-ns="xv"
        vocabulary="DocBook">
  <xs:title>&XS;</xs:title>
  <para>
    &XS; implements a methodology for styling stylesheets
    using a documentation vocabulary into formatted documentation and
    rigourous completeness reports.
    Note that the use of "&#x2122;" is only to protect using this name for
    this set of stylesheets.  The use of these stylesheets is subject to
    the following license:
  </para>
  <para>
    This version only hints at a couple of obvious XSLT 2.0 features, such
    as the built in mode names of <literal>#default</literal> and 
    <literal>#current</literal>.  This is not a complete XSLT 2.0 
    implementation.
  </para>
  <para>
    This core stylesheet is not used on its own, rather, it is imported by a
    stylesheet framework that imports a presentation library in addition to
    this module.  The core delivers the harvested documentation to the
    presentation stylesheets either with or without intermediate processing.
  </para>
</xs:doc>
<!--
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
-->

<xs:doc>
  <xs:title>How to use &XS;</xs:title>
<para>
  See the "XSLT Resources" section linked from the top of the
  <ulink url="http://www.CraneSoftwrights.com/links/res-xs.htm">
    <literal>http://www.CraneSoftwrights.com</literal></ulink>
  "Free resources" web page for up-to-date information on invocation.
</para>
  <section>
    <title>Basic mechanisms</title>
    <para>
      The W3C stylesheet association specification
      <ulink url="http://www.w3.org/1999/06/REC-xml-stylesheet-19990629"><literal>http://www.w3.org/1999/06/REC-xml-stylesheet-19990629</literal></ulink>
      provides for indicating a stylesheet with which to render an XML
      document.  
      This indication is done by way of an XML processing instruction.
    </para>
    <para>
      XSLT stylesheets are XML documents so the stylesheet association
      processing instruction can be added to XSLT documents, suggesting a
      stylesheet with which to render the stylesheet.
    </para>
    <para>
      The XSLTStyle&#x2122; stylesheet and stylesheet library provides an
      environment in which any documentation vocabulary can be used to
      annotate and XSLT stylesheet with documentation.  Furthermore, the
      stylesheet can enforce "business rules" regarding the stylesheets,
      thus being a tool in development for measuring the compliance or
      completeness of an XSLT stylesheet according to those rules.
    </para>
    <para>
      XSLT allows non-XSLT-namespace constructs at the top-level of an XSLT
      stylesheet (except in advance of <literal>&lt;xsl:import></literal>
      instructions).  The embedded documentation, using any vocabulary, is
      wrapped by top-level elements in the XSLT stylesheet using the 
      &XS; vocabulary.  The &XS; vocabulary is
      detected by these stylesheets and the wrapped content is fed to the
      rendering stylesheets, which then render the result as HTML to the
      output (typically a web browser screen).
    </para>
  <section>
    <title>For documentation</title>
    <para>
      &XS; does not, itself, define a documentation vocabulary.
      It is merely a structural vocabulary for decorating an XSLT stylesheet,
      within which a documentation vocabulary is used for the actual prose
      of the documentation.
    </para>
    <para>
      These stylesheets themselves are documented using
      <ulink url="http://www.DocBook.org">DocBook</ulink>, though there is
      no obligation with which to do so.  The author has also utilized the
      <ulink url="https://www.icmwg.org/">Intelligence Community 
      Metadata Standard for Publications - ICMSP</ulink> vocabulary in a 
      similar embedding mechanism with which a set of ICMSP stylesheets
      are documented (in that they document themselves).  Another available
      vocabulary is the 
      <ulink url="http://www.oasis-open.org/committees/dita/">OASIS Darwin 
      Information Typing Architecture (DITA)</ulink>,
      where the stylesheets themselves are documented using DocBook but the
      stylesheets format stylesheets documented using DITA.
    </para>
    <para>
      Thus, the mechanism is independent of the documentation vocabulary, and
      all documentation vocabulary handling is localized at the top stylesheet
      of a stylesheet import tree, where the top documentation-specific
      stylesheet imports the &XS; stylesheet.  This top stylesheet
      implements interpetation of the embedded vocabulary, either directly
      within the fragment or by importing the stylesheets required.
    </para>
 </section>
  <section>
    <title>For completeness</title>
    <para>
      The power of XSLT allows arbitrary business rules to be coded, using
      XPath addresses to find content in an XML document, and stylesheet
      logic to establish if the content meets the constraints of the rules.
    </para>
    <para>
      A stylesheet writing team can choose the business rules for writing
      stylesheets, encode the detection and confirmation of meeting these
      rules in XSLT, and list any detectable incompleteness as a section of 
      the final report.
    </para>
    <para>
      A stylesheet writer's manager, then, could choose not to accept a
      stylesheet as being completely finished until the embedded documentation
      report is free of all business rule inconsistencies.
    </para>
    <para>
      For a quick demonstration of this, remove any &XS;
      documentation construct from the stylesheet producing this report
      and refresh the report to see the inconsistencies section.  You can
      remove any top-level element's documentation construct, or a template
      rule parameter's documentation construct in order to trigger the display
      of this business rule violation section.  Restoring the documentation
      will restore the report not to have any inconsistencies section.
    </para>
    <para>
      The inconsistency report can be suppressed by setting the invocation
      parameter <literal>xslstyle-suppress-inconsistencies</literal> to true.
    </para>
  </section>
  </section>
  <section>
    <title>Using the vocabulary</title>
    <section>
      <title>Stylesheet fragment stylesheet engagement</title>
      <para>
        Each stylesheet with &XS; documentation, or at the least
        those that are at the top of an XSLT import tree, needs a processing
        instruction to automatically engage the stylesheet fragment when
        processed with XSLT.  For example, the invocation of the DocBook
        shell around &XS; at the top of this stylesheet reads as:
      </para>
      <programlisting>
&lt;?xml-stylesheet type="text/xsl" href="xslstyle-docbook.xsl"?>
</programlisting>
      <para>
        Note this processing instruction is not mandatory as the stylesheet
        could of course be invoked explicitly in a command line shell that
        knows which &XS; stylesheet shell to use, but by embedding the
        processing instruction one could invoke the XSLT processor in the 
        command line shell to just use the <literal>xml-stylesheet</literal>
        processing instruction.
      </para>
    </section>
    <section>
      <title>Stylesheet fragment documentation</title>
      <para>
        Any stylesheet with &XS; documentation must have an
        <literal>&lt;xs:doc></literal> element with an <literal>info=</literal>
        attribute showing metadata information, a 
        <literal>filename=</literal>
        attribute having some unique filename information identifying the file
        (so as to be unambiguous with any other stylesheet), and a
        <literal>vocabulary=</literal>
        attribute indicating the vocabulary being embedded.
        These attributes
        must be attached to the first <literal>&lt;xs:doc></literal> in the
        document.
        This first <literal>&lt;xs:doc></literal> must also have an
        <literal>&lt;xs:title></literal> child as the overall title of the
        documentation.
      </para>
      <para>
        You can choose to use any level of detail in either the
        <literal>info=</literal> or <literal>filename=</literal> attributes
        as there are no restrictions to the content. Use whatever you
        will find helpful in the final report to identify the fragment 
        and understand the metadata.
        These stylesheets happen to use CVS source code control metadata
        in the information attribute.  The following is an example from an
        earlier edition of this stylesheet:
      </para>
        <programlisting>
&lt;xs:doc info="&#x24;Id: xslstyle-core.xsl,v 1.17 2005/10/17 04:58:43 G. Ken Holman Exp $"
        filename="xslstyle-core.xsl" global-ns="xs" vocabulary="DocBook">
  &lt;xs:title>XSLStyle&amp;#x2122;&lt;/xs:title>
  &lt;para>
    XSLStyle&amp;#x2122; implements a methodology for styling stylesheets
    using a documentation vocabulary into formatted documentation and
    rigourous completeness reports.
    Note that the use of "&amp;#x2122;" is only to protect using this name for
    this set of stylesheets.  The use of these stylesheets is subject to
    the following license:
  &lt;/para>
  &lt;programlisting>
Copyright (C) - Crane Softwrights Ltd.
...
&lt;/xs:doc> 
</programlisting>
      <para>
        All other <literal>&lt;xs:doc></literal> elements in the stylesheet
        must not have these attributes, but may be present in order to
        indicate major sections of the stylesheet that group the top level
        elements for some reason, typically promoting good stylesheet
        maintenance.  These have an <literal>&lt;xs:title></literal> element
        child used for indexing.  For example, again from this stylesheet, the
        documentation for the next section of this report:
      <programlisting>
&lt;xs:doc>
  &lt;xs:title>Global properties&lt;/xs:title>
  &lt;para>
    These are the invocation and/or importation properties that can be set
    when either invoking the stylesheet from the command line, or using an
    importing stylesheet to import this while overriding these properties.
  &lt;/para>
&lt;/xs:doc>
</programlisting>
      </para>
      <para>
        Note that the <literal>global-ns=</literal> and 
        <literal>internal-ns=</literal> attributes support a
        business rule created for these particular stylesheets:  the
        attributes enumerate in a space-separated list all of the 
        namespace prefixes allowed for names of top-level constructs
        and modes for template matching rules.  Internal variables are
        summarized separately from global variables.
        An inconsistency is reported for
        any top-level element violating this rule, unless the element uses
        <literal>ignore-ns="yes"</literal> to explicitly state that
        it does not belong in the namespace of the
        stylesheet's global constructs, as this stylesheet does for
        command-line invocation parameters:
      </para>
      <programlisting>
&lt;xs:param ignore-ns='yes'>
  &lt;para>
    Invocation/importation parameter set to true to expose the entire import
    tree instead of just the portion of the import tree that is documented
    with XSLStyle&amp;#x2122; constructs (stopping at the point where there are
    no such constructs).
  &lt;/para>
&lt;/xs:param>
&lt;xsl:param name="force-full-import-tree" select="false()"/>
</programlisting>
    <para>
      The inconsistency report for global namespace naming violations
      can be suppressed by setting the invocation
      parameter <literal>suppress-non-ns-global-reports</literal> to true.
    </para>
    <para>
      The content of the &XS; construct is any content that
      is recognized by the documentation vocabulary stylesheets rendering
      the report.  This is the content gleaned from the stylesheet to
      make up the final report.
    </para>
    </section>
    <section>
      <title>Stylsheet top-level element documentation</title>
      <para>
        These stylesheets implement the business rule that each and every
        top-level XSLT element must be documented using an &XS;
        construct.  This construct must have the same local name as the
        top-level XSLT element.  It must be the immediately-preceding element
        (see the <literal>&lt;xs:param></literal> example in the previous
        section), or it can reside anywhere in the top-level of the 
        stylesheet if both the XSLT element and the &XS; 
        element have the same <literal>name=</literal> attribute value.
      </para>
      <para>
        Furthermore, every <literal>&lt;xs:template></literal> element
        documenting an <literal>&lt;xst:template></literal> element
        must have an <literal>&lt;xs:param></literal> child element, with
        a <literal>name=</literal> attribute, for each of the template's
        invocation parameters.  The following is an example:
      </para>
      <programlisting>
&lt;xs:template>
  &lt;para>
    This adds a reference to the in-memory reference tree, maintaining the
    path of the module referenced.
  &lt;/para>
  &lt;xs:param name="path">
    &lt;para>This is the parent's path so far, on which to build this path.&lt;/para>
  &lt;/xs:param>
  &lt;xs:param name="href">
    &lt;para>
      This is the &lt;literal>href=&lt;/literal> attribute used by the parent to
      call this module.
    &lt;/para>
  &lt;/xs:param>
&lt;/xs:template>
&lt;xsl:template match="*" mode="xs:collect-module-hrefs">
  &lt;xsl:param name="path"/>
  &lt;xsl:param name="href"/>
...
</programlisting>
    <para>
      Top-level elements without names can be suppressed from the report
      by setting the invocation parameter
      <literal>suppress-unamed-construct-documentation</literal> to true.
    </para>
    </section>
  </section>
  <section>
    <title>Using the import/include tree</title>
    <para>
      After the table of contents, the import/include tree is shown for
      the set of stylesheets imported and included from the stylesheet
      being documented.  The report will stop a particular branch of the
      import tree when it encounters a fragment without &XS;
      embedded documentation, or whose embedded documentation is using a
      different vocabulary.  A complete report of the full import tree
      can be engaged by setting the invocation parameter
      <literal>force-full-import-tree</literal> to true.
    </para>
    <para>
      Each entry in the import tree is hyperlinked to the report's
      documentation for that stylesheet fragment, thus, it is only necessary
      to browse the "top" fragment in the import tree to see all of the
      documentation for all of the fragments in the entire import tree.
    </para>
  </section>
  <section>
    <title>Using the index of named XSLT top-level elements</title>
    <para>
      At the bottom of the report, before any inconsistencies, is a
      generated index of all of the named XSLT top-level elements in
      the entire import tree.  This is alphabetized by the local name
      of the construct, and sub-indexed by the first letter of the
      local name.
    </para>
    <para>
      Each entry is hyperlinked three ways: to the construct's entry
      in the report, to the construct's group heading in the report,
      and to the construct's stylesheet fragment documentation in the report.
    </para>
  </section>
</xs:doc>

<!--========================================================================-->

<xs:doc>
  <xs:title>Global properties</xs:title>
  <para>
    These are the invocation and/or importation properties that can be set
    when either invoking the stylesheet from the command line, or using an
    importing stylesheet to import this while overriding these properties.
  </para>
</xs:doc>

<xs:param ignore-ns='yes'>
  <para>
    Invocation/importation parameter set to true to expose the entire import
    tree instead of just the portion of the import tree that is documented
    with &XS; constructs (stopping at the point where there are
    no such constructs).
  </para>
</xs:param>
<xsl:param name="xslstyle-force-full-import-tree" select="false()"/>

<xs:param ignore-ns='yes'>
  <para>
    Invocation/importation parameter set to true to suppress the reporting
    of detected inconsistencies.
  </para>
</xs:param>
<xsl:param name="xslstyle-suppress-inconsistencies" select="false()"/>

<xs:param ignore-ns='yes'>
  <para>
    Invocation/importation parameter set to true to suppress the reporting
    of global names and modes not being in the set of declared global
    namespaces.
  </para>
</xs:param>
<xsl:param name="xslstyle-suppress-non-ns-global-reports" select="false()"/>

<xs:param ignore-ns='yes'>
  <para>
    By default, all top-level constructs must be documented, through this
    parameter the complaining about this can be suppressed for unnamed 
    constructs (but not for named constructs).
  </para>
</xs:param>
<xsl:param name="xslstyle-suppress-unnamed-construct-documentation" 
           select="false()"/>

<xs:output>
  <para>
    Use ASCII encoding as "lowest common denominator" for character sets;
    using this prevents character set problems in Internet Explorer
  </para>
</xs:output>
<xsl:output encoding="us-ascii"/>

<!--========================================================================-->

<xs:doc>
  <xs:title>Shared top-level properties</xs:title>
  <para>
    These are the properties set either by a global property or by an
    attribute on xs:doc on the top stylesheet.
  </para>
</xs:doc>

<xs:variable ignore-ns="yes" internal="yes">
  <para>Definition of external CSS stylesheet</para>
</xs:variable>
<xsl:variable name="xv:external-css">
  <xsl:choose>
    <xsl:when test="normalize-space(/*/xs:doc[1]/@external-css)">
      <xsl:value-of select="/*/xs:doc[1]/@external-css"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$xslstyle-external-css"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xs:variable>
  <para>
    Definition of internal CSS stylesheet.
  </para>
</xs:variable>
<xsl:variable name="xv:internal-css">
  <xsl:choose>
    <xsl:when test="normalize-space(/*/xs:doc[1]/@internal-css)">
      <xsl:value-of select="/*/xs:doc[1]/@internal-css"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$xslstyle-internal-css"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xs:variable>
  <para>
    Signal the rendering of the table of contents.
  </para>
</xs:variable>
<xsl:variable name="xv:show-toc">
  <xsl:choose>
    <xsl:when test="normalize-space(/*/xs:doc[1]/@show-toc)">
      <xsl:value-of select="/*/xs:doc[1]/@show-toc"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$xslstyle-show-toc"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xs:variable>
  <para>
    Signal the rendering of the import tree.
  </para>
</xs:variable>
<xsl:variable name="xv:show-tree">
  <xsl:choose>
    <xsl:when test="normalize-space(/*/xs:doc[1]/@show-tree)">
      <xsl:value-of select="/*/xs:doc[1]/@show-tree"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$xslstyle-show-tree"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xs:variable>
  <para>
    Signal the rendering of the invocation parameters.
  </para>
</xs:variable>
<xsl:variable name="xv:show-params">
  <xsl:choose>
    <xsl:when test="normalize-space(/*/xs:doc[1]/@show-params)">
      <xsl:value-of select="/*/xs:doc[1]/@show-params"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$xslstyle-show-params"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xs:variable>
  <para>
    Signal the rendering of the specialization parameters.
  </para>
</xs:variable>
<xsl:variable name="xv:show-spec-params">
  <xsl:choose>
    <xsl:when test="normalize-space(/*/xs:doc[1]/@show-spec-params)">
      <xsl:value-of select="/*/xs:doc[1]/@show-spec-params"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$xslstyle-show-spec-params"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xs:variable>
  <para>
    Signal the rendering of the index.
  </para>
</xs:variable>
<xsl:variable name="xv:show-index">
  <xsl:choose>
    <xsl:when test="normalize-space(/*/xs:doc[1]/@show-index)">
      <xsl:value-of select="/*/xs:doc[1]/@show-index"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$xslstyle-show-index"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<!--========================================================================-->
<xs:doc>
  <xs:title>Source tree initial handling</xs:title>
</xs:doc>

<xs:variable>
  <para>
    Keeps the root node of the input document around regardless of the
    context of the current node.
  </para>
</xs:variable>
<xsl:variable name="xv:input-document-element" select="document('',/)/*"/>

<xs:template>
  <para>
    This fallback triggers when a non-XSLT stylesheet is attempted to be
    formatted by this stylesheet.
  </para>
</xs:template>
<xsl:template match="/*" mode="xs:body">
  <xsl:message terminate="yes">
    <xsl:text>This stylesheet is reserved for XSLT stylesheets that </xsl:text>
    <xsl:text>have embedded XSLStyle documentation elements.</xsl:text>
  </xsl:message>
</xsl:template>

<xs:variable>
  <para>
    This is a true/false indication of the need to do intermediate processing
    on the harvested documentation.
  </para>
</xs:variable>
<xsl:variable name="xv:use-intermediate" select="true()"/>

<xs:variable>
  <para>
    This is a true/false indication of the need to expose the transformed
    intermediate document.
  </para>
</xs:variable>
<xsl:variable name="xv:debug-intermediate" select="false()"/>

<xs:template>
  <para>
    This triggers for an XSLT stylesheet and begins the creation of the result
    tree as a result-tree fragment in a documentation vocabulary.  
    This is then given to xs:rtf2nodesIntermedate in order to push the 
    documentation vocabulary through a second pass before being pushed to
    the imported vocabulary stylesheets.
  </para>
</xs:template>
<xsl:template match="/xsl:stylesheet | /xsl:transform" 
              priority="1" mode="xs:body">
  <xsl:variable name="documentation">
    <xsl:for-each select="/*/xs:doc[@info][1]">
      <xsl:call-template name="xv:format-document"/>
    </xsl:for-each>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$xv:debug-intermediate">
      <xsl:copy-of select="$documentation"/>
    </xsl:when>
    <xsl:when test="$xv:use-intermediate">
      <xsl:call-template name="xs:rtf2nodes">
        <xsl:with-param name="rtf">
          <xsl:call-template name="xs:rtf2nodesIntermediate">
            <xsl:with-param name="rtf" select="$documentation"/>
          </xsl:call-template>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="xs:rtf2nodes">
        <xsl:with-param name="rtf" select="$documentation"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Collect content for the body of the report</xs:title>
</xs:doc>

<xs:template>
  <para>
    Starting at the document element of the input document, determine if
    there is an import tree to report, and do so if there is.  Then collect
    the fragments for formatting for the remainder of the body by building
    a result tree of stylesheet import and include references and pushing
    that tree through template rules.
  </para>
</xs:template>
<xsl:template name="xs:process-body">
  <xsl:for-each select="$xv:input-document-element">
    <xsl:if test="xsl:import | xsl:include">
      <xsl:call-template name="xv:format-tree"/>
    </xsl:if>
  </xsl:for-each>
  <xsl:call-template name="xs:rtf2nodes">
    <xsl:with-param name="rtf">
      <xs:inputparams>
        <xsl:apply-templates select="$xv:input-document-element"
                             mode="xs:collect-parameters"/>
      </xs:inputparams>
    </xsl:with-param>
    <xsl:with-param name="internal" select="true()"/>
  </xsl:call-template>
  <xsl:call-template name="xs:rtf2nodes">
    <xsl:with-param name="rtf">
      <xs:references>
        <xsl:apply-templates select="$xv:input-document-element"
                             mode="xs:collect-module-hrefs"/>
      </xs:references>
    </xsl:with-param>
    <xsl:with-param name="internal" select="true()"/>
  </xsl:call-template>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Create and walk the parameter tree looking for params</xs:title>
</xs:doc>

<xs:template>
  <para>Collect all invocation parameters from all stylesheet fragments.</para>
</xs:template>
<xsl:template match="xsl:stylesheet | xsl:transform"
              mode="xs:collect-parameters">
  <xsl:variable name="internal-prefixes" 
             select="concat(' ',normalize-space(xs:doc[1]/@internal-ns),' ')"/>
  <xsl:for-each select="xsl:param | xsl:variable">
    <xs:inputparam name="{@name}" file="{/*/xs:doc[@info]/@filename}" 
                   idref="{generate-id(.)}" sortby="{@name}"
                   type="{local-name(.)}" internal="no" required="{@required}">
      <xsl:if test="contains(@name,':')">
        <xsl:attribute name="sortby">
          <xsl:value-of select="substring-after(@name,':')"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="contains($internal-prefixes,
                             concat(' ',substring-before(@name,':'),' '))">
        <xsl:attribute name="internal">yes</xsl:attribute>
      </xsl:if>
   <xsl:copy-of select="preceding-sibling::*[1][self::xs:variable]/@internal"/>
      <xsl:copy-of select="/*/xs:doc[@info]/xs:title/node()"/>
    </xs:inputparam>
  </xsl:for-each>
  <xsl:for-each select="xsl:import | xsl:include">
    <xsl:sort select="position()" data-type="number" order="descending"/>
    <xsl:apply-templates select="document(@href,.)/*[xs:*]" 
                         mode="xs:collect-parameters"/>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>Present input parameters and variables</para>
</xs:template>
<xsl:template match="xs:inputparams">
  <xsl:if test="xs:inputparam[@type='param']">
    <xsl:call-template name="xv:format-input-params">
      <xsl:with-param name="params" 
                      select="xs:inputparam[@type='param']"/>
    </xsl:call-template>
  </xsl:if>
  <xsl:if test="xs:inputparam[@type='variable'][@internal='no']">
    <xsl:call-template name="xv:format-spec-params">
      <xsl:with-param name="params" 
                     select="xs:inputparam[@type='variable'][@internal='no']"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>Order presented input parameters</para>
  <xs:param name="params">
    <para>Collection of all invocation parameters found</para>
  </xs:param>
</xs:template>
<xsl:template name="xs:order-params">
  <xsl:param name="params" select="/.."/>
  <xsl:for-each select="$params">
    <xsl:sort select="@sortby"/>
    <xsl:call-template name="xv:format-param"/>
  </xsl:for-each>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Create and walk the reference tree looking for errors</xs:title>
</xs:doc>

<xs:template>
  <para>
    This adds a reference to the in-memory reference tree, maintaining the
    path of the module referenced.
  </para>
  <xs:param name="path">
    <para>This is the parent's path so far, on which to build this path.</para>
  </xs:param>
  <xs:param name="href">
    <para>
      This is the <literal>href=</literal> attribute used by the parent to
      call this module.
    </para>
  </xs:param>
</xs:template>
<xsl:template match="*" mode="xs:collect-module-hrefs">
  <xsl:param name="path"/>
  <xsl:param name="href"/>
  <xs:reference href="{$href}" path="{$path}">
    <xsl:if test="xs:doc[@info] or $xslstyle-force-full-import-tree">
      <xsl:for-each select="xsl:import | xsl:include">
        <xsl:sort select="position()" data-type="number" order="descending"/>
        <xsl:variable name="this-href" select="@href"/>
        <xsl:apply-templates select="document($this-href,.)/*" 
                             mode="xs:collect-module-hrefs">
          <xsl:with-param name="href" select="$this-href"/>
          <xsl:with-param name="path">
            <xsl:choose>
              <xsl:when test="contains($this-href,':')">
                <!--assume this is an absolute URI so previous is irrelevant-->
                <xsl:value-of select="$this-href"/>
              </xsl:when>
              <xsl:otherwise>
                <!--assume this is a relative URI in addition to previous-->
                <xsl:call-template name="xs:path-stem">
                  <xsl:with-param name="path" select="$path"/>
                </xsl:call-template>
                <xsl:value-of select="$this-href"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:with-param>
        </xsl:apply-templates>
      </xsl:for-each>
    </xsl:if>
  </xs:reference>
</xsl:template>

<xs:template>
  <para>
    Handle the references created in the temporary reference tree.
    Look first for bad imports/includes, then walk through the references
    in importance order (reverse importation order).
  </para>
</xs:template>
<xsl:template match="xs:references">
  <xsl:for-each select="xs:reference">
   <xsl:variable name="bad-imports">
     <xsl:apply-templates select="xsl:import | xsl:include" 
                          mode="xs:find-bad-imports"/>
   </xsl:variable>
   <xsl:if test="string($bad-imports)">
     <xsl:message terminate="yes">
       <xsl:value-of select="$bad-imports"/>
     </xsl:message>
   </xsl:if>
   <xsl:apply-templates mode="xs:walk-references-once" select="."/>
 </xsl:for-each>
</xsl:template>

<xs:template>
  <para>Follow imports and includes.</para>
  <xs:param name="path">
    <para>
      The path of the module in which these import/include statements are 
      found.
    </para>
  </xs:param>
</xs:template>
<xsl:template match="xsl:import | xsl:include" mode="xs:find-bad-imports">
  <xsl:param name="path" select="''"/>
  <xsl:variable name="this-href" select="@href"/>
  <xsl:variable name="this-doc" select="document($this-href,.)"/>
  <xsl:choose>
    <xsl:when test="not($this-doc)">
      <xsl:call-template name="xs:find-bad-imports">
        <xsl:with-param name="path" select="concat( $path,'/',$this-href )"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates select="$this-doc/*" mode="xs:find-bad-imports">
        <xsl:with-param name="path" select="concat( $path,'/',$this-href )"/>
      </xsl:apply-templates>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xs:template>
  <para>
    At this point, either there was no document at the given href=, or the
    document element of the document at the given href= is not XSLT.
  </para>
  <xs:param name="path">
    <para>
      The path of the module in which these import/include statements are 
      found.
    </para>
  </xs:param>
</xs:template>
<xsl:template match="*" mode="xs:find-bad-imports" name="xs:find-bad-imports">
  <xsl:param name="path"/>
  <xsl:text>Import tree missing file or non-XSLT stylesheet: </xsl:text>
  <xsl:value-of select="$path"/>
  <xsl:text>
</xsl:text>
</xsl:template>

<xs:template>
  <para>
    So far, so good ... an href= has pointed to an XSLT stlyesheet
  </para>
  <xs:param name="path">
    <para>
      The path of the module found.
    </para>
  </xs:param>
</xs:template>
<xsl:template match="xsl:stylesheet | xsl:transform" 
              mode="xs:find-bad-imports">
  <xsl:param name="path"/>
  <xsl:apply-templates select="xsl:import | xsl:include" 
                       mode="xs:find-bad-imports">
    <xsl:with-param name="path" select="$path"/>
  </xsl:apply-templates>
</xsl:template>

<xs:doc>
  <xs:title>Walking the import tree</xs:title>
</xs:doc>

<xs:template>
  <para>
    This will traverse the import tree in importance order (reverse import
    order), and collect all of the modules, acting on each one only once,
    remembering the visited modules so that a given module is not reported
    on twice even if it is imported/included twice.
  </para>
  <para>
    After the tree is traversed, complete the body of the reporting using the
    visited set of modules.
  </para>
  <xs:param name="visited">
    <para>
      The running collection of visited modules (to prevent duplicates).
      These are <literal>xsl:stylesheet</literal> and 
      <literal>xsl:transform</literal> nodes.
    </para>
  </xs:param>
</xs:template>
<xsl:template mode="xs:walk-references-once" match="xs:reference">
  <xsl:param name="visited" select="/.."/>
  <xsl:variable name="path" select="@path"/>
  <xsl:variable name="this-referenced-document" 
                select="document(string($path),$xv:input-document-element)/*"/>
  <xsl:variable name="nextss" select="$visited | $this-referenced-document"/>
  <!--determine if the module being examined has already been visited-->
  <xsl:if test="count($visited)!=count($nextss)">
    <!--not already visited, so do the work for this module-->
    <xsl:for-each select="$this-referenced-document">
      <xsl:call-template name="xv:format-module">
        <xsl:with-param name="path" select="$path"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:if>
  <!--determine the next module in importance order (reverse import order)-->
  <xsl:variable name="next" 
                select="( xs:reference | 
                    ancestor-or-self::*/following-sibling::xs:reference )[1]"/>
  <xsl:choose>
    <xsl:when test="$next">
      <!--there is a next-->
      <xsl:apply-templates mode="xs:walk-references-once" select="$next">
        <xsl:with-param name="visited" select="$nextss"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="index-set" 
                    select="$nextss[xs:doc]/*[not(self::xs:*)][@name]"/>
      <!--there is no next, so now produce the index at the end-->
      <xsl:if test="$index-set">
        <xsl:call-template name="xv:format-index">
          <xsl:with-param name="top-level-elements"  select="$index-set"/>
        </xsl:call-template>
      </xsl:if>

      <!--next produce a report of detectable inconsistencies-->
      <xsl:if test="not($xslstyle-suppress-inconsistencies)">
        <xsl:call-template name="xs:report-inconsistencies">
          <xsl:with-param name="modules" select="$nextss[xs:doc]"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xs:template>
  <para>
    This handles the listing of each of the importation entries in the
    import tree.
  </para>
</xs:template>
<xsl:template name="xs:collect-and-format-tree-entries"
              match="xsl:import | xsl:include" mode="xs:toc">
  <xsl:for-each select="xsl:import | xsl:include">
    <xsl:sort select="position()" data-type="number" order="descending"/>
    <xsl:variable name="href" select="@href"/>
    <xsl:for-each select="document($href,.)">
      <xsl:for-each select="xsl:stylesheet | xsl:transform">
        <xsl:call-template name="xv:format-tree-entry">
          <xsl:with-param name="href" select="$href"/>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Organizing the information for a module</xs:title>
</xs:doc>

<xs:template>
  <para>
    Report all of the groups for the current module.
  </para>
</xs:template>
<xsl:template name="xs:report-documented-groups">
  <xsl:apply-templates mode="xv:report-documented-group"
                       select="xs:doc[not(@info)]"/>
</xsl:template>

<xs:template>
  <para>
    Determine and report all of the top-level elements in the groups.
  </para>
</xs:template>
<xsl:template name="xs:report-top-level-elements">
  <xsl:choose>
    <xsl:when test="self::xsl:stylesheet | self::xsl:transform">
      <!--this is the unlabeled group of top-level elements at start of file-->
      <xsl:apply-templates mode="xs:find-next-top-level-element"
                           select="*[1]"/>
    </xsl:when>
    <xsl:otherwise>
      <!--this is one of the groups inside the file-->
      <xsl:call-template name="xs:look-next-top-level-element"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xs:template>
  <para>
    Begin (when called) and continue (when applied) looking for the next
    XSLT top-level element for documenting in the report.
  </para>
</xs:template>
<xsl:template name="xs:look-next-top-level-element"
              match="*"
              mode="xs:find-next-top-level-element">
  <xsl:apply-templates mode="xs:find-next-top-level-element"
                       select="following-sibling::*[1]"/>
</xsl:template>

<xs:template>
  <para>
    Don't bother with main &XS; documentation or the import
    and include members that are already documented in the import tree.
  </para>
</xs:template>
<xsl:template match="xs:doc[@info] | xs:*[not(self::xs:doc)] |
                     xsl:import | xsl:include"
              mode="xs:find-next-top-level-element" priority="3">
  <xsl:call-template name="xs:look-next-top-level-element"/>
</xsl:template>

<xs:template>
  <para>
    Stop (by doing nothing) when the next group of elements is found.  That
    group will be handled by <literal>xs:report-documented-groups</literal>
  </para>
</xs:template>
<xsl:template match="xs:doc"
              mode="xs:find-next-top-level-element"
              priority="2"/>

<xs:template>
  <para>
    Found an XSLT construct to be documented.
  </para>
</xs:template>
<xsl:template match="xsl:*" mode="xs:find-next-top-level-element"
              priority="1">
  <xsl:choose>
    <xsl:when test="@name">
      <!--report a named top-level element-->
      <xsl:apply-templates select="." mode="xv:report-top-level-element">
        <xsl:with-param name="doc" 
                        select="../xs:*[local-name(.)=local-name(current()) and
                                      @name = current()/@name] | 
                           preceding-sibling::*[1][not(@name)]
                           [self::xs:*[local-name(.)=local-name(current())]]"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:when test="not($xslstyle-suppress-unnamed-construct-documentation)">
      <!--report an unnamed top-level element-->
      <xsl:apply-templates select="." 
                           mode="xv:report-top-level-element">
        <xsl:with-param name="doc" 
                        select="preceding-sibling::*[1][not(@name)]
                           [self::xs:*[local-name(.)=local-name(current())]]"/>
      </xsl:apply-templates>
    </xsl:when>
  </xsl:choose>
  <xsl:call-template name="xs:look-next-top-level-element"/>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Index groupings and support</xs:title>
</xs:doc>

<xs:template>
  <para>
    Determine, sort and report the first letter of the local portion of the
    possibly qualified top-level element's name for all named top-level
    elements.
  </para>
  <xs:param name="top-level-elements">
    <para>All of the top-level elements across all modules.</para>
  </xs:param>
</xs:template>
<xsl:template name="xs:index-entry-letters">
  <xsl:param name="top-level-elements"/>
  <xsl:for-each select="$top-level-elements[@name]">
    <!--sort by all letters of construct's local name-->
    <xsl:sort select="translate( translate( substring-after( @name, 
                                              substring-before( @name, ':' ) ),
                                            '&no-name;',''),
                                 '&lower;','&upper;')"/>
    <!--grab the first letter-->
    <xsl:variable name="letter" 
      select="translate( 
                  substring( 
                      translate( substring-after(@name,
                                    substring-before( @name, ':' ) ),
                          '      &no-name;','')
                      ,1,1),
                  '&lower;','&upper;')"/>
    <!--only do work at the first in document order for the given letter-->
    <xsl:if test="generate-id(.)=
                  generate-id($top-level-elements[
                              translate( 
                                substring( 
                                  translate( substring-after(@name,
                                              substring-before( @name, ':' ) ),
                                             '&no-name;','')
                                  ,1,1),
                                '&lower;','&upper;')  = $letter][1])">
      <!--produce an index letter for the group of index letters-->
      <xsl:call-template name="xv:format-entry-letter">
        <xsl:with-param name="letter" select="$letter"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>
    Format all of the entries for all of the leters.
  </para>
  <xs:param name="top-level-elements">
    <para>All of the named top-level elements </para>
  </xs:param>
</xs:template>
<xsl:template name="xs:index-entries">
  <xsl:param name="top-level-elements"/>
  <xsl:for-each select="$top-level-elements[@name]">
    <xsl:sort select="translate(
                        translate( 
                          substring-after( @name, 
                                           substring-before( @name, ':' ) ),
                          '&no-name;',''),
                        '&lower;','&upper;')"/>
    <xsl:variable name="letter" 
      select="translate(
                  substring( 
                     translate( substring-after(@name,
                                    substring-before(@name, ':' ) ),
                                '&no-name;',''),
                      1,1),
                   '&lower;','&upper;')"/>
    <xsl:if test="generate-id(.)=
                  generate-id($top-level-elements[
                       translate(
                          substring( 
                             translate( substring-after(@name,
                                              substring-before( @name, ':' ) ),
                                        '&no-name;',''),
                             1,1),
                          '&lower;','&upper;')  = $letter][1])">
      <xsl:call-template name="xv:format-entries">
        <xsl:with-param name="letter" select="$letter"/>
        <xsl:with-param name="entries" 
                        select="$top-level-elements[
                                 translate(
                                   substring( 
                                     translate( substring-after(@name,
                                              substring-before( @name, ':' ) ),
                                                '&no-name;',''),
                                     1,1),
                                   '&lower;','&upper;')  = $letter]"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>
    Gather the information for each of the entries so they can be
    individually formatted in the index.
  </para>
  <para>
    Sort first by the entry's name, then by the prefix, then by the arity.
  </para>
  <xs:param name="entries">
    <para>All of the entries for the current letter.</para>
  </xs:param>
</xs:template>
<xsl:template name="xs:sort-entries">
  <xsl:param name="entries"/>
  <xsl:for-each select="$entries">
    <xsl:sort select="translate(translate( substring-after(@name,
                                             substring-before( @name, ':' ) ),
                                           '&no-name;',''),
                                '&lower;','&upper;')"/>
    <xsl:sort select="substring-before(@name,':')"/>
    <xsl:sort select="count(xsl:param)"/>
    <xsl:apply-templates select="." mode="xv:format-entry">
      <xsl:with-param name="filename" select="../xs:doc[@info][1]/@filename"/>
      <xsl:with-param name="doc-node" 
              select="( .. | preceding-sibling::xs:doc[not(@info)] )[last()]"/>
    </xsl:apply-templates>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>Gather all of the consistencies to be reported</para>
  <xs:param name="modules">
    <para>All of the modules in the import tree.</para>
  </xs:param>
</xs:template>
<xsl:template name="xs:report-inconsistencies">
  <xsl:param name="modules"/>

  <xsl:variable name="report-inconsistencies">
    <xsl:call-template name="xs:check-xsdoc">
      <xsl:with-param name="modules" select="$modules"/>
    </xsl:call-template>

    <xsl:call-template name="xs:check-other">
      <xsl:with-param name="modules" select="$modules"/>
    </xsl:call-template>
  </xsl:variable>

  <xsl:if test="string($report-inconsistencies)">
    <xsl:call-template name="xv:report-detected-inconsistencies">
      <xsl:with-param name="modules" select="$modules"/>
      <xsl:with-param name="report-inconsistencies"
                      select="$report-inconsistencies"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>
    A hook to be overridden by an importing stylesheet in order to add
    custom inconsistency checks.
  </para>
  <xs:param name="modules">
    <para>All of the modules in the import tree.</para>
  </xs:param>
</xs:template>
<xsl:template name="xs:check-other">
  <xsl:param name="modules"/>
  <!--nothing done here by design; must be overridden-->
</xsl:template>

<xs:template>
  <para>
    The built-in &XS; inconsistency checks on modules.
  </para>
  <xs:param name="modules">
    <para>All of the modules in the import tree.</para>
  </xs:param>
</xs:template>
<xsl:template name="xs:check-xsdoc">
  <xsl:param name="modules"/>

  <xsl:variable name="xsdoc-inconsistencies">
    <!--check all modules for identifying constructs-->
    <xsl:if test="$modules[not(xs:doc[@info][@filename])]">
      <xsl:call-template name="xv:report-inconsistencies">
        <xsl:with-param name="title">
          <xsl:text>Module identification problems</xsl:text>
        </xsl:with-param>
        <xsl:with-param name="reports">
          <xsl:choose>
            <xsl:when test="not($modules[xs:doc[@info][@filename]])">
              <xsl:call-template name="xv:report-inconsistency">
                <xsl:with-param name="element" select="/.."/>
                <xsl:with-param name="message">
                  <xsl:text>(no module has identifying information)</xsl:text>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="xv:report-inconsistency">
                <xsl:with-param name="element" select="/.."/>
                <xsl:with-param name="message">
                  <xsl:text>found at least one module without any </xsl:text>
                  <xsl:text>&XS;identifying </xsl:text>
           <xsl:text>information, in that it does not have an </xsl:text>
           <xsl:text>xs:doc element with both info= and filename=; </xsl:text>
           <xsl:text>these can be found by not considering the </xsl:text>
           <xsl:text>following modules that do have identification: </xsl:text>
              <xsl:for-each select="$modules[xs:doc[@info][@filename]]">
                <xsl:if test="position()>1">, </xsl:if>
                <xsl:call-template name="xv:report-module-info">
                  <xsl:with-param name="module" select="."/>
                </xsl:call-template>
              </xsl:for-each>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:variable>
  <xsl:if test="string($xsdoc-inconsistencies)">
    <xsl:call-template name="xv:report-inconsistencies">
      <xsl:with-param name="title">
        &XS; construct problems
      </xsl:with-param>
      <xsl:with-param name="subreports">
        <xsl:copy-of select="$xsdoc-inconsistencies"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:if>

  <xsl:variable name="top-inconsistencies">
    <!--check out top-level construct documentation-->
    <xsl:variable name="top-level-doc">
      <xsl:for-each select="$modules">
        <xsl:sort select="xs:doc[@info][1]/@filename"/>
        <xsl:variable name="top-level-this-doc">
          <!--traverse either all XSLT constructs or only named ones-->
          <xsl:for-each select="xsl:*[not(self::xsl:import | 
                                          self::xsl:include)]
                    [not($xslstyle-suppress-unnamed-construct-documentation)] |
                                xsl:*[@name]">
            <!--sorted by the name of the construct-->
            <xsl:sort select="translate(translate( substring-after(@name,
       substring-before( @name, ':' ) ),'&no-name;',''),'&lower;','&upper;')"/>
            <!--report a problem if there is one-->
            <xsl:if test="not(../xs:*[@name=current()/@name]
                                     [local-name(.)=local-name(current())]
                              | preceding-sibling::*[1]
                           [self::xs:*[local-name(.)=local-name(current())]])">
              <xsl:call-template name="xv:report-inconsistency"/>
            </xsl:if>
          </xsl:for-each>
        </xsl:variable>
        <xsl:if test="string($top-level-this-doc)">
          <xsl:call-template name="xv:report-inconsistencies">
            <xsl:with-param name="title">
              <xsl:text>Module </xsl:text>
              <xsl:call-template name="xv:report-module-info">
                <xsl:with-param name="module" select="."/>
              </xsl:call-template>
            </xsl:with-param>
            <xsl:with-param name="reports">
              <xsl:copy-of select="$top-level-this-doc"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    <xsl:if test="string($top-level-doc)">
      <xsl:call-template name="xv:report-inconsistencies">
        <xsl:with-param name="title">
          <xsl:text>Top-level elements missing documentation</xsl:text>
        </xsl:with-param>
        <xsl:with-param name="subreports">
          <xsl:copy-of select="$top-level-doc"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <!--check individual construct declarations-->
    <xsl:variable name="construct-decls">
      <xsl:for-each select="$modules">
        <xsl:sort select="xs:doc[@info][1]/@filename"/>
        <xsl:variable name="module-inconsistencies">
          <xsl:variable name="template-inconsistencies">
           <xsl:apply-templates select="xsl:template" 
                                mode="xs:check-template">
              <xsl:with-param name="module" select="."/>
           </xsl:apply-templates>
          </xsl:variable>
          <xsl:if test="string($template-inconsistencies)">
            <xsl:call-template name="xv:report-inconsistencies">
              <xsl:with-param name="title">
                <literal>xsl:template</literal> problems
              </xsl:with-param>
              <xsl:with-param name="reports">
                <xsl:copy-of select="$template-inconsistencies"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:variable name="function-inconsistencies">
           <xsl:apply-templates select="xsl:function" 
                                mode="xs:check-template">
              <xsl:with-param name="module" select="."/>
           </xsl:apply-templates>
          </xsl:variable>
          <xsl:if test="string($function-inconsistencies)">
            <xsl:call-template name="xv:report-inconsistencies">
              <xsl:with-param name="title">
                <literal>xsl:function</literal> problems
              </xsl:with-param>
              <xsl:with-param name="reports">
                <xsl:copy-of select="$function-inconsistencies"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:if>
          <xsl:variable name="variable-inconsistencies">
            <xsl:apply-templates select="xsl:variable"
                                 mode="xs:check-template">
              <xsl:with-param name="module" select="."/>
            </xsl:apply-templates>
          </xsl:variable>
          <xsl:if test="string($variable-inconsistencies)">
            <xsl:call-template name="xv:report-inconsistencies">
              <xsl:with-param name="title">
                <literal>xsl:variable</literal> problems
              </xsl:with-param>
              <xsl:with-param name="reports">
                <xsl:copy-of select="$variable-inconsistencies"/>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:if>
        </xsl:variable>
        <xsl:if test="string($module-inconsistencies)">
          <xsl:call-template name="xv:report-inconsistencies">
            <xsl:with-param name="title">
              <xsl:text>Module </xsl:text>
              <xsl:call-template name="xv:report-module-info">
                <xsl:with-param name="module" select="."/>
              </xsl:call-template>
            </xsl:with-param>
            <xsl:with-param name="subreports">
              <xsl:copy-of select="$module-inconsistencies"/>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </xsl:variable>
    <xsl:if test="string($construct-decls)">
      <xsl:call-template name="xv:report-inconsistencies">
        <xsl:with-param name="title">
          <xsl:text>XSL construct problems</xsl:text>
        </xsl:with-param>
        <xsl:with-param name="subreports">
          <xsl:copy-of select="$construct-decls"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>

    <!--check use of namesapaces in namespace-qualified names and modes-->
    <xsl:variable name="xsdoc-element-needs">
      <xsl:apply-templates select="$modules" mode="xs:check-xsdoc">
        <xsl:sort select="xs:doc[@info][1]/@filename"/>
        <xsl:with-param name="modules" select="$modules"/>
      </xsl:apply-templates>
    </xsl:variable>
    <xsl:if test="string($xsdoc-element-needs)">
      <xsl:call-template name="xv:report-inconsistencies">
        <xsl:with-param name="title">
          <xsl:text>Namespace qualified top-level elements and modes</xsl:text>
        </xsl:with-param>
        <xsl:with-param name="reports">
          <xsl:copy-of select="$xsdoc-element-needs"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>

  </xsl:variable>
  <xsl:if test="string($top-inconsistencies)">
    <xsl:call-template name="xv:report-inconsistencies">
      <xsl:with-param name="title">
        Top-level element problems
      </xsl:with-param>
      <xsl:with-param name="subreports">
        <xsl:copy-of select="$top-inconsistencies"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>The inconsistency checking for <literal>xsl:variable</literal></para>
  <xs:param name="module">
    <para>The module containing the XSLT instruction.</para>
  </xs:param>
</xs:template>
<xsl:template match="xsl:variable" mode="xs:check-template">
  <xsl:variable name="xslt2" select="ancestor::xsl:stylesheet/@version>=2
                                 or ancestor::xsl:transform/@version>=2"/>
    <xsl:if test="$xslt2">
      <xsl:if test="not(@as)">
        <xsl:call-template name="xv:report-inconsistency">
          <xsl:with-param name="link-name" select="false()"/>
          <xsl:with-param name="message">
            <xsl:text>Missing type for global variable </xsl:text>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
</xsl:template>

<xs:template>
  <para>The inconsistency checking for <literal>xsl:template</literal> and
        <literal>xsl:function</literal></para>
  <xs:param name="module">
    <para>The module containing the XSLT instruction.</para>
  </xs:param>
</xs:template>
<xsl:template match="xsl:template | xsl:function" mode="xs:check-template">
  <xsl:param name="module"/>
  <xsl:variable name="doc" 
                select="../xs:template[@name=current()/@name] | 
                      preceding-sibling::*[1][self::xs:*]
                                          [local-name(.)=local-name(current())]
                                          [not(@name)]"/>
  <xsl:variable name="xslt2" select="$doc/ancestor::xsl:stylesheet/@version>=2
                                 or $doc/ancestor::xsl:transform/@version>=2"/>
  <xsl:if test="self::xsl:function and not(@as)">
    <xsl:call-template name="xv:report-inconsistency">
      <xsl:with-param name="link-name" select="false()"/>
      <xsl:with-param name="message">
        <xsl:text>Missing function type in </xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:for-each select="xsl:param">
    <xsl:if test="$xslt2">
      <xsl:if test="not(@as)">
        <xsl:call-template name="xv:report-inconsistency">
          <xsl:with-param name="link-name" select="false()"/>
          <xsl:with-param name="message">
            <xsl:text>Missing parameter type in </xsl:text>
            <xsl:call-template name="xv:report-element-info">
              <xsl:with-param name="group-info" select="false()"/>
              <xsl:with-param name="element" select=".."/>
            </xsl:call-template>
            <xsl:text> for </xsl:text>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
    <xsl:if test="not($doc/xs:param[@name=current()/@name])">
      <xsl:call-template name="xv:report-inconsistency">
        <xsl:with-param name="link-name" select="false()"/>
        <xsl:with-param name="message">
          <xsl:text>Missing documentation in </xsl:text>
          <xsl:call-template name="xv:report-element-info">
            <xsl:with-param name="group-info" select="false()"/>
            <xsl:with-param name="element" select=".."/>
          </xsl:call-template>
          <xsl:text> for </xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>
    The inconsistency checking for a module's use of &XS; 
    constructs.  This rule matches on the document element of the XSLT
    stylesheet.
  </para>
</xs:template>
<xsl:template match="*" mode="xs:check-xsdoc">
  <xsl:variable name="module" select="."/>
  <xsl:variable name="xsdoc" select="xs:doc[@info][@filename]"/>
  <xsl:choose>
    <xsl:when test="count($xsdoc)>1">
      <xsl:call-template name="xv:report-inconsistency">
        <xsl:with-param name="module" select="$module"/>
        <xsl:with-param name="message">
          <xsl:text>cannot have two or more xs:doc elements with </xsl:text>
          <xsl:text>an info= attribute</xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$xsdoc[@info]/preceding-sibling::*[not(self::xsl:import)]">
      <xsl:call-template name="xv:report-inconsistency">
        <xsl:with-param name="module" select="$module"/>
        <xsl:with-param name="message">
          <xsl:text>the xs:doc element with the info= attribute </xsl:text>
          <xsl:text>must preceed all top level elements except </xsl:text>
          <xsl:text>xsl:import</xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
  </xsl:choose>
  <xsl:if test="not($xslstyle-suppress-non-ns-global-reports)">
    <xsl:variable name="these-ns" 
        select="concat(' ',normalize-space(concat($xsdoc/@global-ns,' ',
                                                  $xsdoc/@internal-ns)),' ')"/>
    <xsl:if test="$these-ns != '  '">
      <!--check global names and modes for being in the global namespace-->
      <xsl:for-each select="xsl:*/@name | xsl:*/@mode">
        <xsl:variable name="prefix" 
                      select="substring-before(normalize-space(.),':')"/>
        <xsl:if test="normalize-space(.)!='#all' and
                      normalize-space(.)!='#default' and
                      ( not($prefix) 
                        or not(contains($these-ns,concat(' ',$prefix,' ' ))))
              and not( ( ../../xs:*[local-name(.)=local-name(current()/..)
                                    and @name=current()/../@name] |
                        ../preceding-sibling::*[1][self::xs:*][not(@name)] )/
                        @ignore-ns='yes' )">
          <xsl:call-template name="xv:report-inconsistency">
            <xsl:with-param name="module" select="$module"/>
            <xsl:with-param name="element" select=".."/>
            <xsl:with-param name="message">
              <xsl:call-template name="xv:report-monospaced-info">
                <xsl:with-param name="text">
                  <xsl:value-of select="name(.)"/>="<xsl:text/>
                  <xsl:value-of select="."/>"<xsl:text/>
                </xsl:with-param>
              </xsl:call-template>
              <xsl:text> not ignored and namespace prefix not in </xsl:text>
            <xsl:text>declared set of global and internal namespaces</xsl:text>
              <xsl:text> for top-level names and modes: </xsl:text>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>
  </xsl:if>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Utility templates</xs:title>
</xs:doc>

<xs:template>
  <para>
    This recursive template rule determines the stem portion of the path to
    a filename by extracting all content up to and including the last '/'.
  </para>
  <xs:param name="path">
    <para>The decimated path information as the stem is built.</para>
  </xs:param>
  <xs:param name="stem">
    <para>The accumulated stem information as the path is eaten.</para>
  </xs:param>
</xs:template>
<xsl:template name="xs:path-stem">
  <xsl:param name="path"/>
  <xsl:param name="stem"/>
  <xsl:choose>
    <xsl:when test="contains($path,'/')">
      <xsl:call-template name="xs:path-stem">
        <xsl:with-param name="stem"
                       select="concat($stem,substring-before($path,'/'),'/')"/>
        <xsl:with-param name="path" select="substring-after($path,'/')"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$stem"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xs:template>
  <para>
    This identity template preserves any pushed content in the XSLStyle
    stylesheets without interfering with the imported formatting stylesheets.
  </para>
</xs:template>
<xsl:template match="@* | node()" mode="xs:body">
  <xsl:copy>
    <xsl:apply-templates select="@*|node()" mode="xs:body"/>
  </xsl:copy>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Placebo vocabulary-specific templates</xs:title>
  <para>
    These constructs have no definition because they are expected to be
    supplied by an importing stylesheet.  There is no documentation for any
    of them.  For explanations of each, please see the
    <literal>xslstyle-docbook.xsl</literal> stylesheet documentation.
  </para>
  <para>
    The reason placebos are included in this stylesheet is so that the
    stylesheet will execute without a compile-time error, thus delivering
    the error message in <literal>xv:vocabulary</literal> below.
  </para>
</xs:doc>

<xs:variable>
  <para>Placebo variable.</para>
  <para>Report a fatal error that this cannot be used in isolation.</para>
</xs:variable>
<xsl:variable name="xv:vocabulary">
  <xsl:message terminate="yes">
    <xsl:text>XSLStyle(TM) from Crane Softwrights Ltd. cannot </xsl:text>
    <xsl:text>be used in isolation: use </xsl:text>
    <xsl:text>a vocabulary-specific importing stylesheet.</xsl:text>
  </xsl:message>
</xsl:variable>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-document"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-tree"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-input-params"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-spec-params"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-param"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-module"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-index"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-tree-entry"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:reported-documented-group"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:report-top-level-element"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-entry-letter"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-entries"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:format-entry"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:report-detected-inconsistencies"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:report-inconsistencies"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:report-inconsistency"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:report-module-info"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:report-element-info"/>

<xs:template><para>Placebo template.</para></xs:template>
<xsl:template name="xv:report-monospaced-info"/>

</xsl:stylesheet>
