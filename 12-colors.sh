#!/bin/bash

USERID=$( id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" #it has to given, other wise previous mentioned color will continue 

VALIDATE(){
     if [ $1 -ne 0 ]
 then
    echo -e "$2 .....$R FAILURE $N"
    exit 2
 else
    echo -e "$2 ....$G SUCCESS $N"
 fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1 # other than 0
fi

dnf list installed mysql
    if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "INSTALLING MYSQL"
else
    echo -e " mysql is already .....$Y installed $N" 
fi

dnf list installed git
    if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "INSTALLING Git"
else 
    echo  -e " git is already .....$Y installed  $N"
fi