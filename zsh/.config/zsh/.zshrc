# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# ZSH Profile for my personal development
source ~/powerlevel10k/powerlevel10k.zsh-theme

fpath[1,0]=/Users/akozbek/.zsh/completion
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
fpath[1,0]=/usr/local/share/zsh/site-functions

# OPTIONS
setopt auto_cd

# Additional source files
source $ZDOTDIR/.zsh_functions

# COMPLETIONS
# compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit
compinit

# zsh completions
# This way the completion script does not have to parse Bazel's options
# repeatedly.  The directory in cache-path must be created manually.
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path /Users/akozbek/.zsh/cache

# Kubectl completion
source <(kubectl completion zsh)

#openssl
LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
[[ ":/Users/akozbek/.cargo/bin:/Users/akozbek/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/akozbek/.local/bin:" != *":/usr/local/opt/openssl@1.1/bin:"* ]] && PATH="/usr/local/opt/openssl@1.1/bin:/Users/akozbek/.cargo/bin:/Users/akozbek/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/akozbek/.local/bin"

# python
export PYTHONPATH=/Library/Frameworks/Python.framework/Versions/Current
export PYTHON_CONFIGURE_OPTS="--enable-shared"
alias python=python3
alias pip=pip3

# Add user install pip packages to path
export PATH="$PATH:/Users/akozbek/Library/Python/3.11/bin"

# Add doom emacs bin to path
export PATH="$PATH:/Users/akozbek/bin:/usr/local/go/bin:/Users/akozbek/.doomemacs.d/bin"

# Adds vscode-lldb to path
export PATH="$PATH:/usr/local/opt/llvm/bin"

export EDITOR="nvim"

# TODO: lazy load NVM
# Node Version Manager
# Add default node to path
# NOTE: *NOT* updated automatically
export PATH=~/.nvm/versions/node/v17.0.1/bin:$PATH

# Load NVM
export NVM_DIR=~/.nvm
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Additonal files
zsh_add_file .zsh_aliases
zsh_add_file .zsh_work_profile

# PLUGINS
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "jeffreytse/zsh-vi-mode"
zsh_add_plugin "Aloxaf/fzf-tab"

# For zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# AWS CLI Completions
autoload bashcompinit && bashcompinit

complete -C '/usr/local/bin/aws_completer' aws

# Show dotfiles in search
setopt globdots

# Sync history between sessions
setopt share_history

