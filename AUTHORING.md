# Authoring/editing a simple text file of PubMed in (submission) information

\<PubNote> uses the [Crane-txt2xml `https://github.com/CraneSoftwrights/Crane-txt2xml`](https://github.com/CraneSoftwrights/Crane-txt2xml?tab=readme-ov-file#readme) environment to support the transformation of PubMed in (submission) information to and from a simple text representation that does not include angle brackets or other arcane XML syntax.

The text files have their own syntax as described in the [Crane-txt2xml authoring guide](https://github.com/CraneSoftwrights/Crane-txt2xml/blob/main/AUTHORING.md)

Authors are welcome to use the XML element and attribute names as the text labels.

Natural-language text labels also are available for the given language when the transformation is invoked:

- **PubNoteInText2XML-xx** - conversion of PubMed submission text rendering into submission XML  
- **PubNoteXML2Text-xx** – transform PubMed XML document into text without using markdown for mixed content
- **PubNoteXML2TextMarkdown-xx** – transform PubMed XML document into text using markdown for mixed content

Suffixes **-xx**:
  - "**-en**"=English (A4), "**-us**"=English (US-letter), "**-de**"=German, "**-fr**"=French
  - "**-short**"=short labels for use in making the text files smaller than with XML or natural language labels
  - absent suffix: use XML names as defined in the document models as the labels

The summary of the labels for each language can be found listed in each stylesheet, noting again that in place of the natural language label one can use the XML name as the label:

 - [English - PubNote-xlate-en.xsl](xsl/xlate/PubNote-xlate-en.xsl)
 - [German - PubNote-xlate-de.xsl](xsl/xlate/PubNote-xlate-de.xsl)
 - [French - PubNote-xlate-fr.xsl](xsl/xlate/PubNote-xlate-fr.xsl)
 - [LLM - PubNote-xlate-short.xsl](xsl/xlate/PubNote-xlate-short.xsl) - not really suitable for human consumption; see [Crane-txt2xml for LLMs](https://github.com/CraneSoftwrights/Crane-txt2xml/blob/main/llm-scenario/README.md)

