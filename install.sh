#!/bin/bash

# Change Desktop Resolution - Adjust your VM View to Scaled Mode Manually
echo "Changing Resolution \n"
xrandr --size 1920x1200

############################################
echo "Installing Teamviewer \n"
# Install Teamviewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install ./teamviewer_amd64.deb -y

############################################

# Install Net tools for ifconfig
sudo apt install net-tools -y


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
ln -s $HOME/wifisniffer/WiresharkFilters $HOME/Desktop/WiresharkFilters
ln -s $HOME/wifisniffer/README.md $HOME/Desktop/README

############################################
# Setup  background of Desktop for Wireless 
gsettings set org.gnome.desktop.background primary-color "#000000"
gsettings set org.gnome.desktop.background picture-uri /home/telecom/wifisniffer/background.png

echo "Install Complete"

