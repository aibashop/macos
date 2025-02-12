#!/bin/sh

[ -z "$PASSPHRASE" ] && { echo "Error: PASSPHRASE not set" ; exit 1 ; }

temp_file="Private.tar.gz"
encrypted_file="Private.tar.gz.gpg"

tar czf $temp_file Private/
gpg --symmetric --cipher-algo AES256 --batch --yes --passphrase="$PASSPHRASE" \
    --output $encrypted_file $temp_file
rm $temp_file