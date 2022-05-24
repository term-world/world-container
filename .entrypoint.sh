#!/bin/sh

set -x

useradd $VS_USER
ln -s /home/$VS_USER /home/expendable
su $VS_USER
cd ~
