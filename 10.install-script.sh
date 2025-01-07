#!/bin/bash

CHECKUSERID=$(id -u)

echo "$CHECKUSERID"

if [ $CHECKUSERID -eq 0 ]
then
    echo "Current user is root user and the id is : $CHECKUSERID"
    echo "Installing MYSQL Server"
    dnf install mysql-server -y > log.txt
else
    echo "Switching user to root and installing MySql Server"
    sudo dnf install mysql-server -y > log.txt
fi

if [ $? -eq 0 ]
then
    echo "Installation completed successfully"
else
    echo "Installation failed with error code: $?"
fi