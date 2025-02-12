#!/bin/sh
# This script should run before the Complie Sources step in build phase

ENV_DIR=${PROJECT_DIR}/Private/Sourcery
TEMPLATE_PATH=${PROJECT_DIR}/AibaShopAdmin/Configs/Config.stencil
OUTPUT_FILE=${PROJECT_DIR}/AibaShopAdmin/Configs/Config.swift

touch $OUTPUT_FILE
file=""
case "$CONFIGURATION" in
    *Stage*) file="${ENV_DIR}/.stage.private.env" ;;
    *Production*) file="${ENV_DIR}/.production.private.env" ;;
    *) echo "Unknown configuration: ${CONFIGURATION}"; exit 1 ;;
esac
[ -f $file ] || { echo "Missing env file at ${file}"; exit 1; }

# https://github.com/krzysztofzablocki/Sourcery/blob/master/guides/Usage.md
# Arguments should be separated with , without spaces (i.e. arg1=value,arg2=value)
# To pass in string you should use escaped quotes (\")
arguments=$(sed -n 's/=/ /p' $file | awk '{printf "%s=\"%s\",", $1, $2}' | sed 's/,$//')

# Adds support for Apple Silicon brew directory
export PATH="$PATH:/opt/homebrew/bin"
# Codegen
sourcery \
    --templates $TEMPLATE_PATH \
    --sources $OUTPUT_FILE \
    --output $OUTPUT_FILE \
    --args $arguments