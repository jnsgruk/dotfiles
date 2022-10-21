if [[ "${TERM}" == "linux" ]]; then
  export STARSHIP_CONFIG="$HOME/.config/starship-plain.toml"
else
  export STARSHIP_CONFIG="$HOME/.config/starship.toml"
fi

# Custom zsh config
[[ -f "${HOME}/.zsh_config/config.zsh" ]] && source ~/.zsh_config/config.zsh
# Custom zsh functions
[[ -f "${HOME}/.zsh_config/functions.zsh" ]] && source ~/.zsh_config/functions.zsh
# Custom zsh aliases
[[ -f "${HOME}/.zsh_config/aliases.zsh" ]] && source ~/.zsh_config/aliases.zsh
# Custom zsh env
[[ -f "${HOME}/.zsh_config/env.zsh" ]] && source ~/.zsh_config/env.zsh

# Populate the SSH_AUTH_SOCK var if it isn't already.
sysssh

eval "$(starship init zsh)"
eval "$(ssh-agent -a ${SSH_AUTH_SOCK} 2> /dev/null)"

source $HOME/.zsh_config/catppuccin_macchiato-zsh-syntax-highlighting.zsh
source $HOME/.zsh_config/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [[ -z $DISPLAY ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
  source /etc/profile
  export MOZ_ENABLE_WAYLAND=1
  export SDL_VIDEODRIVER=wayland
  export _JAVA_AWT_WM_NONREPARENTING=1
  export QT_QPA_PLATFORM=wayland
  export XDG_CURRENT_DESKTOP=sway
  export XDG_SESSION_DESKTOP=sway
  exec sway >~/.cache/logs_sway.log 2>&1
fi


