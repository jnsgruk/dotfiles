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
export PATH="${GOPATH}/bin:${PATH}"

# pyenv/virtualenv config if installed
if [[ -d "${HOME}/.pyenv" ]]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  export PYENV_BIN="${PYENV_ROOT}/bin"

  if command -v pyenv 1>/dev/null 2>&1; then
   eval "$(pyenv init -)"
     pyenv virtualenvwrapper
  fi

  export PATH="${PYENV_BIN}:$PATH"
  export WORKON_HOME="/home/jon/code/envs"
fi

# snapd config if installed
if [[ -d /var/lib/snapd ]]; then
  export PATH="/snap/bin:${PATH}"
fi

export PATH="${HOME}/bin:${PATH}"
