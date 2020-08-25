#!/bin/bash


generate(){
    local user=$1
    ssh-keygen -t rsa -b 4096 -C "$(whoami)@$(hostname)" -f ~/.ssh/github_${user} -N ""
}

mkdir -p ~/.ssh
generate hotoku
generate dtws

cat <<EOF >> ~/.ssh/config
Host github.com.dtws
  HostName github.com
  User git
  Port 22
  IdentityFile ~/.ssh/github_dtws
  TCPKeepAlive yes
  IdentitiesOnly yes

Host github.com.hotoku
  HostName github.com
  User git
  Port 22
  IdentityFile ~/.ssh/github_hotoku
  TCPKeepAlive yes
  IdentitiesOnly yes
EOF
