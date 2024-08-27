#!/bin/bash

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOG_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
       echo -e "$R please run tins scriipt in root user $N" | tee -a $LOG_FILE
       exit 1
    fi
    
}

VALIDATE (){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is $R failure $N" | tee -a $LOG_FILE
      exit 1
    else 
       echo -e "$2 is $G success $N" | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE :: $N sudo loop.sh package1 package2.. "
    exit 1
}


echo "script started excuiting at: $date" | tee -a $LOG_FILE

CHECK_ROOT

do 
 dnf install $package &>>$LOG_FILE
   if [ $? -ne 0 ]
   then
     echo "$package is not installed ; then install it"
     dnf install $package -y
     VALIDATE $? "INSTALLIING $package"
    
    else
      echo -e "$package is already $Y installed ; nothing to do it $N" | tee -a $LOG_FILE
    fi
done 
   
