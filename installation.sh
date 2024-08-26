#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
  echo "you need to be root user to excuite this script"

fi

yum update -y
if [ $? -ne 0 ]
then
  echo "updating yum is faliure"
else 
  echo "updating yum is success"
fi

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo

if [ $? -ne 0 ]
then
  echo "adding jenkins repo failure"
else
  echo "adding jenkins repo success"
fi

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

if [ $? -ne 0 ]
then
  echo "importing jenkins key is failure"
else
  echo "mporting jenkins key is success"
fi

yum upgrade

if [ $? -ne 0 ]
then
  echo "update is failure"
else
  echo "update is success"
fi

dnf install java-11-openjdk-devel

if [ $? -ne 0 ]
then 
  echo "installation java 11 is failure"
else
  echo "installation java 11 is success"
fi

dnf install jenkins
if [ $? -ne 0 ]
then
  echo "install jenkins is faliure"
else
  echo "install jenkins is success"
fi

systemctl enable jenkins

if [ $? -ne 0 ]
then 
  echo "enable jenkns is falilure"
else
  echo "enable jenkins is sucsess"
fi

systemctl start jenkins
if [ $? -ne 0 ]
then 
  echo "start jenkins is failure"
else
  echo "start jenkins is success"
fi

