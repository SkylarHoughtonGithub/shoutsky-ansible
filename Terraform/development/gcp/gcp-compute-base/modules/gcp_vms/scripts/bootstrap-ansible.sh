#! /bin/bash
mkdir ansible
cd ansible
mkdir inventory
cd inventory/
touch hosts

sudo adduser ansible
sudo usermod -aG wheel ansible
sudo passwd ansible

ssh rocky9-base2
ssh-copy-id rocky9-base2
