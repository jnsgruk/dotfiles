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
# SSH into a libvirt vm by name
function vssh() {
  # Get VM Status
  state=$(virsh list --all | grep $1 | tr -s " " | cut -d " " -f4-)

  if [[ $state == "shut off" ]]; then
    # Start the VM
    echo -e "\e[92m[+] Starting VM\e[0m"
    virsh start $1 >/dev/null
    # Wait for it to have an address
    while ! (virsh domifaddr $1 >/dev/null 2>&1); do
      sleep 1
    done
  elif [[ $state == "paused" ]]; then
    # Resume the VM
    echo -e "\e[92m[+] Resuming VM\e[0m"
    virsh resume $1 >/dev/null
  fi

  ip_addr=$(virsh domifaddr $1 | tail -n-2 | tr -s " " | cut -d" " -f5 | cut -d"/" -f1)
  
  echo -e "\e[92m[+] Waiting for SSH to become available on ${ip_addr}\e[0m"
  while ! (nc -w1 "${ip_addr}" 22 >/dev/null 2>&1); do
    sleep 1
  done

  ssh "${@:2}" $ip_addr 
}

