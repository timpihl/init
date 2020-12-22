#!/bin/bash
#
# Toker
#
echo -e "\n  Installing zsh (apt-get) \n"
apt-get install zsh -y &> /dev/null

ZSH="/root/.oh-my-zsh"
REPO="ohmyzsh/ohmyzsh"
REMOTE="https://github.com/$REPO.git"
BRANCH="master"

echo -e "  Preparing git clone oh-my-zsh \n"
git clone -c core.eol=lf \
            -c core.autocrlf=false \
            -c fsck.zeroPaddedFilemode=ignore \
            -c fetch.fsck.zeroPaddedFilemode=ignore \
            -c receive.fsck.zeroPaddedFilemode=ignore \
            --depth=1 --branch "$BRANCH" "$REMOTE" "$ZSH" &> /dev/null

echo $SHELL > /root/.shell.pre-oh-my-zsh
current_zsh=$(which zsh)

if chsh -s "$current_zsh"
then
    export SHELL="$current_zsh"
    echo -e '\n  Shell successfully changed to zsh & oh-my-zsh.
           __                                     __
    ____  / /_     ____ ___  __  __   ____  _____/ /_
   / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \
  / /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / /
  \____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/
                          /____/                       ....is now installed!
\n' | lolcat
fi
