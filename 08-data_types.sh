#!/bin/bash

NUM1=10
NUM2=Mahesh

SUM=$((NUM1+NUM2))

echo "SUM is : $SUM"

CARS=("Thar" "Seltos" "Gimny")  #This is an array 

echo "Cars are : ${CARS[@]}"
echo "First car is : ${CARS[0]}"
echo "First car is : ${CARS[1]}"
echo "First car is : ${CARS[2]}"