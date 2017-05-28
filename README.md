SFTP watcher
============

*tested on Ubuntu14 & RedHat7 systems
also should work on Debian8, Ubuntu16, Centos7


# To start, run:

```sh
$ git clone https://github.com/karabasss/sftp_docker.git
$ cd sftp_docker
$ ./start.sh
```


Script supports only yum and apt systems.

You must have sudo rights and git installed (and possibly it's also needed to add epel repository (for Centos) and yum/apt update if system is brend new).

SFTP port = 2222

username = impraise

password = impraise

upload dir = /opt/upload




# Logic is as follows:

 > start.sh: 
   - installs python-pip
   - installs ansible
   - runs ansible-playbook "docker.yml"
 > ansible: 
   - installs wget
   - installs docker (starts and enables it)
   - installs docker-py
   - creates upload dir
   - runs docker container with SFTP
   - removes old listener container (if exists)
   - builds listener container with dockerfile "listener.df" with listener.py script which does the job
 > start.sh: 
   - runs listener container
