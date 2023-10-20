#!/bin/sh
if ! tmux new -d -s box; then
  exit 1
fi
tmux rename-window -t 0 servers
tmux split-window -h # creates two vertical panes, and run the servers
# tmux send-keys -t 0 'api' Enter
# tmux send-keys -t 1 'asi' Enter
#
# # Create window 9 for background workers
tmux new-window -t 9 -n workers
# tmux split-window -h
#
# # Create new windows and select asi as the landing screen
tmux new-window -n api \; send-keys 'api' Enter
tmux new-window -n asi \; send-keys 'asi' Enter
tmux new-window -n tai \; send-keys 'tai' Enter
tmux select-window -t 2 \; attach
