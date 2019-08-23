#!/bin/bash -e

sudo tee -a /etc/apt/apt.conf.d/00proxy << EOF
acquire::http::Proxy "http://10.1.0.14:3142";
EOF

sudo tee -a /tmp/keyboard.conf << EOF
keyboard-configuration	keyboard-configuration/unsupported_config_options	boolean	true
keyboard-configuration	keyboard-configuration/variant	select	English (US)
keyboard-configuration	keyboard-configuration/compose	select	No compose key
keyboard-configuration	keyboard-configuration/variantcode	string	
keyboard-configuration	keyboard-configuration/unsupported_layout	boolean	true
keyboard-configuration	keyboard-configuration/unsupported_config_layout	boolean	true
keyboard-configuration	keyboard-configuration/switch	select	No temporary switch
keyboard-configuration	keyboard-configuration/layoutcode	string	us
keyboard-configuration	keyboard-configuration/unsupported_options	boolean	true
keyboard-configuration	keyboard-configuration/xkb-keymap	select	us
keyboard-configuration	keyboard-configuration/store_defaults_in_debconf_db	boolean	true
keyboard-configuration	keyboard-configuration/modelcode	string	pc105
keyboard-configuration	keyboard-configuration/toggle	select	No toggling
keyboard-configuration	keyboard-configuration/optionscode	string	
keyboard-configuration	keyboard-configuration/model	select	Generic 105-key (Intl) PC
keyboard-configuration	keyboard-configuration/layout	select	English (US)
keyboard-configuration	keyboard-configuration/ctrl_alt_bksp	boolean	false
keyboard-configuration	keyboard-configuration/altgr	select	The default for the keyboard layout
keyboard-configuration	console-setup/ask_detect	boolean	false
EOF

export DEBIAN_FRONTEND=noninteractive
export UCF_FORCE_CONFOLD=1
export LC_ALL=en_US.UTF-8

sudo apt-get update

for p in locales bridge-utils build-essential debconf-utils cloud-guest-utils
do
        sudo apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -qq -y install $p
done

if grep -q ^UBUNTU_CODENAME=bionic /etc/os-release
then
        sudo debconf-set-selections < /tmp/keyboard.conf
        sudo dpkg-reconfigure keyboard-configuration -f noninteractive
fi

sudo -E apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -qq -y dist-upgrade
