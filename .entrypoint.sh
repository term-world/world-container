#!/bin/sh

#exec 3>&1 &>/dev/null
useradd $VS_USER -s /bin/bash
mkdir /home/$VS_USER
cd /home
chown -R $VS_USER:$VS_USER /home/dluman
cd /home/$VS_USER
su $VS_USER
