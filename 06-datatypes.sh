#!/bin/bash

VALUE1=$1
VALUE2=$2

TIMESTAMP=$(date)

echo "Script executed at $TIMESTAMP"

TOTAL=($VALUE1+$VALUE2)

echo "Total value is $TOTAL"