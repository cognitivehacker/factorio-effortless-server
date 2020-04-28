#!/bin/bash

set -x 

source ./scripts/source.sh

if [[ ! -d ./tmp ]]; then
    echo "error: tmp not found"
    echo "try to run make && make install"
    exit 1
fi

# Install server

if [[ -d  "$LOCAL_LIB/factorio" ]]; then
    rm -fR $LOCAL_LIB/factorio
fi

mv $TMP$LOCAL_LIB/factorio $LOCAL_LIB/factorio

if [[ -e "$LOCAL_BIN/factorio" ]]; then
    rm $LOCAL_BIN/factorio
fi;

ln -s $LOCAL_LIB/factorio/bin/x64/factorio $LOCAL_BIN/factorio

# Create Factorio User

id -u $FACTORIO_SERVICE_USER &>/dev/null || useradd $FACTORIO_SERVICE_USER 

if [[ ! -d "/home/factorio" ]]; then
    mkdir "/home/factorio"
fi

# Setup Conf

cp -R $TMP/home/factorio/$CONF /home/factorio/$CONF

# Setup Service

cp $TMP$SERVICES/factorio.service $SERVICES/factorio.service
