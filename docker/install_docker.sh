#! /bin/bash
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
sudo apt install docker-ce -y
sudo usermod -aG docker ubuntu > /tmp/docker-log.txt
sudo systemctl status docker > /tmp/cek-group.txt
sudo docker pull hello-worldclear
sudo docker run hello-world
