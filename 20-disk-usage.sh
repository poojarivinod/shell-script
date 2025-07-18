#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5     #in real project it is 80%

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}')
    PARTITION=$(echo $line | awk -F " " '{PRINT $7F}')
    echo "Partition: $PARTITION , Usage: $USAGE"
done <<< $DISK_USAGE  