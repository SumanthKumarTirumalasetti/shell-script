#!/bin/bash

# -gt , -lt , -ge , -le

NUMBER=$1

if [ $NUMBER -gt 100 ]
then
    echo "Given number is graterthan 100"
else
    echo "Given number is lessthan or equal to 100"
fi

