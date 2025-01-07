#!/bin/bash

CHECKUSERID=$(id -u)

echo "$CHECKUSERID"

if [ $CHECKUSERID -ne 0 ]
then
    sudo su
    NEWID=$(id)
    echo "$NEWID"
fi

#dnf install mysql-server -y