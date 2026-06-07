set -e
xslt2 ../xsd/PubMedIn.xsd PubNote-pubmedin-xml2ixml.xsl PubMedIn-xml.ixml
xslt2 ../xsd/PubMedIn.xsd PubNote-pubmedin-en2ixml.xsl  PubMedIn-en.ixml
xslt2 ../xsd/PubMedIn.xsd PubNote-pubmedin-de2ixml.xsl  PubMedIn-de.ixml
xslt2 ../xsd/PubMedIn.xsd PubNote-pubmedin-fr2ixml.xsl  PubMedIn-fr.ixml
