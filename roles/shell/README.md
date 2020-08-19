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
install_exa: true

bat_version: 0.15.4
install_bat: true
```
