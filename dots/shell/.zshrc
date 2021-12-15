if [[ "${TERM}" == "linux" ]]; then
  export STARSHIP_CONFIG="$HOME/.config/starship-plain.toml"
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

source $HOME/.zsh_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh_config/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"