#!/bin/bash

echo "All arguments passwd to a script: $@"
echo "Number of arguments passwd to a script: $#"
echo "Script Name: $0"
echo "Present which directory you are in: $PWD"
echo "Who is running the script: $USER"
echo "Home Directory of the user: $Home"
echo "PID of the Script: $$"
sleep 30 &
echo "Background process id: $!"