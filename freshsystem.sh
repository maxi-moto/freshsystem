#!/bin/bash

install="apt-get install"

red="\033[0;31m"
green="\033[0;32m"
default="\033[0m"


if [ "$(id -u)" != "0" ]; then
  printf "${red}Install failed${default}: super user access required\n"
  printf "Please try again as root\n"
  exit
fi

printf "${green}\n\nStarting installation ...\n${default}"

$install git
$install vim
$install tmux

$install htop
