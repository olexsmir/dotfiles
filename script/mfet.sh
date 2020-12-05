#!/bin/sh
#### Info ####
shell=$(echo $SHELL | sed -e 's|/bin/||g')
os=$(lsb_release -sdr | sed -e 's|"||g')
host=$(hostname)
user=$(echo $USER)
kernal=$(uname -r)
editor=$(echo $EDITOR)
uptime=$(uptime -p|sed 's|up ||g'|sed 's|,||g')

### Colors ###
rest="\e[0m"
bold="\e[1m"
blue="\e[34m"
grey="\e[90m"

#### Code ####
echo -e "  ${blue}${user}${rest}${grey}@${blue}${host}"
echo -e "  ${blue}    os ${rest}${grey}~ ${rest}${os}"
echo -e "  ${blue}    sh ${rest}${grey}~ ${rest}${shell}"
echo -e "  ${blue}kernal ${rest}${grey}~ ${rest}${kernal}"
echo -e "  ${blue}editor ${rest}${grey}~ ${rest}${editor}"
echo -e "  ${blue}uptime ${rest}${grey}~ ${rest}${uptime}"
