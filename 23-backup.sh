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
TIMESTAMP=$(date "+%Y-%m-%d-%H-%M-%S")
ARCHIVE_FILE="$DEST_DIR/backup-$TIMESTAMP.tar.gz"

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
    echo -e "$(date "+%Y-%m-%d-%H-%M-%S") | $1"
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

# log "Backup Started"
# log "Source Directory: $SRC_DIR"
# log "Destination Directory: $DEST_DIR"
# log "Files to be archived older than : $DAYS days" 

if [ -z "$FILES" ]; then
   echo -e "$Y No files to archive $N " | tee -a $LOGS_FILE

else
    log "$G Backup Started $N" | tee -a $LOGS_FILE
    log "$G Source Directory $N: $SRC_DIR" | tee -a $LOGS_FILE
    log "$G Destination Directory $N: $DEST_DIR" | tee -a $LOGS_FILE
    log "$G Files to be archived older than $N : $DAYS days" | tee -a $LOGS_FILE

    echo -e "$G Files to be Archived:: $N $FILES" | tee -a $LOGS_FILE

    find "$SRC_DIR" -type f -name *.log -mtime +"$DAYS" | tar -czvf "$ARCHIVE_FILE" -T -
    if [ $? -eq 0 ]; then
        echo "Archive completed successfully: $ARCHIVE_FILE"

        find "$SRC_DIR" -type f -name *.log -mtime +"$DAYS" -delete
        if [ $? -eq 0 ]; then 
        
           echo "Deleted Archived Files in SRC_DIR" | tee -a $LOGS_FILE
        
        fi
      else
        
        echo "Archive Failed" | tee -a $LOGS_FILE
    fi
fi 
