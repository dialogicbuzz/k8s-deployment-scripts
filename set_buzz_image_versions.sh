#!/bin/bash

set_buzz_image_version()
{

  docker_iamge_name=$1
  docker_iamge_base_tag=$2
  source_path=$3
  target_path=$4
  image_tag_key=$5
  
  echo $image_tag_key
  if [ $source_path != "NO" ];
  then
    echo "copy $source_path to $target_path"
    cp $source_path $target_path
  fi
  
  #login to docker hub
  docker login https://index.docker.io

  docker_hub_repository=dialogicbuzz
  
  docker_hub_image_name=$docker_hub_repository/$docker_iamge_name:$docker_iamge_base_tag
  docker pull $docker_hub_image_name

  docker_hub_version=$(docker inspect $docker_hub_image_name | jq -r '.[0].Config.Labels.version')

  #echo "${docker_hub_version}"
  sed -i "s/$image_tag_key/$docker_hub_version/g" $target_path
}

release_verion=4.1.0

buzz_app=buzz-conf
source=./template/buzz-server/buzz/buzz-conf-deployment.yaml
target=./buzz-server/buzz/buzz-conf-deployment.yaml
image_tag_key=BUZZ_CONF_IMAGE_TAG
set_buzz_image_version $buzz_app $release_verion $source $target $image_tag_key

buzz_app=buzz-rtc
source=./template/buzz-server/buzz/buzz-rtc-deployment.yaml
target=./buzz-server/buzz/buzz-rtc-deployment.yaml
image_tag_key=BUZZ_RTC_IMAGE_TAG
set_buzz_image_version $buzz_app $release_verion $source $target $image_tag_key

buzz_app=buzz-webapp
source=./template/buzz-server/buzz/buzz-webapp-deployment.yaml
target=./buzz-server/buzz/buzz-webapp-deployment.yaml
image_tag_key=BUZZ_WEBAPP_IMAGE_TAG
set_buzz_image_version $buzz_app $release_verion $source $target $image_tag_key

buzz_app=buzzim-admin
source=./template/buzz-im-admin/buzzim-admin-deployment.yaml
target=./buzz-im-admin/buzzim-admin-deployment.yaml
image_tag_key=BUZZIM_ADMIN_IMAGE_TAG
set_buzz_image_version $buzz_app $release_verion $source $target $image_tag_key


buzz_app=buzzim-deploy
source=./template/buzz-im-deploy/buzzim-deploy-deployment.yaml
target=./buzz-im-deploy/buzzim-deploy-deployment.yaml
image_tag_key=BUZZIM_DEPLOY_IMAGE_TAG
set_buzz_image_version $buzz_app $release_verion $source $target $image_tag_key

buzz_app=synapse
source=./template/buzz-im-admin/buzzim-admin-configmap.yaml
target=./buzz-im-admin/buzzim-admin-configmap.yaml
image_tag_key=SYNAPSE_IMAGE_TAG
set_buzz_image_version $buzz_app $release_verion $source $target $image_tag_key


buzz_app=sygnal
source="NO"
target=./buzz-im-admin/buzzim-admin-configmap.yaml
image_tag_key=SYGNAL_IMAGE_TAG
set_buzz_image_version $buzz_app $release_verion $source $target $image_tag_key


