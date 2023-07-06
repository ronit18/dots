###
export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="alanpeabody"

plugins=(git
	 zsh-autosuggestions
 	 zsh-vi-mode)

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

# User configuration
# Change directory using fzf
fcd() {
  cd $(find -type d 2> /dev/null | fzf --preview 'ls -la {}' --bind 'ctrl-o:execute(cd {})')
}

# Kill a process using fzf
fkill() {
  local pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  if [ -n "$pid" ]; then
    kill -9 $pid
  fi
}

# Open files in Vim using fzf
fzfvim() {
  local files=$(fzf --preview 'bat --style=numbers --color=always {}' --query "$argv" --select-1 --exit-0)
  if [ -n "$files" ]; then
    vim $files
  fi
}

# Open a folder in Visual Studio Code using fzf
fzfcode() {
  local folder=$(fd --type d | fzf --preview 'ls -al {}' --query "$argv" --select-1 --exit-0)
  if [ -n "$folder" ]; then
    code --folder-uri=file://$folder
  fi
}



####   ARCOLINUX SETTINGS   ####
export PAGER='most'

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

setopt GLOB_DOTS
#share commands between terminal instances or not
unsetopt SHARE_HISTORY
#setopt SHARE_HISTORY

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

# Make nano the default editor

export EDITOR='nvim'
export VISUAL='nvim'

#PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/Documents/flutter/bin" ] ;
  then PATH="$HOME/Documents/flutter/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.pub-cache/bin" ] ;
  then PATH="$HOME/.pub-cache/bin:$PATH"
fi

### ALIASES ###

#list
alias ls='exa -a --icons --color=always --group-directories-first'
alias la='exa --icons --color=always'
alias ll='exa -lag --icons --color=always --group-directories-first --octal-permissions'
alias l='ls'
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'


# show the list of packages that need this package - depends mpv as example
function_depends()  {
    search=$(echo "$1")
    sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
    }

alias depends='function_depends'

#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'


#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"


#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman
alias pacman="sudo pacman --color auto"
alias update="sudo pacman -Syyu"

# paru as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
#grub issue 08/2022
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#audio check pulseaudio or pipewire
alias audio="pactl info | grep 'Server Name'"

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-m4a="yt-dlp --extract-audio --audio-format m4a "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias yta-opus="yt-dlp --extract-audio --audio-format opus "
alias yta-vorbis="yt-dlp --extract-audio --audio-format vorbis "
alias yta-wav="yt-dlp --extract-audio --audio-format wav "
alias ytv-best="yt-dlp -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"


#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#search content with ripgrep
alias rg="rg --sort path"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"


#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="reboot"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"
alias xdw="ls /usr/share/wayland-sessions"

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

alias playavi='vlc *.avi'
alias playmov='vlc *.mov'
alias playmp4='vlc *.mp4'

alias vdwm='cd ~/.local/src/dwm;vim config.h'
alias vst='cd ~/.local/src/st;vim config.h'
alias vdmenu='cd ~/.local/src/dmenu;vim config.h'
alias vdwmblocks='cd ~/.local/src/dwmblocks;vim config.h'
alias pic='cd ~/pix/Favorites/;sxiv .'
alias keysoup="sudo systemctl restart keyd && sudo systemctl enable keyd && sudo systemctl start keyd && setxkbmap -option compose:menu"



alias adt="arcolinux-desktop-trasher"


#git
alias rmgitcache="rm -r ~/.cache/git"

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

pokemon-colorscripts -r
