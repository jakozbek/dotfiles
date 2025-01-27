echo "Debug: Reached this point in ~/.zshrc" >&2

## OPTIONS
setopt auto_cd

# Show dotfiles in search
setopt globdots

# ZDOTDIR set in .zprofile to be $HOME/.config/zsh

# Additional source files
source $ZDOTDIR/.zsh_functions

echo "Debug: Reached this point in ~/.zshrc" >&2
export EDITOR="nvim"

# FZF
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

echo "Debug: Reached this point in ~/.zshrc" >&2
# Additonal files
zsh_add_file .zsh_aliases

echo "Debug: Reached this point in ~/.zshrc" >&2

# PLUGINS
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
#zsh_add_plugin "jeffreytse/zsh-vi-mode"
#zsh_add_plugin "Aloxaf/fzf-tab"

echo "Debug: Reached this point in ~/.zshrc" >&2

# For zoxide
eval "$(zoxide init zsh)"

# For zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# For incremental search
bindkey '^R' history-incremental-search-backward

# For completions
autoload -Uz compinit && compinit

# Load starship
eval "$(starship init zsh)"
