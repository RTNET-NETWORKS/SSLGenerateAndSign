#!/bin/bash

TARGET="SIGNING"

echo "#################################################"
echo "##################  GENERATE  ###################"
echo "#################################################"

echo ""


if [ $# -ne 1 ]
then
	echo "Please give a name"
	exit 1
fi

read -p "You've chosen "$1" . Be sure this is only the NAME, without any extension at the end [y/N] : " ANSWER

if [ $ANSWER = "y" ]
then
	openssl genpkey -algorithm RSA -out $1.key
	openssl req -new -key $1.key -out $1.csr
else
        exit 0
fi

