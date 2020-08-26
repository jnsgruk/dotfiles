#!/bin/bash
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
TOP_DIR=$( cd "$( dirname "${SCRIPT_DIR}" )" && pwd )
DIST_DIR="${TOP_DIR}/dist"

rm -rf "${DIST_DIR}"
mkdir -p "${DIST_DIR}/dotfiles"

cp -R "${TOP_DIR}/roles" "${DIST_DIR}/dotfiles/roles"
cp -R "${TOP_DIR}/dots" "${DIST_DIR}/dotfiles/dots"
cp -R "${TOP_DIR}/playbook.yml" "${DIST_DIR}/dotfiles/playbook.yml"
cp -R "${TOP_DIR}/requirements.yml" "${DIST_DIR}/dotfiles/requirements.yml"
cp -R "${TOP_DIR}/setup.sh" "${DIST_DIR}/dotfiles/setup.sh"

cd "${DIST_DIR}" || exit
tar -czf "${DIST_DIR}/dotfiles.tar.gz" dotfiles/
rm -rf "${DIST_DIR}/dotfiles"

cat <<-EOF > "${DIST_DIR}/temp.sh"
#!/bin/bash
PAYLOAD_LINE=\$(awk '/^__PAYLOAD_BELOW__/ {print NR + 1; exit 0; }' \${0})
tail -n+\${PAYLOAD_LINE} \${0} | tar xz

./dotfiles/setup.sh
exit 0
__PAYLOAD_BELOW__
EOF

cat "${DIST_DIR}/temp.sh" "${DIST_DIR}/dotfiles.tar.gz" > "${DIST_DIR}/installer.sh"
rm -rf "${DIST_DIR}/temp.sh" "${DIST_DIR}/dotfiles.tar.gz"
chmod +x installer.sh
cp "${SCRIPT_DIR}/net-provision.sh" "${DIST_DIR}/net-provision.sh" 
