#!/bin/bash

USREID=$(id -u)
DATE=$(date +%F)
log="mysql-${DATE}.log"

R="\u001b[41m"
G="\u001b[42m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then 
       echo "$2 is ....$R failure $N"
       exit 1
    else 
      echo "$2 is .....$G success $N"
    fi
}
VALIDATE $? "install git"
 dnf install git -y &>>LOG

VALIDATE $? "install mysql"

 dnf install mysql -y &>>LOG