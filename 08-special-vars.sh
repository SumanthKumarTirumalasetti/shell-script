#!/bin/bash

# special variables

echo "All varibles passed : $@"
echo "Number of variables passed : $#"
echo "Name of the script : $0"
echo "Present working directory : $PWD"
echo "User home directory : $HOME"
echo "which user is running this script : $USER"
echo "Process of current script : $$"
sleep 60 &
echo "Process id of last command in background : $!"