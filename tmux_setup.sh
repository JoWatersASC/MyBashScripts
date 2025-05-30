#!/bin/bash

mkdir -p ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm "$_/tpm"

cat << 'EOF' > ~/.tmux.conf
set -g prefix C-a
unbind C-b

set -g default-terminal 'screen-256color'
set -g status-position top

setw -g mode-keys vi
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

unbind r
bind r source-file ~/.tmux.conf

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'dracula/tmux'

set -g @dracula-plugins "weather"
# set -g @dracula-fixed-location "<Your Location>"


set -g @dracula-show-powerline true
set -g @dracula-show-flags true
set -g @dracula-show-left-icon session


run '~/.tmux/plugins/tpm/tpm'
EOF

SESS_NAME=tsess_$$

# tmux new-session -d -s "$SESS_NAME"
# tmux send-keys -t "$SESS_NAME" "C-a"

~/.tmux/plugins/tpm/bin/install_plugins &
