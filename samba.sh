
#!/bin/bash
echo "Make Sure This Script is running as Sudo"
echo "This is a Easy way to turn Your Raspberry Pi into a File Server"
sleep 1
sudo apt update
sudo apt-get -yy install samba samba-common-bin
echo "What Do You Want The Name Of Your Server To Be"
read servername
echo [$servername] >> /etc/samba/smb.conf
echo path = /media/Server >> /etc/samba/smb.conf
echo writeable=Yes >> /etc/samba/smb.conf
echo create mask=0777 >> /etc/samba/smb.conf
echo directory mask=0777 >> /etc/samba/smb.conf
echo public=yes >> /etc/samba/smb.conf
read -r -p "Are You Using A External Drive [Y/n] " edrive
case $edrive in
    [Yy]|[Yy])
 echo "What Is the UUID (sudo blkid)"
 read driveuuid
 sudo rm /etc/rc.local
 echo #!/bin/sh -e >> /etc/rc.local
 echo mount -U $driveuuid >> /etc/rc.local
 echo exit 0 >> /etc/rc.local
 ;;
    *)
echo "Okay"
 ;;
esac
read -r -p "Do You Want To Make User Accounts [Y/n] " user
case $user in
    [Yy]|Yy])
 read -r -p "What Is The Username" username
 echo "Just put in the Name and Password, After that hit enter for all the other boxes to Skip"
 adduser $username
 echo "Type In Your Password One More Time"
 sudo smbpasswd -a $username
 sleep 2
 echo "All Done"
 echo  "To Log in from Windows type in"
 echo \\$servername
 echo Or \\IP which you will see at the end
 echo "In the address bar of File Explorer"
 echo "For other Platforms search for how to Connect to samba servers"
 echo "Thank You For Using This script"

  *)
 echo "Okay, You will need to use the username pi and the password raspberry unless you set one."
 echo "At any time you can add users by typing in cd /home/pi && sudo ./adduser.sh"
 echo "Thank You For Using This Script"
 sudo /etc/init.d/samba restart
 ifconfig | grep inet
 echo The First One is your Raspis IP.





