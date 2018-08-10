#!/bin/bash
#####################################################
##     Script to add IPs in VPS OVH with CentOS    ##
##                 BY: vendettafv                  ##
#####################################################

# Constante de Cores
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37
GREEN="\033[0;32m" # Verde
YELLOW="\033[1;33m" # Laranja
RED="\033[0;31m"   # Vermelho
NORMAL="\033[0m"   # Sem cor (Cor normal)

# Start
echo -n "${GREEN}Deseja realmente adicionar IP?${NORMAL} [Yy/n]: "
read ADDIP
if [[ $ADDIP = [yY] ]]; then
  START=Y
  while [ "$START" != "n" ]
  do
    # Cria o arquivo
    echo "${GREEN}Digite o nome do arquivo.${NORMAL}"
    echo -n "${RED}Ex: eth0, eth0:0 ou eth0:1${NORMAL} : "
    read ARQUIVO
    echo -n "${RED}Digite o IP:${NORMAL} "
    read IPADDR
    echo "${YELLOW}Criando arquivo${NORMAL}"
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
    echo -n "${GREEN}Deseja realmente adicionar novo IP?${NORMAL} [Yy/n]: "
    read START
    echo "${YELLOW}Reiniciando Network${NORMAL}"
    sudo service network restart
  done
fi
echo "${GREEN}Precesso finalizado!${NORMAL}"