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