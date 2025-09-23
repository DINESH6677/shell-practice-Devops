#!/bin/bash.sh
USER= id -u

if [ $USER -ne 0]; then
    echo "please run the script with root privileges";
else
    echo "User is root "
fi

dnf install mysql -y


if [ $? -eq 0 ]; then
    echo "Mysql installation is successful"
else
    echo "Mysql installation is unsuccessful"