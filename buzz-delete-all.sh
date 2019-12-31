#!/bin/bash

cd buzz-server
./all-delete.sh
cd ..

cd buzz-im-deploy
./buzzim-deploy-delete.sh
cd ..

cd buzz-im-admin
./buzzim-admin-delete.sh
cd ..
