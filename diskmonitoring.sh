#!/bin/bash
#       Created By João Vitor da Silva Pereira
#       j.da.silva.pereira@accenture.com
#       20/05/2021
#       Version: 1.0
#       Script que realiza o expurgo dos dumps gerados no último dia pelo banco de dados.
#       Ao atingir o limite de 98% de uso do /BACKUP -> Purge nos arquivos dentro do
####################################################################
#Informar dentro das '' o FS que precisa ser monitorado
used=$(df -Ph | grep '/dev/loop0' | awk {'print $5'})
#Limite ajustado com a váriavel abaixo
max=80%
#stable=70%
#Diretório que contém os Dumps
pumpdiario=/BACKUP/PumpDiario
pumpsemana=/BACKUP/PumpSemanal
pumpdiariopsbk=/BACKUP/psbk/PumpDiario
pumpsemanalpsbk=/BACKUP/psbk/PumpSemanal
# Extensão dos arquivos que serão apagados
type1=dmp
type2=dmp.gz
# Ao atingir o limite informado na váriavel 'max' ele executa a geração de Logs e o purge dos dados contidos nos diretórios acima
if [[ ${used%?} -ge ${max%?} ]]; then
        echo "The Mount Point "BACKUP" on $(hostname) has used $used at $(date)" >> /var/log/diskclean.log
        find $pumpdiario -type f -name "*.$type1"  -atime +1 -exec rm {} \;
        find $pumpdiario -type f -name "*.$type2"  -atime +1 -exec rm {} \;
        find $pumpsemana -type f -name "*.$type1"  -atime +1 -exec rm {} \;
        find $pumpsemana -type f -name "*.$type2"  -atime +1 -exec rm {} \;
        find $pumpdiariopsbk -type f -name "*.$type1"  -atime +1 -exec rm {} \;
        find $pumpdiariopsbk -type f -name "*.$type2"  -atime +1 -exec rm {} \;
        find $pumpsemanalpsbk -type f -name "*.$type1"  -atime +1 -exec rm {} \;
        find $pumpsemanalpsbk -type f -name "*.$type2"  -atime +1 -exec rm {} \;
fi
