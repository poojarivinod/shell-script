#!/bin/bash

SOURCE_DIR="/home/ec2-user/app-log" #/home/ec2-user/app-log

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*log" -mtime +14)
echo "files to be deleted: $FILES_TO_DELETE"

while read -r file
do 
   echo "deleting file $file" #here file is variable, we give any name;
   rm -rf $file
   echo "deleted file $file"
done <<< $FILES_TO_DELETE