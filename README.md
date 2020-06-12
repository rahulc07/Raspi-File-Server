# Raspi-File-Server
This is a script that allows you to get a File server in ONE COMMAND! Use 

Think the desciption sums it up

# Commands


wget https://raw.githubusercontent.com/xXTeraXx/Raspi-File-Server/master/samba.sh 
 
chmod +x samba.sh

sudo ./samba.sh

# If You Get A Permisson Denied Error

echo chmod 777 /media/Server >> /etc/rc.local && chmod 777 /media/Server
