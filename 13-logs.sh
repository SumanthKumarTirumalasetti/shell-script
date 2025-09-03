#!/bin/bash

USERID=$(id -u)

R="\e[32m"
G="\e[33m"
Y="\e[34m"


LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIME_STAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIME_STAMP.log"

validate() {

    if [ $? -ne 0 ]
    then
        echo "$2 ... Failure"
    else
        echo "$2 ... Success"
    fi

}

remove(){

    if [ $? -eq 0 ]
    then
        echo "$2 ... Success"
    else
        echo "$2 ... Failure"
    fi
}

check(){

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1
fi

}

check

echo "Script started executing at: $TIME_STAMP" &>>$LOG_FILE_NAME

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
    validate $? "Installing MySql"
else
    echo -e "MySQL is already ... $Y installed"
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    validate $? "Installing GIT"
else
    echo -e "Git is already ... $Y Installed"
fi

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -eq 0]
then
    dnf remove mysql -y
    remove $? "Uninstall of MySQL is"
else
    echo "MySQL is not installed"
fi