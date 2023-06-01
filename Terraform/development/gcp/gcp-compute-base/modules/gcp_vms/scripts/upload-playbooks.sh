#! /bin/bash
#cd to outside of playbook directory
address="34.27.41.182"
scp -r ../playbooks/ skylarhoughton1996@$address:~/

ssh skylarhoughton1996@$address "sudo cp -r /home/skylarhoughton1996/playbooks/ /etc/ansible"