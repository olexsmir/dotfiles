#!/bin/sh
shopt -s nullglob globstar

menucmd="rofi -dmenu"
prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )
password=$(printf '%s\n' "${password_files[@]}"|${menucmd} -p  "Passwords" "$@")
[[ -n $password ]] || exit

if [[ $typeit -eq 0 ]]; then
	pass show -c "$password" 2>/dev/null
else
	pass show "$password" | { IFS= read -r pass; printf %s "$pass"; } |
		xdotool type --clearmodifiers --file -
fi
