#!/bin/bash
read Number
if [ $Number -lt 20 ]; then 
    echo "$Number is less than 20"
elif [ $Number -eq 20 ]; then
    echo "$Number is equal to 20"
else
    echo "$Number is greater than 20"
fi