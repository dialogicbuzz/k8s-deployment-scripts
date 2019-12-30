#!/bin/bash
BASEDIR=$(dirname "$0")

DS_DIR="$BASEDIR/datasources"
TARGET=$BASEDIR/influxdb-datasource.yaml
cp -p $DS_DIR/influxdb.yaml $TARGET
for jf in $DS_DIR/*.json; do
  [ ! -f $jf ] && break
  echo "" >> $TARGET
  echo "- name: $(jq -r .name $jf)" >> $TARGET 
  echo "  type: $(jq -r .type $jf)" >> $TARGET
  echo "  url: $(jq -r .url $jf)" >> $TARGET
  echo "  database: $(jq -r .name $jf)" >> $TARGET
  echo "  user: $(jq -r .user $jf)" >> $TARGET
  echo "  secureJsonData:" >> $TARGET
  echo "    password: $(jq -r .password $jf)" >> $TARGET 
  echo "  editable: false" >> $TARGET
done

