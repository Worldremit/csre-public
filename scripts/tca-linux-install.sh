#!/usr/bin/env bash

function check_exit {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        echo "error with $1" >&2
    fi
    return $status
}

sudo apt install unzip

check_exit cd /opt/

check_exit wget https://teamcity.csre.worldremit.com/update/buildAgent.zip

check_exit unzip /opt/buildAgent.zip

check_exit ls -ltrh

check_exit cd /opt/buildAgent/bin/

check_exit ls -ltrh

check_exit bash install.sh

check_exit sleep 10

check_exit bash agent.sh &