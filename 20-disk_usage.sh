#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5     #in real project it is 80%

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    #echo "Partition: $PARTITION , Usage: $USAGE"
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High Disk Usage on partition: $PARTITION Usage is $USAGE \n" # + is given because to append the message otherwise print the single message by replacing previous message
    fi #\n provides new line, otherwise output gives in single line
done <<< $DISK_USAGE  

echo -e "Message: $MSG" # to run \n we should give the -e

echo "$MSG" | mutt -s "High Disk Usage" vinod07081@gmail.com