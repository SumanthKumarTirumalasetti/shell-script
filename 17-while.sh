#!/bin/bash

# while read -r line
# do
#     echo $line
# done < 16-delete-old-logs.sh

SOURCE_DIR="/home/ec2-user/"
DEST_DIR="/home/ec2-user/app-logs"

TOTAL_FILES=$(find $SOURCE_DIR \( -name "*.log" -o -name "*.js" -o -name "*.java" \) -mtime +14)

while read -r file
do
    echo "Moving $file to $DEST_DIR"
    mv $TOTAL_FILES $DEST_DIR
done <<< $TOTAL_FILES