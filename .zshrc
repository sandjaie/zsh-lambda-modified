# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

ZSH_THEME="lambda-mod"

ZSH_DISABLE_COMPFIX=true

export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(git kubectl aws zsh-syntax-highlighting)

SHOW_AWS_PROMPT=true

source $ZSH/oh-my-zsh.sh

# ZSH Options
unsetopt prompt_cr prompt_sp
autoload -U +X bashcompinit && bashcompinit
#setopt share_history
unsetopt share_history

# Exports
export LANG=en_US.UTF-8
export PATH=/Users/$(whoami)/Library/Python/3.7/bin/aws:/Users/$(whoami)/Library/Python/3.7/bin:/Users/$(whoami)/Library/Python/3.7/bin/aws_completer:/Users/$(whoami)/terraform:$PATH
#export SSLKEYLOGFILE=/Users/$(whoami)/testws/kring/ssh_keys.txt
export LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include
export LD_LIBRARY_PATH=/usr/local/lib
#export KUBECONFIG=$KUBECONFIG:~/.kube/config-playground

eval "$(direnv hook zsh bash)"

# Functions
# gitpush -- using for dummy pushes
gitpush() {
    git add "$1"
    git commit -m "$2"
    git push
}

# Use lf to switch directories and bind it to ctrl-o
# lfcd() {
#     tmp="$(mktemp)"
#     lf -last-dir-path="$tmp" "$@"
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp"
#         [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#     fi
# }
# bindkey -s '^o' 'lfcd\n'

# Alias
alias cdl="cd -"
alias cs50="gcc -lcs50-9.0.0"
alias gp=gitpush
alias python=python3
alias pip=pip3
alias gs="git status"
alias pycharm="pycharm"
alias ls="ls -FGp"
alias vim="/usr/local/bin/vim"


# Auto Completions
# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# Kubectl
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# Heroku
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

complete -o nospace -C /Users/$(whoami)/terraform/vault vault
complete -C '/Users/$(whoami)/Library/Python/3.7/bin/aws_completer' aws

# fzf
#$(brew --prefix)/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Kube PS1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#PS1='$(kube_ps1)'$PS1
