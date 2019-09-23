#!/usr/bin/env bash

mkdir -p images;

jq -r '.[] | "curl -s -o \"images/\(.name)\(.extension)\" \"\(.url)\""' $1 | \
while read -r line; do eval "$line"; done