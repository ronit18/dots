function fish_prompt

    set_color white
    printf '['
    
    set_color '#00D7D7' 
    printf '%s' (whoami)
    
    set_color white
    printf '@'
    
    set_color 'FF5FAF' 
    printf '%s ' (hostname -s)
    
    set_color '#9AA0A6'
    printf '%s' (string replace $HOME '~' (pwd))
    
    set_color white
    printf ']$ '
    
    set_color normal
end

