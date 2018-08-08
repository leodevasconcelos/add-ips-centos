#!/bin/bash
echo -n "Deseja realmente adicionar IP? [Y/n]: "
read ADDIP
if [[ $ADDIP = [yY] ]]; then
  START=Y
  while [ "$START" != "n" ]
  do
    # Cria o arquivo
    echo "Digite o nome do arquivo."
    echo -n "Ex: eth0, eth0:0 ou eth0:1 : "
    read ARQUIVO
    echo -n "Digite o IP: "
    read IPADDR
    echo "Criando arquivo"
    sudo touch /etc/sysconfig/network-scripts/ifcfg-$ARQUIVO
    # Add Info no arquivo
    IP="\"$IPADDR\""
    FILE="\"$ARQUIVO\""
    sudo echo "DEVICE="$FILE"
ONBOOT="\"yes\""
BOOTPROTO="\"none\""
IPADDR="$IP"
NETMASK="\"255.255.255.255\""
BROADCAST="$IP"" > /etc/sysconfig/network-scripts/ifcfg-$ARQUIVO
    echo -n "Deseja realmente adicionar novo IP? [Y/n]: "
    read START
    echo "Reiniciando Network"
    sudo service network restart
  done
fi