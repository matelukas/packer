#!/bin/sh

sudo tee -a /etc/ssh/sshd_config <<EOF
UseDNS no
PermitRootLogin yes
EOF
