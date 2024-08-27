#!/bn/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
  if [ $USERID -ne 0 ]
  then
       echo "please run this script with root user priveleges"
       exit 1
  fi
}

VALIDATE(){
  if [ $? -ne 0 ]
  then
      echo -e "$2 is ...$R failure $N"
      exit 1
  else
      echo -e "$2 is ... $G success $N"
  fi
}

CHECK_ROOT

dnf install git -y
if [ $? -ne 0 ]
then 
    echo "git is not installed installed . going to install git"
    dnf install git -y
    VALIDATE $? "install GIT"
else
   echo "git is already installed . nothing to do"
fi

dnf install mysql -y
if [ $? -ne 0 ]
then
  echo "mysql is not installed . going to install mysql"
  dnf install mysql -y
  VALIDATE $? "install MYSQL"
else
   echo "mysql already installed nothing to do"
fi

dhf install nginx -y
if [ $? -ne 0 ]
then 
   echo "nginx is not installed . going to install nginx"
   dnf install nginx -y
   VALIDATE $? "install NGINX "
else
   echo "nginx already installed. nothing to do"
fi

