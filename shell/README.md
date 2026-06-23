# shell

This directory contains scripts for Unix-style command-line environments, such as found on macOS or Linux.

These `.sh` files automate common tasks, such as validating your XML, translating label text, or generating reports. If you're comfortable running Terminal commands, this is the most direct way to work with <PubNote>.

The shell scripts are the working engine behind the drag-and-drop Mac apps.

## Manifest

Each invocation below accepts a single argument: the name of either an XML file or a text file, depending on the tool.

- [`PubNoteInCheck.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteInCheck.sh) — Validates a PubNote submission XML input file against the submission DTD.
- [`PubNoteInIndent.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteInIndent.sh) — Produces an indented version of a PubNote submission XML input file, without its document type declaration.
- [`PubNoteInText2XML-de.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteInText2XML-de.sh) — Converts a PubNote submission text input file into XML, using German-labelled iXML grammar.
- [`PubNoteInText2XML-en.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteInText2XML-en.sh) — Converts a PubNote submission text input file into XML, using English-labelled iXML grammar.
- [`PubNoteInText2XML-fr.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteInText2XML-fr.sh) — Converts a PubNote submission text input file into XML, using French-labelled iXML grammar.
- [`PubNoteInText2XML-short.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteInText2XML-short.sh) — Converts a PubNote submission text input file into XML, using the short-label iXML grammar.
- [`PubNoteInText2XML.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteInText2XML.sh) — Converts a PubNote submission text input file into XML using Invisible XML (iXML).
- [`PubNoteOutCheck.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteOutCheck.sh) — Validates a PubNote distribution XML output file against the distribution DTD.
- [`PubNoteOutExtract.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteOutExtract.sh) — Extracts the individual XML Article files embedded in a PubNote distribution XML ArticleSet document (or copies a single Article document).
- [`PubNoteOutIndent.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteOutIndent.sh) — Produces an indented version of a PubNote distribution XML output file.
- [`PubNoteRender-de.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteRender-de.sh) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using German labels.
- [`PubNoteRender-en.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteRender-en.sh) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using Saxon, FOP, and Wordinator.
- [`PubNoteRender-fr.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteRender-fr.sh) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using French labels.
- [`PubNoteRender-short.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteRender-short.sh) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using the short-label set.
- [`PubNoteRender-us.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteRender-us.sh) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using English labels with US-letter page geometry.
- [`PubNoteRender.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteRender.sh) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using raw XML element and attribute names as labels.
- [`PubNoteXML2Text-de.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteXML2Text-de.sh) — Converts a PubNote XML file into an editable text file, using German labels for elements and attributes.
- [`PubNoteXML2Text-en.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteXML2Text-en.sh) — Converts a PubNote XML file into an editable text file, using English labels for elements and attributes.
- [`PubNoteXML2Text-fr.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteXML2Text-fr.sh) — Converts a PubNote XML file into an editable text file, using French labels for elements and attributes.
- [`PubNoteXML2Text-short.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteXML2Text-short.sh) — Converts a PubNote XML file into an editable text file, using the very short hint labels for elements and attributes.
- [`PubNoteXML2Text.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteXML2Text.sh) — Converts a PubNote XML file into an editable text file, with optional markdown mixed-content rendering.
- [`PubNoteXML2TextMarkdown-de.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteXML2TextMarkdown-de.sh) — Converts a PubNote XML file into an editable text file with markdown mixed content, using German labels.
- [`PubNoteXML2TextMarkdown-en.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteXML2TextMarkdown-en.sh) — Converts a PubNote XML file into an editable text file with markdown mixed content, using English labels.
- [`PubNoteXML2TextMarkdown-fr.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteXML2TextMarkdown-fr.sh) — Converts a PubNote XML file into an editable text file with markdown mixed content, using French labels.
- [`PubNoteXML2TextMarkdown-short.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteXML2TextMarkdown-short.sh) — Converts a PubNote XML file into an editable text file with markdown mixed content, using the very short hint labels.
- [`PubNoteXML2TextMarkdown.sh`](https://github.com/realtaonline/PubNote/blob/main/shell/PubNoteXML2TextMarkdown.sh) — Converts a PubNote XML file into an editable text file with markdown mixed content, using raw XML element and attribute names as labels.
