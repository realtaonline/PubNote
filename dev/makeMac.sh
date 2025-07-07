#!/bin/bash

# Exit on error
set -e

# Identify version file
FILES=(version-*.txt)
if [[ ${#FILES[@]} -ne 1 ]]; then
  echo "ERROR: Expected exactly one version-*.txt file, found ${#FILES[@]}"
  exit 1
fi

VERSION_FILE="${FILES[0]}"
VERSION="${VERSION_FILE#version-}"
VERSION="${VERSION%.txt}"
echo "INFO: Building macOS packages for version $VERSION"

# Define names
BASENAME="PubNote-$VERSION"
STAGING_ROOT="build/macos-staging"
STAGING="$STAGING_ROOT/$BASENAME"
DMGFILE="build/$BASENAME-mac--use-wget-or-curl.dmg"
ZIPFILE="build/$BASENAME-mac.zip"

# Clean up and prepare staging directory
rm -rf "$STAGING_ROOT"
mkdir -p "$STAGING"
rsync -a --exclude='.*' ./ "$STAGING/"

# ZIP with metadata (manual use only)
echo "INFO: Creating ZIP (ditto)..."
ditto -c -k --sequesterRsrc --keepParent "$STAGING" "$ZIPFILE"

# DMG creation with parent folder
echo "INFO: Creating DMG with parent directory..."
hdiutil create -volname "$BASENAME" \
  -srcfolder "$STAGING_ROOT" \
  -ov -format UDZO "$DMGFILE"

echo "Done"
echo "ZIP: $ZIPFILE"
echo "DMG: $DMGFILE"


