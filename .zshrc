# Aliasing for convenience
alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Auto-sourcing
alias program="source program"
alias script="source script"

# Aliases for convenience
alias l="ls -CF"
alias la="ls -A"
alias ll="ls -alF"

alias config="git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Environment
export EDITOR=nvim
export VISUAL=nvim

add_to_path () {
    export PATH="$1:$PATH"
}

add_to_path "$HOME/scripts/"
add_to_path "$HOME/.local/bin/"
add_to_path "$HOME/.cargo/bin/"

# Keybinds
# no, we don"t want vim bindings for the shell
bindkey -e

# bind ctrl+arrow
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-kill-word
bindkey "5~" kill-word

# Rust setup
. "$HOME/.cargo/env"

# ZSH plugins
source /home/jakub/software/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /home/jakub/software/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Terminal prompt
autoload -U colors && colors
PS1="%{$fg[magenta]%}%n@%m%{$fg[green]%} %~ %{$reset_color%}%% "

# Colorization
# export LESS_TERMCAP_mb=$"\e[1;32m"
# export LESS_TERMCAP_md=$"\e[1;32m"
# export LESS_TERMCAP_me=$"\e[0m"
# export LESS_TERMCAP_se=$"\e[0m"
# export LESS_TERMCAP_so=$"\e[01;33m"
# export LESS_TERMCAP_ue=$"\e[0m"
# export LESS_TERMCAP_us=$"\e[1;4;35m"

[ -f "/home/jakub/.ghcup/env" ] && source "/home/jakub/.ghcup/env" # ghcup-env