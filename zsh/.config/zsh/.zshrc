## OPTIONS
setopt auto_cd

# Show dotfiles in search
setopt globdots

# ZDOTDIR set in .zprofile to be $HOME/.config/zsh

# Additional source files
source $ZDOTDIR/.zsh_functions

# Source private settings
source $ZDOTDIR/.zsh_private

export EDITOR="nvim"

# Additonal files
zsh_add_file .zsh_aliases

# PLUGINS
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"


# For zoxide
eval "$(zoxide init zsh)"

# For zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# For incremental search
bindkey '^R' history-incremental-search-backward

# For completions
autoload -Uz compinit && compinit

# ensure "python3" command uses homebrew's version of python3
alias python3=/opt/homebrew/bin/python3
# OPTIONAL: ensure "python" command uses homebrew's version of python3
alias python=/opt/homebrew/bin/python3

# Load starship
eval "$(starship init zsh)"

# For Android emulator
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# pnpm
export PNPM_HOME="/Users/jesse/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/jesse/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
