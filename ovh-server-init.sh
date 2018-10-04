#!/usr/bin/env bash

# Create Ubuntu user
adduser ubuntu --gecos "" --disabled-password
echo "ubuntu:$UBUNTU_PWD" | sudo chpasswd
usermod -aG sudo ubuntu

# Setup keys and repositories
add-apt-repository -y ppa:ondrej/php

# Mongo
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list

# R 
echo "deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/" | tee /etc/apt/sources.list.d/cran-3.5.list

# OBiBa Suite
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61
echo 'deb https://dl.bintray.com/obiba/deb all main' | sudo tee /etc/apt/sources.list.d/obiba.list

# Install
apt update
apt install -y openjdk-8-jdk apache2 mongodb-org mysql-server  php5.6 php5.6-common php5.6-curl php5.6-MYSQL php5.6-gb php5.6-dom php5.6-mbstring r-base gdebi-core
