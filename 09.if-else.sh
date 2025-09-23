#!/bin/bash

Number=$1
if [ $(($Number%2)) -eq 0 ] ; then
    echo "$Number is Even"
else
    echo "the give $Number is odd"
fi