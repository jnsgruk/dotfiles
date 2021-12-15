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

export PATH="${HOME}/bin:${HOME}/nextcloud/scripts:${PATH}"
export PATH="$PATH:/home/jon/.local/bin"
