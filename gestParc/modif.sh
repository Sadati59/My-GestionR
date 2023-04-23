#!/bin/bash

read -p "Donner l'id de l'équipement à modifier : " id
query="SELECT * FROM Equipement WHERE id = $id"
result=$(mysql -u sissa22 -pSaandati59 -D donnees -se "$query")

if [ -z "$result" ]; then
    echo "Aucun équipement trouvé avec l'id $id"
else
    echo "Equipement avec l'id $id :"
    echo "$result" 
fi

read -p "Entrez l'ID de l'équipement à mettre à jour : " id
read -p "Entrez le nom de l'équipement : " nom
read -p "Entrez l'adresse MAC de l'équipement : " adMAC
read -p "Entrez l'adresse IP de l'équipement : " adIP
read -p "Entrez la valeur CIDR de l'équipement : " cidr
read -p "Entrez l'ID du type d'équipement : " idT

query="UPDATE Equipement SET nom='$nom', adMAC='$adMAC', adIP='$adIP', CIDR=$cidr, idT=$idT WHERE id=$id"
read -p "Confirmer la modification (o/n) : " confirm
if [ "$confirm" == "o" ]; then
    mysql -u sissa22 -pSaandati59 -D donnees -e "$query"
    if [ $? -eq 0 ]; then
        echo "Les données ont été mises à jour avec succès"
    else
        echo "Erreur lors de la mise à jour des données"
    fi
else
    echo "L'annulation de la modification"
fi

read -p "[Appuyez sur Entrée pour continuer]"

