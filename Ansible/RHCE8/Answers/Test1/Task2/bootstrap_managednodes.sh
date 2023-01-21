#! /bin/bash

#Example pub key to use
# ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGUmcJVUSe31lESr7gUgolioS8hHaB8SmkFbv6/mXSC47rE91llOTp/ZzgFGg18dG8txawi1IpLyZ6AfUR+UdRnqgEWMn1OhTX6yynUHj7uVQDl1oF8ozkbnYNNUmH0f04YJFAKk4AQkWTcYapjbsRTr2R9QJ4TH8r7dcuEBdCWP+S3Ww== shoughtsky@control.ansi.example.com

# To run on managed nodes
sudo bash -c "useradd shoughtsky; usermod -aG wheel shoughtsky ; mkdir -p /home/shoughtsky/.ssh ; echo "shoughtsky" | passwd shoughtsky --stdin"
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh ; chmod 700 /home/shoughtsky/.ssh'

sudo bash -c "touch /home/shoughtsky/.ssh/authorized_keys"
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh/authorized_keys ; chmod 644 /home/shoughtsky/.ssh/authorized_keys'
#Replace with your generated pub key
sudo -u shoughtsky bash -c 'echo "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGi1ET7BP5Y41BhnZ8AESPzWpD/k8moqn8Dbfg3gtWC7aEybj3KnIOYon0/s1YLrHaQ7IPp1xuVnYpCqTBrd/zQEgCdEyFt6ixvoOs76+7D39xEwW0T9ILzulBcUShGKsztzSzNFD9QS9gIXkfvkChgySvygnEkDKCUMi2TSg+NabMnEw== shoughtsky@control.ansi.example.com" >> /home/shoughtsky/.ssh/authorized_keys'