PROMPT='%F{white}[%F{#ff6ea0}%n%F{white}@%F{#53cf83}%m %F{#9AA0A6}%~%F{white}]$ %f'

# Path setup
export PATH="${HOME}/.local/bin:/opt/homebrew/bin:$PATH"

# Vi mode
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#eval "$(starship init zsh)"

# Load aliases
source ~/.zshrc-aliases


[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
