{
    "exclusive": true,
    "modules-left": [
        "sway/workspaces",
    ],
    "modules-center": [
        "clock",
        "idle_inhibitor"
    ],
    "modules-right": [
        "tray",
        "custom/scratchpad-indicator",
        "pulseaudio",
        "pulseaudio#source",
        "network",
        "battery",
        "custom/power"
    ],
    "network": {
        "format-wifi": "{essid} ({signalStrength}%) ",
        "format-ethernet": "{ifname} ",
        "format-disconnected": "",
        "max-length": 50,
        "on-click": "alacritty -e nmtui"
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
        "format": "{:%Y-%m-%d %H:%M}"
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
        "format": "{volume}% {icon}",
        "format-bluetooth": "{volume}% {icon} {format_source}",
        "format-bluetooth-muted": " {icon} {format_source}",
        "format-muted": "",        
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
        "on-click": "volumectl toggle-mute",
        "on-click-right": "pavucontrol"
    },
    "pulseaudio#source": {
        "format": "{format_source}",
        "format-source": "",
        "format-source-muted": "",
        "on-click": "volumectl -m toggle-mute",
        "on-click-right": "pavucontrol"
    },
    "custom/power": {
        "format": "",
        "on-click": "power-menu"
    },
}
