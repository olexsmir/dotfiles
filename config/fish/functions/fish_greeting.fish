function fish_greeting
  if type -q todo.sh
    TODOTXT_VERBOSE=0 todo.sh listpri a
  end
end
