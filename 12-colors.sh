#!/bin/bash

USERID=($id -u)

#Colour codes

R="\e[31m"
G="\e[32m"
Y="\e[33m"

validate() {

    if [$1 -ne 0]
    then
        echo -e "$2 ... $R Failure"
    else
        echo -e "$2 ... $G Success"
    fi
}

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: You must have sudo access to execute this script"
    exit 1 # otherthan 0
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    validate $? "Installing MySql"
else
    echo -e "MySQL is already ... $Y installed"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    validate $? "Installing GIT"
else
    echo -e "Git is already ... $Y Installed"
fi