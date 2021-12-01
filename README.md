
  
    
# TyR ## Description: Android Recon & Research Tools    
 ### Author: Jonathan Scott @jonathandata1    
 ## CURRENT VERSION 1.2

> 0. Samsung Identification - AT Commands - Linux  
> 1. Samsung Identification - AT Commands - MacOS  
> 2. Pull All System APKs & Unpack Them - All Androids  
> 3. Select & Download Any APK & Unpack It - All Androids  
> 4. LG Identification - AT Commands - COMING SOON  
> 5. Dump Secret Codes - All Androids  
> 6. Run Secret Codes (Manual Selection) - All Androids - COMING SOON  
> 7. Bug Report Dump - All Androids - COMING SOON  
> 8. View Bug Report Data In GUI - All Androids - COMING SOON  
> 9. Instant Factory Reset - Samsung Devices - Linux  
> 10. Instant Factory Reset - Samsung Devices - MacOS  
> 11. Instant Factory Reset - LG Devices - Linux  
> 12. Instant Factory Reset - LG Devices - MacOS  
> 13. Auto Enable ADB - Samsung - MacOS  
> 14. Auto Enable ADB - Samsung - Linux
    
![TyR Android Recon & Research Tools](https://i.postimg.cc/Ls7D9tGf/Untitled-design-Max-Quality-2021-11-30-T192018-583.jpg)    
    
![TyR Android Recon & Research Tools](https://i.postimg.cc/N0PJyq2K/Samsung-Device-ID-AT-Commands.gif)    
  
# NOTE :  
## Auto-Enable ADB Functionality Limited To The Following Devices  
### More To Come  
  
- Samsung Galaxy S3 - Verizon/Unlocked  
- Samsung Galaxy S4 - Verizon/Unlocked  
- Samsung Galaxy S5 /S5 Active - Verizon/Unlocked  
- Samsung Galaxy S6/S6 Edge +/S6 Active - Verizon/Unlocked  
- Samsung Galaxy S7 - Verizon/Unlocked  
- Samsung Galaxy S8/S8+/S8+ Active - Verizon/Unlocked  
- Samsung Galaxy S9/S9+ - Verizon/Unlocked  
- Samsung Galaxy S10/10+ - Verizon/Unlocked  
- Samsung Galaxy Note 4 - Verizon/Unlocked  
- Samsung Galaxy Note 5 - Verizon/Unlocked  
- Samsung Galaxy Note 8 - Verizon/Unlocked  
- Samsung Galaxy Note 10 - Verizon/Unlocked  
  
    
## Dependencies    
  ####  If you are on on a MacOS you will need to install brew package manager    
 ``` /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"```    
    
 ## MacOS & Linux    
####  For a nice selection tool for the single apk download you will need to install peco   
  ``` brew install peco ```      
 ``` sudo apt install peco  ```    
 ## To unpack the android apks you will need to install apk tool    
    
 ``` brew install apktool ```    
 ``` sudo apt install apktool ```    
 ##  ADB (Android Debug Bridge) must be installed   
       
 ``` brew install android-platform-tools ```       
 ``` sudo apt install android-tools-adb ```    
 ##  UUIDGEN  
  ``` sudo apt install uuidgen ```   
## SoCat  
  
  ``` brew install socat ```    
``` sudo apt install socat ```   
  
## Pip for Python 2  
  `wget https://bootstrap.pypa.io/pip/2.7/get-pip.py` `python2 get-pip.py`  
`pip2 install python-gsmmodem`  
`pip3 install pyserial`  
`rm -f get-pip.py`  
`sudo reboot`  
  
## LG Modem Drivers  
- MacOS Drivers Folder is in this repo or download from the link below  
- Source: LG Universal Mobile Drivers  
- https://www.lg.com/us/support/software-firmware-drivers  
- Linux Does Not Require LG Drivers