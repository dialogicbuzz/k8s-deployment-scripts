#!/bin/bash

unicorn='\360\237\246\204'
redis='\xF0\x9F\x93\x80'
buzz='\xF0\x9F\x90\x9D'
remove='\xE2\x9C\x82'

printf "\n${buzz}  Setup Buzz Website ${buzz}\n"
kubectl create -f ./buzz/buzz-webapp-deployment.yaml
kubectl create -f ./buzz/buzz-webapp-service.yaml

printf "\n${buzz}  Setup Buzz RTC Server ${buzz}\n"
kubectl create -f ./buzz/buzz-rtc-deployment.yaml
kubectl create -f ./buzz/buzz-rtc-service.yaml

printf "\n${buzz}  Setup Buzz SFU Conference Server ${buzz}\n"
kubectl create -f ./buzz/buzz-conf-deployment.yaml




