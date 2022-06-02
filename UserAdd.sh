#!/bin/bash
#Paste Username and public ssh key.

echo "Enter Username: "
read username

echo "Enter Public SSH Key: "
read key

#Create user and directory
sudo useradd -m -d /home/$username -s /bin/bash $username

mkdir /home/$username/.ssh

#add the SSH Public Key to .ssh folder
echo "$key" > /home/$username/.ssh/authorized_keys


# make sure only the new user has permissions
chown -R $username:$username /home/$username/.ssh

# make sure only the new user has permissions
chmod 700 /home/$username/.ssh
chmod 600 /home/$username/.ssh/authorized_keys

#add user to the SUDO group
sudo usermod -a -G sudo $username
