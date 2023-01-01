## Single Board Computers

ODroid XU4  
RasPi 3B+  
RasPi Zero W  

<br><br>
---  
### To create backups  
https://www.raspberrypi.org/documentation/linux/filesystem/backup.md  
<br>


Get the device name (e.g. /dev/sdb1/)
```bash
sudo fdisk -l
```  
<br>

Next create a copy using dd command and compress - try larger block size 8M or 16M
```bash
sudo dd bs=4M if=/dev/sdb | gzip > /home/your_username/image`date +%d%m%y`.gz
```
<br>

To restore it to a target device
```bash
gzip -dc /home/your_username/image.gz | sudo dd bs=4M of=/dev/sdb
gunzip --stdout /home/your_username/image.gz | sudo dd bs=4M of=/dev/sdb
```
