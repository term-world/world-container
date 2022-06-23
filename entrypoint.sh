#!/bin/sh

useradd $VS_USER -s /bin/bash
usermod -d /world/city/$DISTRICT/$VS_USER $VS_USER

cd /world

chown -R $VS_USER:$VS_USER city/$DISTRICT/$VS_USER

cd city/$DISTRICT/$VS_USER

cat /etc/profile.d/gatorgrader.sh >> city/$DISTRICT/$VS_USER/.bashrc

sudo -i -u $VS_USER code-server
