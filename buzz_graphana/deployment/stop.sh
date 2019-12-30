#!/bin/bash
BASEDIR=$(dirname "$0")
echo "stopping grafana ..."
$BASEDIR/grafana/stop-grafana.sh
echo "stopping influxDB ..."
$BASEDIR/influxDB/stop-influx.sh
