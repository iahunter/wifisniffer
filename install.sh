#!/bin/bash

############################################

echo "Installing Wireshark \n"
# Install Wireshark
sudo apt-get install wireshark -y

echo "Installing linssid \n"
# Install linssid spectrum anayzer
sudo apt-get install linssid -y

# Install Git
sudo apt install git -y

git clone https://github.com/iahunter/wifisniffer.git wifisniffer

sudo chmod -R 755 wifisniffer

cd wifisniffer
# Create Desktop Icon for Wifi Sniffer
cp WifiSniffer.desktop $HOME/Desktop/

gsettings set org.gnome.desktop.background primary-color "#111111"
gsettings set org.gnome.desktop.background picture-uri /home/telecom/wifisniffer/background.png

echo "Install Complete"


