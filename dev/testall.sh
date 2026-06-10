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

  "$REPO/shell/PubNoteRender-en.sh" "$file" || fail=5
  "$REPO/shell/PubNoteRender-us.sh" "$file" || fail=6
  "$REPO/shell/PubNoteRender-de.sh" "$file" || fail=7
  "$REPO/shell/PubNoteRender-fr.sh" "$file" || fail=8

  if [[ "$base" == PubMedIn* ]]; then
    "$REPO/shell/PubNoteInText2XML.sh"    "$dir/$base/$base.xml.txt"             || fail=9
    "$REPO/shell/PubNoteInText2XML-en.sh" "$dir/$base/$base.xml-en.txt"          || fail=10
    "$REPO/shell/PubNoteInText2XML-fr.sh" "$dir/$base/$base.xml-fr.txt"          || fail=11
    "$REPO/shell/PubNoteInText2XML-de.sh" "$dir/$base/$base.xml-de.txt"          || fail=12
    "$REPO/shell/PubNoteInText2XML.sh"    "$dir/$base/$base.xml-markdown.txt"    || fail=13
    "$REPO/shell/PubNoteInText2XML-en.sh" "$dir/$base/$base.xml-markdown-en.txt" || fail=14
    "$REPO/shell/PubNoteInText2XML-fr.sh" "$dir/$base/$base.xml-markdown-fr.txt" || fail=15
    "$REPO/shell/PubNoteInText2XML-de.sh" "$dir/$base/$base.xml-markdown-de.txt" || fail=16
  fi

  if [ "$fail" -ne 0 ]; then
    echo "FAILED: $base $Fail"
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