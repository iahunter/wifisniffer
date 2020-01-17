#!/bin/bash

# Change Desktop Resolution - Adjust your VM View to Scaled Mode Manually
echo "Changing Resolution \n"
xrandr --size 1920x1200

echo "Adding Telecom to Sudoers \n"
sudo cat << EOF >> /etc/sudoers

# Telecom no password when sudo
telecom ALL=(ALL) NOPASSWD:ALL
EOF


############################################
echo "Installing Teamviewer \n"
# Install Teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ./teamviewer_amd64.deb -y


# Install Git
sudo apt install git -y

############################################

echo "Installing Wireshark \n"
# Install Wireshark
sudo apt-get install wireshark -y

echo "Installing linssid \n"
# Install linssid spectrum anayzer
sudo apt-get install linssid -y

############################################

sudo chmod -R 755 $HOME/wifisniffer

# Create Desktop Icon for Wifi Sniffer
cp $HOME/wifisniffer/WifiSniffer.desktop $HOME/Desktop/

############################################
# Setup  background of Desktop for Wireless 
gsettings set org.gnome.desktop.background primary-color "#111111"
gsettings set org.gnome.desktop.background picture-uri /home/telecom/wifisniffer/background.png

echo "Install Complete"

