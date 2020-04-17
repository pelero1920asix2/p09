#!/bin/bash
#
if (( EUID !=0 ))
then
	zenity --error --text="Aquest script s'ha d'executar amb privilegis de l'usuari root"
	exit 1
fi
clear
DIR=$(zenity --file-selection --filename=$ETC --directory --title="selecciona una carpeta" --width 1000)
if [[ -d /etc/$DIR ]]
then
	tar -cpvzf $DIR.orig
fi
exit 0
echo "vols continuar? s/n"
ready yn
case $yn in
	y)	clear
		;;
	n)	exit 2
		;;
	*)	echo "selecciona s o n"
		;;
	esac
done
exit 1
