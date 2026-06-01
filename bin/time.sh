#!/usr/bin/env bash
# hledger -f "$HOME/org/time.timeclock" balance --daily -p 'this week'
#
# sudo groupadd hostblock
# sudo usermod -aG hostblock olex
# sudo chown root:hostblock /etc/hosts
# sudo chmod 664 /etc/hosts

readonly TC="$HOME/org/time.timeclock"
readonly CATS=("stop" "WORK" "SEMI-WASTE" "WASTE")
readonly BLOCKED=("news.ycombinator.com" "lobste.rs" "www.reddit.com" "www.chess.com" "www.lichess.org"
                  "discord.com" "www.x.com" "bsky.app" "www.youtube.com" "youtube.com" "www.twitch.tv")

now() { date '+%Y-%m-%d %H:%M:%S'; }
current() { awk '/^[io]/ { last_type=$1; last_cat=$4 } END { if (last_type == "i") print last_cat }' "$TC"; }
stop_tracking() { [[ -n "$(current)" ]] && printf 'o %s\n' "$(now)" >>"$TC"; }

block_sites() {
  for domain in "${BLOCKED[@]}"; do
    grep -qF "::1 $domain" /etc/hosts 2>/dev/null || printf '%s\t%s\n' '::1' "$domain" >>/etc/hosts
  done
}

unblock_sites() {
  local pattern
  for domain in "${BLOCKED[@]}"; do
    pattern+="/^::1[[:space:]]\+$domain\([[:space:]]\|$\)/d;"
  done
  sed "$pattern" /etc/hosts >/tmp/hosts.tmp && cat /tmp/hosts.tmp >/etc/hosts
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
  "")
    cat=$(printf '%s\n' "${CATS[@]}" | fzf --reverse --no-info) || exit
    stop_tracking

    [[ -z "$cat" || "$cat" == stop ]] && { unblock_sites; update_tmux ""; exit; }

    printf 'i %s t:%s\n' "$(now)" "$cat" >> "$TC"
    [[ "$cat" == WASTE ]] && unblock_sites || block_sites
    update_tmux "$cat"
  ;;
esac
