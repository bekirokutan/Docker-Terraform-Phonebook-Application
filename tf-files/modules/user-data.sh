#! /bin/bash
yum update -y
yum install docker -y
usermod -a -G docker ec2-user
newgrp docker
curl -SL https://github.com/docker/compose/releases/download/v2.16.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
mkdir -p /home/ec2-user/phonebook
FOLDER="https://raw.githubusercontent.com/bekirokutan/my-projects/main/Docker-Terraform-Phonebook-Application"
curl -s --create-dirs -o "/home/ec2-user/phonebook/docker-compose.yml" -L "$FOLDER"/docker-compose.yml
cd /home/ec2-user/phonebook
systemctl start docker
systemctl enable docker
docker-compose up -d