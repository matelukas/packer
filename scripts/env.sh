#!/bin/sh

sudo -- sed -i -e '$ a\LC_ALL="en_US.UTF-8"' /etc/environment
sudo -- sed -i -e '$ a\LC_ALL="en_US.UTF-8"' /etc/default/locale
