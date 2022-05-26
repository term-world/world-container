#!/bin/sh

#exec 3>&1 &>/dev/null
useradd $VS_USER -s /bin/bash
cd /home
chown -R $VS_USER:$VS_USER /home/$VS_USER
sudo -i -u $VS_USER code-server
