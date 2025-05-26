#!/bin/bash

TMPDIR=$(mktemp -d /tmp/tmux-ephemeral-XXXX)
echo $TMPDIR

touch "$TMPDIR/main.cpp" "$TMPDIR/main.py"

SESS_NAME="eph-$$"

tmux new-session -d -s "$SESS_NAME" -c "$TMPDIR"

#tmux set-hook -t "$SESS_NAME" session-closed \
#	"run-shell 'echo \'hello\' && rm -rf $TMPDIR'"

# tmux set-option -t "$SESS_NAME" remain-on-exit off

tmux attach -t "$SESS_NAME"

rm -rf $TMPDIR
