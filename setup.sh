#!/bin/bash
set -euo pipefail
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "[+] Checking for Ansible command"
if ! command -v ansible >/dev/null; then
  # Get the name of the distro
  DISTRO=$(grep -Po "^NAME=\"\K[a-zA-Z\s]+" /etc/os-release)
  # Do the right thing to install Ansible
  if [[ "${DISTRO}" == "Arch Linux" ]]; then
    echo "[+] Installing Ansible" 
    sudo pacman -Sy --quiet --noprogressbar --noconfirm ansible > "${SCRIPT_DIR}/setup.log" 2>&1
  elif [[ "${DISTRO}" == "Ubuntu" ]]; then
    export DEBIAN_NONINTERACTIVE=true
    echo "[+] Updating package index"
    sudo apt-get update > "${SCRIPT_DIR}/setup.log" 2>&1
    echo "[+] Installing Ansible"
    sudo apt-get install -y ansible >> "${SCRIPT_DIR}/setup.log" 2>&1
  fi
fi

echo "[+] Downloading Ansible role dependencies"
ansible-galaxy install -r "${SCRIPT_DIR}/requirements.yml" >> "${SCRIPT_DIR}/setup.log" 2>&1

if [[ ! -f "${SCRIPT_DIR}/overrides.yml" ]]; then
  echo "[+] Creating template overrides file"
  cat <<-EOF > "${SCRIPT_DIR}/overrides.yml"
---
install_shell: true
install_desktop: true
install_fonts: true
install_pyenv: true
install_cloud_tools: true
install_azcli: true
install_docker: true
EOF
  echo
  read -p "[?] By default, all roles will be installed and configured. Do you want to adjust? [y/n] " ADJUST

  if [[ "${ADJUST}" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    "${EDITOR:-nano}" "${SCRIPT_DIR}/overrides.yml"
    echo "[+] Updated overrides file"
  fi
fi
echo
ansible-playbook -K "${SCRIPT_DIR}/playbook.yml" --extra-vars @"${SCRIPT_DIR}/overrides.yml" | tee -a "${SCRIPT_DIR}/setup.log"