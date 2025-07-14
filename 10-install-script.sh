#!/bin/bash

USERID=$( id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR:: you must have sudo access to execute this script"
exit 1 # other than 0
fi

dnf install mysqllshh -y

if [ $? -ne 0 ]
then
echo "installing mysql .....FAILURE"
exit 2
else
echo "installing mysql ....SUCCESS"
fi

dnf install git -y

if [ $? -ne 0]
then
echo "installing git .....FAILURE"
exit 3
else
echo "installing git ....SUCCESS"
fi