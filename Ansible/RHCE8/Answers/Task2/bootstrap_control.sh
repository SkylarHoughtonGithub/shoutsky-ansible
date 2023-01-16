#! /bin/bash

# Run from the vagrant environment
#vagrant upload Ansible /home/shoughtsky/Ansible control

# To run on control node
sudo bash -c "useradd shoughtsky; usermod -aG wheel shoughtsky ; mkdir -p /home/shoughtsky/.ssh;echo "shoughtsky" | passwd shoughtsky --stdin"
sudo -u shoughtsky bash -c 'ssh-keygen -t ecdsa -b 521 -f /home/shoughtsky/.ssh/shoughtsky_ecdsa512 -q -P ""'
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh ; chmod 700 /home/shoughtsky/.ssh'
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh/shoughtsky_ecdsa512 ; chmod 600 /home/shoughtsky/.ssh/shoughtsky_ecdsa512'
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh/shoughtsky_ecdsa512.pub ; chmod 644 /home/shoughtsky/.ssh/shoughtsky_ecdsa512.pub'
sudo bash -c 'cp -r Ansible /home/shoughtsky/'