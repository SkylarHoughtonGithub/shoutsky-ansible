#! /bin/bash

vagrant ssh <all inventory nodes>

sudo vim /etc/yum.repos.d/redhat.repo
# [base]
# name=Base
# baseurl=http://repo/BaseOS
# gpgcheck=0
# enabled=1

# [apps]
# name=Apps
# baseurl=http://repo/AppStream
# gpgcheck=0
# enabled=1
#
# Across all managed nodes
sudo bash -c "adduser shoughtsky ; usermod -aG wheel shoughtsky"
vagrant ssh repo password | passwd --stdin
vagrant ssh node1 password | passwd --stdin
vagrant ssh node2 password | passwd --stdin
vagrant ssh node3 password | passwd --stdin
vagrant ssh node4 password | passwd --stdin

sudo su - shoughtsky

#On control node
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.55.201
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.55.202
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.55.203
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.55.204
ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.55.199
ansible all -i inventory -u vagrant -b -a "adduser shoughtsky"
ansible all -i inventory -u vagrant -b -a "echo 'password' | passwd shoughtsky --stdin"
ssh-copy-id -i ~/.ssh/id_rsa.pub shoughtsky@192.168.55.201
ssh-copy-id -i ~/.ssh/id_rsa.pub shoughtsky@192.168.55.202
ssh-copy-id -i ~/.ssh/id_rsa.pub shoughtsky@192.168.55.203
ssh-copy-id -i ~/.ssh/id_rsa.pub shoughtsky@192.168.55.204
ssh-copy-id -i ~/.ssh/id_rsa.pub shoughtsky@192.168.55.199

ansible all -i inventory -u vagrant -b -a "nc -zv google.com 443"
# repo.mindshout.com | CHANGED | rc=0 >>
# Connection to google.com (64.233.177.102) 443 port [tcp/https] succeeded!

