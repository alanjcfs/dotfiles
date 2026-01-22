# Copied from https://github.com/ohmyzsh/ohmyzsh/blob/d82669199b5d900b50fd06dd3518c277f0def869/lib/completion.zsh
zmodload -i zsh/complist # Load the completion system required for menuselect

unsetopt menucomplete # Do not autoselect the first completion entry
unsetopt flowcontrol # Do not start a new command after pressing ^S
setopt automenu # Pressing tab key repeatedly cycles through completions
setopt completeinword # Allow completion within a word
setopt always_to_end # Move cursor to the end of a completed word

bindkey -M menuselect '^o' accept-and-infer-next-history # Accept the current completion and add a space
zstyle ':completion:*:*:*:*:*' menu select # Use menu selection for completion
zstyle ':completion:*' special-dirs true # Enable special directory completion . and ..
zstyle ':completion:*' list-colors '' # Disable colors in completion list
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01' # Colorize kill completion list
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories # Order directories first in completion list
zstyle ':completion:*' use-cache yes # Cache completion results
zstyle ':completion:*' cache-path $ZSH_CACHE_DIR # Cache completion results in $ZSH_CACHE_DIR
# Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
        clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
        gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
        ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
        named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
        operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
        rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
        usbmux uucp vcsa wwwrun xfs '_*'
# ... unless we really want to.
zstyle '*' single-ignored show

if [[ ${COMPLETION_WAITING_DOTS:-false} != false ]]; then
  expand-or-complete-with-dots() {
    # use $COMPLETION_WAITING_DOTS either as toggle or as the sequence to show
    [[ $COMPLETION_WAITING_DOTS = true ]] && COMPLETION_WAITING_DOTS="%F{red}…%f"
    # turn off line wrapping and print prompt-expanded "dot" sequence
    printf '\e[?7l%s\e[?7h' "${(%)COMPLETION_WAITING_DOTS}"
    zle expand-or-complete
    zle redisplay
  }
  zle -N expand-or-complete-with-dots
  # Set the function as the default tab completion widget
  bindkey -M emacs "^I" expand-or-complete-with-dots
  bindkey -M viins "^I" expand-or-complete-with-dots
  bindkey -M vicmd "^I" expand-or-complete-with-dots
fi

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# tmuxinator completion (find dynamically since gem path includes Ruby version)
if command -v tmuxinator &>/dev/null; then
  _tmuxinator_completion=$(gem contents tmuxinator 2>/dev/null | grep 'tmuxinator\.zsh$')
  [[ -r "$_tmuxinator_completion" ]] && source "$_tmuxinator_completion"
  unset _tmuxinator_completion
fi
