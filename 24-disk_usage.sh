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



Threshold=30

echo $usage

while read -r filesystem use_percentage; do
 
 if [ $use_percentage -gt $Threshold ];  then
     usage="Disk utilization is greater than Threshold $Threshold : $filesystem $use_percentage%"
     echo "$usage" | tee -a $LOGS_FILE
     message+="$usage"
 fi
done < <(df -h | grep -v Filesystem | awk -F" " '{print $1,$5}'| tr -d %)

echo "....MessageStarts...."

echo -e "$message"$\n

echo "....MessageENDS....."

./mail.sh "mahesh9.storage@gmail.com" "DISK_UTILIZATION_ALERT" "$message"