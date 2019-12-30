#!/bin/bash
BASEDIR=$(dirname "$0")
echo "updating grafana datasource config parameters ..."
$BASEDIR/grafana/read_db_conf.sh
