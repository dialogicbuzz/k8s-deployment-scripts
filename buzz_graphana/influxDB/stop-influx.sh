#!/bin/bash
BASEDIR=$(dirname "$0")
kubectl delete -f "$BASEDIR/svc.yaml"
kubectl delete -f "$BASEDIR/deployment.yaml"
kubectl delete -f "$BASEDIR/pvc.yaml"
kubectl delete -f "$BASEDIR/secret.yaml"
