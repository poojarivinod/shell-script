#!/bin/bash

USERID=$( id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" #it has to give, other wise previous mentioned color will contine 

LOG_FOLDER="/var/log/shell-script.log" # /var/log/shell-script.log 
LOG_FILE=$(echo $0 | cut -d "." -f1) # $0 — Script name(13-logs.sh)
TIMESTAMP=$(date +%Y-%m-%d-%H:%M:%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
     if [ $1 -ne 0 ]
 then
    echo -e "$2 .....$R FAILURE $N"
    exit 2
 else
    echo -e "$2 ....$G SUCCESS $N"
 fi
}

echo "script started executing at: $TIMESTAMP" &>> $LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1 # other than 0
fi

dnf list installed mysql &>>$LOG_FILE_NAME

    if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "INSTALLING MYSQL" &>> $LOG_FILE_NAME

else
    echo -e " mysql is already .....$Y installed $N" 
fi

dnf list installed git &>>$LOG_FILE_NAME

    if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME

    VALIDATE $? "INSTALLING Git"
else 
    echo  -e " git is already .....$Y installed  $N"
fi