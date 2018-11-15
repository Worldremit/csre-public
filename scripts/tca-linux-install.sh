#!/usr/bin/env bash

function check_exit {
    "$@"
    local status=$?
    if [ $status -ne 0 ]; then
        echo "error with $1" >&2
    fi
    return $status
}


echo -e "\n### Standard OS updates, installation of unzip and JRE\n"
check_exit sudo apt update -y
check_exit sudo apt upgrade -y
check_exit sudo apt install unzip -y
check_exit sudo apt install openjdk-8-jre -y
check_exit sudo apt install -y apt-transport-https ca-certificates curl software-properties-common lsb-release
check_exit sudo apt autoremove -y

echo -e "\n### Packer installation\n"
check_exit cd /tmp
check_exit sudo wget https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip
check_exit sudo unzip packer_1.3.2_linux_amd64.zip
check_exit sudo mv packer /usr/bin/packer
check_exit sudo chmod +x /usr/bin/packer

echo -e "\n### Docker Installation\n"
check_exit curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
check_exit sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
check_exit sudo apt update
check_exit sudo apt install -y docker-ce
check_exit sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose
check_exit sudo chmod +x /usr/bin/docker-compose

echo -e "\n### Azure CLI Installation\n"
check_exit sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main"
check_exit sudo apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv --keyserver packages.microsoft.com --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF
check_exit sudo apt update
check_exit sudo apt install -y azure-cli

echo -e "\n### Microsoft .NET Core Installation\n"
check_exit cd /tmp
check_exit sudo wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
check_exit sudo dpkg -i packages-microsoft-prod.deb
check_exit sudo apt update
check_exit sudo apt install -y nuget

echo -e "\n### Installation of TC Build Agent\n"
check_exit cd /opt/
check_exit sudo wget https://teamcity.csre.worldremit.com/update/buildAgent.zip
check_exit sudo unzip -o /opt/buildAgent.zip
check_exit cd /opt/bin/
check_exit sudo bash install.sh https://teamcity.csre.worldremit.com/ &
