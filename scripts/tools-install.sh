#!/bin/sh

# You may well be aware that CentOS Linux 8 died a premature death,
# it reached the End Of Life (EOL) on December 31st, 2021,
# thus it no longer receives development resources from the official CentOS project.
# This means that after Dec 31st, 2021, to update your CentOS installation,
# you are required to change the mirrors to CentOS Vault Mirror, where they will be archived permanently.
sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# update the yum repo
sudo yum update -y

# install Consul and its dependencies
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install consul

# install git
sudo yum install git -y

# install curl
sudo yum install curl -y