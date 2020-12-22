#
# Toker
#

alias ls='ls --color=tty --group-directories-first -a1'

export tf='/toker/files'
export tsh='/toker/files/sh.d'

alias zshrc="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh/oh-my-zsh.sh"

alias cdtf='cd /toker/files'
alias tls='ls -a1 $tf'
alias dc="docker-compose"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcdrr="docker-compose down --remove-orphans --rmi all"
alias dcps='bash $tf/dc.d/ps.sh'
alias update="tbash update os"
alias upgrade="upgrade-system"
alias hassio="cd /toker/hassio/homeassistant/"
alias myip="curl ifconfig.co"

bash /toker/files/motd.d/motd > /toker/files/motd.d/dynamic
cat /etc/update-motd.d/dynamic