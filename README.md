## jnsgruk's dotfiles

This repository contains the dotfiles, and some lightweight automation in the form of some `bash`
scripts that make it easy to get started.

### TL;DR

To get started really fast with my shell/terminal config, you can:

```bash
$ wget https://jnsgr.uk/provision
$ bash provision
```

### Automation Breakdown

For shell/terminal config, the most interesting parts here are:

- `./scripts/install-packages-shell` - installs software needed for `zsh`/`vim`/`tmux` setup.
- `./scripts/link-configs-shell` - symlinks configs/s for my `zsh`/`vim`/`tmux` setup.
- `./scripts/install-fonts` - installs a couple of nice fonts (including fancy powerline fonts).

There is also some automation to get a functioning desktop using `sway`:

- `./scripts/install-packages-sway` - installs various packages needed for my `sway` setup.
- `./scripts/link-configs-sway` - symlinks configs/dotfiles for `sway` setup.

When installing packages for `sway`, if on Arch Linux, packages will be installed from the AUR, if
on Ubuntu, then some will be installed from the archives, but some will be compiled from source to
ensure that I have the correct versions that support the features I use.
