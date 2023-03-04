/usr/local/bin/k3s-uninstall.sh
#K3S_EXTERNAL_IP=`curl https://2ip.ru`
#sudo ip addr del $K3S_EXTERNAL_IP dev lo

sudo rm -rf /etc/rancher /var/lib/rancher/
cd /tmp
sudo -u postgres psql << EOT
DROP DATABASE IF EXISTS k3s;
DROP USER IF EXISTS k3s;
EOT
