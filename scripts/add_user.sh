#!/bin/bash
root_group=$(groups | grep root)
if [ $root_group == root ]; then
   read -p "Enter username: " username
   read -s -p "Enter password: " password
   useradd $username
   echo $username:$password | chpasswd
   usermod -a -G root $username
   echo "Congratulation, u create user $username"
else
   echo "Error, you have not permissions"
fi
