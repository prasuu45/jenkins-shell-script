#!/bin/bash

USREID=$(id -u)
VALIDATE(){
    if [$1 -ne 0]
    then 
       echo "$2 is .... failure"
       exit 1
    else 
      echo "$2 is .....success"
    fi
}
VALIDATE $? "install git"
 dnf install git -y

VALIDATE $? "install mysql"

 dnf install mysql -y