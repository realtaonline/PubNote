# mac

This directory contains small Mac applications that make it easier to run the \<PubNote> tools without needing to open a Terminal window.

If you're using a Mac, you can drag and drop your PubMed XML files onto these apps. Each one is tailored for a specific task, like checking for errors or transforming content.

No command-line knowledge is needed to use these apps

***Note: These apps will not function correctly if this repository is downloaded as a ZIP file. Mac applications require certain hidden file structures that ZIP archives do not preserve. To ensure these apps work as intended, you must clone or fork the repository using a GitHub account rather than downloading it as a ZIP. Instructions for doing this are provided in the main [README file](../README.md)..***

## Manifest

Each invocation below accepts a single argument: the name of either an XML file or a text file, depending on the tool.

These are drag-and-drop Automator applications, not interactive GUI applications; drop a file onto the icon to run it.

- [`PubNoteInCheck`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteInCheck.app) — Validates a PubNote submission XML input file against the submission DTD.
- [`PubNoteInIndent`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteInIndent.app) — Produces an indented version of a PubNote submission XML input file, without its document type declaration.
- [`PubNoteInText2XML-de`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteInText2XML-de.app) — Converts a PubNote submission text input file into XML, using German-labelled iXML grammar.
- [`PubNoteInText2XML-en`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteInText2XML-en.app) — Converts a PubNote submission text input file into XML, using English-labelled iXML grammar.
- [`PubNoteInText2XML-fr`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteInText2XML-fr.app) — Converts a PubNote submission text input file into XML, using French-labelled iXML grammar.
- [`PubNoteInText2XML-short`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteInText2XML-short.app) — Converts a PubNote submission text input file into XML, using the short-label iXML grammar.
- [`PubNoteInText2XML`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteInText2XML.app) — Converts a PubNote submission text input file into XML using Invisible XML (iXML).
- [`PubNoteOutCheck`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteOutCheck.app) — Validates a PubNote distribution XML output file against the distribution DTD.
- [`PubNoteOutExtract`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteOutExtract.app) — Extracts the individual XML Article files embedded in a PubNote distribution XML ArticleSet document (or copies a single Article document).
- [`PubNoteOutIndent`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteOutIndent.app) — Produces an indented version of a PubNote distribution XML output file.
- [`PubNoteRender-de`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteRender-de.app) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using German labels.
- [`PubNoteRender-en`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteRender-en.app) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using Saxon, FOP, and Wordinator.
- [`PubNoteRender-fr`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteRender-fr.app) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using French labels.
- [`PubNoteRender-short`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteRender-short.app) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using the short-label set.
- [`PubNoteRender-us`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteRender-us.app) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using English labels with US-letter page geometry.
- [`PubNoteRender`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteRender.app) — Renders a PubNote XML file to PDF, HTML, DOCX, and text using raw XML element and attribute names as labels.
- [`PubNoteXML2Text-de`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteXML2Text-de.app) — Converts a PubNote XML file into an editable text file, using German labels for elements and attributes.
- [`PubNoteXML2Text-en`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteXML2Text-en.app) — Converts a PubNote XML file into an editable text file, using English labels for elements and attributes.
- [`PubNoteXML2Text-fr`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteXML2Text-fr.app) — Converts a PubNote XML file into an editable text file, using French labels for elements and attributes.
- [`PubNoteXML2Text-short`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteXML2Text-short.app) — Converts a PubNote XML file into an editable text file, using the very short hint labels for elements and attributes.
- [`PubNoteXML2Text`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteXML2Text.app) — Converts a PubNote XML file into an editable text file, with optional markdown mixed-content rendering.
- [`PubNoteXML2TextMarkdown-de`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteXML2TextMarkdown-de.app) — Converts a PubNote XML file into an editable text file with markdown mixed content, using German labels.
- [`PubNoteXML2TextMarkdown-en`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteXML2TextMarkdown-en.app) — Converts a PubNote XML file into an editable text file with markdown mixed content, using English labels.
- [`PubNoteXML2TextMarkdown-fr`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteXML2TextMarkdown-fr.app) — Converts a PubNote XML file into an editable text file with markdown mixed content, using French labels.
- [`PubNoteXML2TextMarkdown-short`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteXML2TextMarkdown-short.app) — Converts a PubNote XML file into an editable text file with markdown mixed content, using the very short hint labels.
- [`PubNoteXML2TextMarkdown`](https://github.com/realtaonline/PubNote/tree/main/mac/PubNoteXML2TextMarkdown.app) — Converts a PubNote XML file into an editable text file with markdown mixed content, using raw XML element and attribute names as labels.
