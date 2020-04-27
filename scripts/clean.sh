#!/bin/bash

set -x

if [[ -d ./tmp ]]; then
    rm -fR ./tmp
fi