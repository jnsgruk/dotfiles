#!/bin/bash
set -euo pipefail

echo "[+] Checking script dependencies"
if ! command -v git >/dev/null; then
  # Get the name of the distro
  DISTRO=$(grep -Po "^NAME=\"\K[a-zA-Z\s]+" /etc/os-release)
  # Do the right thing to install Ansible
  if [[ "${DISTRO}" == "Arch Linux" ]]; then
    echo "[+] Installing git" 
    sudo pacman -Sy --quiet --noprogressbar --noconfirm git >/dev/null 2>&1
  elif [[ "${DISTRO}" == "Ubuntu" ]]; then
    export DEBIAN_NONINTERACTIVE=true
    echo "[+] Updating package index"
    sudo apt-get update >/dev/null 2>&1
    echo "[+] Installing git"
    sudo apt-get install -y git >/dev/null 2>&1
  fi
fi

if [[ -d "${HOME}/dotfiles" ]]; then
  echo "[!] Directory ${HOME}/dotfiles exists. Attempting git pull..."
  git -C "${HOME}/dotfiles" pull -q origin master
else
  echo "[+] Cloning https://github.com/jnsgruk/dotfiles"
  git clone -q https://github.com/jnsgruk/dotfiles "${HOME}/dotfiles"
fi

"${HOME}/dotfiles/setup.sh"
