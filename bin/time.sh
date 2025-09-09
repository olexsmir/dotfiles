#!/usr/bin/env bash
set -euo pipefail

CATEGORIES=(
  "stop"
  "programming"
  "notes"
  "chat"
  "chore"
  "study"
  "wasted"
)

_stop() { timew stop; }

_status() {
  if current=$(timew get dom.active.tags 2>/dev/null); then
    echo "$current"
  else
    echo "none"
  fi
}

_select() {
  selected=$(printf "%s\n" "${CATEGORIES[@]}" | sk --margin 25% --color="bw" --reverse)
  [[ "$selected" == "" ]] && exit 1

  if [[ "$selected" == "stop" ]]
  then _stop
  else  timew start "$selected"
  fi
}

case "${1:-}" in
  status) _status ;;
  stop)   _stop   ;;
  *)      _select ;;
esac
