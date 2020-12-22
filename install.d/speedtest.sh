#!/bin/bash
#
# Toker
#
echo -e "\n  Speedtest "
a='379CE192D401AB61'
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $a &> /dev/null

echo -e "#\n# Toker\n#" > /etc/apt/sources.list.d/speedtest.list
echo -e "deb https://ookla.bintray.com/debian buster main" >> /etc/apt/sources.list.d/speedtest.list

apt-get update &> /dev/null
apt-get autoremove &> /dev/null

apt-get install speedtest -y &> /dev/null
echo -e "\n Speedtest done "