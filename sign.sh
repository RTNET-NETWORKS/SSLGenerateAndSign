#!/bin/bash

CA_KEY="PRIVATE_CA/CA.key"
CA_CRT="PRIVATE_CA/CA.crt"

TARGET="SIGNING"

echo "#################################################"
echo "####################  SIGN  #####################"
echo "#################################################"

echo ""

if ! [ -d $TARGET ]
then
	mkdir $TARGET
fi

if [ $# -ne 1 ]
then
	echo "Please enter argument"
	exit 1
fi

read -p "You've chosen "$1" . Be sure this is only the NAME, without any extension at the end [y/N] : " ANSWER

if [ $ANSWER = "y" ]
then
	openssl x509 -req -in $1.csr -CA $CA_CRT -CAkey $CA_KEY -CAcreateserial -out $TARGET/$1.crt -days 365
else
	exit 0
fi
