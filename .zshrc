# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/SRavi-MacBook/.oh-my-zsh"

#ZSH_THEME="lambda-mod"

ZSH_DISABLE_COMPFIX=true

export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(git autojump fzf zsh-z kubectl aws zsh-syntax-highlighting python zsh-autosuggestions history)

SHOW_AWS_PROMPT=false
#AWS_DEFAULT_PROFILE=automation
#ZSH_THEME_AWS_PREFIX="[aws-profile:"
#ZSH_THEME_AWS_SUFFIX="]"
#PROMPT='$(kube_ps1)'$PROMPT

# ZSH Options
unsetopt prompt_cr prompt_sp
autoload -U +X bashcompinit && bashcompinit
#setopt share_history
unsetopt share_history

source $ZSH/oh-my-zsh.sh

# Exports
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=/Users/$(whoami)/Library/Python/3.7/bin:/Users/$(whoami)/terraform:/Users/$(whoami)/go/bin:$PATH
export PATH="$HOME/.tgenv/bin:$PATH"
#export SSLKEYLOGFILE=/Users/$(whoami)/testws/kring/ssh_keys.txt
export LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include
export LD_LIBRARY_PATH=/usr/local/lib
export DIRENV_WARN_TIMEOUT=100s

# terraform exports
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
export TF_VAR_aws_account_role_name=AutomationRead

eval "$(direnv hook zsh bash)"

# Alias
alias cdl="cd -"
alias cs50="gcc -lcs50-9.0.0"
alias python="python3"
alias pip="pip3"
alias gs="git status"
alias ls="ls -FGp"
alias vim="nvim"
alias cim="nvim"
# alias aws="/usr/local/bin/aws"

# Auto Completions
# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# Kubectl
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# Heroku
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# fzf
#$(brew --prefix)/opt/fzf/install
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
# [ -f /Users/SRavi-MacBook/.travis/travis.sh ] && source /Users/SRavi-MacBook/.travis/travis.sh

# complete
# vault
complete -o nospace -C /Users/$(whoami)/terraform/vault vault
# AWS 
complete -C '/usr/local/bin/aws_completer' aws

# Kube PS1
# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#PS1='$(kube_ps1)'$PS1

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#export PYENV_VIRTUALENV_DISABLE_PROMPT=1

#export KUBECONFIG=~/.kube/config-clark-at-staging
export AWS_DEFAULT_REGION=eu-central-1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/repos/custom/powerlevel10k/config/p10k-pure.zsh.
[[ ! -f ~/repos/custom/powerlevel10k/config/p10k-pure.zsh ]] || source ~/repos/custom/powerlevel10k/config/p10k-pure.zsh

# tmux
export TERM=xterm-256color
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

source ~/repos/custom/powerlevel10k/powerlevel10k.zsh-theme
source ~/.iterm2_shell_integration.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

