#!/bin/bash

CHECKUSERID=$(id -u)

echo "$CHECKUSERID"

if [ $CHECKUSERID -e $CHECKUSERID ]
then
    sudo su
    NEWID=$(id)
    echo "$NEWID"
fi

#dnf install mysql-server -y