#! /bin/bash
# To run on managed nodes
sudo bash -c "useradd shoughtsky; usermod -aG wheel shoughtsky ; mkdir -p /home/shoughtsky/.ssh ; echo "shoughtsky" | passwd shoughtsky --stdin"
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh ; chmod 700 /home/shoughtsky/.ssh'

sudo bash -c "touch /home/shoughtsky/.ssh/authorized_keys"
sudo bash -c 'chown shoughtsky. /home/shoughtsky/.ssh/authorized_keys ; chmod 644 /home/shoughtsky/.ssh/authorized_keys'
#Replace with your generated pub key
sudo -u shoughtsky bash -c 'echo "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGi1ET7BP5Y41BhnZ8AESPzWpD/k8moqn8Dbfg3gtWC7aEybj3KnIOYon0/s1YLrHaQ7IPp1xuVnYpCqTBrd/zQEgCdEyFt6ixvoOs76+7D39xEwW0T9ILzulBcUShGKsztzSzNFD9QS9gIXkfvkChgySvygnEkDKCUMi2TSg+NabMnEw== shoughtsky@control.ansi.example.com" >> /home/shoughtsky/.ssh/authorized_keys'