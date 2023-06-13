#! /bin/bash
#Run on all nodes
sudo adduser ansible
sudo usermod -aG wheel ansible
sudo passwd ansible
sudo bash -c "sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && systemctl restart sshd"
sudo systemctl restart sshd

#Run on Control Node
sudo dnf install -y pip sshpass
pip3 install ansible
ssh-keygen

ssh-copy-id ansible@ansible-node1
ssh-copy-id ansible@ansible-node2
