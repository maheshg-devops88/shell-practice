#!/bin/bash

user_id=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"

LOGS_FOLDER=/var/logs/shell-script
LOGS_FILE=/var/logs/shell-script/$(basename $0).log
SRC_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

if [ $user_id -ne 0 ]; then
   echo -e "Please execute the script with sudo or root access" 
   exit 1
fi

mkdir -p $LOGS_FOLDER

USAGE() {
    echo -e "$Y Please provide ### sh backup.sh SRC_DIR DEST_DIR NO_OF_DAYS ##### $N"  | tee -a $LOGS_FILE
    exit 1
}

log() {
    echo  "$(date "+%Y-%m-%d %H:%M:%S") | $1"
}



if [ $# -lt 2 ]; then
   USAGE
fi

if [ ! -d $DEST_DIR ]; then 
   echo -e "$Y No Dest_DIR in place $N" | tee -a $LOGS_FILE
   exit 1
fi

if [ ! -d $SRC_DIR ]; then
   echo -e "$Y No SOURCE_DIR in place $N" | tee -a $LOGS_FILE
   exit 1
fi 

FILES=$(find $SRC_DIR -type f -name *.log -mtime +$DAYS)

log "Backup Started"
log "Source Directory: $SRC_DIR"
log "Destination Directory: $DEST_DIR"


if [ -z "$FILES" ]; then
   echo -e "$Y No files to archive $N " | tee -a $LOGS_FILE
   else
   echo -e "$G Files to be Archived:: $N $FILES" | tee -a $LOGS_FILE

fi 
