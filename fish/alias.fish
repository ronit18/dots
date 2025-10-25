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
alias tmp='cd ~/usr/tmp/'
alias cx='z'
alias rmgitcache='rm -r ~/.cache/git'
alias c='code '
alias dev='cd ~/usr/'
alias usr='cd ~/usr/'

# variables
set -Ux tmp ~/usr/tmp
set -Ux usr ~/usr/
set -Ux gh ~/usr/code
set -Ux config ~/.config

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
alias gl='git log --graph --oneline'
alias gpl='git pull'
alias gpu='git push'
alias grm='git rm'
alias ggp='git push'
alias gcl='git clone'
alias lz='lazygit'
alias gitlog='git log --format=%s '

alias nm="nmap -sC -sV -oN nmap"
alias nma="nmap -A -T4 -sC -sV -oN nmap"

# Docker
alias dps="docker ps"
alias dpa="docker ps -a"
alias dpl="docker ps -l -q"
alias dx="docker exec -it"
alias dexec="docker exec -it"
alias dlog="docker logs -f"
alias rmcontainer='docker container rm -f $(docker container ls -aq)'

# list
alias ls='eza -a --icons --color=auto --group-directories-first'
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
alias brewup="brew update && brew upgrade && brew cleanup && brew autoremove && brew cleanup -s" # Update Homebrew
alias myip="curl ifconfig.me" # Get external IP
alias findbig="find . -type f -size +100M"

alias ports="lsof -i -P -n | grep LISTEN" # List open ports
alias sudoports="lsof -i -P -n | grep LISTEN" # List root open ports also
alias whoison="arp -a"
alias pyserve="python3 -m http.server"
alias up="python3 -m http.server"
alias ff='fastfetch'
alias g='git'
alias ytd='yt-download '
alias mvenv 'uv venv .venv'
alias svenv 'source .venv/bin/activate.fish'

alias qr-gen 'uv run ~/.local/bin/qr-gen.py'

function sshub
    ssh -i ~/.ssh/.pem/aws-ec2.pem ubuntu@$argv
end

function cz
    cx $argv
    ls
end

function sshec
    ssh -i ~/.ssh/.pem/aws-ec2.pem ec2-user@$argv
end

function scpup
    scp -i ~/.ssh/.pem/aws-ec2.pem $argv[2] ubuntu@$argv[1]:/home/ubuntu/
end

function scpdown
    scp -i ~/.ssh/.pem/aws-ec2.pem ubuntu@$argv[1]:$argv[2] .
end
