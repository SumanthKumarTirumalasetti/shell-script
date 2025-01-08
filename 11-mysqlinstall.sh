#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You are not a admin user and you must have admin access to run the program"
    exit 2
fi

echo $?

echo "Installing mysql-server"