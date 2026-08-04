#!/bin/bash

user_id=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

LOGS_FOLDER=/var/logs/shell-script
LOGS_FILE=/var/logs/shell-script/$0.logs


FILES=$(find /home/ec2-user/app-logs -type f -mtime +14)

While IFS= read -r line ; do
     echo "OLD_Files: $FILE"
     done < "$FILES"