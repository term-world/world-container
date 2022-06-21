#!/bin/sh

export DISTRICT=`jq ".$VS_USER.district" .registry`

useradd $VS_USER -s /bin/bash
usermod usermod -d /home/$DISTRICT/$VS_USER $VS_USER

cd /home

chown -R $VS_USER:$VS_USER /home/$DISTRICT/$VS_USER

sudo -i -u $VS_USER code-server
