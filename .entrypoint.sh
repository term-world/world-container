#!/bin/sh

set -x

useradd $VS_USER -s /bin/bash
ln -s /home/expendable /home/$VS_USER
cd /home/$VS_USER
chown -R $VS_USER:$VS_USER /home/expendable
su $VS_USER
