#!/bin/bash

user_id=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

LOGS_FOLDER=/var/logs/shell-script
LOGS_FILE=/var/logs/shell-script/$0.logs



OLD_FILES_To_DELETE=$(find /home/ec2-user/app-logs -type f -mtime +14)



if [ -z "$OLD_FILES_To_DELETE" ]; then
    
    echo "No files older than 14 days"
else 
    while IFS= read -r FILE; do
         echo "OLD_Files: $FILE"
    echo "Deleting Old File: $FILE"
    rm -rf $File
    echo "Deleted old File: $FILE"
    done <<< "$OLD_FILES_To_DELETE"
fi