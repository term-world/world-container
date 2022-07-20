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

mkdir -p city/$DISTRICT/$VS_USER/.inv

INV_FILE="city/$DISTRICT/$VS_USER/.inv/.registry"

if [[-f $INV_FILE ]]; then
  echo "NOTHING TO DO"
else
  echo "{}" >> $INV_FILE
fi

sudo -i -u $VS_USER code-server
