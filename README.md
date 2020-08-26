## jnsgruk's dotfiles/automation

This repository contains both my [configs/dotfiles](./dots) and some associated Ansible [Roles](./roles) I use for setting up my machines.

### TODO/Contributing

- [ ] Update [Docker Role](./roles/docker) for RedHat/Fedora/CentOS
- [ ] Ensure this works for Raspbian/RaspberryPi OS
- [ ] Make code compliant with `ansible-lint` rules

### What does this do?

- Download and install Ansible
- Fetch any roles required from Ansible Galaxy
- Check for an `overrides.yml` file, and create one if it doesn't exist
- Offer the opportunity to edit the `overrides.yml` before contining
- Provision the host with Ansible according to the preferences in the `overrides.yml`

### Installation methods

Aside from simply cloning this repo and running the installer, like so:

```
$ git clone https://github.com/jnsgruk/dotfiles
$ ./dotfiles/setup.sh
```

There are two alternate installation methods. The [latest release](https://github.com/jnsgruk/dotfiles/releases/latest) contains two install scripts:

- [installer.sh](https://github.com/jnsgruk/dotfiles/releases/latest/download/installer.sh) is a self-contained, self-extracting installer that when run, will extract an archive of this repository into the current working directory and then run the installer
- [net-provision.sh](https://github.com/jnsgruk/dotfiles/releases/latest/download/net-provision.sh) will install `git`, then proceed to clone this repo into `~/dotfiles` and run the installer

### What is the overrides file?

The `override.yml` file is created during setup, and used to toggle which roles are applied to the machine. An example is:

```yaml
---
install_shell: true
install_desktop: false
install_fonts: false
install_pyenv: true
install_cloud_tools: true
install_azcli: false
install_docker: false
```

### What do the roles do?

There are README files for each of the Roles. They should answer any questions...
