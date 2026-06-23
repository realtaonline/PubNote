set -e
xslt2 ../xsd/PubMedIn.xsd ../xsl/PubNote-pubmedin-xml2ixml.xsl PubMedIn.ixml
xslt2 ../xsd/PubMedIn.xsd ../xsl/PubNote-pubmedin-en2ixml.xsl  PubMedIn-en.ixml
xslt2 ../xsd/PubMedIn.xsd ../xsl/PubNote-pubmedin-de2ixml.xsl  PubMedIn-de.ixml
xslt2 ../xsd/PubMedIn.xsd ../xsl/PubNote-pubmedin-fr2ixml.xsl  PubMedIn-fr.ixml
xslt2 ../xsd/PubMedIn.xsd ../xsl/PubNote-pubmedin-short2ixml.xsl  PubMedIn-short.ixml
