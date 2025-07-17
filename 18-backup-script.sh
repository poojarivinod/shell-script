#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is not providing number of days, we are taking 14 days as default;

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" #it has to give, other wise previous mentioned color will contine 

LOG_FOLDER="/home/ec2-user/shell-scrip-log"  
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H:%M:%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

USAGE(){
   echo -e "$R ERROR:: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"
   exit 1
}

if [ $# -lt 2 ]
    then 
         USAGE
fi         

if [ ! -d $SOURCE_DIR ]
then
     echo -e " $SOURCE_DIR Does not exist ......please check"
     exit 1
fi

if [ ! -d $DEST_DIR ]
then
     echo -e " $DEST_DIR Does not exist ......please check"
     exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)
echo "files are:: $FILES"

mkdir -p /home/ec2-user/shell-scrip-log
echo "script started executing at: $TIMESTAMP" &>> $LOG_FILE_NAME