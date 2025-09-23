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

dnf install nginx -y

if [ $? -eq 0 ]; then
    echo "nginx installation is successful"
else
    echo "Error: nginx installation is unsuccessful"
    exit 1
fi

dnf install python3 -y

if [ $? -eq 0 ]; then
    echo "python3 installation is successful"
else
    echo "Error: python3 installation is unsuccessful"
    exit 1
fi