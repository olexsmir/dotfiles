#!/usr/bin/env bash

p="$(tmux run 'echo #{pane_current_path}')"
cd "$p"
url=$(git remote get-url origin 2>/dev/null) || { echo "No remote 'origin' found in $p"; exit 1; }

if [[ $url == git@* ]]; then
  url="${url#git@}"
  url="${url/://}"
  url="https://$url"
fi

url="${url%.git}"
if [[ $url == https://* || $url == http://* ]]; then open "$url"
else echo "Cannot open: unrecognized remote format: $url: in $p"
     exit 1
fi

if command -v xdg-open &>/dev/null; then xdg-open "$url" >/dev/null
elif command -v open &>/dev/null;   then open "$url" >/dev/null
else tmux display-message "no opener found: $url" ; exit 1
fi

tmux display-message "opened: $url"
