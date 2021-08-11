#!/bin/bash

if [  -z  "$1"  ]
then
        echo "Il manque le singulier du module"
        exit
elif [ -z  "$2" ]
then
        echo "Il manque le pluriel du module"
        exit
else
        echo "Ajout du module : $1"
fi


lowerSin=$(echo "$1" | tr '[:upper:]' '[:lower:]')
upperSin=$(echo "${1^}" )

lowerPlu=$(echo "$2" | tr '[:upper:]' '[:lower:]')
upperPlu=$(echo "${2^}" )



echo ""  > ./constructors/${upperSin}Constructor.js
echo ""  > ./services/${upperSin}Service.js
echo ""  > ./controllers/${upperSin}Controller.js
echo ""  > ./schemas/${upperSin}.js
