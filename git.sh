#!/bin/bash

USERID=$(id -u)
if [ $? -ne 0 ]
then
  echo "you need to root user excuit the script"
fi

if [ $? -ne 0 ]
then 
  echo "git is not installed ; then install git"
  dnf install git -y
  if [ $? -ne 0 ]
  then 
    echo "git installation failure ... please check it"
    exit 1
  else 
    echo "git installation success"
  fi
else 
   echo "git is already installed ; nothing to do "
fi

if [ $? -ne 0 ]
then 
  echo "mysql not install ; then install mysql"
  dnf install mysql -y
  if [ $? -ne 0 ]
  then
    echo "mysql installation is failure .. please check it"
    exit 1
  else 
    echo "mysql installation success"
  fi

else 
  echo "mysql already install ; nthing to do"
fi  

