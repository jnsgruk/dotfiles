export HISTFILE=~/.histfile
export HISTSIZE=10000
export SAVEHIST=10000

export EDITOR=vim
export HH_CONFIG=hicolor
export LSCOLORS=Gxfxcxdxbxegedabagacad

# ZSH Options 
setopt appendhistory notify #consistent history
unsetopt autocd #don't change directory automatically
bindkey -e

zstyle :compinstall filename $HOME/.zshrc
autoload -U colors && colors
autoload -Uz compinit
compinit

zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

autoload -U promptinit
promptinit

# Aliases
alias ip='ip --color'
alias ipb='ip --color --brief'
alias gac='git add -A  && git commit -a'
alias gp='git push'
alias gst='git status -sb'

# Wireguard Aliases
alias wgu='sudo wg-quick up'
alias wgd='sudo wg-quick down'

export STARSHIP_CONFIG="$HOME/.config/starship-plain.toml"
# source $HOME/.zsh_config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $HOME/.zsh_config/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"