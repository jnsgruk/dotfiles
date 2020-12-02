### cloud-tools

This is an Ansible role to install the following tools:

- kubectl
- helm
- istioctl
- cfssl
- cfssljson
- packer
- vault
- terraform
- terragrunt

By default, the tools are installed into `/usr/local/bin/`, with `/tmp` used as a staging directory for downloads/unarchiving.

Packages are preferred where they exist. Versions specified in variables are not honoured when installing with a package manager.

#### Variables

Defaults:

```yaml
---
tmp_dir: "/tmp"
install_dir: "/usr/local/bin"
architecture: "amd64"
os: "linux"
owner: root
group: root

# https://github.com/helm/helm/releases/latest
helm_version: 3.4.1
helm_checksum: "sha256:538f85b4b73ac6160b30fd0ab4b510441aa3fa326593466e8bf7084a9c288420"

# https://github.com/istio/istio/releases/latest
istioctl_version: 1.8.0
istioctl_checksum: "sha256:769ac7db4807483072426e8f1d550ee758a591d764996d752fdf22b3ce6298ff"

# https://github.com/cloudflare/cfssl/releases/latest
cfssl_version: 1.5.0
cfssl_checksum: "sha256:d5cea17ec190dd19ea300366c6fd7d2b41c8d9a599b30be79c290d1477f82c68"
cfssljson_checksum: "sha256:3d33ef410313ca242ebdae1d9092447a8b02681a2b6d21d0a272f6e8d6d5191e"

# https://www.terraform.io/downloads.html
terraform_version: 0.13.5
terraform_checksum: "sha256:f7b7a7b1bfbf5d78151cfe3d1d463140b5fd6a354e71a7de2b5644e652ca5147"

# https://www.packer.io/downloads
packer_version: 1.6.5
packer_checksum: "sha256:a49f6408a50c220fe3f1a6192ea21134e2e8f31092c507614cd27ad4f913234b"

# https://www.vaultproject.io/downloads
vault_version: 1.6.0
vault_checksum: "sha256:83048e2d1ebfea212fead42e474e947c3a3bccc5056a5158ed33f530f8325e39"

# https://github.com/gruntwork-io/terragrunt/releases
terragrunt_version: 0.26.7
terragrunt_checksum: "sha256:ac9df2de05d8fd14e3f8deb91899814461ac89f9cecb6a1fb44c8e74e1c6bf06"
```
