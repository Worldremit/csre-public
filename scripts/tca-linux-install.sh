#!/usr/bin/env bash

function check_exit {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        echo "error with $1" >&2
    fi
    return $status
}


### Standard OS updates, installation of unzip and JRE
check_exit sudo apt update -y
check_exit sudo apt upgrade -y
check_exit sudo apt install unzip -y
check_exit sudo apt install openjdk-8-jre -y

### Packer installation
check_exit wget https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip 
check_exit unzip /opt/packer_1.3.2_linux_amd64.zip
check_exit sudo mv packer /usr/bin/packer
check_exit sudo chmod +x /usr/bin/packer

### Docker Installation
check_exit sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
check_exit curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
check_exit sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
check_exit sudo apt-get update
check_exit sudo apt-get install docker-ce

### Installation of TC Build Agent
check_exit cd /opt/
check_exit wget https://teamcity.csre.worldremit.com/update/buildAgent.zip
check_exit unzip /opt/buildAgent.zip
check_exit cd /opt/bin/
check_exit bash install.sh https://teamcity.csre.worldremit.com/ &