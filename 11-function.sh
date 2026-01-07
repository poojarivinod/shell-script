#!/bin/bash

USERID=$( id -u)

VALIDATE(){
     if [ $1 -ne 0 ]
 then
    echo "$2 .....FAILURE"
    exit 2
 else
    echo "$2 ....SUCCESS"
 fi
}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to execute this script"
    exit 1 # other than 0
fi

dnf list installed mysqlff
    if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "INSTALLING MYSQL"
else
    echo " mysql is already installed " 
fi

dnf list installed git
    if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "INSTALLING Git"
else 
    echo  " git is already installed "
fi