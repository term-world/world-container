#!/bin/sh

useradd $VS_USER -s /bin/bash
groupadd $DISTRICT

usermod -u $(od -An -N2 -i /dev/urandom) -g $(od -An -N2 -i /dev/urandom) $VS_USER

usermod -aG $DISTRICT $VS_USER
usermod -d /world/city/$DISTRICT/$VS_USER $VS_USER

cd /world

chown -R $VS_USER:$DISTRICT city/$DISTRICT
chown -R $VS_USER:$VS_USER city/$DISTRICT/$VS_USER

cat /etc/profile.d/gatorgrader.sh >> city/$DISTRICT/$VS_USER/.bashrc

sudo -i -u $VS_USER code-server
