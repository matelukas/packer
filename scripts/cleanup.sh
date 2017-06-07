#!/bin/sh

sudo apt-get clean
sudo sed -i 's/.*ubuntu$//'g /etc/hosts
