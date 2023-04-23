
#!/bin/bash

echo 
#import des configs et fonctions
source config.sh
source fonction.sh

echo -e "\nQue souhaitez vous consulter:"
echo "1) Toutes les informations"
echo "2) Seulement les machines"
echo "3) Seulement les serveurs"
echo "4) Seulement les switchs"
echo "0) Quitter"
echo -e "Veuillez choisir une option :"
read choix

case $choix in 
	1 )
	echo -e "\n> Résultats"
		mysql -u sissa22 -pSaandati59 -D donnees -e "SELECT TypeE.libelle, Equipement.id, Equipement.nom, Equipement.adMAC, Equipement.adIP, Equipement.CIDR
        FROM Equipement
        INNER JOIN TypeE ON Equipement.idT = TypeE.id";
		read -n1 -r -s -p "[Appuyer sur entrer pour continuer]"
	echo " "

		

		;;
	2 )
	echo -e "\n> Résultats"
		mysql -u sissa22 -pSaandati59 -D donnees -e "SELECT * FROM Equipement WHERE id = 1";
		read -n1 -r -s -p "[Appuyer sur entrer pour continuer]"
	echo " "

		;;
	3 )
	echo -e "\n> Résultats"
		mysql -u sissa22 -pSaandati59 -D donnees -e "SELECT * FROM Equipement WHERE id = 2";
		read -n1 -r -s -p "[Appuyer sur entrer pour continuer]"
	echo " "

		;;
	4 )
	echo -e "\n> Résultats"
		mysql -u sissa22 -pSaandati59 -D donnees -e "SELECT * FROM Equipement WHERE id = 3";
		read -n1 -r -s -p "[Appuyer sur entrer pour continuer]"
	echo " "

		;;
	0 )
		quitter=0
		;;
	* )
	echo "Erreur dans la saisie"
		;;
esac