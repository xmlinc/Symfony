#!/bin/bash

read -p "Are you alright? (y/n) " RESP
if [ "$RESP" = "y" ]; then
	echo "Glad to hear it"
else
	echo "You need more bash programming"
fi



echo "Do you wish to install this program?"  
select yn in "Yes" "No"; do  
case $yn in
	Yes ) make install; break;;
	No ) exit;;
esac
done

#echo Would you like to install? "(Y or N)"
#read x
#if [ $x == "y" ]; then
#	echo "ok"
#fi
	

#php app/console generate:bundle --namespace=Efi/BlogtestBundle --format=annotation