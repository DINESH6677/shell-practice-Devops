#!/bin/bash
USER=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[37m"
LOGS_Folder="/var/log/shell-script-practice"
script_name=$( echo $0 | cut -d "." -f1 )
logs_file="$LOGS_Folder/$script_name.log"
mkdir -p $LOGS_Folder

echo " Script started executing at : $(date)" | tee -a $logs_file
if [ $USER -ne 0 ]; then
    echo -e " $R please run the script with root privileges $N"
    exit 1
fi
VALIDATE(){
    if [ $1 -eq 0 ]; then
        echo -e "$2 installation is $G successful $N" | tee -a $logs_file
    else
        echo -e "$R Error $N $2 installation is $R unsuccessful $N" | tee -a $logs_file
        exit 1
    fi
}

for package in $@
do
    dnf list installed $package &>>logs_file
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>logs_file
        VALIDATE $? $package
    else
        echo -e " $W $package is already installed so .....$N $Y skipping $N"
    fi
done