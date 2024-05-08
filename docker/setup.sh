#!/bin/bash

# ensure docker and tools are installed

sudo apt update
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# Install docker
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose

# Install psql client
sudo apt install -y postgresql-client-common postgresql-client

# Add ubuntu to docker group
sudo usermod -aG docker ubuntu

# Start up docker image for Postgres under group docker

sg docker "docker compose up -d"

# Run the sql script to finish configuration
until pg_isready -h localhost
do
  sleep 1
done

PGPASSWORD=root-secret psql -h localhost -U root users < movielens.sql

# set up Java and Maven

sudo apt install -y openjdk-21-jdk
sudo apt install -y maven

