#!/bin/bash
#
# Toker
#
dist=$(cat /etc/os-release | awk -F "=" '/^ID=/ { print $2 }')
echo -e "\n  Installing docker for $dist"

if [ $dist == debian ]
then
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - &> /dev/null
  echo -e '#\n# Toker\n#\n' > /etc/apt/sources.list.d/docker.list
  echo -e '#deb [arch=amd64] https://download.docker.com/linux/debian buster nightly' >> /etc/apt/sources.list.d/docker.list
  echo -e 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' >> /etc/apt/sources.list.d/docker.list
elif [ $dist == ubuntu ]
then
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - &> /dev/null
  echo -e '#\n# Toker\n#\n' > /etc/apt/sources.list.d/docker.list
  echo -e '#deb [arch=amd64] https://download.docker.com/linux/ubuntu eoan nightly' >> /etc/apt/sources.list.d/docker.list
  echo -e 'deb [arch=amd64] https://download.docker.com/linux/ubuntu eoan stable' >> /etc/apt/sources.list.d/docker.list
fi
apt-get update &> /dev/null
apt-get install -y docker-ce &> /dev/null
apt-get autoremove -y &> /dev/null
apt-get autoclean -y &> /dev/null

echo -e '\n  Docker Installed'