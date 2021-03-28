#!/bin/bash
#
#       Created by João Vitor Pereira
#       Date 25/03/2021
# Aumentar Partições Linux usando LVM
#######################################

clear
echo "Partições montadas: "
df -Th
echo
echo
echo "Path LVMs disponíveis"
lvdisplay |grep "LV Path"

function FS(){
        PATH1=$(PATH)
}

i=1
while [ $i -le 5 ]; do
        read -p "Insira o caminho completo da partição LVM: " PATH
        if [ -z $PATH ]; then
                echo "Caminho vazio"
                i=$(($i+1))
        else
                echo "$PATH gravado"
                i=6
                /bin/clear
                VG1=$(/sbin/lvdisplay $PATH |/bin/grep "VG Name" |/bin/awk '{$2=$2};1' |/bin/cut -d " " -f 3)
                /sbin/vgdisplay $VG1|/bin/grep "Free  PE / Size" |/bin/awk '{$2=$2};1' |/bin/cut -d " " -f 7
        fi
done
