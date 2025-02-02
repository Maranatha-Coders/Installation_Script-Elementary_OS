#bash

#Download Elementary OS from here: 
#http://sourceforge.net/projects/elementaryos/files/stable/

#First you update your system
sudo apt-get update && sudo apt-get dist-upgrade

#Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable

#Clean-up System
sudo apt-get purge midori-granite
sudo apt-get purge noise
sudo apt-get purge software-center
sudo apt-get purge scratch-text-editor
sudo apt-get purge bluez
sudo apt-get purge modemmanager
sudo apt-get autoremove
sudo apt-get autoclean

#Remove some Switchboard Plug's
sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-bluetooth.plug
sudo rm -rf /usr/lib/plugs/GnomeCC/gnomecc-wacom.plug

#Install gedit (Text Editor)
sudo apt-get install gedit gedit-plugins

#Install File Compression Libs
sudo apt-get install unace unrar zip unzip xz-utils p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller

#Install Guake Terminal
sudo apt-get install guake

#Install screenfetch (my elementary-OS special Version)
mkdir screenfetch
cd screenfetch
wget https://raw.github.com/memoryleakx/screenFetch/master/screenfetch-dev
sudo mv screenfetch-dev /usr/bin/screenfetch
cd ..
rm -rf screenfetch

#make it readable and executable
sudo chmod +rx /usr/bin/screenfetch

##setup .bashrc for auto screenfetch
gedit ~/.bashrc
###put this on the last line
screenfetch -D "Elementary"

#For fresh Nvidia Drivers
sudo add-apt-repository ppa:xorg-edgers/ppa
sudo apt-get update && sudo apt-get dist-upgrade

#For Nvidia Cards
sudo apt-get install nvidia-331

#For AMD/ATI Cards 
sudo apt-get install fglrx-installer


#Install Ubuntu Restricted Extras
sudo apt-get install ubuntu-restricted-extras

#Enable all Startup Applications
cd /etc/xdg/autostart
sudo sed --in-place 's/NoDisplay=true/NoDisplay=false/g' *.desktop

#Enable Movie DVD Support
sudo apt-get install libdvdread4
sudo /usr/share/doc/libdvdread4/install-css.sh

#Install a Firewall Application
sudo apt-get install gufw

#Install Gimp
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt-get update
sudo apt-get install gimp gimp-data gimp-plugin-registry gimp-data-extras

#Install Elementary OS extras
sudo apt-add-repository ppa:versable/elementary-update
sudo apt-get update

sudo apt-get install elementary-desktop elementary-tweaks
sudo apt-get install elementary-dark-theme elementary-plastico-theme elementary-whit-e-theme elementary-harvey-theme
sudo apt-get install elementary-elfaenza-icons elementary-nitrux-icons
sudo apt-get install elementary-plank-themes
sudo apt-get install wingpanel-slim indicator-synapse

#if not installed 
#Install the Dynamic Kernel Module Support Framework
sudo apt-get install dkms

mkdir kernel
cd kernel

#Install Kernel 3.12.2 on 64 Bit
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-headers-3.12.2-031202-generic_3.12.2-031202.201311291538_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-headers-3.12.2-031202_3.12.2-031202.201311291538_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-image-3.12.2-031202-generic_3.12.2-031202.201311291538_amd64.deb

#Install Kernel 3.12.2 on 32 Bit
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-headers-3.12.2-031202-generic_3.12.2-031202.201311291538_i386.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-headers-3.12.2-031202_3.12.2-031202.201311291538_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.2-trusty/linux-image-3.12.2-031202-generic_3.12.2-031202.201311291538_i386.deb

sudo dpkg -i *.deb

cd ..
rm -rf kernel
#Reboot!

#Install fresh firmware
mkdir firmware
cd firmware

wget https://launchpad.net/ubuntu/+archive/primary/+files/linux-firmware_1.117_all.deb
wget https://launchpad.net/ubuntu/+archive/primary/+files/nic-firmware_1.117_all.udeb

sudo dpkg -i *.deb

cd ..
rm -rf firmware

#update initramfs
sudo update-initramfs -k all -u
#Reboot!




#Install Broadcom STA Driver (if you need)
mkdir wlan
cd wlan
wget https://launchpad.net/ubuntu/+archive/primary/+files/broadcom-sta-dkms_6.30.223.141-1_all.deb

sudo dpkg -i *.deb
cd ..
rm -rf wlan
#Reboot!

#Install Apparmor 2.8
sudo add-apt-repository ppa:apparmor-upload/apparmor-2.8
sudo apt-get update && sudo apt-get dist-upgrade


#Install Java 7
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer

#Install Steam
wget http://repo.steampowered.com/steam/signature.gpg && sudo apt-key add signature.gpg
sudo sh -c 'echo "deb http://repo.steampowered.com/steam/ precise steam" >> /etc/apt/sources.list.d/steam.list'
sudo apt-get update
sudo apt-get install steam

#Install PlayonLinux
#Run Windows Applications and Games on Linux
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
sudo wget http://deb.playonlinux.com/playonlinux_precise.list -O /etc/apt/sources.list.d/playonlinux.list
sudo apt-get update
sudo apt-get install playonlinux

#Install Skype
sudo apt-add-repository "deb http://archive.canonical.com/ubuntu/ precise partner"
sudo apt-get update && sudo apt-get install skype

#Install Libre Office 4
sudo add-apt-repository ppa:libreoffice/libreoffice-4-0
sudo apt-get update
sudo apt-get install libreoffice

#Install the Clementine Music Player
sudo add-apt-repository ppa:me-davidsansome/clementine
sudo apt-get update
sudo apt-get install clementine

#Install the latest git Version
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install git

#Install the latest Version of VirtualBox
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib" >> /etc/apt/sources.list.d/virtualbox.list'
sudo apt-get update
sudo apt-get install virtualbox-4.3

#Install Thunderbird
#if you want install Thunderbird instead of Geary Mail
#first remove Geary Mail
sudo apt-get purge geary

sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
sudo apt-get update
sudo apt-get install thunderbird


#Install multitouch gestures on Ubuntu based distro

#Para instalar o touchegg no Ubuntu basta que abra o terminal e execute o seguinte comando:
sudo apt install touchegg
sudo apt-get install geis-tools

#-> Em seguida vamos criar um perfil de gestos. Basta criar o ficheiro .xprofile e adicionar o seguinte código:

#synclient TapButton2=0
# synclient ClickFinger2=0
# synclient TapButton3=0
# synclient ClickFinger3=0
# synclient HorizTwoFingerScroll=0
# synclient VertTwoFingerScroll=0
# touchegg &

# -> Depois de tudo feito, gravem o ficheiro e reiniciem a máquina. 


#Official PPA with Remmina 1.4.7

# - Can be installed by copying and pasting this in a terminal:
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt install remmina remmina-plugin-rdp remmina-plugin-secret
sudo apt install remmina remmina-plugin-vnc




