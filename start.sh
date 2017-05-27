#!/bin/bash

YUM_CMD=$(which yum)
APT_CMD=$(which apt)

if [[ ! -z $YUM_CMD ]]; then
    sudo yum install -y python-pip
elif [[ ! -z $APT_CMD ]]; then
    sudo apt install -y python-pip  

else
    echo "error, script supports only yum and apt"
    exit 1;
fi

#sudo pip install ansible
ansible-playbook docker.yml

