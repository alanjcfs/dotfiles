#!/usr/bin/env zsh
tmux new -d -s box
tmux split-window -h # creates two vertical panes, and run the servers
tmux send-keys -t 0 'api' Enter 'rails server -p 5000' Enter
tmux send-keys -t 1 'asi' Enter 'rails server -p 5001' Enter

# Horizontal Split left/api side to run sidekiq and elastic search
tmux select-pane -t 0
tmux split-window
tmux send-keys -t 1 'api' Enter 'be sidekiq' Enter
tmux split-window
tmux send-keys -t 2 'elasticsearch' Enter

# Switch to right/asi side to horizontal split and run sidekiq
tmux select-pane -t 3
tmux split-window
tmux send-keys -t 4 'asi' Enter 'be rails sidekiq -c1' Enter

# Create new windows and select asi as the landing screen
tmux new-window -n api
tmux send-keys -t 0 'api' Enter
tmux new-window -n asi
tmux send-keys -t 0 'asi' Enter
tmux select-window -t 2
tmux attach
