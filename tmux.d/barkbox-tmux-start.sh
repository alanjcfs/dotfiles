#!/usr/bin/env zsh
tmux new -d -s barkbox
tmux split-window -h
tmux send-keys -t 0 'cd ~/Projects/barkbox-rails' Enter 'rails server' Enter
tmux send-keys -t 1 'cd ~/Projects/barkbox-assignment' Enter 'rails server' Enter
tmux new-window -n assign
tmux send-keys -t 0 'cd ~/Projects/barkbox-assignment' Enter
tmux new-window -n rails
tmux send-keys -t 0 'cd ~/Projects/barkbox-rails' Enter
tmux attach
