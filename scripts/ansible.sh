#!/bin/bash

# add the gpg public key manually
# since downloading this with apt typically fails behind a proxy
# to get the pubkey, follow this guide: https://superuser.com/a/937778?sgp=2
sudo apt-key add /vagrant/scripts/ansible_pubkey
sudo apt-get update
sudo apt-get install software-properties-common
# note: using apt-add-repository fails behind some proxies
# because the gpg check of the repository fails..
cp /vagrant/scripts/ansible-ubuntu-ansible-artful.list /etc/apt/sources.list.d
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y ansible
