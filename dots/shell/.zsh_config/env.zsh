export HISTFILE="${HOME}/.histfile"
export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR=vim
export LSCOLORS=Gxfxcxdxbxegedabagacad

export DEFAULT_USER="jon"
export LIBVIRT_DEFAULT_URI="qemu:///system"

export GDK_CORE_DEVICE_EVENTS=1

# Go config
export GOPATH="${HOME}/go"

# snapd config if installed
if [[ -d /var/lib/snapd ]]; then
  export PATH="/snap/bin:${PATH}"
fi

export PATH="${HOME}/bin:${PATH}"
export PATH="${HOME}/nextcloud/scripts:${PATH}"
export PATH="${HOME}/.local/bin:${PATH}"

# pyenv config
if [[ -d "${HOME}/.pyenv" ]]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PYENV_BIN="${PYENV_ROOT}/shims"

  if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
  fi

  export PATH="${PYENV_BIN}:$PATH"
fi

# rbenv config
if [[ -d "${HOME}/.rbenv" ]]; then
  export RBENV_ROOT="${HOME}/.rbenv"
  export RBENV_BIN="${RBENV_ROOT}/shims"

  if command -v rbenv 1>/dev/null 2>&1; then
    eval "$(rbenv init -)"
  fi

  export PATH="${RBENV_BIN}:$PATH"
fi

