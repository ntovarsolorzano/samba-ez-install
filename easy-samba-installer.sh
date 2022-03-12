#!/bin/bash
# Nelson Tovar simple script :D

echo "1) Install Packets"
sudo apt install samba smbclient vim nano -y
sudo mkdir -p /mnt/samba/{Public,Private}

echo "2) Set access to folders"
echo "[Public]
   comment = Publico 
   path = /mnt/samba/Public
   guest ok = yes
   browseable = yes
   create mask = 0600
   read only = yes
   valid users = %U 
   writeable = yes" | sudo tee -a /etc/samba/smb.conf

echo "[Private]
   comment = My private Share
   path = /mnt/samba/Private
   browseable = yes
   read only = no 
   valid users = ntadmin
   write list = @sambaeditors //Will contain the members of a group that will be called 'sambaeditor'
   guest ok = no " | sudo tee -a /etc/samba/smb.conf

echo "3) Creating an username, group, and setting prmissions"
sudo addgroup smbgroup
echo "Write the username of samba admin"
read USER
sudo useradd -s /usr/sbin/nologin $USER
sudo smbpasswd -a $USER
sudo usermod -aG smbgroup $USER
sudo chown root:smbgroup /mnt/samba/
sudo systemctl restart smbd.service
sudo chmod g+w /mnt/samba/
sudo chmod o+wwx /mnt/samba/Public
echo "Installation finished! Horray! :D"
