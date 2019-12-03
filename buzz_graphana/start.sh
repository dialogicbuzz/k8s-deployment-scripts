#!/bin/bash
if [ -z "$(kubectl get namespaces | grep monitoring)" ]
then $(kubectl create namespace monitoring)
fi

BASEDIR=$(dirname "$0")
echo "starting influxDB ..."
$BASEDIR/influxDB/start-influx.sh
echo "starting grafana ..."
$BASEDIR/grafana/start-grafana.sh
