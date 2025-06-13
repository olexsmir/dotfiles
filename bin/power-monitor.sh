#!/usr/bin/env bash
# ~~stolen~~ inspired by https://github.com/linuxmobile/kaku/blob/niri/home/services/system/power-monitor.nix

set -euo pipefail

STARTUP_WAIT=0

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >&2
}

get_battery_path() {
  local bat_path
  bat_path=$(echo /sys/class/power_supply/BAT*)
  if [[ ! -d "$bat_path" ]]; then
    log "No battery found"
    exit 1
  fi
  echo "$bat_path"
}

readonly BAT="$(get_battery_path)"
readonly BAT_STATUS="$BAT/status"
readonly BAT_CAP="$BAT/capacity"
readonly LOW_BAT_PERCENT=30

readonly AC_PROFILE="performance"
readonly BAT_PROFILE="balanced"
readonly LOW_BAT_PROFILE="power-saver"

for file in "$BAT_STATUS" "$BAT_CAP"; do
  if [[ ! -f "$file" ]]; then
    log "Required file not found: $file"
    exit 1
  fi
done

if ! command -v powerprofilesctl >/dev/null 2>&1; then
  log "powerprofilesctl not found"
  exit 1
fi

if [[ -n "''${STARTUP_WAIT:-}" ]]; then
  sleep "$STARTUP_WAIT"
fi

get_power_profile() {
  local status capacity
  status=$(cat "$BAT_STATUS")
  capacity=$(cat "$BAT_CAP")

  if [[ "$status" == "Discharging" ]]; then
    if [[ "$capacity" -gt $LOW_BAT_PERCENT ]]; then
      echo "$BAT_PROFILE"
    else
      echo "$LOW_BAT_PROFILE"
    fi
  else
    echo "$AC_PROFILE"
  fi
}

apply_profile() {
  local profile=$1
  log "Setting power profile to $profile"
  if ! powerprofilesctl set "$profile"; then
    log "Failed to set power profile"
    return 1
  fi
}

log "Starting power monitor"
prev_profile=""

while true; do
  current_profile=$(get_power_profile)

  if [[ "$prev_profile" != "$current_profile" ]]; then
    apply_profile "$current_profile"
    prev_profile=$current_profile
  fi

  if ! inotifywait -qq "$BAT_STATUS" "$BAT_CAP"; then
    log "inotifywait failed, sleeping for 5 seconds before retry"
    sleep 5
  fi
done
