#!/bin/bash
#
# Toker
#
echo -e "\n  Updating os "
apt-get update &≥ /dev/null
apt-get full-upgrade -y &≥ /dev/null
apt-get autoremove -y &≥ /dev/null
apt-get autoclean -y &≥ /dev/null
echo -e "\n done."