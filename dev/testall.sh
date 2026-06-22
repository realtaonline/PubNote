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
    "$REPO/shell/PubNoteOutCheck.sh" "$file" || fail=1
    "$REPO/shell/PubNoteOutExtract.sh" "$file" || fail=2
    "$REPO/shell/PubNoteOutIndent.sh" "$file" || fail=3
  elif [[ "$base" == PubMedIn* ]]; then
    "$REPO/shell/PubNoteInCheck.sh" "$file" || fail=4
  else
    echo "Skipping $file: no matching test pattern"
  fi

  "$REPO/shell/PubNoteRender-short.sh" "$file" || fail=6a
  "$REPO/shell/PubNoteRender-us.sh" "$file" || fail=6b
  "$REPO/shell/PubNoteRender-en.sh" "$file" || fail=5
  "$REPO/shell/PubNoteRender-de.sh" "$file" || fail=7
  "$REPO/shell/PubNoteRender-fr.sh" "$file" || fail=8
  "$REPO/shell/PubNoteRender.sh"    "$file" || fail=9

  if [[ "$base" == PubMedIn* ]]; then
    "$REPO/shell/PubNoteRender-short.sh" "$file" || fail=10
  fi

  # Standalone XML2Text / XML2TextMarkdown invocations, exercised directly
  # rather than only via PubNoteRender's internal calls.
  "$REPO/shell/PubNoteXML2Text.sh"            "$file" || fail=11
  "$REPO/shell/PubNoteXML2Text-en.sh"         "$file" || fail=12
  "$REPO/shell/PubNoteXML2Text-de.sh"         "$file" || fail=13
  "$REPO/shell/PubNoteXML2Text-fr.sh"         "$file" || fail=14
  "$REPO/shell/PubNoteXML2TextMarkdown.sh"    "$file" || fail=15
  "$REPO/shell/PubNoteXML2TextMarkdown-en.sh" "$file" || fail=16
  "$REPO/shell/PubNoteXML2TextMarkdown-de.sh" "$file" || fail=17
  "$REPO/shell/PubNoteXML2TextMarkdown-fr.sh" "$file" || fail=18

  if [[ "$base" == PubMedIn* ]]; then
    "$REPO/shell/PubNoteXML2Text-short.sh"         "$file" || fail=19
    "$REPO/shell/PubNoteXML2TextMarkdown-short.sh" "$file" || fail=20
  fi

  if [[ "$base" == PubMedIn* ]]; then
    "$REPO/shell/PubNoteInText2XML.sh"    "$dir/$base/$base.xml.txt"             || fail=21
    "$REPO/shell/PubNoteInText2XML-en.sh" "$dir/$base/$base.xml-en.txt"          || fail=22
    "$REPO/shell/PubNoteInText2XML-fr.sh" "$dir/$base/$base.xml-fr.txt"          || fail=23
    "$REPO/shell/PubNoteInText2XML-de.sh" "$dir/$base/$base.xml-de.txt"          || fail=24
    "$REPO/shell/PubNoteInText2XML.sh"    "$dir/$base/$base.xml-markdown.txt"    || fail=25
    "$REPO/shell/PubNoteInText2XML-en.sh" "$dir/$base/$base.xml-markdown-en.txt" || fail=26
    "$REPO/shell/PubNoteInText2XML-fr.sh" "$dir/$base/$base.xml-markdown-fr.txt" || fail=27
    "$REPO/shell/PubNoteInText2XML-de.sh" "$dir/$base/$base.xml-markdown-de.txt" || fail=28
    "$REPO/shell/PubNoteInText2XML-short.sh" "$dir/$base/$base.xml-short.txt"             || fail=29
    "$REPO/shell/PubNoteInText2XML-short.sh" "$dir/$base/$base.xml-markdown-short.txt"    || fail=30
  fi

  if [ "$fail" -ne 0 ]; then
    echo "FAILED: $base $fail"
    echo "$base $fail" >> "$TESTDIR/.failed_cases"
    return 1
  else
    echo "PASSED: $base"
    return 0
  fi
}
export -f process_file
export REPO TESTDIR

# Abandon running in parallel as some non-project resources appear not to be threadsafe
find "$TESTDIR" -maxdepth 1 -name '*.xml' | sort | xargs -P 1 -n 1 bash -c 'process_file "$0"' 

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