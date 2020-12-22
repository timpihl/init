#!/bin/bash
#
# Toker
#
echo -e "\n  Installing docker-compose \n"

curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-Linux-x86_64" -o /usr/local/bin/docker-compose &> /dev/null
chmod +x /usr/local/bin/docker-compose

curl -L "https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose" -o /etc/bash_completion.d/docker-compose &> /dev/null

echo -e "\n  Docker-Compose installed \n"