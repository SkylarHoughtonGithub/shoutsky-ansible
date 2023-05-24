#! /bin/bash
#Run on control node, after managed nodes
sudo adduser ansible
sudo usermod -aG wheel ansible
sudo passwd ansible
sudo bash -c "sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && systemctl restart sshd"

sudo su - ansible

sudo mkdir -p /etc/ansible/inventory
sudo mkdir -p /etc/ansible/playbooks
sudo mkdir -p /etc/ansible/roles
sudo ansible-config init >> /etc/ansible/ansible.cfg

sudo sed -i 's/^inventory*/inventory=/etc/ansible/inventory/hosts' /etc/ansible/ansible.cfg
sudo sed -i 's/^forks*/forks=50' /etc/ansible/ansible.cfg
sudo sed -i 's/^forks*/forks=50' /etc/ansible/ansible.cfg
sudo sed -i 's/^remote_user*/remote_user=ansible' /etc/ansible/ansible.cfg
sudo sed -i 's/^become_user*/become_user=ansible' /etc/ansible/ansible.cfg

sudo touch /etc/ansible/inventory/hosts
sudo echo "[control]" >> /etc/ansible/inventory/hosts
sudo echo "localhost ansible_host=localhost ansible_connection=local" >> /etc/ansible/inventory/hosts
sudo echo " " >> /etc/ansible/inventory/hosts
sudo echo "[node]" >> /etc/ansible/inventory/hosts
sudo secho "0.0.0.0 ansible_host=ansible-node1" >> /etc/ansible/inventory/hosts
sudo secho "0.0.0.1 ansible_host=ansible-node2" >> /etc/ansible/inventory/hosts

ansible-galaxy role search "gitlab"
ansible-galaxy role install -p ./ activatedinc.gitlab
ansible-galaxy role install -p ./ geerlingguy.haproxy
git clone https://github.com/milesbarry/rhel-repo-sync.git

ssh-keygen
ssh-copy-id ansible@ansible-node1
ssh-copy-id ansible@ansible-node2