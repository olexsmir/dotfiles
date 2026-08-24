function fish_prompt
  set -l last_status $status
  set -l cwd (prompt_pwd --full-length-dirs 1)
  set -l vcs (prompt_vcs)

  set -l close_color normal
  test $last_status -ne 0; and set close_color red

  set -l vcs_segment ''
  test -n "$vcs"; and set vcs_segment (printf ' (%s%s%s%s)' (set_color blue) $vcs (set_color $close_color) '')

  printf '%s%s%s%s ' (set_color cyan) $cwd (set_color normal) $vcs_segment(set_color normal)
end
