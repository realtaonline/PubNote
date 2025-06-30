<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-docbook.xsl"?>
<!DOCTYPE xsl:stylesheet
[
<!ENTITY XS "XSLStyle&#x2122;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns="urn:X-Crane:test:of:namespace:stripping"
                exclude-result-prefixes="xs"
                version="1.0">

<!--an example import-->
<xsl:import href="docbookex1.xsl"/>

<!--another example import-->
<xsl:import href="docbookex2.xsl"/>

<xs:doc info="$Id: docbookex.xsl,v 1.4 2010/03/02 17:05:43 gkholman Exp $"
        filename="docbookex.xsl" global-ns="xs" vocabulary="DocBook">
  <xs:title>&XS; illustration for the DocBook vocabulary</xs:title>
  <para>
    This stylesheet embeds the DocBook vocabulary into the XSLStyle
    scaffolding used to document the constructs in an XSLT stylesheet.
    For ease of use, any namespace that may be attached to the documentation
    constructs found inside of the XSLStyle constructs is stripped before
    the rendering stylesheets are invoked, thus keeping the XSLT author from
    having to worry about default namespace declarations and such simply
    for the documentation.
  </para>
  <para>
    &XS; implements a methodology for styling stylesheets
    using a documentation vocabulary into formatted documentation and
    rigourous completeness reports.
    Note that the use of "&#x2122;" is only to protect using this name for
    this set of stylesheets.  The use of these stylesheets is subject to
    the following license:
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
      These example stylesheets themselves are documented using
      <ulink url="http://www.DocBook.org">DocBook</ulink>,
      though there is no obligation with which to do so.  
      Other vocabularies suppored include
      <ulink url="http://www.oasis-open.org/committees/dita/">DITA</ulink>.
      The author has also utilized the
      <ulink url="https://www.icmwg.org/">Intelligence Community 
      Metadata Standard for Publications - ICMSP</ulink> vocabulary in a 
      similar embedding mechanism with which a set of ICMSP stylesheets
      are documented (in that they document themselves).
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
      parameter <literal>suppress-inconsistencies</literal> to true.
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
&lt;?xml-stylesheet type="text/xsl" href="xslstyle-dita.xsl"?>
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
&lt;xs:doc info="&#x24;Id: xslstyle.xsl,v 1.17 2005/10/17 04:58:43 G. Ken Holman Exp $"
        filename="xslstyle.xsl" global-ns="xs" vocabulary="DocBook">
  &lt;xs:title>&XS; illustration for the DocBook vocabulary&lt;/xs:title>
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
        There are a number of other top-level <literal>&lt;xs:doc></literal>
        attributes corresponding to external and internal stylesheets,
        and suppressing or expanding portions of the final report.  Please
        see the corresponding shell stylesheet that wraps the core stylesheet
        supporting this vocabulary.
      </para>
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
        If you look inside this example stylesheet you will note that
        sections are embedded in the documentation using
        <literal>&lt;section></literal> elements.  This environment will supply
        defaulted <literal>id=</literal> and <literal>class=</literal> attributes
        where required, so the embedded documentation need not have them
        unless you feel you need them.
      </para>
<programlisting>
  &lt;section>
    &lt;title>Using the vocabulary&lt;/title>
    &lt;section>
      &lt;title>Stylesheet fragment stylesheet engagement&lt;/title>
      &lt;para>
        Each stylesheet with &XS; documentation, or at the least
        ...
</programlisting>
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
    This is an example
  </para>
</xs:param>
<xsl:param name="this" select="false()"/>

<xs:variable ignore-ns='yes'>
  <para>
    That is an example
  </para>
</xs:variable>
<xsl:variable name="that" select="false()"/>

<xs:doc>
  <xs:title>One of everything else</xs:title>
  <para>
    These are the invocation and/or importation properties that can be set
    when either invoking the stylesheet from the command line, or using an
    importing stylesheet to import this while overriding these properties.
  </para>
</xs:doc>

<xs:template>
  <para>A sample template</para>
</xs:template>
<xsl:template name="xs:sample"/>

<xs:attribute-set>
  <para>A sample attribute set</para>
</xs:attribute-set>
<xsl:attribute-set name="xs:attribute-set"/>

<xs:key>
  <para>A sample key</para>
</xs:key>
<xsl:key name="xs:key" match="abc" use="def"/>

<xs:character-map>
  <para>A sample character map</para>
</xs:character-map>
<xsl:character-map name="xs:character-map"/>

<xs:function>
  <para>A sample function</para>
</xs:function>
<xsl:function name="xs:sample" as="xs:string"/>

</xsl:stylesheet>
