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
    sudo pacman -Sy --quiet --noprogressbar --noconfirm ansible 2>&1 | tee "${SCRIPT_DIR}/setup.log" > /dev/null
  elif [[ "${DISTRO}" == "Ubuntu" ]]; then
    export DEBIAN_NONINTERACTIVE=true
    echo "[+] Updating package index"
    sudo apt-get update 2>&1 | tee -a "${SCRIPT_DIR}/setup.log" > /dev/null
    echo "[+] Installing Ansible"
    sudo apt-get install -y ansible 2>&1 | tee -a "${SCRIPT_DIR}/setup.log" > /dev/null
  fi
fi

# Fetch Ansible Galaxy dependencies
echo "[+] Downloading Ansible role dependencies"
ansible-galaxy install -r "${SCRIPT_DIR}/requirements.yml" 2>&1 | tee -a "${SCRIPT_DIR}/setup.log" > /dev/null

# Check if there is already an overrides file present
if [[ ! -f "${SCRIPT_DIR}/overrides.yml" ]]; then
  echo "[+] Creating template overrides file"
  cat <<-EOF > "${SCRIPT_DIR}/overrides.yml"
---
install_shell: true
install_desktop: true
install_fonts: true
install_cloud_tools: true
install_docker: true
install_libvirt: true
EOF
  # Prompt the user if they would like to edit the default overrides (which installs everything)
  echo
  read -r -p "[?] By default, all roles will be installed and configured. Do you want to adjust? [y/n] " ADJUST
  
  # If they want to edit, then open the overrides file with their specified EDITOR, or nano if unspecified
  if [[ "${ADJUST}" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    "${EDITOR:-nano}" "${SCRIPT_DIR}/overrides.yml"
    echo "[+] Updated overrides file"
  fi
fi
# Run Ansible to install the roles!
echo
ansible-playbook -K "${SCRIPT_DIR}/playbook.yml" --extra-vars @"${SCRIPT_DIR}/overrides.yml" | tee -a "${SCRIPT_DIR}/setup.log"