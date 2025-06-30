<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-dita.xsl"?>
<!DOCTYPE xsl:stylesheet
[
<!ENTITY XS "XSLStyle&#x2122;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<!--an example import-->
<xsl:import href="ditaex1.xsl"/>

<!--another example import-->
<xsl:import href="ditaex2.xsl"/>

<xs:doc info="$Id: ditaex.xsl,v 1.5 2010/03/02 17:05:43 gkholman Exp $"
        filename="ditaex.xsl" global-ns="xs" vocabulary="DITA">
  <xs:title>&XS; illustration for the DITA vocabulary</xs:title>
  <p>
    This stylesheet embeds the DITA vocabulary into the XSLStyle
    scaffolding used to document the constructs in an XSLT stylesheet.
    For ease of use, any namespace that may be attached to the documentation
    constructs found inside of the XSLStyle constructs is stripped before
    the rendering stylesheets are invoked, thus keeping the XSLT author from
    having to worry about default namespace declarations and such simply
    for the documentation.
  </p>
  <p>
    &XS; implements a methodology for styling stylesheets
    using a documentation vocabulary into formatted documentation and
    rigourous completeness reports.
    Note that the use of "&#x2122;" is only to protect using this name for
    this set of stylesheets.  The use of these stylesheets is subject to
    the following license:
  </p>
  <codeblock>
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
</codeblock>
</xs:doc>

<xs:doc>
  <xs:title>How to use &XS;</xs:title>
<p>
  See the "XSLT Resources" section linked from the top of the
  <xref format="html" href="http://www.CraneSoftwrights.com/links/res-xs.htm">
    <codeph>http://www.CraneSoftwrights.com</codeph></xref>
  "Free resources" web page for up-to-date information on invocation.
</p>
  <topic>
    <title>Basic mechanisms</title>
    <p>
      The W3C stylesheet association specification
      <xref format="html" href="http://www.w3.org/1999/06/REC-xml-stylesheet-19990629"><codeph>http://www.w3.org/1999/06/REC-xml-stylesheet-19990629</codeph></xref>
      provides for indicating a stylesheet with which to render an XML
      document.  
      This indication is done by way of an XML processing instruction.
    </p>
    <p>
      XSLT stylesheets are XML documents so the stylesheet association
      processing instruction can be added to XSLT documents, suggesting a
      stylesheet with which to render the stylesheet.
    </p>
    <p>
      The XSLTStyle&#x2122; stylesheet and stylesheet library provides an
      environment in which any documentation vocabulary can be used to
      annotate and XSLT stylesheet with documentation.  Furthermore, the
      stylesheet can enforce "business rules" regarding the stylesheets,
      thus being a tool in development for measuring the compliance or
      completeness of an XSLT stylesheet according to those rules.
    </p>
    <p>
      XSLT allows non-XSLT-namespace constructs at the top-level of an XSLT
      stylesheet (except in advance of <codeph>&lt;xsl:import></codeph>
      instructions).  The embedded documentation, using any vocabulary, is
      wrapped by top-level elements in the XSLT stylesheet using the 
      &XS; vocabulary.  The &XS; vocabulary is
      detected by these stylesheets and the wrapped content is fed to the
      rendering stylesheets, which then render the result as HTML to the
      output (typically a web browser screen).
    </p>
  <topic>
    <title>For documentation</title>
    <p>
      &XS; does not, itself, define a documentation vocabulary.
      It is merely a structural vocabulary for decorating an XSLT stylesheet,
      within which a documentation vocabulary is used for the actual prose
      of the documentation.
    </p>
    <p>
      These example stylesheets themselves are documented using
      <ulink url="http://www.oasis-open.org/committees/dita/">DITA</ulink>,
      though there is no obligation with which to do so.  
      The &XS; stylesheet fragments (including that for DITA) are documented in
      <xref format="html" href="http://www.DocBook.org">DocBook</xref>
      The author has also utilized the
      <xref format="html" href="https://www.icmwg.org/">Intelligence Community 
      Metadata Standard for Publications - ICMSP</xref> vocabulary in a 
      similar embedding mechanism with which a set of ICMSP stylesheets
      are documented (in that they document themselves).
    </p>
    <p>
      Thus, the mechanism is independent of the documentation vocabulary, and
      all documentation vocabulary handling is localized at the top stylesheet
      of a stylesheet import tree, where the top documentation-specific
      stylesheet imports the &XS; stylesheet.  This top stylesheet
      implements interpetation of the embedded vocabulary, either directly
      within the fragment or by importing the stylesheets required.
    </p>
 </topic>
  <topic>
    <title>For completeness</title>
    <p>
      The power of XSLT allows arbitrary business rules to be coded, using
      XPath addresses to find content in an XML document, and stylesheet
      logic to establish if the content meets the constraints of the rules.
    </p>
    <p>
      A stylesheet writing team can choose the business rules for writing
      stylesheets, encode the detection and confirmation of meeting these
      rules in XSLT, and list any detectable incompleteness as a section of 
      the final report.
    </p>
    <p>
      A stylesheet writer's manager, then, could choose not to accept a
      stylesheet as being completely finished until the embedded documentation
      report is free of all business rule inconsistencies.
    </p>
    <p>
      For a quick demonstration of this, remove any &XS;
      documentation construct from the stylesheet producing this report
      and refresh the report to see the inconsistencies section.  You can
      remove any top-level element's documentation construct, or a template
      rule parameter's documentation construct in order to trigger the display
      of this business rule violation section.  Restoring the documentation
      will restore the report not to have any inconsistencies section.
    </p>
    <p>
      The inconsistency report can be suppressed by setting the invocation
      parameter <codeph>suppress-inconsistencies</codeph> to true.
    </p>
  </topic>
  </topic>
  <topic>
    <title>Using the vocabulary</title>
    <topic>
      <title>Stylesheet fragment stylesheet engagement</title>
      <p>
        Each stylesheet with &XS; documentation, or at the least
        those that are at the top of an XSLT import tree, needs a processing
        instruction to automatically engage the stylesheet fragment when
        processed with XSLT.  For example, the invocation of the DITA
        shell around &XS; at the top of this stylesheet reads as:
      </p>
      <codeblock>
&lt;?xml-stylesheet type="text/xsl" href="xslstyle-dita.xsl"?>
</codeblock>
      <p>
        Note this processing instruction is not mandatory as the stylesheet
        could of course be invoked explicitly in a command line shell that
        knows which &XS; stylesheet shell to use, but by embedding the
        processing instruction one could invoke the XSLT processor in the 
        command line shell to just use the <codeph>xml-stylesheet</codeph>
        processing instruction.
      </p>
    </topic>
    <topic>
      <title>Stylesheet fragment documentation</title>
      <p>
        Any stylesheet with &XS; documentation must have an
        <codeph>&lt;xs:doc></codeph> element with an <codeph>info=</codeph>
        attribute showing metadata information, a 
        <codeph>filename=</codeph>
        attribute having some unique filename information identifying the file
        (so as to be unambiguous with any other stylesheet), and a
        <codeph>vocabulary=</codeph>
        attribute indicating the vocabulary being embedded.
        These attributes
        must be attached to the first <codeph>&lt;xs:doc></codeph> in the
        document.
        This first <codeph>&lt;xs:doc></codeph> must also have an
        <codeph>&lt;xs:title></codeph> child as the overall title of the
        documentation.
      </p>
      <p>
        You can choose to use any level of detail in either the
        <codeph>info=</codeph> or <codeph>filename=</codeph> attributes
        as there are no restrictions to the content. Use whatever you
        will find helpful in the final report to identify the fragment 
        and understand the metadata.
        These stylesheets happen to use CVS source code control metadata
        in the information attribute.  The following is an example from an
        earlier edition of this stylesheet:
      </p>
        <codeblock>
&lt;xs:doc info="&#x24;Id: xslstyle.xsl,v 1.17 2005/10/17 04:58:43 G. Ken Holman Exp $"
        filename="xslstyle.xsl" global-ns="xs" vocabulary="DITA">
  &lt;xs:title>&XS; illustration for the DITA vocabulary&lt;/xs:title>
  &lt;p>
    XSLStyle&amp;#x2122; implements a methodology for styling stylesheets
    using a documentation vocabulary into formatted documentation and
    rigourous completeness reports.
    Note that the use of "&amp;#x2122;" is only to protect using this name for
    this set of stylesheets.  The use of these stylesheets is subject to
    the following license:
  &lt;/p>
  &lt;codeblock>
Copyright (C) - Crane Softwrights Ltd.
...
&lt;/xs:doc> 
</codeblock>
      <p>
        There are a number of other top-level <codeph>&lt;xs:doc></codeph>
        attributes corresponding to external and internal stylesheets,
        and suppressing or expanding portions of the final report.  Please
        see the corresponding shell stylesheet that wraps the core stylesheet
        supporting this vocabulary.
      </p>
      <p>
        All other <codeph>&lt;xs:doc></codeph> elements in the stylesheet
        must not have these attributes, but may be present in order to
        indicate major sections of the stylesheet that group the top level
        elements for some reason, typically promoting good stylesheet
        maintenance.  These have an <codeph>&lt;xs:title></codeph> element
        child used for indexing.  For example, again from this stylesheet, the
        documentation for the next section of this report:
      <codeblock>
&lt;xs:doc>
  &lt;xs:title>Global properties&lt;/xs:title>
  &lt;p>
    These are the invocation and/or importation properties that can be set
    when either invoking the stylesheet from the command line, or using an
    importing stylesheet to import this while overriding these properties.
  &lt;/p>
&lt;/xs:doc>
</codeblock>
      </p>

      <p>
        If you look inside this example stylesheet you will note that
        sections are embedded in the documentation using
        <codeph>&lt;topic></codeph> elements.  This environment will supply
        defaulted <codeph>id=</codeph> and <codeph>class=</codeph> attributes
        where required, so the embedded documentation need not have them
        unless you feel you need them.
      </p>
<codeblock>
  &lt;topic>
    &lt;title>Using the vocabulary&lt;/title>
    &lt;topic>
      &lt;title>Stylesheet fragment stylesheet engagement&lt;/title>
      &lt;p>
        Each stylesheet with &XS; documentation, or at the least
        ...
</codeblock>
      <p>
        Note that the <codeph>global-ns=</codeph> and 
        <codeph>internal-ns=</codeph> attributes support a
        business rule created for these particular stylesheets:  the
        attributes enumerate in a space-separated list all of the 
        namespace prefixes allowed for names of top-level constructs
        and modes for template matching rules.  Internal variables are
        summarized separately from global variables.
        An inconsistency is reported for
        any top-level element violating this rule, unless the element uses
        <codeph>ignore-ns="yes"</codeph> to explicitly state that
        it does not belong in the namespace of the
        stylesheet's global constructs, as this stylesheet does for
        command-line invocation parameters:
      </p>
      <codeblock>
&lt;xs:param ignore-ns='yes'>
  &lt;p>
    Invocation/importation parameter set to true to expose the entire import
    tree instead of just the portion of the import tree that is documented
    with XSLStyle&amp;#x2122; constructs (stopping at the point where there are
    no such constructs).
  &lt;/p>
