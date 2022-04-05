# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH Profile for my personal development
source ~/powerlevel10k/powerlevel10k.zsh-theme

fpath[1,0]=/Users/akozbek/.zsh/completion
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
fpath[1,0]=/usr/local/share/zsh/site-functions

# compinstall
zstyle :compinstall filename '/Users/akozbek/.zshrc'
autoload -Uz compinit
compinit

# zsh completions
# This way the completion script does not have to parse Bazel's options
# repeatedly.  The directory in cache-path must be created manually.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path /Users/akozbek/.zsh/cache

#openssl
LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
[[ ":/Users/akozbek/.cargo/bin:/Users/akozbek/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/akozbek/.local/bin:" != *":/usr/local/opt/openssl@1.1/bin:"* ]] && PATH="/usr/local/opt/openssl@1.1/bin:/Users/akozbek/.cargo/bin:/Users/akozbek/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/akozbek/.local/bin"

# python
export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/Current
alias python=python3
alias pip=pip3

# Enable vim in terminal
bindkey -v
export KEYTIMEOUT=1
bindkey "^?" backward-delete-char

# The below commented out lines significantly slow down zsh when used
# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

setopt auto_cd

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Additional source files
source $ZDOTDIR/.zsh_functions
source $ZDOTDIR/.zsh_aliases
source $ZDOTDIR/.zsh_work_profile

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
