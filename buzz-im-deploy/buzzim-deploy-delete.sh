#!/bin/sh
# Remove BuzzIM-Deploy from Kubernetes.

# Delete the namespace for the tool
kubectl delete -f buzzim-deploy-namespace.yaml &

sleep 20s

../delete-stuck-namespace.sh buzzim-deploy

# Delete cluster role.
kubectl delete -f buzzim-deploy-clusterrole-binding.yaml
kubectl delete -f buzzim-deploy-clusterrole.yaml
