#!/bin/bash

set -x

source ./scripts/source.sh

if [[ -d "$TMP" ]]; then
    rm -fR $TMP
fi