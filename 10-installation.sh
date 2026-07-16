#!/bin/bash


dnf install nginx -y


if [ $? -eq 0 ]; then
  
   echo "nginx installation is success"
else
   echo "nginx installation is failure"
fi  