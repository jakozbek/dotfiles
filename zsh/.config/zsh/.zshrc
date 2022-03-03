# ZSH Profile for my personal development

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

# NVIM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Additional source files
source $ZDOTDIR/.zsh_functions
source $ZDOTDIR/.zsh_aliases
source $ZDOTDIR/.zsh_work_profile
