# windows

This directory contains Windows batch files (.bat) that let you run \<PubNote> tools by drag-and-drop or from the DOS command line.

Each batch file is tailored for a specific function, such as validation or formatting. They're built to be easy to use, especially for those unfamiliar with XML or scripting.

Windows drag-and-drop should work as expected, regardless of how you copy the repository, though some users report problems after installing the ZIP on a networked drive. This hasn't been reported after cloning or forking the repository on a networked drive.

## Manifest

Each invocation below accepts a single argument: the name of either an XML file or a text file, depending on the tool.

- [`PubNoteInCheck.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteInCheck.bat) — Validates a PubNote submission XML input file against the submission DTD.
- [`PubNoteInIndent.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteInIndent.bat) — Produces an indented version of a PubNote submission XML input file, without its document type declaration.
- [`PubNoteInText2XML-de.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteInText2XML-de.bat) — Converts a PubNote submission text input file into XML, using German-labelled iXML grammar.
- [`PubNoteInText2XML-en.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteInText2XML-en.bat) — Converts a PubNote submission text input file into XML, using English-labelled iXML grammar.
- [`PubNoteInText2XML-fr.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteInText2XML-fr.bat) — Converts a PubNote submission text input file into XML, using French-labelled iXML grammar.
- [`PubNoteInText2XML-short.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteInText2XML-short.bat) — Converts a PubNote submission text input file into XML, using the short-label iXML grammar.
- [`PubNoteInText2XML.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteInText2XML.bat) — Converts a PubNote submission text input file into XML using Invisible XML (iXML).
- [`PubNoteOutCheck.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteOutCheck.bat) — Validates a PubNote distribution XML output file against the distribution DTD.
- [`PubNoteOutExtract.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteOutExtract.bat) — Extracts the individual XML Article files embedded in a PubNote distribution XML ArticleSet document (or copies a single Article document).
- [`PubNoteOutIndent.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteOutIndent.bat) — Produces an indented version of a PubNote distribution XML output file.
- [`PubNoteRender-de.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteRender-de.bat) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using German labels.
- [`PubNoteRender-en.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteRender-en.bat) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using Saxon, FOP, and Wordinator.
- [`PubNoteRender-fr.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteRender-fr.bat) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using French labels.
- [`PubNoteRender-short.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteRender-short.bat) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using the short-label set.
- [`PubNoteRender-us.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteRender-us.bat) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using English labels with US-letter page geometry.
- [`PubNoteRender.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteRender.bat) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using raw XML element and attribute names as labels.
- [`PubNoteXML2Text-de.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteXML2Text-de.bat) — Converts a PubNote XML file into an editable text file, using German labels for elements and attributes.
- [`PubNoteXML2Text-en.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteXML2Text-en.bat) — Converts a PubNote XML file into an editable text file, using English labels for elements and attributes.
- [`PubNoteXML2Text-fr.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteXML2Text-fr.bat) — Converts a PubNote XML file into an editable text file, using French labels for elements and attributes.
- [`PubNoteXML2Text-short.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteXML2Text-short.bat) — Converts a PubNote XML file into an editable text file, using the very short hint labels for elements and attributes.
- [`PubNoteXML2Text.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteXML2Text.bat) — Converts a PubNote XML file into an editable text file, with optional markdown mixed-content rendering.
- [`PubNoteXML2TextMarkdown-de.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteXML2TextMarkdown-de.bat) — Converts a PubNote XML file into an editable text file with markdown mixed content, using German labels.
- [`PubNoteXML2TextMarkdown-en.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteXML2TextMarkdown-en.bat) — Converts a PubNote XML file into an editable text file with markdown mixed content, using English labels.
- [`PubNoteXML2TextMarkdown-fr.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteXML2TextMarkdown-fr.bat) — Converts a PubNote XML file into an editable text file with markdown mixed content, using French labels.
- [`PubNoteXML2TextMarkdown-short.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteXML2TextMarkdown-short.bat) — Converts a PubNote XML file into an editable text file with markdown mixed content, using the very short hint labels.
- [`PubNoteXML2TextMarkdown.bat`](https://github.com/realtaonline/PubNote/blob/main/windows/PubNoteXML2TextMarkdown.bat) — Converts a PubNote XML file into an editable text file with markdown mixed content, using raw XML element and attribute names as labels.
