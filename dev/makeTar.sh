#!/bin/bash

set -e  # Exit on error

# Ensure there's exactly one version-*.txt file
shopt -s nullglob
VERSION_FILES=(version-*.txt)
shopt -u nullglob

if [[ ${#VERSION_FILES[@]} -ne 1 ]]; then
  echo "ERROR: Expected exactly one version-*.txt file, found ${#VERSION_FILES[@]}"
  exit 1
fi

VERSION_FILE="${VERSION_FILES[0]}"
VERSION="${VERSION_FILE#version-}"
VERSION="${VERSION%.txt}"

# Define output location
BUILD_DIR="build"
TARBALL_NAME="PubNote-${VERSION}.tar.gz"
TARBALL_PATH="${BUILD_DIR}/${TARBALL_NAME}"

echo "INFO: Building tarball ${TARBALL_NAME}..."

# Create clean build directory if needed
mkdir -p "$BUILD_DIR"

# Create a temporary staging directory with a versioned root folder
STAGING_DIR="${BUILD_DIR}/PubNote-${VERSION}"
rm -rf "$STAGING_DIR"
mkdir -p "$STAGING_DIR"

# Copy all visible files and folders (exclude dotfiles, including .git)
rsync -a --exclude='.*' ./ "$STAGING_DIR/"

# Build the tarball from the staging directory
tar -czf "$TARBALL_PATH" -C "$BUILD_DIR" "PubNote-${VERSION}"

echo "SUCCESS: Created $TARBALL_PATH"

