#!/bin/bash

xcodes=$(ls /Applications | grep '^Xcode' | sort -V -r)

printf "Available Xcodes:\n"
printf "\e[36m- %s\e[0m\n" $xcodes

latest_xcode=$(echo "$xcodes" | head -n 1)

# Set the selected Xcode
# The latest Xcode(16.2.0) on the GitHub runner does not include iOS 18.2.
# sudo xcode-select -s "/Applications/$latest_xcode"
sudo xcode-select -s /Applications/Xcode_16.1.0.app || exit 1
printf "\e[32m✓ %s\e[0m\n" "$latest_xcode selected" 