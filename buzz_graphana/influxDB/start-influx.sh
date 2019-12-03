#!/bin/bash
BASEDIR=$(dirname "$0")
kubectl apply -f "$BASEDIR/secret.yaml" 
kubectl apply -f "$BASEDIR/pvc.yaml"
kubectl apply -f "$BASEDIR/deployment.yaml"
kubectl apply -f "$BASEDIR/svc.yaml"
port=`kubectl get svc -o wide -n monitoring | grep influxdb | awk -F'[:/]' '{print $2}'`
host=`kubectl cluster-info | grep 'Kubernetes master' | awk -F'[:]' '{print $2}' | sed -r 's/\///g'`
sleep 15
curl -u root:root -i -XPOST "$host:$port/query?pretty=true" --data-urlencode "q=create database statistics"
