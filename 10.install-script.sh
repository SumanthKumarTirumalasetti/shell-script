#!/bin/bash

CHECKUSERID=$(id -u)

echo "$CHECKUSERID"

if [ $CHECKUSERID -ne 0 ]
then
    sudo su
    echo "$(id)"
fi

#dnf install mysql-server -y