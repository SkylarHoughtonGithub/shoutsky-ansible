#! /bin/bash
address="35.224.139.134"
scp -r playbooks/ skylarhoughton1996@$address:~/

ssh skylarhoughton1996@$address "sudo cp -r /home/skylarhoughton1996/playbooks/ /etc/ansible"
ssh skylarhoughton1996@$address "sudo mkdir -p /var/ftp/roles"
ssh skylarhoughton1996@$address "sudo cp -r /home/skylarhoughton1996/playbooks/geerlingguy.haproxy /var/ftp/roles/"
ssh skylarhoughton1996@$address "sudo tar cvf /var/ftp/roles/geerlingguy.haproxy.tar /var/ftp/roles/geerlingguy.haproxy"
