set fish_greeting # Supresses fish's intro message
set TERM xterm-256color

# Enable vim keybindings
function fish_user_key_bindings
    fish_vi_key_bindings
end

# Homebrew configuration
eval (/opt/homebrew/bin/brew shellenv)

# PATH modifications
set -x PATH $HOME/.local/bin /opt/homebrew/bin $HOME/.config/emacs/bin $PATH

# History settings
set -U fish_history_limit 5000
set -U fish_history_file ~/.fish_history

set -gx KUBECONFIG ~/.kube/config


# Use the Pure prompt
set --universal pure_color_system_time pure_color_mute
set --universal pure_check_for_new_release false
set --universal pure_enable_single_line_prompt true

source ~/.config/fish/alias.fish
