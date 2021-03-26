#!/bin/bash
#
#       Created by João Vitor Pereira
#       Date 25/03/2021
# Aumentar Partições Linux usando LVM
#######################################3
clear
echo "Partições montadas: "
df -h
echo
echo
echo "Path LVMs disponíveis"
lvdisplay |grep "LV Path"
read -p "Insira o nome do path que precisa aumentar: " PATH
echo $PATH
