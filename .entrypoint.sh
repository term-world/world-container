#!/bin/sh

set -x
useradd $VS_USER -s /bin/bash
mkdir /home/$VS_USER
cd /home
chown -R $VS_USER:$VS_USER /home/dluman
cd $VS_USER
su $VS_USER
