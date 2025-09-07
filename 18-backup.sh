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
    if [ $? -ne 0]
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

FILES=$(find $SOURCE_DIR -name "*.log" -mtime $DAYS)
echo $FILES

