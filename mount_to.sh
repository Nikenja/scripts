#!/bin/bash

IP="${1}"
echo "IP: ${IP}"
shift

PREFIX="${1}"
echo "PREFIX: ${PREFIX}"
shift

while [ ${#} -gt 0 ]
do
    SRC_PATH="${PREFIX}/${1}"
    echo "SRC_PATH: ${SRC_PATH}"
    
    DST_PATH="/mnt/${SRC_PATH}"
    echo "DST_PATH: ${DST_PATH}"

    sudo mkdir -p "${DST_PATH}"
    sudo sshfs dudin@${IP}:"${SRC_PATH}" "${DST_PATH}" -oauto_cache,allow_other,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3,IdentityFile=~/.ssh/id_rsa
    shift
done
