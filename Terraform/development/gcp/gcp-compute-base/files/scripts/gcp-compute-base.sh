#! /bin/bash
export public_key="ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBG0mm5bAevWkZ6n0XsQ37LspdEaQBh3jW/ARxW9dwf66y14M3N3bJS0XD506Ccr3itRu7XuSxwzdEnqIs7YGDuk= SkylarHoughtonGithub@gmail.com"
# adduser shoutsky 
# usermod -aG wheel shoutsky
mkdir -p /home/shoutsky/.ssh
touch /home/shoutsky/.ssh/authorized_keys
echo $public_key >> /home/shoutsky/.ssh/authorized_keys
chmod 700 /home/shoutsky/.ssh
chmod 600 /home/shoutsky/.ssh/authorized_keys
chown -R shoutsky. /home/shoutsky/.ssh
yum update -y
