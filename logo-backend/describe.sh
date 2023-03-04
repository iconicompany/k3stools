set -e
kubectl -n logos describe certificate

kubectl get pods -n logos
kubectl get service -n logos
kubectl get ingress -n logos
