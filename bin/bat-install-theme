#!/usr/bin/env bash

tmDir="$(bat --config-dir)/themes"

mkdir -p "$tmDir"
curl -O https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/sublime/tokyonight_night.tmTheme -o "$tmDir"/tokyonight_night.tmTheme
bat cache --build

read -p $'\e[32mDo you want to set the theme to tokyonight_night?\e[0m [y/N]:' -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo '--theme="tokyonight_night"' >>"$(bat --config-dir)/config"
fi
