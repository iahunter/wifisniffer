# Description
These are instructions and scripts to run Wireshark as a VM in Vitrualbox on top of windows using an external Wireless NIC. 

I have had trouble doing packet captures in Microsoft Windows promiscuous mode. This was an attempt to use the same laptop but do the capturing in a Linux VM instead of carrying around another laptop.  

#### Tested NICs that work on both 2.4Ghz and 5Ghz: 
* Panda Wireless PAU07


# Installation

## Create new VM in Virtualbox

* Name: WifiSniffer
* Type: Linux
* Version: Ubuntu 6(4-bit)

* Memory: 8192MB

* Create a virtual hard disk file

* VDI
* Dynamically allocated
* 10 GB

### Change VM defaults: 
* General
	* Advanced
		* Shared Clipboard: Bidirectional
		* Grag'n'Drop: Bidirectional
* System
	* Processor
		* Processors: 2
* Display
	* Screen
		* Video Memory: 64 MB
* Storage
	* Controller:IDE
		* Empty: 64 MB
			* Attributes: 64 MB
				* Optical Drive: Click on CD Image and select Ubuntu ISO you have downloaded. 
* USB
	* USB Device Filters
		* Click Add and select your Wireless USB Adapter
		
Click Ok and Start VM - Normal Start

## Install OS

* Install Ubuntu Desktop 18.04. 
	* Using "telecom" as the example user for future reference. 

## Add Telecom to Sudoers with No password (Optional)
```
sudo nano /etc/sudoers
```
* Add line to end of file to allow sudo without having to type the password everytime. 
	```
	telecom ALL=(ALL) NOPASSWD:ALL
	```

## Install Git
```
sudo apt install git -y
```

## Clone Repo to Home Directory of User "telecom"
```
git clone https://github.com/iahunter/wifisniffer.git /home/telecom/wifisniffer
```

## Change Permissions
```
chmod 755 /home/telecom/wifisniffer
```

## Run Installation of WifiSniffer Dependencies
```
sh /home/telecom/wifisniffer/install.sh
```

# Using the Tools

To Sniff wireless traffic you must insert your USB Wireless NIC into the laptop and make sure that the VM has access to it under VirtualBox > VM > Settings > USB > USB Device Filters. Add the USB Adapter and click ok. 

### Get your Wireless USB NIC Adapter Name

* Get the Network Adapter name of your USB Wireless NIC - Copy the name
```
ifconfig
```

#### Edit Adapter Variable
```
nano /home/telecom/wifisniffer/sniff.sh 
```
* Replace the adapter variable with your USB Wireless NIC name from ifconfig output above.
	```
	ADAPTER="YOURNICNAME"
	```

### Launch WifiSniffer

* From Desktop: 
	* Double click WifiSniffer Icon on the Desktop

* From Terminal: 
	```
	sh /home/telecom/wifisniffer/sniff.sh
	```
Note: If no packets are showing up you may need to reseat the USB NIC and run  

### Add Wifi Color Rules to Wireshark: 
* View > Color Rules > Import
	* Navigate to wifisniffer > colorfilters.txt
	* Click Open
	* Click Ok

### Select the Wifi Channel you want to Sniff
* View > Wireless Toolbar
	* Select the Channel you want to Sniff.
	* May need to get this from Spectrum Analyzer of known APs in the area or your wireless controller. 
	
### Start Capture
* Capture > Options > Select your Wireless Interface from ifconfig output above. 

#### Capture Filter for Known MAC:
```
(wlan.sa == 14:9d:11:22:33:44) || (wlan.da == 14:9d:11:22:33:44)
```

### Notes: 
* You can use iwconfig to make sure wireless NIC is showing up and in monitor mode after launching. 



