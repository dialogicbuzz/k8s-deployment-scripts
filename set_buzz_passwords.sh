#!/bin/bash

set_buzz_password()
{

  source_path=$1
  target_path=$2
  password_key=$3
  password_value=$4
  
  if [ $source_path != "NO" ];
  then
    echo "copy $source_path to $target_path"
    cp $source_path $target_path
  fi

  sed -i "s/$password_key/$password_value/g" $target_path
}

source=./template/buzz-im-admin/buzzim-admin-delete-db-job.yaml
target=./buzz-im-admin/buzzim-admin-delete-db-job.yaml
password_key=BUZZ_IM_ADMIN_DB_PASSWORD
password_value=$(cat ./buzz_secrets.json | jq '.BUZZ_IM_ADMIN_DB_PASSWORD')
set_buzz_password $source $target $password_key $password_value

source=./template/buzz-im-admin/buzzim-admin-init-db-job.yaml
target=./buzz-im-admin/buzzim-admin-init-db-job.yaml
password_key=BUZZ_IM_ADMIN_DB_PASSWORD
password_value=$(cat ./buzz_secrets.json | jq '.BUZZ_IM_ADMIN_DB_PASSWORD')
set_buzz_password $source $target $password_key $password_value

source=./template/buzz-im-admin/buzzim-admin-secret.yaml
target=./buzz-im-admin/buzzim-admin-secret.yaml
password_key=BUZZIM_ADMIN_DB_PASSWORD_HERE
password_value=$(cat ./buzz_secrets.json | jq '.BUZZ_IM_ADMIN_DB_PASSWORD')
set_buzz_password $source $target $password_key $password_value

source="NO"
target=./buzz-im-admin/buzzim-admin-secret.yaml
password_key=APNS_CERT_HERE
password_value=$(cat ./buzz_secrets.json | jq '.APNS_CERT')
set_buzz_password $source $target $password_key $password_value

source="NO"
target=./buzz-im-admin/buzzim-admin-secret.yaml
password_key=GCM_API_KEY_HERE
password_value=$(cat ./buzz_secrets.json | jq '.GCM_API_KEY')
set_buzz_password $source $target $password_key $password_value

source=./template/stolon-postgresql/secret.yaml
target=./stolon-postgresql/secret.yaml
password_key=SECRET_PASSWORD
password_value=$(cat ./buzz_secrets.json | jq '.STOLON_SECRET_PASSWORD')
set_buzz_password $source $target $password_key $password_value

source=./template/stolon-postgresql/stolon-keeper.yaml
target=./stolon-postgresql/stolon-keeper.yaml
password_key=STKEEPER_PG_REPL_PASSWORD_HERE
password_value=$(cat ./buzz_secrets.json | jq '.STKEEPER_PG_REPL_PASSWORD')
set_buzz_password $source $target $password_key $password_value

