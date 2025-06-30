#!/bin/bash

REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"
TESTDIR="$REPO/test"

EXITSTATUS=0
FAILED_CASES=()

# Export functions and variables for xargs subprocesses
process_file() {
  file="$1"
  base=$(basename "$file" .xml)
  echo "Processing $base..."

  fail=0
  [ -d "$TESTDIR/$base" ] && rm -r "$TESTDIR/$base"

  if [[ "$base" == PubMedOut* ]]; then
    open -W -a "$REPO/mac/PubNoteOutCheck.app" -- "$file" || fail=1
    open -W -a "$REPO/mac/PubNoteOutExtract.app" -- "$file" || fail=1
    open -W -a "$REPO/mac/PubNoteOutIndent.app" -- "$file" || fail=1
  elif [[ "$base" == PubMedIn* ]]; then
    open -W -a "$REPO/mac/PubNoteInCheck.app" -- "$file" || fail=1
  else
    echo "Skipping $file: no matching test pattern"
  fi

  open -W -a "$REPO/mac/PubNoteRender-en.app" -- "$file" || fail=1
  open -W -a "$REPO/mac/PubNoteRender-us.app" -- "$file" || fail=1
  open -W -a "$REPO/mac/PubNoteRender-de.app" -- "$file" || fail=1
  open -W -a "$REPO/mac/PubNoteRender-fr.app" -- "$file" || fail=1

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

# Run up to 16 files in parallel
find "$TESTDIR" -maxdepth 1 -name '*-1.xml' | sort | xargs -P 1 -n 1 bash -c 'process_file "$0"'

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