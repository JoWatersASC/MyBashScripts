#!/bin/bash

TMPDIR=$(mktemp -d /tmp/tmux-ephemeral-XXXX)
echo $TMPDIR

touch "$TMPDIR/main.cpp" "$TMPDIR/main.py"

SESS_NAME="eph-$$"

tmux new-session -d -s "$SESS_NAME" -c "$TMPDIR"
tmux send-keys -t "$SESS_NAME" "cd $TMPDIR" Enter
tmux send-keys -t "$SESS_NAME" "clear" Enter
tmux attach -t "$SESS_NAME"

rm -rf $TMPDIR
