#!/bin/bash

# Get the absolute path to the repo (directory of this script)
THIS="$(cd "$(dirname "$0")" && pwd)"
TEMPLATE="$THIS/fop-config.template.xml"
CONFIG="$THIS/fop-config.local.xml"
FOP="$THIS/../fop-2.11/fop-2.11/fop"

# Create a local config if it doesn't already exist
if [[ ! -f "$CONFIG" ]]; then
  echo "Creating local FOP config at: $CONFIG" >&2
  sed "s|{{REPO_DIR}}|$THIS|g" "$TEMPLATE" > "$CONFIG"
fi

# Call FOP with the generated config
exec "$FOP" -c "$CONFIG" "$@"
