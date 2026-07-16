#!/bin/bash

Userid=$(id -u)

if [ $Userid -gt 0 ]; then
   echo "Run the script with sudo permissions"
   exit 1
fi


dnf install nginx -y


if [ $? -eq 0 ]; then
  
   echo "nginx installation is success"
else
   echo "nginx installation is failure"
fi  