&lt;/xs:param>
&lt;xsl:param name="force-full-import-tree" select="false()"/>
</codeblock>
    <p>
      The inconsistency report for global namespace naming violations
      can be suppressed by setting the invocation
      parameter <codeph>suppress-non-ns-global-reports</codeph> to true.
    </p>
    <p>
      The content of the &XS; construct is any content that
      is recognized by the documentation vocabulary stylesheets rendering
      the report.  This is the content gleaned from the stylesheet to
      make up the final report.
    </p>
    </topic>
    <topic>
      <title>Stylsheet top-level element documentation</title>
      <p>
        These stylesheets implement the business rule that each and every
        top-level XSLT element must be documented using an &XS;
        construct.  This construct must have the same local name as the
        top-level XSLT element.  It must be the immediately-preceding element
        (see the <codeph>&lt;xs:param></codeph> example in the previous
        section), or it can reside anywhere in the top-level of the 
        stylesheet if both the XSLT element and the &XS; 
        element have the same <codeph>name=</codeph> attribute value.
      </p>
      <p>
        Furthermore, every <codeph>&lt;xs:template></codeph> element
        documenting an <codeph>&lt;xst:template></codeph> element
        must have an <codeph>&lt;xs:param></codeph> child element, with
        a <codeph>name=</codeph> attribute, for each of the template's
        invocation parameters.  The following is an example:
      </p>
      <codeblock>
