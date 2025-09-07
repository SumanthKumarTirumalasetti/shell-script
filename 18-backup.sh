#!/bin/bash

# Colour coding

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


# SOURCE_DIRECTORY="/home/ec2-user/app-logs"
# DESTINATION_DIRECTORY="/home/ec2-user/archive-logs"
# DAYS=${3:-14}

SOURCE_DIRECTORY=$1
DESTINATION_DIRECTORY=$2
DAYS=${3:-14}

LOGS_FOLDER="/home/ec2-user/shell-scriptlogs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIME_STAMP.log"


validate(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

usage(){
    echo -e "$R USAGE:: $N backup <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1        
}

mkdir -p "/home/ec2-user/shell-scriptlogs"
# mkdir -p $1
# mkdir -p $2


if [ $# -lt 2 ]
then
    usage
fi

if [ ! -d $SOURCE_DIRECTORY ]
then
    echo -e "$SOURCE_DIRECTORY $R does not exists $N ... Please check"
    exit 1
fi

if [ ! -d $DESTINATION_DIRECTORY ]
then
     echo -e "$DESTINATION_DIRECTORY $R does not exists $N ... Please check"
     exit 1
fi


dnf list installed zip &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install zip -y &>>$LOG_FILE_NAME
    validate $? "ZIP installation"
else
    echo "ZIP has already been installed"
fi

FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +$DAYS)
# echo "$FILES"

if [ -n "$FILES" ]
then
    echo "$FILES"
    ZIP_FILE="$DESTINATION_DIRECTORY/app-log-$TIME_STAMP.zip"
    find $SOURCE_DIRECTORY -name "*.log" -mtime +$DAYS | zip -@ $ZIP_FILE
    echo "$ZIP_FILE"
    if [ -f $ZIP_FILE ]
    then
        echo "ZIP file is successfully created"
        while read -r filepath
        do
            echo $filepath
            rm -rf $filepath
            echo "Deleted files $filepath"
        done <<< $FILES
    else
        echo "ZIP file creation failed"
    fi
else
    echo "No files to zip"
fi

# File Test Operators
# Operator	Description
# -e	File exists (any type)
# -f	File exists and is a regular file
# -d	File exists and is a directory
# -s	File exists and is not empty
# -r	File is readable
# -w	File is writable
# -x	File is executable
# -L	File is a symbolic link
# -b	File is a block device
# -c	File is a character device
# -p	File is a named pipe (FIFO)
# -S	File is a socket
# -t	File descriptor is open and refers to a terminal
# 🔤 String Test Operators
# Operator	Description
# -z	String is empty
# -n	String is not empty
# =	Strings are equal
# !=	Strings are not equal
# <	String1 is less than String2 (lexicographically)
# >	String1 is greater than String2 (lexicographically)
# Note: < and > must be escaped or used inside [[ ... ]] to avoid shell interpretation.

# 🔢 Integer Comparison Operators
# Operator	Description
# -eq	Equal (==)
# -ne	Not equal (!=)
# -gt	Greater than (>)
# -lt	Less than (<)
# -ge	Greater than or equal (>=)
# -le	Less than or equal (<=)