#K3S_IP=$1
set -e
K3S_DB_PASSWORD=`uuidgen`
#K3S_EXTERNAL_IP=`curl https://2ip.ru`
#export INSTALL_K3S_EXEC="--tls-san ${K3S_EXTERNAL_IP}"
#sudo ip addr add ${K3S_EXTERNAL_IP} dev lo

cd /tmp
sudo -u postgres psql << EOT
DROP DATABASE IF EXISTS k3s;
DROP USER IF EXISTS k3s;
create database k3s;
CREATE USER k3s WITH PASSWORD '${K3S_DB_PASSWORD}';
GRANT ALL PRIVILEGES ON DATABASE k3s to k3s;
EOT

curl -sfL https://get.k3s.io | sh -s - server \
--datastore-endpoint="postgres://k3s:${K3S_DB_PASSWORD}@localhost:5432/k3s" \
--write-kubeconfig-mode="0640" \
--node-name="k3s"
#--node-external-ip=${K3S_EXTERNAL_IP}

sudo groupadd -f k3s
sudo usermod -aG k3s $USER
sudo chown root:k3s /etc/rancher/k3s/k3s.yaml
mkdir -p $HOME/.kube
cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config
