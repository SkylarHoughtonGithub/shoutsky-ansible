#! /bin/bash
#Run on all nodes
sudo adduser ansible
sudo usermod -aG wheel ansible
sudo passwd ansible
sudo bash -c "sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && systemctl restart sshd"
sudo systemctl restart sshd

#Run on Control Node
sudo su - ansible
sudo dnf install -y pip
pip3 install ansible
ssh-keygen
ssh-copy-id ansible@ansible-node1
ssh-copy-id ansible@ansible-node2
sudo mkdir -p /etc/ansible/inventory
sudo mkdir -p /etc/ansible/playbooks
sudo mkdir -p /etc/ansible/roles
sudo chown -R ansible:ansible /etc/ansible
ansible-config init >> /etc/ansible/ansible.cfg
