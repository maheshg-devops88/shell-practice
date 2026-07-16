#!/bin/bash

Num=$1

if [ $Num -gt 20 ]; then

    echo "$Num is greater than 20"

elif [ $Num -eq 20 ]; then
    
    echo "$Num is equal to 20"
else
   
    echo "$Num is less than 20"

fi