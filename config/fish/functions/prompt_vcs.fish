function prompt_vcs
  set -l dir $PWD
  set -l depth 0

  while test "$dir" != / -a $depth -lt 20
    if test -d "$dir/.jj"
      _prompt_vcs_jj
      return
    else if test -d "$dir/.git"
      _prompt_vcs_git $dir
      return
    end
    set dir (path dirname $dir)
  end
end

function _prompt_vcs_seg -a label
  printf '%s%s%s' (set_color blue) $label (set_color normal)
end

function _prompt_vcs_jj
  command -sq jj; or return
  set -l head (jj log --no-graph -r @ -T 'change_id.shortest()' 2>/dev/null)
  test -n "$head"; and printf '%s%s%s%s' (set_color normal) (set_color white) 'jj: ' (set_color blue) $head (set_color normal)
end

function _prompt_vcs_git -a root
  set -l git_dir "$root/.git"
  if test -f "$git_dir"
    read -l gitdir_line < "$git_dir"
    set git_dir (string replace 'gitdir: ' '' -- $gitdir_line)
  end

  set -l head_file "$git_dir/HEAD"
  test -f "$head_file"; or return
  read -l head < "$head_file"

  set -l m (string match -r '^ref: refs/heads/(.*)' -- $head)
  _prompt_vcs_seg (test -n "$m[2]"; and echo $m[2]; or string sub -l 7 -- $head)
end
