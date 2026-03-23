function prompt_vcs
  set -l dir $PWD
  set -l repo_root ""
  set -l vcs_type ""
  set -l depth 0

  while test "$dir" != "/" -a $depth -lt 20
    if test -d "$dir/.jj"
      set vcs_type jj
      set repo_root $dir
      break
    end
    if test -d "$dir/.git"
      set vcs_type git
      set repo_root $dir
      break
    end
    set dir (path dirname $dir)
    set depth (math $depth + 1)
  end

  test -n "$vcs_type"; or return

  if test "$vcs_type" = jj; and command -sq jj
    set -l head (jj log --no-graph -r "@" -T "change_id.shortest()" 2>/dev/null)
    printf ' %s(jj: %s%s%s)%s' (set_color normal) (set_color blue) $head (set_color normal) (set_color normal)
    return
  end

  # git
  set -l git_dir "$repo_root/.git"
  if test -f "$git_dir"
    read -l gitdir_line < "$git_dir"
    set git_dir (string replace "gitdir: " "" -- $gitdir_line)
  end

  set -l head_file "$git_dir/HEAD"
  test -f "$head_file"; or return

  read -l head_content < "$head_file"

  if string match -qr '^ref: refs/heads/' -- $head_content
    set -l branch (string replace 'ref: refs/heads/' '' -- $head_content)
    printf ' %s(%s%s%s)%s' (set_color normal) (set_color blue) $branch (set_color normal) (set_color normal)
  else
    printf ' %s(%s%s%s)%s' (set_color normal) (set_color blue) (string sub -l 7 -- $head_content) (set_color normal) (set_color normal)
  end
end
