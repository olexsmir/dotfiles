function prompt_vcs
  if command -sq jj; and jj root --quiet >/dev/null 2>&1
    set -l head (jj log --no-graph -r "@" -T "change_id.shortest()" 2>/dev/null)
    printf ' %s(jj: %s%s%s)%s' (set_color normal) (set_color blue) $head (set_color normal) (set_color normal)
    return
  end

  if not command -sq git
    return
  end

  set -l status_lines (command git status --porcelain=1 -b --ignore-submodules=dirty 2>/dev/null)
  if test $status -ne 0; or test (count $status_lines) -eq 0
    return
  end

  set -l branch_line $status_lines[1]
  if test -z "$branch_line"
    return
  end

  set -l branch (string replace -r '^## ' '' -- $branch_line)
  set branch (string replace -r '\\.{3}.*$' '' -- $branch)
  set branch (string replace -r '^No commits yet on ' '' -- $branch)
  if string match -qr '^HEAD' -- $branch
    set branch (command git rev-parse --short HEAD 2>/dev/null; or echo "HEAD")
  end

  set -l dirty ""
  if test (count $status_lines) -gt 1
    set dirty "*"
  end

  printf ' %s(%s%s%s%s%s)%s' (set_color normal) (set_color blue) $branch (set_color yellow) $dirty (set_color normal) (set_color normal)
end
