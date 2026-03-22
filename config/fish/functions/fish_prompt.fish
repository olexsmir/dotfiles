function fish_prompt
  set -l last_status $status
  set -l cwd (prompt_pwd --full-length-dirs 1)
  set -l vcs (prompt_vcs)

  switch $fish_bind_mode
    case default
      set mode_char "❮"
      set mode_color (set_color cyan)
    case '*'
      set mode_char "❯"
      if test $last_status -eq 0
        set mode_color (set_color green)
      else
        set mode_color (set_color red)
      end
  end

  printf '%s%s%s%s %s%s%s ' (set_color cyan) $cwd (set_color normal) $vcs $mode_color $mode_char (set_color normal)
end
