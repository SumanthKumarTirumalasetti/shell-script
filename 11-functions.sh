#!/bin/bash

# Check whether the user is root user or not

USERID=$(id -u)


validate(){

    if [ $1 -ne 0 ]
    then
        echo "Installing $2 ... FAILURE"
        exit 1
    else
        echo "Installing $2 ... SUCCESS"
    fi

}

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 # other than 0 to break the flow
fi

# Check whether mysql is installed or not

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    validate $? "Mysql"
else
    echo "MySQL is already ... INSTALLED"    
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    validate $? "Git"
else
    echo "Git is already ... INSTALLED"
fi      