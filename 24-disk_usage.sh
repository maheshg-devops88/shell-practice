#!/bin/bash

user_id=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

LOGS_FOLDER=/var/logs/shell-script
LOGS_FILE=/var/logs/shell-script/$(basename $0).log

if [ $user_id -ne 0 ]; then
   echo -e "Please execute the script with sudo or root access" 
   exit 1
fi

mkdir -p $LOGS_FOLDER

usage=$(df -h | grep -v Filesystem | awk -F" " '{print $1,$5}'| tr -d % )

Threshold=30

echo $usage

for fileystem in $usage; do
   if [ $5 -gt $Threshold ]; then
       {
          echo "Disk Utilization is greater than $Threshold: $1,$5"
          exit 1
       }
   fi
done