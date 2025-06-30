# xsl

This directory contains XSLT stylesheets — files that describe how to transform content from one or more XML documents into output of some kind (text, HTML, or XML).

Most users won't need to write or edit these, but they are the heart of what \<PubNote> does: turning arcane PubMed XML into readable reports and simpler layouts.

If you're curious about how the transformations work, or if you're interested in customising the output, this is where to look.

Note that each top-level stylesheet is accompanied with HTML documentation files.

### `xlate/` subdirectory

This subdirectory holds translations of interface and label text for different human languages. If you're preparing output in a language other than English, these are the files that will help localise your results.