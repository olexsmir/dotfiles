function kitty_reload
  kill -SIGUSR1 (pidof kitty | awk '{ print $1 }')
end
