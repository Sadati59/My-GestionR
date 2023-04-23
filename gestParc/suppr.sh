#!/bin/bash

read -p "Donner l'id de l'équipement à supprimer : " id
query="SELECT * FROM Equipement WHERE id = $id"
result=$(mysql -u sissa22 -pSaandati59 -D donnees -se "$query")

if [ -z "$result" ]; then
    echo "Aucun équipement trouvé avec l'id $id"
else
    echo "Equipement avec l'id $id :"
    echo "$result" 
    read -p "Confirmer la suppression (o/n) : " confirm
    if [ "$confirm" == "o" ]; then
        mysql -u sissa22 -pSaandati59 -D donnees -e "DELETE FROM Equipement WHERE id = $id"
        if [ $? -eq 0 ]; then
            echo "Les données ont été supprimées de la base de données"
        else
            echo "Erreur lors de la suppression des données de la base de données"
        fi
    else
        echo "L'annulation de la suppression a été confirmée"
    fi
fi

read -p "[Appuyer sur entrer pour continuer]"

