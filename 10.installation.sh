#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "please run the script with root privileges"
    exit 1
fi

dnf install mysql -y


if [ $? -eq 0 ]; then
    echo "Mysql installation is successful"
else
    echo "Error: Mysql installation is unsuccessful"
    exit 1
fi