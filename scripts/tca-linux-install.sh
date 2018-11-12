#!/usr/bin/env bash

function check_exit {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        echo "error with $1" >&2
    fi
    return $status
}

sudo apt update -y
sudo apt upgrade -y
sudo apt install unzip -y
sudo apt install openjdk-8-jre -y

check_exit cd /opt/

check_exit wget https://teamcity.csre.worldremit.com/update/buildAgent.zip

check_exit unzip /opt/buildAgent.zip

check_exit ls -ltrh

check_exit cd /opt/buildAgent/bin/

check_exit ls -ltrh

check_exit bash install.sh https://teamcity.csre.worldremit.com/

check_exit sleep 10

check_exit bash agent.sh start &