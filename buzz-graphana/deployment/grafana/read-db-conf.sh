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

for jf in $DS_DIR/*.json; do
  [ ! -f $jf ] && break
  if grep -q 'cc_host' $jf; then
    sed -i "s/cc_host/$cc_host/" $jf
    sed -i "s/cc_port/$cc_port/" $jf
    sed -i "s/cc_user/$cc_user/" $jf
    sed -i "s/cc_pwd/$cc_pwd/" $jf
  fi
  if grep -q 'shared_host' $jf; then
    sed -i "s/shared_host/$cc_host/" $jf
    sed -i "s/shared_port/$cc_port/" $jf
    sed -i "s/shared_user/$cc_user/" $jf
    sed -i "s/shared_pwd/$cc_pwd/" $jf
  fi
  if grep -q 'rpt_host' $jf; then
    sed -i "s/rpt_host/$cc_host/" $jf
    sed -i "s/rpt_port/$cc_port/" $jf
    sed -i "s/rpt_user/$cc_user/" $jf
    sed -i "s/rpt_pwd/$cc_pwd/" $jf
  fi
done
