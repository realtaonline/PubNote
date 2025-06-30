The "debug" XSLStyle(TM) shell
---------------------------------

This shell for XSLStyle is used by CSS stylesheet developers to identify 
which CSS styles are in use at particular places in the generated text of
reports.  Users are in control of which CSS styles are used within user
documentation embedded in the XSLStyle scaffolding.

Should users find any problems with the style names or they need more
fine-grained control over styles, please let us know and we will consider
if such changes are possible.

Note that when the top-level <xs:doc> element of the stylesheet being
documented does not have an external-css= stylesheet, this environment will
hard-wire an absolute URI to the known location of this file.  In order to
avoid having an absolute URI to the CSS stylesheet, use the external-css=
attribute.

XSLStyle(TM) by Crane Softwrights Ltd:

  http://www.CraneSoftwrights.com/resources/#xslstyle

=============
$Id: readme.txt,v 1.2 2010/03/02 15:43:34 gkholman Exp $
