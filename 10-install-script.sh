#!/bin/bash

# Check whether the user is root user or not

USERID=$(id -u)

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
    if [ $? -ne 0 ]
    then
        echo "Installing MySQL ... FAILURE"
        exit 1
    else
        echo "Installing MySQL ... SUCCESS"
    fi
else
    echo "MySQL is already ... INSTALLED"    


dnf list installed git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Installing git ... FAILURE"
        exit 1
    else
        echo "Installing git ... SUCCESS"
    fi
else
    echo "git is already ... INSTALLED"   