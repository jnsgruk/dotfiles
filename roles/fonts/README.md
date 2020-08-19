### fonts

This is an Ansible role to install the following fonts:

- Meslo LGMDZ Nerd Font
- San Francisco Pro

Currently tested on Ubuntu and Arch Linux. Role will test to see if there is a GUI on the machine by inspecting the DISPLAY and WAYLAND_DISPLAY environment variables. This behavious can be overridden with the `fonts_force` variable.

Fonts are installed to `/usr/share/fonts/custom`

#### Variables

```yaml
---
display: "{{ lookup('env','DISPLAY') }}{{ lookup('env', 'WAYLAND_DISPLAY') }}"
fonts_force: no # Install even if there is no display detected
install_dir: /usr/share/fonts/custom
tmp_dir: /tmp
```
