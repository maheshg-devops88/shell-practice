#!/bin/bash

user_id=$(id -u)

LOGS_FOLDER=/var/logs/shell-script
LOGS_FILE=/var/logs/shell-script/$0.logs

if [ $user_id -ne 0 ]; then
   echo "Please execute the script with sudo or root access"
   exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE () {
    if [ $1 -ne 0 ]; then
       echo "$2 installation is failure" | tee -a $LOGS_FILE
       exit 1
       else
       echo "$2 installation is success" | tee -a  $LOGS_FILE 
    fi
}

if [ $@ -gt 0 ]; then
   for package in $@ ; do
      dnf install $package -y &>> $LOGS_FILE
      VALIDATE $? "$package"
      done
else 
   echo "Please provide the packages to execute the script"
fi