&lt;xs:template>
  &lt;p>
    This adds a reference to the in-memory reference tree, maintaining the
    path of the module referenced.
  &lt;/p>
  &lt;xs:param name="path">
    &lt;p>This is the parent's path so far, on which to build this path.&lt;/p>
  &lt;/xs:param>
  &lt;xs:param name="href">
    &lt;p>
      This is the &lt;codeph>href=&lt;/codeph> attribute used by the parent to
      call this module.
    &lt;/p>
  &lt;/xs:param>
&lt;/xs:template>
&lt;xsl:template match="*" mode="xs:collect-module-hrefs">
  &lt;xsl:param name="path"/>
  &lt;xsl:param name="href"/>
...
</codeblock>
    <p>
      Top-level elements without names can be suppressed from the report
      by setting the invocation parameter
      <codeph>suppress-unamed-construct-documentation</codeph> to true.
    </p>
    </topic>
  </topic>
  <topic>
    <title>Using the import/include tree</title>
    <p>
      After the table of contents, the import/include tree is shown for
      the set of stylesheets imported and included from the stylesheet
      being documented.  The report will stop a particular branch of the
      import tree when it encounters a fragment without &XS;
      embedded documentation, or whose embedded documentation is using a
      different vocabulary.  A complete report of the full import tree
      can be engaged by setting the invocation parameter
      <codeph>force-full-import-tree</codeph> to true.
    </p>
    <p>
      Each entry in the import tree is hyperlinked to the report's
      documentation for that stylesheet fragment, thus, it is only necessary
      to browse the "top" fragment in the import tree to see all of the
      documentation for all of the fragments in the entire import tree.
    </p>
  </topic>
  <topic>
    <title>Using the index of named XSLT top-level elements</title>
    <p>
      At the bottom of the report, before any inconsistencies, is a
      generated index of all of the named XSLT top-level elements in
      the entire import tree.  This is alphabetized by the local name
      of the construct, and sub-indexed by the first letter of the
      local name.
    </p>
    <p>
      Each entry is hyperlinked three ways: to the construct's entry
      in the report, to the construct's group heading in the report,
      and to the construct's stylesheet fragment documentation in the report.
    </p>
  </topic>
