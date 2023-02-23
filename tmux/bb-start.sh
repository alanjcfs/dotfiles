#!/usr/bin/env zsh
tmux new -d -s box
tmux rename-window -t 0 servers
tmux split-window -h # creates two vertical panes, and run the servers
tmux send-keys -t 0 'api' Enter 'rails server -p 5000' Enter
tmux send-keys -t 1 'asi' Enter 'rails server -p 5001' Enter

# Create window 9 for background workers
tmux new-window -t 9 -n workers
tmux split-window -h
tmux send-keys -t 0 'api' Enter 'bundle exec sidekiq -c 5' Enter
tmux split-window -t 0 \; send-keys -t 1 'api' Enter 'bundle exec sidekiq -C $SKQ -c 5' Enter
tmux send-keys -t 2 'asi' Enter 'bundle exec sidekiq -c 5' Enter
tmux split-window -t 2 \; send-keys -t 3 'elasticsearch' Enter

# Create new windows and select asi as the landing screen
tmux new-window -n api \; send-keys 'api' Enter
tmux new-window -n asi \; send-keys 'asi' Enter
tmux select-window -t 2 \; attach
