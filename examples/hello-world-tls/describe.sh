set -e
kubectl -n hello describe certificate

kubectl get pods -n hello
kubectl get service -n hello
kubectl get ingress -n hello
kubectl describe ingress -n hello

