### pyenv

This is an Ansible role to install the following tools:

- pyenv
- pyenv-virtualenvwrapper

Currently tested on Ubuntu and Arch Linux

In addition to installing the above, the role will also install a version of Python using pyenv.

#### Variables

Defaults:

```yaml
---
pyenv_set_global_python: true
pyenv_python_version: 3.8.5
```
