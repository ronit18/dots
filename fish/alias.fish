# ALIASES
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias vim='nvim'
alias v='nvim'
alias rmgit='rm -rf .git'
alias docs='cd ~/Documents/'
alias desk='cd ~/Desktop/'
alias dl='cd ~/Downloads/'
alias yt='cd ~/yt/'
alias tmp='cd ~/dev/tmp/'
alias cx='z'
alias rmgitcache='rm -r ~/.cache/git'
alias c='code '
alias tmux='tmux'
alias dev='cd ~/dev/'

# Git aliases
alias gs='git status'
alias gpa='git add -p'
alias ga.='git add -A'
alias lz='lazygit'
alias gz='lazygit'
alias gs='git status'
alias ga='git add'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gl='git log'
alias gpl='git pull'
alias gpu='git push'
alias grm='git rm'
alias ggp='git push'
alias gcl='git clone'
alias lz='lazygit'
alias gitlog='git log --format=%s '

alias nm="nmap -sC -sV -oN nmap"

# Docker
alias dps="docker ps"
alias dpa="docker ps -a"
alias dpl="docker ps -l -q"
alias dx="docker exec -it"
alias dexec="docker exec -it"
alias dlog="docker logs -f"
alias rmcontainer='docker container rm -f $(docker container ls -aq)'

# list
alias ls='eza -a --icons --color=always --group-directories-first'
alias la='eza --icons --color=always'
alias ll='eza -S -lag --icons --color=always --group-directories-first --octal-permissions'
alias l='ls'
alias lt='eza --level=2 --git -aT --color=always --group-directories-first' # tree listing
alias l.='eza --git -a | egrep "^\."'

# fix obvious typos
alias cd..='cd ..'

# Kubernetes
alias k="kubectl"
alias kns='kubens'
alias kcd='kubectx -d'
alias kget="kubectl get"
alias kgetpods="kubectl get pods"
alias kdel="kubectl delete"
alias klogs="kubectl logs -f"
alias kdesc="kubectl describe"
alias kapply="kubectl apply -f"
alias kexec="kubectl exec -it"
alias kwatch="watch kubectl get pods"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'
alias kube='kubectl --insecure-skip-tls-verify=true '

alias cl='clear'

# Colorize the grep command output for ease of use (good for log files)
alias grep='grep --color=auto'

# System
alias flushdns="sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ipa="ifconfig | grep 'inet ' | grep -v 127.0.0.1"
alias df="df -h"
alias brewup="brew update && brew upgrade && brew cleanup && brew autoremove" # Update Homebrew
alias myip="curl ifconfig.me" # Get external IP
alias findbig="find . -type f -size +100M"

alias ports="sudo lsof -i -P -n | grep LISTEN" # List open ports
alias whoison="arp -a"
alias pyserve="python3 -m http.server"
alias up="python3 -m http.server"
alias ff='fastfetch'
alias g='git'