</xs:doc>

<!--========================================================================-->

<xs:doc>
  <xs:title>Global properties</xs:title>
  <p>
    These are the invocation and/or importation properties that can be set
    when either invoking the stylesheet from the command line, or using an
    importing stylesheet to import this while overriding these properties.
  </p>
</xs:doc>

<xs:param ignore-ns='yes'>
  <p>
    This is an example
  </p>
</xs:param>
<xsl:param name="this" select="false()"/>

<xs:variable ignore-ns='yes'>
  <p>
    That is an example
  </p>
</xs:variable>
<xsl:variable name="that" select="false()"/>

<xs:doc>
  <xs:title>One of everything else</xs:title>
  <p>
    These are the invocation and/or importation properties that can be set
    when either invoking the stylesheet from the command line, or using an
    importing stylesheet to import this while overriding these properties.
  </p>
</xs:doc>

<xs:template>
  <p>A sample template</p>
</xs:template>
<xsl:template name="xs:sample"/>

<xs:attribute-set>
  <p>A sample attribute set</p>
</xs:attribute-set>
<xsl:attribute-set name="xs:attribute-set"/>

<xs:key>
  <p>A sample key</p>
</xs:key>
<xsl:key name="xs:key" match="abc" use="def"/>

<xs:character-map>
  <p>A sample character map</p>
</xs:character-map>
<xsl:character-map name="xs:character-map"/>

<xs:function>
  <p>A sample function</p>
</xs:function>
<xsl:function name="xs:sample" as="xs:string"/>

</xsl:stylesheet>
