#! /usr/bin/sh
##########################################################

# Define USB Wireless Adapter Name Here...
ADAPTER="wlan0"

echo "Wireless Adapter Name: "$ADAPTER"\n"

echo "NOTE! If the Adapter is not capturing traffic when Wireshark Starts, you may need to reseat the NIC and run the script again.\n"

##########################################################

printf "Starting Sniffer Config Setup... Please Wait...\n"

sudo service network-manager stop

sudo rfkill unblock all

sudo ifconfig $ADAPTER down
sudo iwconfig $ADAPTER mode monitor
sudo ifconfig $ADAPTER up

sudo service network-manager start

echo "Starting Wireshark - Start Capture on "$ADAPTER" to capture wireless traffic.\n"
sudo wireshark
