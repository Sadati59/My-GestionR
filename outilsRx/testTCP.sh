#!/bin/bash

read -p "Veuillez saisir une adresse IP : 
" ip
read -p "Veuillez saisir un numéro de port TCP : 
" port

echo "Envoie de la requête TCP..."

nc -z -w5 $ip $port

if [ $? -eq 0 ]; then
    echo "Le port TCP est ouvert sur l'adresse IP."
else
    echo "Le port TCP est fermé sur l'adresse IP."
fi

read -p "[Appuyer sur entrer pour continuer]"
