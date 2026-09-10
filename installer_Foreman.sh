#!/bin/bash
sudo apt-get -y install ca-certificates
cd /tmp && wget https://apt.voxpupuli.org/openvox8-release-ubuntu22.04.deb
sudo apt-get install /tmp/openvox8-release-ubuntu22.04.deb
sudo wget https://deb.theforeman.org/foreman.asc -O /etc/apt/trusted.gpg.d/foreman.asc
echo "deb http://deb.theforeman.org/ jammy 5.0" | sudo tee /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 5.0" | sudo tee -a /etc/apt/sources.list.d/foreman.list
sudo apt-get update && sudo apt-get -y install foreman-installer
sed -i '/127.0.1.1/d' /etc/hosts
sudo foreman-installer
sudo foreman-installer --enable-foreman-plugin-ansible --enable-foreman-proxy-plugin-ansible
sudo foreman-installer --enable-foreman-plugin-remote-execution --enable-foreman-proxy-plugin-remote-execution-script
