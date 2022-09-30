#!/bin/bash
#Autor: Òscar Herrán Morueco
root_check()
{
if [ "$(id -u)" != "0" ]; then
	whiptail --title "Error!" \
    --msgbox "Heu d'executar aquest script com a root (sudo) > ./nomscript.sh" 10 30
	exit 1
fi
tria
}

tria()
{

if(whiptail  --title "Regenerar id de l'equip" \
    --yesno "Esteu segurs que voleu reiniciar l'identificador de l'equip?" \
    --yes-button "Si" \
    --no-button "No" 10 60) then
    restaura
else
    echo -e "Operació avortada per l'usuari"
fi

}

restaura()
{
  rm /etc/machine-id
  systemd-machine-id-setup
}

root_check
