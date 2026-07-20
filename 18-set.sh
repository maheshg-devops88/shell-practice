#!/bin/bash

user_id=$(id -u)

set -e

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

LOGS_FOLDER=/var/logs/shell-script
LOGS_FILE=/var/logs/shell-script/$0.logs

if [ $user_id -ne 0 ]; then
   echo "Please execute the script with sudo or root access"
   exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE () {
    if [ $1 -ne 0 ]; then
       echo -e "$N $2 installation is $R failure" | tee -a $LOGS_FILE
       exit 1
       else
       echo -e " $N $2 installation is $G success" | tee -a  $LOGS_FILE 
    fi
}

if [ $# -gt 0 ]; then
   for package in $@ ; do
      dnf list installed $package &>> $LOGS_FILE
      if [ $? -eq 0 ]; then
        echo -e "$Y $package is $N aleady installed" | tee -a $LOGS_FILE
     else
        echo -e "Installing.....$Y $package"    
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "$package"
     fi
      done
else 
   echo "Please provide the packages to execute the script"
fi