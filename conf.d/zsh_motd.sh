# Toker zsh

stamp="$HOME/.motd_shown"

PERL_INSTALLED=0
if hash perl
then
  PERL_INSTALLED=1
fi

random_word() {
  perl -e 'open IN, "</usr/share/dict/words";rand($.) < 1 && ($n=$_) while <IN>;print $n'
}

rainbow_dino() {
  ( hash cowsay 2>/dev/null && cowsay -n -f stegosaurus || cat ) |
  ( hash lolcat 2>/dev/null && lolcat || cat )
}

fortune_text() {
  ( hash fortune 2>/dev/null && fortune || printf "Hey $USER\n" )
}

print_header() {
  if [ ! -z ${ZSH_MOTD_CUSTOM+x} ]
  then
    echo $ZSH_MOTD_CUSTOM |
    ( hash figlet 2>/dev/null && figlet || cat ) |
    rainbow_dino
  elif [ ! -z ${ZSH_MOTD_WOTD+x} ] && [ $PERL_INSTALLED -eq 1 ]; then
    random_word |
    ( hash figlet 2>/dev/null && figlet || cat ) |
    rainbow_dino
  else
    fortune_text | rainbow_dino
  fi
}

if [ -d /etc/update-motd.d ] && [ ! -e "$HOME/.hushlogin" ] && [ -z "$MOTD_SHOWN" ] && ! find $stamp -newermt 'today 0:00' 2> /dev/null | grep -q -m 1 '.'
then
  [ $(id -u) -eq 0 ] || SHOW="--show-only"
  update-motd $SHOW | rainbow_dino
  touch $stamp
  export MOTD_SHOWN=update-motd
elif [ ! -z ${ZSH_MOTD_ALWAYS+x} ] || ! find $stamp -mmin -179 2> /dev/null | grep -q -m 1 '.'; then
  print_header
  touch $stamp
else
  echo
  random_word | ( hash lolcat 2>/dev/null && lolcat || cat )
fi

rm $stamp
