#!/bin/bash

set -e

RELEASE_DATA=$(curl -s "https://api.github.com/repos/neovim/neovim/releases/tags/nightly")

RELEASE_ID=$(echo "$RELEASE_DATA" | jq -r ".target_commitish")
SHA256_ARM=$(echo "$RELEASE_DATA" | jq -r ".assets[] | select(.name == \"nvim-macos-arm64.tar.gz\") | .digest" | cut -d ":" -f 2)
SHA256_X86=$(echo "$RELEASE_DATA" | jq -r ".assets[] | select(.name == \"nvim-macos-x86_64.tar.gz\") | .digest" | cut -d ":" -f 2)

if [ -z "$RELEASE_ID" ] || [ -z "$SHA256_ARM" ] || [ -z "$SHA256_X86" ]; then
  echo "Failed to get release data"
  exit 1
fi

CASK_FILE="Casks/neovim-nightly.rb"
TEMPLATE_FILE="cask.template"

# Replace placeholders in the template and write to the cask file
sed -e "s/__RELEASE_ID__/$RELEASE_ID/g" \
    -e "s/__SHA256_ARM__/$SHA256_ARM/g" \
    -e "s/__SHA256_X86__/$SHA256_X86/g" \
    "$TEMPLATE_FILE" > "$CASK_FILE"
