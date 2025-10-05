set fish_greeting # Supresses fish's intro message
set TERM xterm-256color
set fish_cursor_default block
set fish_cursor_insert block

# Enable vim keybindings
function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end
bind -M insert ctrl-n down-or-search

# Homebrew configuration
eval (/opt/homebrew/bin/brew shellenv)

# PATH modifications
set -x PATH $HOME/.local/bin /opt/homebrew/bin $PATH

# History settings
set -U fish_history_limit 5000
set -U fish_history_file ~/.fish_history

# Use the Pure prompt
set --universal pure_color_system_time pure_color_mute
set --universal pure_check_for_new_release false
set --universal pure_enable_single_line_prompt true
set --universal pure_check_for_new_release false
set --universal pure_color_current_directory '#FA7CA6'

source ~/.config/fish/alias.fish

# bun
if test -d "$HOME/.bun/bin"
    set --export BUN_INSTALL "$HOME/.bun"
    set --export PATH "$BUN_INSTALL/bin" $PATH
end

zoxide init fish | source
