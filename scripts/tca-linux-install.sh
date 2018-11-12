#!/usr/bin/env bash

touch /opt/test

echo "it works" > /opt/test

cd /opt/

wget https://teamcity.csre.worldremit.com/update/buildAgent.zip

unzip /opt/buildAgent.zip

ls -ltrh

cd /opt/buildAgent/

bash install.sh