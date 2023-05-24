#! /bin/bash
#Run on control node
sudo adduser ansible
sudo usermod -aG wheel ansible
sudo passwd ansible
sudo bash -c "sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && systemctl restart sshd"
