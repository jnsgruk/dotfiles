### goenv

This is an Ansible role to install the following tools:

- `goenv`

Currently tested on Ubuntu and Arch Linux

In addition to installing the above, the role will also install a version of Go using `goenv`.

#### Variables

Defaults:

```yaml
---
goenv_set_global_go: true
goenv_go_version: 1.15.0
```
