#!/bin/bash

function add_ssh() {
  echo -en "\n\nHost $1\n  HostName $2\n  User $3\n  ServerAliveInterval 30\n  ServerAliveCountMax 120" >> ~/.ssh/config
}

function sshlist() {
  awk '$1 ~ /Host$/ { print $2 }' ~/.ssh/config
}

export EC2_WEB=ubuntu@23.21.58.217
export EC2_VPN=ubuntu@107.22.224.189
