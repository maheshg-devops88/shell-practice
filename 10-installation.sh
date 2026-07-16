#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]; then
   echo "Run the script with sudo permissions"
   exit 1
fi


echo "installing nginx"
dnf install nginx -y


if [ $? -eq 0 ]; then
  
   echo "nginx installation is success"
else
   echo "nginx installation is failure"
fi  

echo "installing nodejs"
dnf install nodejs -y


if [ $? -eq 0 ]; then
  
   echo "nodejs installation is success"
else
   echo "nodejs installation is failure"
fi  

echo "installing mysql"
dnf install mysql -y


if [ $? -eq 0 ]; then
  
   echo "mysql installation is success"
else
   echo "mysql installation is failure"
fi 