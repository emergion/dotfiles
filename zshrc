source /etc/zshrc
# --------------------------------------------------------------------------------
# ZSH Options
# --------------------------------------------------------------------------------
export EDITOR='nvim'        # Set NeoVim as my default editor
export PAGER="less -FirSwX" # Use less as the default pager
export MANPAGER="$PAGER"    # Use default pager for reading man pages
HISTFILE=~/.histfile        # Where to save history
HISTSIZE=5000               # Length of history to keep in buffer
SAVEHIST=10000              # Length of history to save
setopt share_history        # Share history between sessions
setopt autocd               # Enter directory name to cd to that directory
setopt prompt_subst         # Re-evaluate, expand prompt on each command
bindkey -v                  # Use VI key bindings

# --------------------------------------------------------------------------------
# Alias and Bindings
# --------------------------------------------------------------------------------

# Allow editing of current command
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey '^k' history-beginning-search-backward
bindkey '^j' history-beginning-search-forward # vim style searching

alias ls="ls --color -l"
alias hi='history | tail -20'
alias vi=nvim
alias vim=nvim
alias sc="sudo systemctl"
alias v=nvim
alias g=git
alias gr=grep
alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'
alias grom="git pull -r origin master"

# --------------------------------------------------------------------------------
# Environment Setup
# --------------------------------------------------------------------------------

# Golang environment setup
export GOPATH="$HOME/projects/go"
export PATH=$PATH:$GOPATH/bin

# https://github.com/junegunn/fzf#respecting-gitignore-hgignore-and-svnignore
export FZF_DEFAULT_COMMAND='ag -g ""'

export $(gnome-keyring-daemon -s)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(direnv hook zsh)"

. $HOME/.asdf/asdf.sh
