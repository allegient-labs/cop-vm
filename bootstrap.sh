#!/usr/bin/env bash

# Update yum
yum -y update

# Dev Tools Installation
yum install -y epel-release
yum install -y git python-pip java-1.8.0-openjdk-devel

# Docker installation
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce
usermod -a -G docker vagrant
systemctl start docker
