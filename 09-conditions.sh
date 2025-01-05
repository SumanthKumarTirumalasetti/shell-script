#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 100 ]
then
    echo "Printing Number : $NUMBER"

else
    echo "Number is graterthen 100"

fi


if [ find . -type f -name '*.sh' > /dev/null]
then
    echo "File exists"
else
    echo "File not exists"
fi
