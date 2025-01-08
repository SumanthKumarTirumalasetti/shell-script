#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "You are not a admin user and you must have admin access to run the program"
    exit 1
fi

echo "Installing mysql-server"
#dnf install mysql-server -y

if [ $? -eq 0 ]
then
    echo "MySql server installation completed successfully"
else
    echo "MySql server installation failed"
fi

echo "Starting mysql-server"
systemctl start mysqld

if [ $? -eq 0 ]
then
    echo "MySql service has been started successfully"
else
    echo "MySql service has not been started successfully"
fi

echo "enabling mysql-server"
systemctl enable mysqld

if [ $? -eq 0 ]
then
    echo "MySql server has been enabled successfully"
else
    echo "MySql server has not been enabled"
fi

