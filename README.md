# samba-ez-install

For public use  

COPY AND PASTE IN THE UBUNTU/DEBIAN SHELL  
--------------------------------------------------------------------------------------------------------------------------
git clone https://github.com/ntovarsolorzano/samba-ez-install  
cd samba-ez-install   
bash easy-samba-installer.sh  

HOW TO TEST DOING A LOCALTEST  
--------------------------------------------------------------------------------------------------------------------------
smbclient -L localhost  
{Should appear your folders "Public" and "Private" here mentioned.}   

SEE MY FOLDERS FROM ANOTHER COMPUTER
--------------------------------------------------------------------------------------------------------------------------
First, find your private IP on the server, run:  
ifconfig   
Then type that Private IP on any other computer in the File Explorer. If you use windows this should be in the format:   
\\\MY-PRIVATE-IP  

TESTED ON CLEAN INSTALL UBUNTU 20.04 AND DEBIAN 11 SUCCESSFULLY. 
--------------------------------------------------------------------------------------------------------------------------
