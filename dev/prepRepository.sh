REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"

# ---------------------------------------------------------------------------
# prepRepository.sh
#
# A shell script without arguments to clean up a repository's files before
# preparing a commit.
#
# ---------------------------------------------------------------------------

find $REPO/mac -name \*.app -exec $REPO/dev/restoreIconset.sh {} $REPO/dev/Realta.icns \;

echo Before continuing, run the windows and mac invocation scripts
read

echo
echo Testing all invocations after removing remnants
find ../test -type d -depth 1 -exec rm -r {} \;
find ../test -type f -name \*.txt -exec rm {} \;
"$REPO/dev/testall.sh"

echo
echo Generating HTML documentation \(note that SXWN9040 is innocuous and inevitable with recent design decisions by Saxonica\)...

find "$REPO/xsl" -maxdepth 1 -name '*.xsl' -exec sh -c '
  file="$1"
  base=$(basename "$file" .xsl)
  echo Generating HTML for $1...
  java -jar "$2/utilities/saxon12he/saxon12he.jar" -a -warnings:silent -s:"$file" > "$2/xsl/$base.xsl.html"
' sh {} "$REPO" \;

echo
echo These files have inconsistencies that need to be addressed:
find "$REPO/xsl" -maxdepth 1 -name \*.xsl.html -exec grep -l Inconsistencies {} \;
echo End of list of files with inconsistencies
echo Remember that the SXWN9040 errors are innocuous ... would love to avoid them but I haven\'t the time to update the 22-year-old files

