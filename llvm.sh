#!/bin/bash
#
#       Created by João Vitor Pereira
#       Date 25/03/2021
# Aumentar Partições Linux usando LVM
#######################################
clear
echo "Partições montadas: "
df -h
echo
echo
echo "Path LVMs disponíveis"
lvdisplay |grep "LV Path"

function FS(){
        /bin/clear
        echo "dados do FS"
}

i=1
while [ $i -le 5 ]; do
        read -p "Insira a montagem que deseja aumentar: " PATH
        if [ -z $PATH ]; then
                echo "Caminho vazio"
                i=$(($i+1))
        else
                echo "$PATH gravado"
                i=6
                FS
        fi
done

