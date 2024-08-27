#!/bn/bash

USERID=$(id -u)

CHECK_ROOT(){
  if [ $USERID -ne o ]
  then
       echo "please run this script with root user priveleges"
       exit 1
  fi
}

VALIDATE(){
  if [ $? -ne 0 ]
  then
      echo "$2 is ... failure"
  else
      echo "$2 is ... success"
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

