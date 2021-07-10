function unlock() {
  eval $(op signin my)
}
function opsearch() {
  op list items | jq -r --arg term $1 '.[] | select(.overview.title | match($term;"i")) | .overview.title + ":\t" + .uuid'
}
function opget(){
  op get item $1 | jq -r '.details.fields[] | select(.designation == "password") | .value'
}
function opcopy(){
 opget $1 | xargs echo -n | xclip -selection c
}

function reset_microk8s() {
  # Unregister the 'micro' controller from Juju
  juju unregister micro -y  
  # Purge and reinstall microk8s
  sudo bash -c "snap remove --purge microk8s && \
  snap install --classic microk8s && \
  microk8s status --wait-ready && \
  microk8s enable storage dns ingress"
  # Bootstrap the new cluster
  juju bootstrap microk8s micro
  # Add a default model and configure the logging
  juju add-model development
  juju model-config logging-config="<root>=INFO;unit=DEBUG"
}
