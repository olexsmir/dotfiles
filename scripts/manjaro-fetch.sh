host="$(hostname)"
os='Manjaro'
kernel="$(uname -r)"
uptime="$(uptime -p | sed 's/up //')"
packages="$(pacman -Q | wc -l)"
shell="$(basename "$SHELL")"
ui="$(basename ${XDG_CURRENT_DESKTOP})"

if [ -x "$(command -v tput)" ]; then
	bold="$(tput bold)"
	black="$(tput setaf 0)"
	red="$(tput setaf 1)"
	green="$(tput setaf 2)"
	yellow="$(tput setaf 3)"
	blue="$(tput setaf 4)"
	magenta="$(tput setaf 5)"
	cyan="$(tput setaf 6)"
	white="$(tput setaf 7)"
	reset="$(tput sgr0)"
fi

lc="${reset}${bold}${green}"
nc="${reset}${bold}${green}"
ic="${reset}"
c0="${reset}${green}"

cat <<EOF
${c0} ||||||||| |||| ${nc}${USER}${ic}@${nc}${host}${reset}
${c0} ||||||||| |||| ${lc}OS:        ${ic}${os}${reset}
${c0} ||||      |||| ${lc}KERNEL:    ${ic}${kernel}${reset}
${c0} |||| |||| |||| ${lc}PACKAGES:  ${ic}${packages}${reset}
${c0} |||| |||| |||| ${lc}SHELL:     ${ic}${shell}${reset}
${c0} |||| |||| |||| ${lc}UPTIME:    ${ic}${uptime}${reset}
${c0} |||| |||| |||| ${lc}DE/WM:     ${ic}${ui}${reset}
EOF
