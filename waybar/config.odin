{
    "exclusive": true,
    "modules-left": [
        "sway/workspaces"
    ],
    "modules-center": [
        "clock"
    ],
    "modules-right": [
        "tray",
        "custom/scratchpad-indicator",
        "network",
        "pulseaudio",
        "pulseaudio#source",
        "battery",
        "idle_inhibitor",
        "custom/power"
    ],
    "sway/workspaces": {
        "format": "{icon}",
        "format-icons": {
            "1": "",
            "2": "",
            "3": "",
            "4": "",
            "5": "",
            "6": ""
        }
    },
    "network": {
        "format-wifi": "{essid} ",
        "format-ethernet": "{ifname} ",
        "format-disconnected": "",
		"tooltip-format":  "{ifname} / {essid} ({signalStrength}%) / {ipaddr}",
        "max-length": 15,
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
        "format": "{:%d %b %H:%M}"
    },
    "battery": {
        "states": {
            // "good": 95,
            "warning": 20,
            "critical": 10
        },
        "format": "{icon}",
        "format-charging": "",
        "format-plugged": "",
        "tooltip-format": "{capacity}% / {time}",
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
