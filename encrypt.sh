#!/bin/bash
#encrypt files with aes-128-cbc cipher using openssl

#encrypt files
if [ "$1" == "-e" ];
then
    if [ -f "$2" ];
    then
    openssl aes-128-cbc -a -e -salt -in "$2" -out "$2.aes"
    else
       echo "This file does not exist!" 
    fi
#decrypt files
elif [ "$1" == "-d" ];
then
    if [ -f "$2" ];
    then
        name=${2%.aes}
        openssl aes-128-cbc -a -d -salt -in "$2" -out "$name"
    else
        echo "This file does not exist!" 
    fi
#show help
elif [ "$1" == "--help" ];
then
    echo "This software uses openssl for encrypting files with the aes-128-cbc cipher"
    echo "Usage for encrypting: ./encrypt -e [file]"
    echo "Usage for decrypting: ./encrypt -d [file]"
else
    echo "This action does not exist!"
    echo "Use ./encrypt.sh --help to show help."
fi
