#!/bin/bash
USER=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"
LOGS_Folder="/var/log/shell-script-practice"
script_name=$( echo $0 | cut -d "." -f1 )
logs_file="$LOGS_Folder/$script_name.log"
mkdir -p $LOGS_Folder

echo " Script started executing at : $(date)"
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

dnf list installed mysql &>>$logs_file
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$logs_file
    VALIDATE $? "MYsql"
else
    echo -e " $W Mysql is already installed so....$N $Y skipping $N"
fi

dnf list installed nginx &>>$logs_file
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$logs_file
    VALIDATE $? "Nginx"
else
    echo -e " $W Nginx is already installed so....$N $Y skipping $N"
fi

dnf list installed python3 &>>$logs_file
if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$logs_file
    VALIDATE $? "Python3"
else
    echo -e " $W Python3 is already installed so....$N $Y skipping $N"
fi