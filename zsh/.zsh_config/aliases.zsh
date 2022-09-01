# Aliases
alias ip='ip --color'
alias ipb='ip --color --brief'
alias zshrc='vim ~/.zshrc'
alias pbcopy='xargs echo -n | xclip -selection c'
alias open='xdg-open'

# Git
alias gac='git add -A  && git commit -a'
alias gp='git push'
alias gst='git status -sb'

# Terrform Things
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply -auto-approve'
alias tfd='terraform destroy -auto-approve'
alias tfo='terraform output -json'

# Wireguard Aliases
alias wgu='sudo wg-quick up'
alias wgd='sudo wg-quick down'

# Juju Aliases
alias js="juju status"
alias jsw='watch -n1 --color "juju status --color"'
alias jsrw='watch -n1 --color "juju status --color --relations"'
alias jdl='juju debug-log'
if command -v exa >/dev/null; then
  alias ls='exa -gl --git --color=automatic'
fi

if command -v bat >/dev/null; then
  alias cat='bat'
fi

alias k="kubectl"
alias tmux="TERM=xterm-256color tmux"

alias ts="tailscale"
alias tssh="tailscale ssh"
alias tst="tailscale status"
alias tsu="tailscale up --ssh --operator=$USER"
alias tsd="tailscale down"
