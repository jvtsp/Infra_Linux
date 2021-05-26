#!/bin/bash
#       Created By João Vitor da Silva Pereira
#       j.da.silva.pereira@accenture.com
#       20/05/2021
#       Version: 1.0
#       Script que realiza o expurgo dos dumps gerados no último dia pelo banco de dados.
#       Ao atingir o limite de 98% de uso do /BACKUP -> Purge nos arquivos dentro do
####################################################################
#Informar dentro das '' o FS que precisa ser monitorado
used=$(df -Ph | grep '' | awk {'print $5'})
#Limite ajustado com a váriavel abaixo
max=96%
#stable=70%
# Ao atingir o limite informado na váriavel 'max' ele executa a geração de Logs e o purge dos dados contidos nos diretórios acima
if [[ ${used%?} -ge ${max%?} ]]; then
        echo "The Mount Point "BACKUP" on $(hostname) has used $used at $(date)" >> /tmp/diskclean.log
        find /BACKUP/PumpDiario -daystart -type f -name '*.dmp'  -mtime 1 -exec rm {} \;
        find /BACKUP/PumpDiario -daystart -type f -name '*.dmp.gz'  -mtime 1 -exec rm {} \;

        find /BACKUP/PumpSemanal -daystart -type f -name '*.dmp'  -mtime 1 -exec rm {} \;
        find /BACKUP/PumpSemanal -daystart -type f -name '*.dmp.gz'  -mtime 1 -exec rm {} \;

        find /BACKUP/psbk/PumpDiario -daystart -type f -name '*.dmp'  -mtime 1 -exec rm {} \;
        find /BACKUP/psbk/PumpDiario -daystart -type f -name '*.dmp.gz'  -mtime 1 -exec rm {} \;

        find /BACKUP/psbk/PumpSemanal -daystart -type f -name '*.dmp'  -mtime 1 -exec rm {} \;
        find /BACKUP/psbk/PumpSemanal -daystart -type f -name '*.dmp.gz'  -mtime 1 -exec rm {} \;
fi
