### Docker

This is an Ansible role to install the following tools:

- docker
- docker-compose

Currently tested on Ubuntu and Arch Linux

Docker is installed using the ditro-relevant package manager. Docker Compose is installed into `/usr/local/bin`, except on Arch Linux where it is installed using `pacman`

#### Variables

Defaults:

```yaml
---
docker_compose_version: 1.27.4
docker_compose_checksum: "sha256:04216d65ce0cd3c27223eab035abfeb20a8bef20259398e3b9d9aa8de633286d"
install_dir: /usr/local/bin
```
