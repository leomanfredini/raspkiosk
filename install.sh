#!/bin/sh
# This script will install RASPKIOSK on a fresh Raspberry Pi OS
# This script is experimental and does not ensure any security.
# sudo wget -qO - https://raw.githubusercontent.com/leomanfredini/raspkiosk/master/install.sh | bash

# REMOVER PACOTES DESNECESSÁRIOS
apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 smartsim java-common minecraft-pi libreoffice* -y
#apt-get purge smartsim java-common minecraft-pi libreoffice* -y

# LIMPAR ARQUIVOS RESIDUAIS
apt-get clean && apt-get autoremove -y

# ATUALIZAR O SISTEMA
apt-get update && apt-get upgrade -y

# INSTALANDO PACOTES NECESSÁRIOS PARA O KIOSK MODE
apt-get -y install xdotool unclutter sed wget

# CRIAR O SCRIPT RESPONSÁVEL POR INICIAR O KIOSK MODE
wget -P /home/pi https://raw.githubusercontent.com/leomanfredini/raspkiosk/master/kiosk.sh
chown pi:pi /home/pi/kiosk.sh

# CRIANDO O SERVIÇO PARA INICIAR O SCRIPT NO BOOT
wget -P /lib/systemd/system https://raw.githubusercontent.com/leomanfredini/raspkiosk/master/kiosk.service

# HABILITAR O SCRIPT NA INICIALIZAÇÃO
systemctl enable kiosk.service

	echo " ** Script RASPKIOSK instalado com sucesso **"
	echo "Edite o arquivo /home/pi/kiosk.sh para alterar as URLs que serão exibidas em sequência"
	echo
	echo "Comando para iniciar manualmente o Kiosk Mode:"
	echo "  sudo systemctl start kiosk.service"
	echo 
  	echo "Comando para finalizar manualmente o Kiosk Mode:"
	echo "  sudo systemctl stop kiosk.service"
	echo
	echo "Por padrão, o script será iniciado sempre ao iniciar o sistema operacional"
	echo "Para desabilitar o início automático, executar a seguinte linha de comando:"
	echo "  sudo systemctl disable kiosk.service"
	echo 
