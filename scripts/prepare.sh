#!/bin/bash

set -x

source ./scripts/source.sh

if [[ ! -d "$TMP" ]]; then

    mkdir -p $TMP

fi

download_server(){

    mkdir -p $TMP$LOCAL_LIB
    wget -c $URL -O $TMP$LOCAL_LIB/factorio-headless.tar.xz
    
    tar xf $TMP$LOCAL_LIB/factorio-headless.tar.xz -C $TMP$LOCAL_LIB/
    rm $TMP$LOCAL_LIB/factorio-headless.tar.xz

}

service(){
    mkdir -p $TMP$SERVICES
    cp ./scripts/assets/factorio.service  $TMP$SERVICES/factorio.service
}

download_mods(){
    
    while IFS= read -r line
    do
    echo ""
        wget --content-disposition "$line?username=$FACTORIO_USERNAME&token=$FACTORIO_ACCESS_TOKEN" -P $TMP$LOCAL_LIB/factorio/mods
    done < "configs/mods.txt"

    for i in `ls $TMP$LOCAL_LIB/factorio/mods/*.zip?*`; do echo $i | cut -f 1 -d \? | xargs -n1 mv $i ; done

}

configs(){
    mkdir -p $TMP/home/$FACTORIO_SERVICE_USER/$CONF
    cp -r ./configs/* $TMP/home/$FACTORIO_SERVICE_USER/$CONF
}

download_server
service
download_mods
configs
