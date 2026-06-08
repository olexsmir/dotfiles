# tmux-yank replacement, yank to system clipboard from copy mode

if-shell 'command -v wl-copy' 'set -g @_yank_cmd "wl-copy"'
if-shell 'command -v pbcopy' 'set -g @_yank_cmd "pbcopy"'
if-shell 'command -v xclip' 'set -g @_yank_cmd "xclip -selection clipboard"'

bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel "#{@_yank_cmd}"
bind-key -T copy-mode-vi Y send -X copy-pipe-and-cancel "#{@_yank_cmd}" \; paste-buffer
bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "#{@_yank_cmd}"
