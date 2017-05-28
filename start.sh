#!/bin/bash

YUM_CMD=$(which yum)
APT_CMD=$(which apt)

if [[ ! -z $YUM_CMD ]]; then
     sudo yum update -y
     sudo yum install -y epel-release
     sudo yum install -y python-pip gcc libffi-devel python-devel openssl-devel
elif [[ ! -z $APT_CMD ]]; then
     sudo apt update -y
     sudo apt install -y python-pip build-essential libssl-dev libffi-dev python-dev  

else
    echo "error, script supports only yum and apt"
    exit 1;
fi

sudo pip install --upgrade pip
sudo pip install cryptography
sudo pip install markupsafe
sudo pip install ansible
ansible-playbook docker.yml

docker run -v /opt/upload:/opt/upload -it listener:latest
