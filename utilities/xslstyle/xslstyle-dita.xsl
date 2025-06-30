<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<!--the stylesheets implementing DITA for XSLStyle&#x2122;-->
<xsl:import href="support/xslstyle-dita-core.xsl"/>

<xs:doc filename="xslstyle-dita.xsl" global-ns="xs" 
  info="$Id: xslstyle-dita.xsl,v 1.19 2010/03/02 17:06:02 gkholman Exp $"
        vocabulary="DocBook">
  <xs:title>DITA shell for the XSLStyle&#x2122; environment</xs:title>
  <para>
    This shell for XSLStyle&#x2122; assumes that the embedded constructs
    are in the <ulink url="http://www.oasis-open.org/committees/dita/">OASIS
    Darwin Information Typing Architecture (DITA)</ulink> vocabulary.
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
  <xs:title>Using this shell</xs:title>
  <para>
    This shell only defines default values for the invocation parameters of the
    XSLStyle environment.  It imports the core stylesheets for this XSLStyle
    environment, providing values used by the core.
  </para>
  <para>
    There are two ways to take advantage of this shell:
  </para>
  <itemizedlist>
    <listitem>
      you can make a copy of this shell, set your own values for all defaults,
      and import the core stylesheets for the environment as this does, or
    </listitem>
    <listitem>
      you can create your own shell to import this shell and set your own
      values for only those defaults you want to change, leaving the other
      defaults as they are.
    </listitem>
  </itemizedlist>
  <para>
    The latter approach is more resilient to future changes to the core
    stylesheets that may require new default parameters that must be found
    in the shell.  If they are not found in your copy of the shell, there
    may be errors preventing the core from being used.
  </para>
  <section>
    <title>Note regarding these parameters</title>
    <para>
      Each of these parameters is ignored if a like-named attribute
      (without the "<literal>xslstyle-</literal>" prefix) is specified on
      the top-level <literal>&lt;xs:doc></literal> element of the
      stylesheet being styled.
    </para>
  </section>
</xs:doc>

<xs:param ignore-ns="yes">
  <para>
    Identification of external CSS stylesheet reference.
  </para>
</xs:param>
<xsl:param name="xslstyle-external-css" select="'xslstyle.css'"/>

<xs:param ignore-ns="yes">
  <para>
    Definition of internal CSS stylesheet.  Unfortunately, the DITA
    stylesheets do not support this parameter, so this is ignored, but it
    is included to satisfy the requirements of the core.
  </para>
</xs:param>
<xsl:param name="xslstyle-internal-css">
  /* put internal CSS styles here */

</xsl:param>

<xs:param ignore-ns="yes">
  <para>
    Signal the rendering of the table of contents.
  </para>
</xs:param>
<xsl:param name="xslstyle-show-toc" select="'yes'"/>

<xs:param ignore-ns="yes">
  <para>
    Signal the rendering of the import tree.
  </para>
</xs:param>
<xsl:param name="xslstyle-show-tree" select="'yes'"/>

<xs:param ignore-ns="yes">
  <para>
    Signal the rendering of the invocation parameters.
  </para>
</xs:param>
<xsl:param name="xslstyle-show-params" select="'yes'"/>

<xs:param ignore-ns="yes">
  <para>
    Signal the rendering of the specialization parameters.
  </para>
</xs:param>
<xsl:param name="xslstyle-show-spec-params" select="'yes'"/>

<xs:param ignore-ns="yes">
  <para>
    Signal the rendering of the index.
  </para>
</xs:param>
<xsl:param name="xslstyle-show-index" select="'yes'"/>

</xsl:stylesheet>
