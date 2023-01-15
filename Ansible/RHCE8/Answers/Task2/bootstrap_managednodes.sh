#! /bin/bash
# To run on managed nodes
sudo bash -c "useradd shoughtsky; usermod -aG wheel shoughtsky ; mkdir -p /home/shoughtsky/.ssh;echo "shoughtsky" | passwd shoughtsky --stdin"
sudo bash -c "touch /home/shoughtsky/.ssh/authorized_keys"
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh ; chmod 700 /home/shoughtsky/.ssh'
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh/authorized_keys ; chmod 644 /home/shoughtsky/.ssh/authorized_keys'

#Replace with your generated pub key
sudo bash -c 'echo ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAHtu/RWswcIjg9Yob1Xius2rAAYeuBr4j5WDX2WZfrRNkSrcYUtCHSQjdXPccXC/F2I59ZF2yVeNEisJFRTdm7bTgGvNx18KFbDLOWiphFfaniU7ebW2YNDhla5Upy7ggHYnH5CLaN1LxPZzSciwXPyyc7WFnJZEJJU9W5JP75p6h9gYQ== root@control.ansi.example.com >> /home/shoughtsky/.ssh/authorized_keys'