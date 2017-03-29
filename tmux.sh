# Set some configuration options
SESSION=my_awesome_project

# Create a new, detached session
tmux new-session -d -s $SESSION

# Create a second window
tmux new-window -t $SESSION:1 -n 'webserver'

# Select and configure the first window
tmux select-window -t $SESSION:1
tmux split-window -v 
tmux send-keys 'python -m SimpleHTTPServer' C-m

# Create third window
tmux select-window -t $SESSION:1
tmux split-window -h
tmux send-keys 'this is a prefilled text'

tmux new-window -t $SESSION:2 -n 'front-end'
tmux select-window -t $SESSION:2
tmux send-keys 'gulp watch' C-m

# Attach to the session
tmux attach-session -t $SESSION
