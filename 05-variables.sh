#!/bin/bash

# Taking user input from argument level from command line 

echo "Please enter PERSON1 USERNAME:"
read -s PERSON1

echo "Please enter PERSON2 USERNAME:"
read -s PERSON2

echo "$PERSON1:: Hi $PERSON2"
echo "${PERSON2}:: Hello $PERSON1"
echo "Sumanth:: How are you doing?"
echo "$PERSON2:: I am good. How are you?"