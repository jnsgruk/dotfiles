# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="${HOME}/.oh-my-zsh"

if [[ "${TERM}" == "linux" ]]; then
  export ZSH_THEME="ys"
  plugins=(git pyenv kubectl zsh-syntax-highlighting)
else
  export ZSH_THEME="powerlevel10k/powerlevel10k"
  export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=243"
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f "${HOME}/.zsh_config/p10k.zsh" ]] || source ~/.zsh_config/p10k.zsh
  plugins=(git pyenv kubectl zsh-autosuggestions zsh-syntax-highlighting)
fi

source "${ZSH}/oh-my-zsh.sh"

# Custom zsh config
[[ -f "${HOME}/.zsh_config/config.zsh" ]] && source ~/.zsh_config/config.zsh
# Custom zsh functions
[[ -f "${HOME}/.zsh_config/functions.zsh" ]] && source ~/.zsh_config/functions.zsh
# Custom zsh aliases
[[ -f "${HOME}/.zsh_config/aliases.zsh" ]] && source ~/.zsh_config/aliases.zsh
# Custom zsh env
[[ -f "${HOME}/.zsh_config/env.zsh" ]] && source ~/.zsh_config/env.zsh
# Created by `userpath` on 2020-11-13 08:10:16
export PATH="$PATH:/home/jon/.local/bin"
