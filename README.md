# Raspkiosk
***Kiosk Mode no Raspberry Pi usando a distribuição Raspbian***

**Distribuição utilizada:** Raspbian Buster with desktop
**Download:** [https://www.raspberrypi.org/downloads/raspbian/](https://www.raspberrypi.org/downloads/raspbian/ "https://www.raspberrypi.org/downloads/raspbian/")


------------



#### 1. REMOVER PACOTES DESNECESSÁRIOS


	$ sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
	$ sudo apt-get purge smartsim java-common minecraft-pi libreoffice* -y


#### 2. LIMPAR ARQUIVOS RESIDUAIS

	$ sudo apt-get clean
	$ sudo apt-get autoremove -y


#### 3. ATUALIZAR O SISTEMA

	$ sudo apt-get update
	$ sudo apt-get upgrade


#### 4. INSTALAR PACOTES NECESSÁRIOS PARA O MODO QUIOSQUE

	$ sudo apt-get install xdotool unclutter sed


#### 5. HABILITAR O LOGIN AUTOMÁTICO

	$ sudo raspi-config

Opcao 3 - Boot Options
Opção B1 - Desktop/CLI
Opção B4 - Desktop Autologin


#### 6. CRIAR O SCRIPT RESPONSÁVEL POR INICIAR O MODO QUIOSQUE

Criar o arquivo para o script

	$ nano /home/pi/kiosk.sh

Copiar o conteúdo do arquivo *kiosk.sh* disponível neste repositório

#### 7. CRIANDO O SERVIÇO PARA INICIAR O SCRIPT NO BOOT

Criar o arquivo para o script

	$ sudo nano /lib/systemd/system/kiosk.service

Copiar o conteúdo do arquivo *kiosk.service* disponível neste repositório

#### 8. HABILITAR O SCRIPT NA INICIALIZAÇÃO

	$ sudo systemctl enable kiosk.service


------------

Comando para iniciar manualmente o Kiosk Mode

	$ sudo systemctl start kiosk.service

Comando para finalizar manualmente o Kiosk Mode

	$ sudo systemctl stop kiosk.service
