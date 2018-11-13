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

check_exit cd /opt/bin/

check_exit bash install.sh https://teamcity.csre.worldremit.com/ &

check_exit wget https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip 

check_exit unzip /opt/packer_1.3.2_linux_amd64.zip

check_exit sudo mv packer /usr/bin/packer

check_exit sudo chmod +x /usr/bin/packer