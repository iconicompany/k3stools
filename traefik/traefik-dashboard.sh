if [ -z "$DOMAIN" ]; then echo "DOMAIN env is unset"; exit 1; fi
cat traefik-dashboard-service.yaml | envsubst | kubectl apply -f -
cat traefik-dashboard-ingress.yaml | envsubst | kubectl apply -f -
