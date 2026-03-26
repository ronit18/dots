set fish_greeting
set TERM xterm-256color
set fish_cursor_default block
set fish_cursor_insert block

# Enable vim keybindings
function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end
bind -M insert ctrl-n down-or-search

if test -x /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)

    # Ensure brew bin exists before adding
    if not contains /opt/homebrew/bin $PATH
        set -gx PATH /opt/homebrew/bin $PATH
    end
end

if test -d $HOME/go/bin
    if not contains $HOME/go/bin $PATH
        set -gx PATH $HOME/go/bin $PATH
    end
end

if test -d $HOME/.local/bin
    if not contains $HOME/.local/bin $PATH
        set -gx PATH $HOME/.local/bin $PATH
    end
end

set -U fish_history_limit 5000

set --universal pure_color_system_time pure_color_mute
set --universal pure_check_for_new_release false
set --universal pure_enable_single_line_prompt true
set --universal pure_color_current_directory '#FA7CA6'

set -gx EDITOR nvim

source ~/.config/fish/alias.fish

if test -d "$HOME/.bun/bin"
    set --export BUN_INSTALL "$HOME/.bun"
    if not contains "$BUN_INSTALL/bin" $PATH
        set --export PATH "$BUN_INSTALL/bin" $PATH
    end
end

if type -q zoxide
    zoxide init fish | source
end
