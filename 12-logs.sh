#!/bin/bash

Userid=$(id -u)

LOGS_FOLDER=/var/logs/shell-script
LOGS_FILE=/var/logs/shell-script/$0.logs

if [ $Userid -ne 0 ]; then
   echo "Run the script with sudo permissions"
   exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE () {
    if [ $1 -ne 0 ]; then
       echo "$2 installation is failure" &>> $LOGS_FILE
       exit 1
       else
       echo "$2 installation is success" &>> $LOGS_FILE 
    fi
}


dnf install nginx -y  &>> $LOGS_FILE
VALIDATE $? "nginx"


dnf install mysql -y  &>> $LOGS_FILE
VALIDATE $? "mysql"

dnf install nodejs -y &>> $LOGS_FILE
VALIDATE $? "nodejs"