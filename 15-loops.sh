#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIME_STAMP.log"


validate() {

    if [ $? -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE $N"
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

remove() {

    if [ $? -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE $N"
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

CHECK_ROOT() {

    if [ $USERID -ne 0 ]
    then
        echo "ERROR:: You must have sudo access to execute this script"
        exit 1
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

CHECK_ROOT

for package in $@
do
    dnf list installed $package &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$LOG_FILE_NAME
        validate $? "Installing $package"
    else
        echo -e "$package is already $Y ... INSTALLED $N"
    fi
done

for package in $1
do
    dnf list installed $package &>>$LOG_FILE_NAME
    if [ $? -eq 0 ]
    then
        dnf remove $package -y &>>$LOG_FILE_NAME
        remove $? "Removing $package"

    else
        echo -e "MySQL is not installed"
    fi
done

