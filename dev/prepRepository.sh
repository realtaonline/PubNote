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
echo Generating HTML documentation...
"$REPO/dev/documentall.sh"

