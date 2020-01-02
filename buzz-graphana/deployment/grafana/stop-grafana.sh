#!/bin/bash
BASEDIR=$(dirname "$0")
kubectl delete -f "$BASEDIR/grafana-ingress.yaml"
kubectl delete -f "$BASEDIR/svc.yaml"
kubectl delete -f "$BASEDIR/deployment.yaml"
kubectl delete configmap grafana-config -n monitoring
kubectl delete -f "$BASEDIR/secret.yaml"
