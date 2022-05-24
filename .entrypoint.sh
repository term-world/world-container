#!/bin/sh

set -x

useradd $VS_USER
mkdir /home/$VS_USER
sudo su $VS_USER
cd ~
