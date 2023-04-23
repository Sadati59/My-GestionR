

#!/bin/bash

read -p "Veuillez saisir une adresse IP : " ip

echo "Envoie de la requête ICMP"
ping -c 4 $ip > /dev/null

if [ $? -eq 0 ]
then
  echo "... L'adresse IP répond aux pings."
else
  echo "... L'adresse IP ne répond pas aux pings."
fi

read -p "[Appuyer sur entrer pour continuer]"

