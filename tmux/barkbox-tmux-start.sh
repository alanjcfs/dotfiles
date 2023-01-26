#!/usr/bin/env zsh
tmux new -d -s barkbox
tmux split-window -h # creates two vertical panes, and run the servers
tmux send-keys -t 0 'cd ~/Projects/barkbox-rails' Enter 'rails server -p 5000' Enter
tmux send-keys -t 1 'cd ~/Projects/barkbox-assignment' Enter 'rails server -p 5001' Enter

tmux select-pane -t 0
tmux split-window
tmux split-window
tmux send-keys -t 1 'elasticsearch'
tmux send-keys -t 2 'be sidekiq'
tmux send-keys -t 3 'be sidekiq -C config/sidekiq_fulfillment.yml'

tmux select-pane -t 4
tmux split-window
tmux split-window
tmux send-keys -t 5 'be rails sidekiq -c1'
tmux send-keys -t 6 'be rails sidekiq -c1'

tmux new-window -n assign
tmux send-keys -t 0 'cd ~/Projects/barkbox-assignment' Enter
tmux new-window -n rails
tmux send-keys -t 0 'cd ~/Projects/barkbox-rails' Enter
tmux select-window -t 1
tmux attach
