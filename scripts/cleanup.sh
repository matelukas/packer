#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

sudo -E sh -c 'systemctl disable systemd-resolved || true'
sudo -E sh -c 'systemctl stop systemd-resolved || true'
sudo -E sh -c 'rm -rf /etc/netplan || true'

sudo apt-get clean
sudo apt-get autoremove --yes

sudo sed -i 's/.*ubuntu$//'g /etc/hosts
