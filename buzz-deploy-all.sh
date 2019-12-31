#!/bin/bash

#This script assumes the following requirementas:
# 1. Kubenetes environment has been built.
# 2. All variables are pre-configured.
# 3. Communications are not blocked between BUZZ components.

cd buzz-im-admin
./buzzim-admin-create.sh
cd ..

cd buzz-im-deploy
./buzzim-deploy-create.sh
cd ..

cd buzz-server
./all-create.sh
cd ..
