set -e
kubectl create namespace hello
kubectl create configmap hello-world -n hello --from-file index.html
kubectl apply -f hello-world.yml
