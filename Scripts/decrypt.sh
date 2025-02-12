#!/bin/sh

[ -z "$PASSPHRASE" ] && { echo "Error: PASSPHRASE not set" ; exit 1 ; }
file="Private.tar.gz.gpg"
decrypted_file="Private.tar.gz"
if ! gpg --quiet --batch --yes --decrypt --passphrase="$PASSPHRASE" \
    --output $decrypted_file $file; then
      echo "Error: Failed to decrypt $file"
fi
tar xzf $decrypted_file
rm $decrypted_file