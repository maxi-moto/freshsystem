#!/bin/bash

# script configs
udate="apt-get update -y"
upgrade="apt-get upgrade -y"
install="apt-get install -y"
remove="apt-get remove -y"

red="\033[0;31m"
green="\033[0;32m"
default="\033[0m"

# root check
if [ "$(id -u)" != "0" ]; then
  printf "${red}Install failed${default}: super user access required\n"
  printf "Please try again as root\n"
  exit
fi

# add repos
# I don't think I want to use oracle java anymore
# ppa="deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"
# ppa_src="deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"

printf "\nAdding required repos ...\n"
# echo $ppa | tee /etc/apt/sources.list.d/webupd8team-java.list
# echo $ppa_src | tee -a /etc/apt/sources.list.d/webupd8team-java.list
# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

printf "${green}\n\nStarting installation ...\n${default}"
printf "Interaction may be required\n"
apt-get update -y
apt-get upgrade -y

# development tools
$install git vim tmux

# system tools
$install curl htop tree ack-grep

printf "\n\nRemoving uncessary and unwanted files ...\n"
$remove nano

apt-get autoremove -y

printf "\n\nDone\n\n"
