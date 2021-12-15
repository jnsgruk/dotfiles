function yubissh() {
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs | grep ssh | cut -d':' -f2)"
}
function sysssh() {
  export SSH_AUTH_SOCK="/run/user/1000/ssh-agent.socket"
  #export SSH_AUTH_SOCK="/run/user/1000/keyring/ssh"
}

function reset_microk8s() {
  # Unregister the 'micro' controller from Juju
  juju unregister micro -y  
  # Purge and reinstall microk8s
  sudo bash -c "snap remove --purge microk8s && \
  snap install --classic microk8s --channel=1.21/stable && \
  microk8s status --wait-ready && \
  microk8s enable storage dns ingress"
  # Bootstrap the new cluster
  juju bootstrap microk8s micro
  # Add a default model and configure the logging
  juju add-model development
  juju model-config logging-config="<root>=INFO;unit=DEBUG"
}
