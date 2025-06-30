<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="xslstyle.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<!--
     XSLStyle(tm) - a methodology for styling stylesheets into useful 
                    documentation and rigourous completion reports.

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

<xs:doc filename="xslstyle-nodes.xsl" internal-ns="xs" vocabulary="DocBook"
  info="$Id: xslstyle-nodes.xsl,v 1.10 2010/08/17 01:29:38 admin Exp $">
  <xs:title>XSLT processor-specific extension support for node-sets</xs:title>
  <para>
    Since the XSLT 1.0 environment needs extensions for converting a 
    result-tree fragment to a node set, this module needs to be updated for
    processors not accommodating any of the functions invoked here.  This is
    in its own module so that the main logic of XSLStyle&#x2122; need not be
    touched.
  </para>
</xs:doc>

<xs:variable name="xs:xslstyle-debug">
  <para>
    Set this to any true value to have the intermediate vocabulary result tree 
    written to the final result tree, instead of having it translated to HTML.
  </para>
</xs:variable>
<xsl:variable name="xs:xslstyle-debug" select="false()"/>

<xs:template>
  <para>Translate a result tree fragment into a node set and push the root
  node of the node tree through the unnamed-mode template rules.</para>
  <para>
    If none of the attempted etension functions succeeds, an error is given
    to both the result tree and the XSLT message route.  It is possible in some
    processors to trash the result tree when using the XSLT message route, so
    hopefully the message route will choose to expose the message delivered.
  </para>
  <xs:param name="rtf">
    <para>
      A result tree fragment that is to be converted to a node set using
      an extension function recognized by the XSLT processor.
    </para>
  </xs:param>
  <xs:param name="internal">
    <para>
      The indication that this is being called to process internally-generated
      constructs and not the documentation constructs.
    </para>
  </xs:param>
</xs:template>

<xsl:template name="xs:rtf2nodes">
  <xsl:param name="rtf"/>
  <xsl:param name="internal" select="false()"/>
  <xsl:choose>
    <xsl:when test="$xs:xslstyle-debug and not( $internal )">
      <xsl:copy-of select="$rtf"/>
    </xsl:when>
    <xsl:when test="function-available('exsl:node-set')" 
              xmlns:exsl="http://exslt.org/common">
      <xsl:apply-templates select="exsl:node-set($rtf)">
        <xsl:with-param name="internal" select="true()"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:when test="function-available('msxsl:node-set')"
              xmlns:msxsl="urn:schemas-microsoft-com:xslt">
      <xsl:apply-templates select="msxsl:node-set($rtf)">
        <xsl:with-param name="internal" select="true()"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:when test="function-available('xalan:nodeset')"
              xmlns:xalan="http://xml.apache.org/xalan">
      <xsl:apply-templates select="xalan:nodeset($rtf)">
        <xsl:with-param name="internal" select="true()"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:when test="function-available('xt:node-set')"
              xmlns:xt="http://www.jclark.com/xt">
      <xsl:apply-templates select="xt:node-set($rtf)">
        <xsl:with-param name="internal" select="true()"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:when test="system-property('xsl:version')>1">
      <xsl:apply-templates select="$rtf">
        <xsl:with-param name="internal" select="true()"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:variable name="report">
        <xsl:text>The xslstyle-nodes.xsl stylesheet fragment is </xsl:text>
        <xsl:text>missing an extension function implementation </xsl:text>
        <xsl:text>supported by the XSLT processor being used.</xsl:text>
      </xsl:variable>
      <xsl:value-of select="$report"/>
      <xsl:message terminate="yes">
        <xsl:value-of select="$report"/>
      </xsl:message>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xs:template>
  <para>Translate a result tree fragment into a node set and push the element
  children of the node tree through the intermediate template rules.</para>
  <xs:param name="rtf">
    <para>
      A result tree fragment that is to be converted to a node set using
      an extension function recognized by the XSLT processor.
    </para>
  </xs:param>
</xs:template>

<xsl:template name="xs:rtf2nodesIntermediate">
  <xsl:param name="rtf"/>
  <xsl:choose>
    <xsl:when test="function-available('exsl:node-set')" 
              xmlns:exsl="http://exslt.org/common">
      <xsl:apply-templates select="exsl:node-set($rtf)/*"
                           mode="xs:intermediate"/>
    </xsl:when>
    <xsl:when test="function-available('msxsl:node-set')"
              xmlns:msxsl="urn:schemas-microsoft-com:xslt">
      <xsl:apply-templates select="msxsl:node-set($rtf)/*"
                           mode="xs:intermediate"/>
    </xsl:when>
    <xsl:when test="function-available('xalan:nodeset')"
              xmlns:xalan="http://xml.apache.org/xalan">
      <xsl:apply-templates select="xalan:nodeset($rtf)/*"
                           mode="xs:intermediate"/>
    </xsl:when>
    <xsl:when test="function-available('xt:node-set')"
              xmlns:xt="http://www.jclark.com/xt">
      <xsl:apply-templates select="xt:node-set($rtf)/*"
                           mode="xs:intermediate"/>
    </xsl:when>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>