{
    "exclusive": true,
    "modules-left": [
        "sway/workspaces",
        "sway/mode"
    ],
    "modules-center": [
        "clock",
        "idle_inhibitor"
    ],
    "modules-right": [
        "tray",
        "custom/scratchpad-indicator",
        "pulseaudio",
        "network",
        "battery",
        "custom/power"
    ],
    "sway/mode": {
        "format": "<span style=\"italic\"> {} </span>"
    },
    "network": {
        "format-wifi": "{essid} ({signalStrength}%) ",
        "format-ethernet": "{ifname} ",
        "format-disconnected": "",
        "max-length": 50,
        "on-click": "foot 'nmtui'"
    },
    "idle_inhibitor": {
        "format": "{icon}",
        "format-icons": {
            "activated": "",
            "deactivated": ""
        }
    },
    "tray": {
        "icon-size": 15,
        "spacing": 10
    },
    "clock": {
        "format": "{:%Y-%m-%d %H:%M}",
    },
    "battery": {
        "states": {
            // "good": 95,
            "warning": 20,
            "critical": 10
        },
        "format": "{capacity}% {icon}",
        "format-charging": "{capacity}% ",
        "format-plugged": "{capacity}% ",
        "format-alt": "{time} {icon}",
        "format-full": "",
        "format-icons": [
            "",
            "",
            "",
            "",
            ""
        ]
    },
    "pulseaudio": {
        // "scroll-step": 1, // %, can be a float
        "format": "{volume}% {icon} ",
        "format-bluetooth": "{volume}% {icon} {format_source}",
        "format-bluetooth-muted": " {icon} {format_source}",
        "format-muted": "0% {icon} ",
        "format-source": "{volume}% ",
        "format-source-muted": "",
        "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": [
                "",
                "",
                ""
            ]
        },
        "on-click": "pavucontrol"
    },
    "custom/power": {
        "format": "",
        "on-click": "swaynag -t warning -m 'Power Menu Options' -b 'Logout' 'swaymsg exit' -b 'Restart' 'shutdown -r now' -b 'Shutdown'  'shutdown -h now' --background=#005566 --button-background=#009999 --button-border=#002b33 --border-bottom=#002b33"
    },
    "custom/scratchpad-indicator": {
        "format-text": "{}",
        "return-type": "json",
        "interval": 3,
        "exec": "~/.local/bin/scratchpad-indicator 2> /dev/null",
        "exec-if": "exit 0",
        "on-click": "swaymsg 'scratchpad show'",
        "on-click-right": "swaymsg 'move scratchpad'"
    }
}