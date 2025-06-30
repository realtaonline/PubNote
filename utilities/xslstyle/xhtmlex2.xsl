<?xml version="1.0" encoding="iso-8859-1"?>
<!DOCTYPE xsl:stylesheet
[
<!ENTITY XS "XSLStyle&#x2122;">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<xs:doc info="$Id: xhtmlex2.xsl,v 1.3 2010/02/20 14:25:23 gkholman Exp $"
        filename="xhtmlex2.xsl" global-ns="xs" vocabulary="XHTML">
  <xs:title>&XS; imported fragment two</xs:title>
  <p>
    This is a sample imported fragment.
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

<!--========================================================================-->
<xs:doc>
  <xs:title>A section of templates</xs:title>
</xs:doc>

<xs:template>
  <p>
    This recursive template rule determines the stem portion of the path to
    a filename by extracting all content up to and including the last '/'.
  </p>
  <xs:param name="path">
    <p>The decimated path information as the stem is built.</p>
  </xs:param>
  <xs:param name="stem">
    <p>The accumulated stem information as the path is eaten.</p>
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

</xsl:stylesheet>
