#! /bin/bash

# Run from the vagrant environment
#vagrant upload Ansible /home/shoughtsky/Ansible control

# Example private key to use
# -----BEGIN OPENSSH PRIVATE KEY-----
# b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAArAAAABNlY2RzYS
# 1zaGEyLW5pc3RwNTIxAAAACG5pc3RwNTIxAAAAhQQBlJnCVVEnt9ZREq+4FIKJYqEvIR2g
# fEppBW7+v5l0guO6xPdZZTk6f2c4BRoNfHRvLcWsItSKS8megH1EflHUZ6oBFjJ9ToU1+s
# sp1B4+7lUA5daBfKM5G52DTVJh9H9OGCRQCpOAEJFk3GGqY27EU69kfUCeEx/K+3XLhAXQ
# lj/kt1sAAAEoMPQ/gjD0P4IAAAATZWNkc2Etc2hhMi1uaXN0cDUyMQAAAAhuaXN0cDUyMQ
# AAAIUEAZSZwlVRJ7fWURKvuBSCiWKhLyEdoHxKaQVu/r+ZdILjusT3WWU5On9nOAUaDXx0
# by3FrCLUikvJnoB9RH5R1GeqARYyfU6FNfrLKdQePu5VAOXWgXyjORudg01SYfR/ThgkUA
# qTgBCRZNxhqmNuxFOvZH1AnhMfyvt1y4QF0JY/5LdbAAAAQgHcd4zffqQLVfxBd63gofNE
# PfZV4l9Sqe0lr6n4DI2iyN1hGZ7X4P/ytB0Rz3AVSMjECQeStnrRzui7z5viT2UttQAAAC
# NzaG91Z2h0c2t5QGNvbnRyb2wuYW5zaS5leGFtcGxlLmNvbQECAwQFBgc=
# -----END OPENSSH PRIVATE KEY-----

# To run on control node
sudo bash -c "useradd shoughtsky; usermod -aG wheel shoughtsky ; mkdir -p /home/shoughtsky/.ssh;echo "shoughtsky" | passwd shoughtsky --stdin"
sudo -u shoughtsky bash -c 'ssh-keygen -t ecdsa -b 521 -f /home/shoughtsky/.ssh/shoughtsky_ecdsa512 -q -P ""'
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh ; chmod 700 /home/shoughtsky/.ssh'
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh/shoughtsky_ecdsa512 ; chmod 600 /home/shoughtsky/.ssh/shoughtsky_ecdsa512'
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh/shoughtsky_ecdsa512.pub ; chmod 644 /home/shoughtsky/.ssh/shoughtsky_ecdsa512.pub'
sudo bash -c 'cp -r Ansible /home/shoughtsky/'