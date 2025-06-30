This package is XSLStyle(TM), a free developer resource from Crane 
Softwrights Ltd.:

  http:www.CraneSoftwrights.com/links/res-xs.htm

Using XSLStyle(TM) one can embed structured documentation in XSLT stylesheets
and produce "javadoc"-like reports of the information found therein.  These
stylesheets traverse the entire import tree of an XSLT stylesheet and
generate an alphabetized index of all global constructs.

In addition, documentation business rules are enforced by reporting
inconsistencies where detected.

The XSLStyle vocabulary defines scaffolding to use in an XSLT stylesheet, in
which you use the vocabulary of your choice to actually write the prose of
the documentation.  With few limitations you can use the entire scope of each
vocabulary within the XSLT scaffolding.  This can make for very rich detail.

For simple examples of use of each of the three vocabularies, please see the
following stylesheets.  Each stylesheet has documentation on how to use
XSLStyle, framed in each of the different vocabularies so that you can look
inside the examples to see the vocabulary embedded in the XSLStyle scaffolding:

  docbookex.xsl
  docbookex.html         - embedding DocBook vocabulary in XSLT stylesheets
                           using xslstyle-docbook.xsl for formatting

  ditaex.xsl
  ditaex.html            - embedding DITA vocabulary in XSLT stylesheets
                           using xslstyle-dita.xsl for formatting

  xhtmlex.xsl
  xhtmlex.html           - embedding HTML/XHTML vocabulary in XSLT stylesheets
                           using xslstyle-xhtml.xsl for formatting

For environment details and instructions on use (and a very detailed
examples of use of the DocBook vocabulary in each), please see each of these
stylesheets, which are the ones you will be invoking with your stylesheets
in order to render your documentation according to the vocabulary you use:

  xslstyle-docbook.xsl
  xslstyle-docbook.html  - embedding DocBook vocabulary in XSLT stylesheets

  xslstyle-dita.xsl
  xslstyle-dita.html     - embedding DITA vocabulary in XSLT stylesheets

  xslstyle-xhtml.xsl
  xslstyle-xhtml.html    - embedding HTML/XHTML vocabulary in XSLT stylesheets

You will need only look at the envrionment stylesheets if you want to
customize the environment for your own purposes.  Otherwise, you should be
just fine reading the sample files for each of the vocabularies.

When using the above stylesheets, there is a built-in assumption that the
current directory has a CSS stylesheet named "xslstyle.css" in order to
decorate the appearance.  As no such file is included (you are welcome to
write your own), no CSS styles are applied in the default rendering.

For more visually elaborate renderings than the rather bland default
renderings, one can use these examples to decorate the result into a much
more visually stunning presentation.  Please see the following examples
that you are welcome to use to augment the above default renderings:

  Contributed styles with thanks to Florent Georges and George Bina:

      fgeorges/readme.txt
      fgeorges/xslstyle-docbook-fgeorges.xsl
      fgeorges/xslstyle-docbook-fgeorges.html
      fgeorges/xslstyle-dita-fgeorges.xsl
      fgeorges/xslstyle-dita-fgeorges.html
      fgeorges/xslstyle-xhtml-fgeorges.xsl
      fgeorges/xslstyle-xhtml-fgeorges.html
      fgeorges/ditaex-fgeorges.html
      fgeorges/ditaex-fgeorges.xsl
      fgeorges/docbookex-fgeorges.html
      fgeorges/docbookex-fgeorges.xsl
      fgeorges/xhtmlex-fgeorges.html
      fgeorges/xhtmlex-fgeorges.xsl

  Contributed styles with thanks to Dominic Marcotte:

      dmarcotte/readme.txt
      dmarcotte/xslstyle-docbook-dmarcotte.xsl
      dmarcotte/xslstyle-docbook-dmarcotte.html
      dmarcotte/xslstyle-dita-dmarcotte.xsl
      dmarcotte/xslstyle-dita-dmarcotte.html
      dmarcotte/xslstyle-xhtml-dmarcotte.xsl
      dmarcotte/xslstyle-xhtml-dmarcotte.html
      dmarcotte/ditaex-dmarcotte.html
      dmarcotte/ditaex-dmarcotte.xsl
      dmarcotte/docbookex-dmarcotte.html
      dmarcotte/docbookex-dmarcotte.xsl
      dmarcotte/xhtmlex-dmarcotte.html
      dmarcotte/xhtmlex-dmarcotte.xsl

To help you develop your own default 'xslstyle.css' CSS stylesheet
for XSLStyle, or a more elaborate environment as above, there is a debug
environment that exposes the named styles and where they are used (note
this exposition does not work with IE6 but does with more current browsers):

      debug/readme.txt
      debug/xslstyle-dita-debug.html
      debug/xslstyle-dita-debug.xsl
      debug/xslstyle-docbook-debug.html
      debug/xslstyle-docbook-debug.xsl
      debug/xslstyle-xhtml-debug.html
      debug/xslstyle-xhtml-debug.xsl
      debug/ditaex-debug.html
      debug/ditaex-debug.xsl
      debug/docbookex-debug.html
      debug/docbookex-debug.xsl
      debug/xhtmlex-debug.html
      debug/xhtmlex-debug.xsl

If this inspires you to write your own CSS stylesheets for XSLStyle and you
would like to share them with others, then please forward them to Crane
Softwrights with written permission to include them in our distribution.

Also, as the number of environments has grown, it has been difficult to keep
all of the documentation in sync.  If you find faults with the documentation,
please do not hesitate to let me know, and I would be pleased to address your
findings.

Thank you for your input to this project!

. . . . . . . .  G. Ken Holman

Release notes:

  2010-08-17 02:40z - repaired missing style for template parameters; added
                      highlighting of required command-line parameters

  2010-03-02 17:40z - add elaborate renderings and HTML/XHTML vocabulary

  2008-10-13 17:50z - latest DocBook stylesheets (big change in ZIP size!)
                    - ids on sections preserved

===========================
$Id: readme-package.txt,v 1.5 2010/08/17 02:40:13 admin Exp $
