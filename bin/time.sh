#!/usr/bin/env bash
# hledger -f "$HOME/org/time.timeclock" balance --daily -p 'this week'
#
# sudo groupadd hostblock
# sudo usermod -aG hostblock olex
# sudo chown root:hostblock /etc/hosts
# sudo chmod 664 /etc/hosts

readonly TC="$HOME/org/time.timeclock"
readonly CATS=$'stop\nWORK\nVIM\nWASTE'
readonly BLOCKED=("news.ycombinator.com" "www.lobste.rs" "www.twitch.tv" "www.reddit.com" "www.chess.com" "www.lichess.org") # "www.youtube.com" "youtube.com"

now() { date '+%Y-%m-%d %H:%M:%S'; }
current() { awk '/^[io]/ { last_type=$1; last_cat=$4 } END { if (last_type == "i") print last_cat }' "$TC"; }
stop_tracking() { [[ -n "$(current)" ]] && printf 'o %s\n' "$(now)" >>"$TC"; }

block_sites() {
  for domain in "${BLOCKED[@]}"; do
    hostess "$1" "$domain" "::1" >/dev/null 2>&1
  done
}

update_tmux() {
  [[ -z "${TMUX:-}" ]] && return
  local curr=$(tmux show -gqv status-right 2>/dev/null || true)
  local clean=${curr#"#(/home/olex/bin/time.sh status)" }
  if [[ -n "${1:-}" ]]
  then tmux set -gq status-right "#($0 status)${clean:+ $clean}"
  else tmux set -gq status-right "$clean"
  fi
}

case "${1:-}" in
  status)
    open=$(current)
    [[ -n "$open" ]] && printf '%s\n' "${open#t:}"
  ;;
  ""|s)
    cat=$(printf '%s\n' "$CATS" | fzf) || exit
    [[ -z "$cat" || "$cat" == stop ]] && { stop_tracking; block_sites rm; update_tmux ""; exit; }

    stop_tracking
    printf 'i %s t:%s\n' "$(now)" "$cat" >> "$TC"
    [[ "$cat" == WASTE ]] && block_sites rm || block_sites add
    update_tmux "$cat"
  ;;
esac
