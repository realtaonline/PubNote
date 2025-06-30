<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-docbook-debug.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<!--the stylesheets implementing DocBook for XSLStyle&#x2122;-->
<xsl:import href="../xslstyle-docbook.xsl"/>
<!--the definition of the external stylesheet for debug-->
<xsl:import href="xslstyle-def-debug.xsl"/>

<xs:doc filename="xslstyle-docbook-debug.xsl" internal-ns="xv" global-ns="xs"
info="$Id: xslstyle-docbook-debug.xsl,v 1.3 2010/03/02 15:45:26 gkholman Exp $"
        external-css="debug-xslstyle.css" vocabulary="DocBook">
  <xs:title>DocBook <literal>debug</literal> shell for the XSLStyle&#x2122; environment</xs:title>
  <para>
    This shell for XSLStyle&#x2122; assumes that the embedded constructs
    are in the <ulink url="http://www.DocBook.org">DocBook</ulink> vocabulary
    and default formatting of the resulting HTML.
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

</xsl:stylesheet>
