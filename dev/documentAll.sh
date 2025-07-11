REPO="$(cd "$(dirname "$0")" && cd .. && pwd)"

# ---------------------------------------------------------------------------
# documentAll.sh
#
# A shell script without arguments to revise the HTML documentation of the
# stylesheets.
#
# ---------------------------------------------------------------------------

echo \(note that SXWN9040 is innocuous and inevitable with recent design decisions by Saxonica\)
find "$REPO/xsl" -maxdepth 1 -name '*.xsl' -exec sh -c '
  file="$1"
  base=$(basename "$file")
  echo Generating HTML for $1...
  java -jar "$2/utilities/saxon12he/saxon12he.jar" -a -warnings:silent -s:"$file" > "$2/xsl/$base.html"
' sh {} "$REPO" \;

echo
echo These files have inconsistencies that need to be addressed:
find "$REPO/xsl" -maxdepth 1 -name \*.xsl.html -exec grep -l Inconsistencies {} \;
echo End of list of files with inconsistencies
echo Remember that the SXWN9040 errors are innocuous ... would love to avoid them but I haven\'t the time to update the 22-year-old files
