#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]; then
    echo "please run the script with root privileges"
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]; then
        echo "$2 installation is successful"
    else
        echo "Error: $2 installation is unsuccessful"
        exit 1
    fi
}

dnf install mysql -y
VALIDATE $? "MYsql"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "Python3"