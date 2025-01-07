#!/bin/bash

CHECKUSERID=$(id -u)

echo "$CHECKUSERID"

if [ $CHECKUSERID -eq 0 ]
then
    echo "Current user is root user and the id is : $CHECKUSERID"
    echo "Installing MYSQL Server"
    dnf install mysql-server -y
else
    echo "Switching user to root and installing MySql Server"
    sudo dnf install mysql-server -y
fi

#dnf install mysql-server -y