# Description
These are instructions and scripts to run Wireshark as an Ubuntu VM in Vitrualbox on top of Windows using an external Wireless NIC. 

We have had trouble doing 802.11 plus radiotap packet captures in Microsoft Windows promiscuous mode. This was an attempt to use the same hardware laptop running windows but do the capturing in a Linux VM. 

#### Tested NICs that work on both 2.4GHz and 5GHz: 
* Panda Wireless PAU07


# Installation

Download Oracle Virtualbox and install on your laptop. https://www.virtualbox.org/wiki/Downloads
* Download VBoxGuestAdditions ISO as well for your version. This is later added to Ubuntu VM for copy & paste functionality from Windows to Ubuntu. http://download.virtualbox.org/virtualbox/

Download Ubuntu Desktop ISO from thier website. https://ubuntu.com/download/desktop

## Create new VM in Virtualbox

* Name: WifiSniffer
* Type: Linux
* Version: Ubuntu (64-bit)

* Memory: 8192MB (adjustable based on needs)

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

## Install VirtualBoxGuestAdditions
### In VirtualBox VM Settings
* Storage
	* Controller:IDE
		* Empty: 64 MB
			* Attributes: 64 MB
				* Optical Drive: Click on CD Image and select VBoxGuestAdditions ISO you have downloaded earlier.
				
### In the VM
* Navigate to the CD Image on Ubuntu Desktop
* Click Run Software in top right corner of window. 
* Reboot

### Test copy & paste from Windows to Ubuntu. 
* You should now be able to copy and paste text from Windows to Ubuntu VM. 

# Using the Tools

To Sniff wireless traffic you must insert your USB Wireless NIC into the laptop and make sure that the VM has access to it under VirtualBox > VM > Settings > USB > USB Device Filters. Add the USB Adapter and click ok. 

### Get your Wireless USB NIC Adapter Name

* Get the Network Adapter name of your USB Wireless NIC - Copy the name
```
iwconfig
```

#### Edit Adapter Variable
```
nano /home/telecom/wifisniffer/sniff.sh 
```
* Replace the adapter variable with your USB Wireless NIC name from iwconfig output above.
	```
	ADAPTER="YOUR-NIC-NAME"
	```

### Launch WifiSniffer

* From Desktop: 
	* Double click WifiSniffer Icon on the Desktop
	* Click Approve and Trust if prompted when first running.

* From Terminal: 
	```
	sh /home/telecom/wifisniffer/sniff.sh
	```
Note: If no traffic is showing on the interface you want to sniff, you may need to reseat the USB NIC and run it again.

### Add Wifi Color Rules to Wireshark: 
* View > Color Rules > Import
	* Navigate to wifisniffer > colorfilters.txt
	* Click Open
	* Click Ok

### Select the Wifi Channel you want to Sniff
* View > Wireless Toolbar
	* Select the Channel you want to Sniff.
	* May need to get this from a Spectrum Analyzer of known APs in the area or your wireless controller. 
		* Metageek.com has a lite version of inSSIDer that is free with no license key required. (free account is required)
	
### Start Capture
* Capture > Options > Select your Wireless Interface from iwconfig output above. 

#### Display Filter for Known MAC:
```
wlan.addr == 14:9d:11:22:33:44
```

### Notes: 
* You can use iwconfig to make sure wireless NIC is showing up and in monitor mode after launching. 
* Useful Display Filters can be found in [WiresharkFilters](WiresharkFilters)



