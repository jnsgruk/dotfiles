### desktop

Ansible role to install and configure:

- xdg-user-dirs
- tilix
- signal desktop
- visual studio code
- 1password
- discord
- spotify
- ~~terminator~~

Currently tested on Ubuntu and Arch Linux. Role will test to see if there is a GUI on the machine by inspecting the DISPLAY and WAYLAND_DISPLAY environment variables. This behavious can be overridden with the `desktop_force` variable.

#### Variables

```yaml
---
display: "{{ lookup('env','DISPLAY') }}{{ lookup('env', 'WAYLAND_DISPLAY') }}"
desktop_force: no # Install even if there is no display detected
```
