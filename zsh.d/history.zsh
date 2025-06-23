# Copied from https://github.com/ohmyzsh/ohmyzsh/blob/d82669199b5d900b50fd06dd3518c277f0def869/lib/history.zsh

[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=500000 # Number of commands to remember in memory
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=100000 # Number of commands to save to disk
[ -z "$HISTFILE" ] && HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

setopt sharehistory # Share command history data
setopt histfindnodups # Do not display a duplicate entry when searching history
setopt histexpiredupsfirst # Expire duplicate entries first when trimming history
setopt histignoredups # Do not record an entry that was just recorded again
setopt histignorespace # Do not record an entry starting with a space
setopt histreduceblanks # Remove superfluous blanks from each command line being added to the history list
setopt histverify # Do not execute immediately upon history expansion
setopt append_history # Append history to the history file at the end of the session
setopt incappendhistory # Append history to the history file immediately after each command
setopt extended_history # Save timestamp of command in history file
