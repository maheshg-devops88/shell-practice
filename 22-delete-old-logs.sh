#!/bin/bash

user_id=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

LOGS_FOLDER=/var/logs/shell-script
LOGS_FILE="$LOGS_FOLDER/$(basename "$0").logs"

if [ $user_id -ne 0 ]; then
   echo -e "$Y Please execute the script with sudo or root access $N" 
   exit 1
fi

mkdir -p $LOGS_FOLDER

OLD_FILES_TO_DELETE=$(find /home/ec2-user/app-logs -type f -mtime +14) 



if [ -z "$OLD_FILES_TO_DELETE" ]; then
    
    echo -e "$R No files older than 14 days $N"
else 
    while IFS= read -r FILE; do
         echo -e "$OLD_FILES: $G $FILE $N"
    echo -e "$Y Deleting Old File $N: $G $FILE $N"
    rm -f "$FILE"
    done <<< "$OLD_FILES_TO_DELETE"
fi