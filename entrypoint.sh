#!/bin/sh

useradd $VS_USER -s /bin/bash
groupadd -g $GID $DISTRICT

usermod -u $(shuf -i 3000-10000 -n1) -g $GID $VS_USER

usermod -aG $DISTRICT $VS_USER
usermod -d /world/city/$DISTRICT/$VS_USER $VS_USER

cd /world

chown -R $VS_USER:$DISTRICT city/$DISTRICT
chown -R $VS_USER:$VS_USER city/$DISTRICT/$VS_USER

cp /etc/profile.d/gatorgrader.sh city/$DISTRICT/$VS_USER/.bashrc

echo "alias get='f(){ python -c \"from inventory import Acquire\nAcquire(\\\"\$1\\\")\"; unset -f f;}; f'" >> city/$DISTRICT/$VS_USER/.bashrc
echo "alias use='f(){ python -c \"import inventory\nimport sys\ninventory.items.use(\\\"\$1\\\")\" \"\$@\"; unset -f f;}; f'" >> city/$DISTRICT/$VS_USER/.bashrc
echo "alias inventory='f(){ python -c \"import inventory\ninventory.list.display()\"; unset -f f;}; f'" >> city/$DISTRICT/$VS_USER/.bashrc

sed -i 's/FILE="gatorgrade.yml"/FILE=".gatorgrade.yml"/' /usr/local/lib/python3.10/dist-packages/gatorgrade/main.py

export INV_PATH="~/.inv"
export INV_REGISTRY=".registry"

mkdir -p city/$DISTRICT/$VS_USER/.inv

INV_FILE="city/$DISTRICT/$VS_USER/.inv/.registry"

if [ -f $INV_FILE ]; then
  echo "NOTHING TO DO"
else
  echo "{}" >> $INV_FILE
fi

sudo -i -u $VS_USER code-server
