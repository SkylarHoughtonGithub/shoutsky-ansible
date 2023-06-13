#! /bin/bash
address="35.194.31.57"
scp -r ../playbooks/ skylarhoughton1996@$address:~/

ssh skylarhoughton1996@$address "sudo cp -r /home/skylarhoughton1996/playbooks/ /etc/ansible"