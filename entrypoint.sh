#!/bin/sh

useradd -u $VS_USER_ID $VS_USER -s /bin/bash
groupadd -g $GID $DISTRICT

usermod -g $GID $VS_USER

usermod -aG $DISTRICT $VS_USER
usermod -d /world/city/$DISTRICT/$VS_USER $VS_USER

cd /world

chown root:$DISTRICT city/$DISTRICT
chown -R $VS_USER:$VS_USER city/$DISTRICT/$VS_USER


if ! grep -qF "##### term-world config #####" city/$DISTRICT/$VS_USER/.bashrc; then
  echo "##### term-world config #####" >> city/$DISTRICT/$VS_USER/.bashrc
  echo "alias get='f(){ python -c \"from inventory import Acquire\nAcquire(\\\"\$1\\\")\"; unset -f f;}; f'" >> city/$DISTRICT/$VS_USER/.bashrc
  echo "alias use='f(){ python -c \"import inventory\nimport sys\ninventory.items.use(\\\"\$1\\\")\" \"\$@\"; unset -f f;}; f'" >> city/$DISTRICT/$VS_USER/.bashrc
  echo "alias inventory='f(){ python -c \"import inventory\ninventory.list.display()\"; unset -f f;}; f'" >> city/$DISTRICT/$VS_USER/.bashrc
  echo "export PYTHONDONTWRITEBYTECODE=1" >> city/$DISTRICT/$VS_USER/.bashrc
  echo "##### term-world config #####" >> city/$DISTRICT/$VS_USER/.bashrc
fi

export INV_PATH="~/.inv"
export INV_REGISTRY=".registry"

mkdir -p city/$DISTRICT/$VS_USER/.inv

INV_FILE="city/$DISTRICT/$VS_USER/.inv/.registry"

if [ -f $INV_FILE ]; then
  echo "INVENTORY FILE EXISTS!"
else
  echo "{}" >> $INV_FILE
fi

sudo -i -u $VS_USER code-server --install-extension /term-world-theme.vsix
sudo -i -u $VS_USER code-server --install-extension /term-world-launcher.vsix
sudo -i -u $VS_USER code-server
