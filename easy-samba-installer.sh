#!/bin/bash
# Nelson Tovar simple script :D

echo "1) Install Packets"
sudo apt-get update; sudo apt-get upgrade; sudo apt-get install samba smbclient vim nano -y
sudo mkdir -p /svr/samba/{Public,Private}

echo "2) Creating an username, group, and setting prmissions"
sudo addgroup smbgroup
echo "Write the username of samba admin"; read USER
sudo useradd -s /usr/sbin/nologin $USER
sudo smbpasswd -a $USER
sudo usermod -aG smbgroup $USER
sudo chown -R $USER:smbgroup /svr/samba/
sudo chmod g+w /svr/samba/
sudo chmod o+rwx /svr/samba/Public

echo "3) Set access to folders"
echo "[Public]
   comment = Public share 
   path = /svr/samba/Public
   guest ok = yes
   browseable = yes
   create mask = 755
   read only = no
   writeable = yes" | sudo tee -a /etc/samba/smb.conf

echo "[Private]
   comment = My private Share
   path = /svr/samba/Private
   browseable = yes
   read only = no 
   #valid users = $USER
   guest ok = no " | sudo tee -a /etc/samba/smb.conf

sudo service smbd restart
sudo service nmbd restart
sudo systemctl enable smbd.service
sudo systemctl enable nmbd.service
echo "Installation finished! Horray! :D"
echo "If you are in the same LAN/Network Segment, you should be able to see your shared folders by typing the PrivateIP of THIS computer on another PC"
echo "Ex. Suppose your private IP is 192.168.1.8, in windows explorer you should open \\192.168.1.8"
echo "Don't forget to login using the user and password you just created"
