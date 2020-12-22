#!/bin/bash
#
# Toker
#
echo -e "\n  Network "

a="/toker/files/conf.d"
b="/lib/systemd/network"
c="/etc/network"

sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"/g' /etc/default/grub
cp -f $a/2*.link $b
cp -f $a/interfaces $c

grub-mkconfig &> /dev/null
update-grub &> /dev/null
update-grub2 &> /dev/null

echo -e "\n  Network done \n"