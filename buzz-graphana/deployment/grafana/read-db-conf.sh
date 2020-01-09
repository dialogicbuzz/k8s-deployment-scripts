#!/bin/bash
BASEDIR=$(dirname "$0")

DS_DIR="$BASEDIR/datasources"

echo "Please enter PowerVillCC connection string:"
read -e -p "Database server host: " cc_host
read -e -p "Database server port: " cc_port
read -e -p "Database user: " cc_user
read -e -p "Database password: " cc_pwd

echo "Please enter PowerVillSharedProductData connection string:"
read -e -i "$cc_host" -p "Database server host: " shared_host
read -e -i "$cc_port" -p "Database server port: " shared_port
read -e -i "$cc_user" -p "Database user: " shared_user
read -e -i "$cc_pwd" -p "Database password: " shared_pwd

echo "Please enter PowerNovaReport connection string:"
read -e -i "$cc_host" -p "Database server host: " rpt_host
read -e -i "$cc_port" -p "Database server port: " rpt_port
read -e -i "$cc_user" -p "Database user: " rpt_user
read -e -i "$cc_pwd" -p "Database password: " rpt_pwd

tmp_file=$DS_DIR/tmp
for jf in $DS_DIR/*.json; do
  [ ! -f $jf ] && break
  if grep -q 'PowerVilleCC' $jf; then
    cat $jf | \
      jq '.url="'$cc_host':'$cc_port'"' | \
      jq '.user="'$cc_user'"' | \
      jq '.password="'$cc_pwd'"' \
      > $tmp_file  && mv $tmp_file $jf
  fi
  if grep -q 'PowerVilleSharedProductData' $jf; then
    cat $jf | \
      jq '.url="'$shared_host':'$shared_port'"' | \
      jq '.user="'$shared_user'"' | \
      jq '.password="'$shared_pwd'"' \
      > $tmp_file  && mv $tmp_file $jf
  fi
  if grep -q 'PowerNovaReports' $jf; then
    cat $jf | \
      jq '.url="'$rpt_host':'$rpt_port'"' | \
      jq '.user="'$rpt_user'"' | \
      jq '.password="'$rpt_pwd'"' \
      > $tmp_file  && mv $tmp_file $jf
  fi
done
