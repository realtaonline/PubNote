<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-xhtml-debug.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<xsl:import href="../xhtmlex.xsl"/>

<xs:doc info="$Id: xhtmlex-debug.xsl,v 1.4 2010/03/02 15:45:23 gkholman Exp $"
        external-css="debug-xslstyle.css"
        filename="xhtmlex-debug.xsl" global-ns="xs" vocabulary="XHTML">
  <xs:title>Test shell to demonstrate "debug" style formatting</xs:title>
  <p>
    This stylesheet adds nothing to the logic of the 
    <literal>xhtmlex.xsl</literal> stylesheet but does invoke a different
    XSLStyle rendering stylesheet due to being at the top level.
  </p>
</xs:doc>

</xsl:stylesheet>
