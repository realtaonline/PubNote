#!/bin/bash

REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"
TESTDIR="$REPO/test"

EXITSTATUS=0
FAILED_CASES=()

# Export functions and variables for xargs subprocesses
process_file() {
  file="$1"
  dir=$(dirname "$file")
  base=$(basename "$file" .xml)
  echo "Processing $base..."

  fail=0
  [ -d "$TESTDIR/$base" ] && rm -r "$TESTDIR/$base"

  if [[ "$base" == PubMedOut* ]]; then
    open -W -a "$REPO/mac/PubNoteOutCheck.app" -- "$file" || fail=1
    open -W -a "$REPO/mac/PubNoteOutExtract.app" -- "$file" || fail=2
    open -W -a "$REPO/mac/PubNoteOutIndent.app" -- "$file" || fail=3
  elif [[ "$base" == PubMedIn* ]]; then
    open -W -a "$REPO/mac/PubNoteInCheck.app" -- "$file" || fail=4
    open -W -a "$REPO/mac/PubNoteRender-short.app" -- "$file" || fail=5
    open -W -a "$REPO/mac/PubNoteInIndent.app" -- "$file" || fail=31
  else
    echo "Skipping $file: no matching test pattern"
  fi

  open -W -a "$REPO/mac/PubNoteRender-us.app"    -- "$file" || fail=6
  open -W -a "$REPO/mac/PubNoteRender-en.app"    -- "$file" || fail=7
  open -W -a "$REPO/mac/PubNoteRender-de.app"    -- "$file" || fail=8
  open -W -a "$REPO/mac/PubNoteRender-fr.app"    -- "$file" || fail=9
  open -W -a "$REPO/mac/PubNoteRender.app"       -- "$file" || fail=10

  # Standalone XML2Text / XML2TextMarkdown invocations, exercised directly
  # rather than only via PubNoteRender's internal calls.
  open -W -a "$REPO/mac/PubNoteXML2Text.app"            -- "$file" || fail=11
  open -W -a "$REPO/mac/PubNoteXML2Text-en.app"         -- "$file" || fail=12
  open -W -a "$REPO/mac/PubNoteXML2Text-de.app"         -- "$file" || fail=13
  open -W -a "$REPO/mac/PubNoteXML2Text-fr.app"         -- "$file" || fail=14
  open -W -a "$REPO/mac/PubNoteXML2TextMarkdown.app"    -- "$file" || fail=15
  open -W -a "$REPO/mac/PubNoteXML2TextMarkdown-en.app" -- "$file" || fail=16
  open -W -a "$REPO/mac/PubNoteXML2TextMarkdown-de.app" -- "$file" || fail=17
  open -W -a "$REPO/mac/PubNoteXML2TextMarkdown-fr.app" -- "$file" || fail=18

  if [[ "$base" == PubMedIn* ]]; then
    open -W -a "$REPO/mac/PubNoteXML2Text-short.app"         -- "$file" || fail=19
    open -W -a "$REPO/mac/PubNoteXML2TextMarkdown-short.app" -- "$file" || fail=20
    open -W -a "$REPO/mac/PubNoteInText2XML.app"       -- "$dir/$base/$base.xml.txt"             || fail=21
    open -W -a "$REPO/mac/PubNoteInText2XML-en.app"    -- "$dir/$base/$base.xml-en.txt"          || fail=22
    open -W -a "$REPO/mac/PubNoteInText2XML-fr.app"    -- "$dir/$base/$base.xml-fr.txt"          || fail=23
    open -W -a "$REPO/mac/PubNoteInText2XML-de.app"    -- "$dir/$base/$base.xml-de.txt"          || fail=24
    open -W -a "$REPO/mac/PubNoteInText2XML.app"       -- "$dir/$base/$base.xml-markdown.txt"    || fail=25
    open -W -a "$REPO/mac/PubNoteInText2XML-en.app"    -- "$dir/$base/$base.xml-markdown-en.txt" || fail=26
    open -W -a "$REPO/mac/PubNoteInText2XML-fr.app"    -- "$dir/$base/$base.xml-markdown-fr.txt" || fail=27
    open -W -a "$REPO/mac/PubNoteInText2XML-de.app"    -- "$dir/$base/$base.xml-markdown-de.txt" || fail=28
    open -W -a "$REPO/mac/PubNoteInText2XML-short.app" -- "$dir/$base/$base.xml-short.txt"             || fail=29
    open -W -a "$REPO/mac/PubNoteInText2XML-short.app" -- "$dir/$base/$base.xml-markdown-short.txt"    || fail=30
  fi

  if [ "$fail" -ne 0 ]; then
    echo "FAILED: $base"
    echo "$base" >> "$TESTDIR/.failed_cases"
    return 1
  else
    echo "PASSED: $base"
    return 0
  fi
}
export -f process_file
export REPO TESTDIR

# Abandon running in parallel as some non-project resources appear not to be threadsafe
# find "$TESTDIR" -maxdepth 1 -name '*-1.xml' | sort | xargs -P 1 -n 1 bash -c 'process_file "$0"'
while IFS= read -r file; do
  process_file "$file"
done < <(find "$TESTDIR" -maxdepth 1 -name '*.xml' | sort)

# Summary
if [ -f "$TESTDIR/.failed_cases" ]; then
  echo
  echo -n "testall.sh failed:"
  tr '\n' ' ' < "$TESTDIR/.failed_cases"
  echo
  EXITSTATUS=1
  rm "$TESTDIR/.failed_cases"
else
  echo
  echo "All tests passed."
  EXITSTATUS=0
fi

exit $EXITSTATUS