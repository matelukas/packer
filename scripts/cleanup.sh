#!/bin/sh

export DEBIAN_FRONTEND=noninteractive

sudo apt-get clean
sudo apt-get autoremove --yes

sudo sed -i 's/.*ubuntu$//'g /etc/hosts
