# Install
Install Ubuntu Desktop 18.04 with telecom user as an example.

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

### Using the Tools

```
To Sniff you must install your USB NIC into the laptop and make sure that the VM has access to it under VirtualBox > VM > Settings > USB > USB Device Filters. Add the USB Adapter and click ok. 

Edit the sniff.sh script in /home/telecom/wifisniffer/sniff.sh
	* Make sure the Network Adapter name matches the one you have inserted in USB. 
		* ifconfig - get the usb wireless adapter name
		* nano /home/telecom/wifisniffer/sniff.sh - replace the adapter variable with your USB Wifi Adapter name

Launch Wireshark
	* From Terminal: 
		 sh /home/telecom/wifisniffer/sniff.sh

	Note: If no packets are showing up you may need to reseat the USB NIC and run the script again. Or just try to run the script again. 

```
