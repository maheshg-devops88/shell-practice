#!/bin/bash

Userid=$(id -u)

if [ $Userid -ne 0 ]; then
   echo "Run the script with sudo permissions"
   exit 1
fi

VALIDATE () {
    if [ $1 -ne 0 ]; then
       echo "$2 installation is failure"
       exit 1
       else
       echo "$2 installation is success"
    fi
}


dnf install nginxx -y
VALIDATE $? "nginx"


