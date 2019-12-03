#!/bin/bash
BASEDIR=$(dirname "$0")
kubectl apply -f "$BASEDIR/secret.yaml" 
kubectl apply -f "$BASEDIR/deployment.yaml"
kubectl apply -f "$BASEDIR/svc.yaml"
kubectl create configmap grafana-config -n monitoring \
        --from-file=influxdb-datasource.yaml="$BASEDIR/influxdb-datasource.yaml" \
        --from-file=grafana-dashboard-provider.yaml="$BASEDIR/grafana-dashboard-provider.yaml" \
        --from-file=system.json="$BASEDIR/dashboards/system.json" \
        --from-file=subscriber.json="$BASEDIR/dashboards/subscriber.json" \
        --from-file=tenant.json="$BASEDIR/dashboards/tenant.json" \
        --from-file=grafana.ini="$BASEDIR/grafana.ini" \


