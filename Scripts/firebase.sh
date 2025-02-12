#!/bin/sh
# This script should run before the Complie Sources step in build phase

PLIST_DIR="$PROJECT_DIR/Private/Firebase"
plist_file=""
case "$CONFIGURATION" in
    *Stage*) plist_file="$PLIST_DIR/Stage-GoogleService-Info.plist" ;;
    *Production*) plist_file="$PLIST_DIR/Production-GoogleService-Info.plist" ;;
    *) echo "Unknown project configuration: $CONFIGURATION"; exit 1 ;;
esac
[ -f $plist_file ] || { echo "Missing plist file at $plist_file" ; exit 1 ; }
cp "${plist_file}" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/Contents/Resources/GoogleService-Info.plist"