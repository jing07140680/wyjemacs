#!/bin/bash

# Script to import a GPG key into Emacs' keyring and set trust level
# Ensure the gnupg directory exists
GNUPG_DIR="$HOME/.emacs.d/elpa/gnupg"
mkdir -p "$GNUPG_DIR"

# Get key ID from user if not provided as argument
if [ -z "$1" ]; then
    read -p "Enter GPG key ID to import (645357D2883A0966): " KEY_ID
else
    KEY_ID="$1"
fi

echo "Importing key $KEY_ID from keyserver..."
gpg --homedir "$GNUPG_DIR" --keyserver keyserver.ubuntu.com --recv-keys "$KEY_ID"

if [ $? -ne 0 ]; then
    echo "Error: Failed to import key"
    exit 1
fi

echo "Please run the following command manually:"
echo "gpg --homedir $GNUPG_DIR --edit-key $KEY_ID"
echo "Then type 'trust', choose '5', confirm with 'y', and type 'quit'"


# Clean up the temporary expect script
rm -f "$EXPECT_SCRIPT"

echo "Process completed."

