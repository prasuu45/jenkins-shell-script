#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0]
then
  echo "you need to be root user to excuite this script"

fi

yum update -y
if [$? -ne 0]
then
  echo "updating yum is faliure"
else 
  echo "updating yum is success"
fi

wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

fi [$? -ne 0]
then
  echo "adding jenkins repo failure"
else
  echo "adding jenkins repo success"
fi

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
fi [$? -ne 0]
then
  echo "importing jenkins key is failure"
else
  echo "mporting jenkins key is success"
fi

yum upgrade
fi [$? -ne 0]
then
  echo "update is failure"
else
  echo "update is success"
fi

dnf install java-17-amazon-corretto -y

if [$? -ne 0]
then 
  echo "installation java 17 is failure"
else
  echo "installation java 17 is success"
fi