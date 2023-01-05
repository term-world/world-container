#!/bin/sh

useradd -u $VS_USER_ID $VS_USER -s /bin/bash
groupadd -g $GID $DISTRICT

usermod -g $GID $VS_USER

usermod -aG $DISTRICT $VS_USER
usermod -d /world/city/$DISTRICT/$VS_USER $VS_USER

cd /world

chown root:$DISTRICT city/$DISTRICT
chown -R $VS_USER:$VS_USER city/$DISTRICT/$VS_USER

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
