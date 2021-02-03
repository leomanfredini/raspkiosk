#!/bin/sh
# This script will install RASPKIOSK on a fresh Raspberry Pi OS
# This script is experimental and does not ensure any security.

# REMOVER PACOTES DESNECESSÁRIOS
apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
apt-get purge smartsim java-common minecraft-pi libreoffice* -y

# LIMPAR ARQUIVOS RESIDUAIS
apt-get clean
apt-get autoremove -y

# ATUALIZAR O SISTEMA
apt-get update
apt-get upgrade

# INSTALANDO PACOTES NECESSÁRIOS PARA O KIOSK MODE
apt-get install xdotool unclutter sed wget

# CRIAR O SCRIPT RESPONSÁVEL POR INICIAR O KIOSK MODE
wget -P /home/pi https://raw.githubusercontent.com/leomanfredini/raspkiosk/master/kiosk.sh
chown pi:pi /home/pi/kiosk.sh

# CRIANDO O SERVIÇO PARA INICIAR O SCRIPT NO BOOT
wget -P /lib/systemd/system https://raw.githubusercontent.com/leomanfredini/raspkiosk/master/kiosk.service

# HABILITAR O SCRIPT NA INICIALIZAÇÃO
systemctl enable kiosk.service



# Comando para iniciar manualmente o Kiosk Mode
# $ sudo systemctl start kiosk.service
# Comando para finalizar manualmente o Kiosk Mode
# $ sudo systemctl stop kiosk.service
