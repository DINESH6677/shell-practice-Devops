#!/bin/bash
USER=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"

if [ $USER -ne 0 ]; then
    echo -e " $R please run the script with root privileges $N"
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]; then
        echo -e "$2 installation is $G successful $N"
    else
        echo -e "$R Error $N $2 installation is $R unsuccessful $N"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MYsql"
else
    echo -e " $W Mysql is already installed so....$N $Y skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e " $W Nginx is already installed so....$N $Y skipping $N"
fi

dnf list installed python3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo -e " $W Python3 is already installed so....$N $Y skipping $N"
fi