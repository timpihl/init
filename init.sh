#!/bin/bash
#
# Toker
#

a='bash-completion curl gnupg2 nano upgrade-system'

export DEBIAN_FRONTEND=noninteractive

echo 'First purge'
apt-get purge -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" postfix* bind9* landscape* update-notifier* alsa-* apport* ubuntu-standard* ubuntu-minimal* software-properties-common* sg3* snapd* screen* sosrep* squashfs-tools* friendly-recovery* at* unattended-upgrades* cloud-init* eatmydata* isc-dhcp-client* isc-dhcp-common* libdns-export1109* libeatmydata1* libisc-export1105* libyaml-0-2* python3-attr* python3-blinker* python3-cffi-backend* python3-configobj* python3-cryptography* python3-importlib-metadata* python3-jinja2* python3-json-pointer* python3-jsonpatch* python3-jsonschema* python3-jwt* python3-markupsafe* python3-more-itertools* python3-nacl* python3-oauthlib* python3-openssl* python3-pymacaroons* python3-pyrsistent* python3-serial* python3-yaml* python3-zipp* python3-netifaces*  &> /dev/null
apt-get autopurge -y &> /dev/null
apt-get autoremove -y &> /dev/null
apt-get autoclean -y &> /dev/null

echo 'Create folder'
mkdir /toker &> /dev/null;

echo 'Update & install'
apt-get update -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" &> /dev/null
apt-get upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" &> /dev/null
apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" $a &> /dev/null
apt-get autopurge -y &> /dev/null
apt-get autoremove -y &> /dev/null
apt-get autoclean -y &> /dev/null

echo 'Conf ssh & pam'
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config &> /dev/null
sed -i 's/#PrintLastLog yes/PrintLastLog no/g' /etc/ssh/sshd_config &> /dev/null
sed -i '/^#\s/d' /etc/ssh/sshd_config &> /dev/null
sed -i 'N;/^\n/d' /etc/ssh/sshd_config &> /dev/null
sed -i 's/^session    optional   pam_motd.so motd=\/run\/motd.dynamic/#session    optional   pam_motd.so motd=\/run\/motd.dynamic/g' /etc/pam.d/login &> /dev/null
sed -i 's/^session    optional     pam_motd.so  motd=\/run\/motd.dynamic/#session    optional     pam_motd.so  motd=\/run\/motd.dynamic/g' /etc/pam.d/sshd &> /dev/null
sed -i 's/^session    optional   pam_lastlog.so/#session    option   pam_lastlog.so/g' /etc/pam.d/login &> /dev/null

echo 'Cleaning'
systemctl disable apt-daily-upgrade.timer &> /dev/null &> /dev/null
systemctl disable apt-daily.timer &> /dev/null &> /dev/null
rm -rf /etc/update-motd.d/ &> /dev/null
apt-get autopurge -y &> /dev/null
apt-get autoremove -y &> /dev/null
apt-get autoclean -y &> /dev/null