### shell

This is an Ansible role to install baseline command line utlities, zsh and oh-my-zsh along with all the config to go with:

- zsh
- oh-my-zsh
- zsh plugins
- vim, vundle and vimrc
- tmux and config
- exa
- bat

Oh-my-zsh is installed for the current user and root user, with a smaller stripped out zshrc for root.

#### Variables

Defaults:

```yaml
---
install_dir: /usr/local/bin
tmp_dir: /tmp

exa_version: 0.9.0
exa_checksum: "sha256:53d8746b1ca2d945c5b75767edc83addfd1fe3c4a2b0b766c07172473330a50b"
install_exa: true

bat_version: 0.16.0
bat_checksum: "sha256:a9e2d7f5ad5962bca8bd742536c80f9d4d5f42cb1b160bf19671907c3507ab1e"
install_bat: true
```
