# installed plugins
# fzf
brew install fzf
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting
brew install zsh-syntax-highlighting
# install powerline10k

# config file .zshrc

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
unsetopt prompt_cr prompt_sp
autoload -U +X bashcompinit && bashcompinit
setopt no_share_history
unsetopt share_history
source $ZSH/oh-my-zsh.sh
plugins=(git fzf zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
eval `ssh-agent` >> /dev/null
ssh-add ~/.ssh/somesshkey >> /dev/null
alias gs="git status"
alias ls="ls -FGp"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
