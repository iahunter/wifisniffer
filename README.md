# Create new VM in Virtualbox

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

# Install
* Install Ubuntu Desktop 18.04 with telecom user as an example. 

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
sudo apt install git
```

## Clone Repo to Home Directory of User "telecom"
```
git clone https://github.com/iahunter/wifisniffer.git /home/telecom/wifisniffer
```

## Change Permissions
```
chmod 755 /home/telecom/wifisniffer
```

## Run Installation
```
sh /home/telecom/wifisniffer/install.sh
```

## Using the Tools

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

