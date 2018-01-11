#!/bin/sh

sudo tee -a /etc/apt/apt.conf.d/00proxy << EOF
acquire::http::Proxy "http://192.168.50.4:3142";
EOF

sudo LC_ALL=en_US.UTF-8 apt-get update
sudo LC_ALL=en_US.UTF-8 apt-get dist-upgrade --yes | tee
sudo LC_ALL=en_US.UTF-8 apt-get install ifupdown --yes
