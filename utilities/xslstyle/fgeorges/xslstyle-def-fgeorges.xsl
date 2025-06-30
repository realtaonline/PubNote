<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE xsl:stylesheet
[
<!NOTATION dummy SYSTEM ".">
<!--use the unparsed entity declaration to find the base URI of stylesheet,
    assuming the named CSS directory is relative to this XSLT fragment;
    to change from an absolute URI to a relative URI, do not change this
    declaration, change the global variable xs:external-css-->
<!ENTITY stylesheet-uri SYSTEM "fgeorges/fgeorges-xslstyle.css" NDATA dummy>
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<xs:doc filename="xslstyle-def-fgeorges.xsl" global-ns="xs"
info="$Id: xslstyle-def-fgeorges.xsl,v 1.3 2010/02/28 22:46:17 gkholman Exp $"

        vocabulary="DocBook">
  <xs:title><literal>fgeorges</literal> definitions for the XSLStyle&#x2122; environment</xs:title>
  <para>
    This shell for XSLStyle&#x2122; overrides the default null specification
    of a CSS stylesheet with a particular specification of a CSS stylesheet.
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

<xs:param ignore-ns="yes">
  <para>
    Identification of external CSS stylesheet reference as an absolute URI.
  </para>
  <para>
    Use the absolute URI of the CSS stylesheet when there is no knowledge of
    where the CSS stylesheet is located relative to the XSLT stylesheet that
    is using this XSLStyle stylesheet for rendering.
  </para>
  <para>
    Change the test to <literal>false()</literal> and the otherwise to
    the desired relative URI in order to embed the URI into the generated
    HTML.  
    Alternatively one can just (a) create a shell stylesheet around this 
    stylesheet that overrides this definition of the global parameter, or
    (b) invoke this parameter with a particular URI.
  </para>
</xs:param>
<xsl:param name="xslstyle-external-css">
  <xsl:choose>
    <xsl:when test="true()">
      <!--use the absolute URI of the CSS stylesheet because there is no
          knowledge of where the CSS stylesheet is located relative to the
          XSLT stylesheet that is using this stylesheet for rendering-->
      <xsl:for-each select="document('')">
        <xsl:value-of select="unparsed-entity-uri('stylesheet-uri')"/>
      </xsl:for-each>
    </xsl:when>
    <xsl:otherwise>
      <!--change <xsl:when> test to false() to engage the following value-->
      <xsl:text>relative/uri/goes/here/to/fgeorges-xslstyle.css</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:param>

</xsl:stylesheet>
