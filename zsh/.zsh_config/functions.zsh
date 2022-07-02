function yubissh() {
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs | grep ssh | cut -d':' -f2)"
}

function sysssh() {
  local distro="$(grep -Po "^ID=\K.*" /etc/os-release)"
  if [[  "$distro" == "arch" ]]; then
    export SSH_AUTH_SOCK="/run/user/1000/ssh-agent.socket"
  elif [[ "$distro" == "ubuntu" ]]; then
    export SSH_AUTH_SOCK="/run/user/1000/keyring/ssh"
  fi
}

