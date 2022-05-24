#!/bin/sh

set -x

useradd $VS_USER -s /bin/bash
ln -s /home/expendable /home/$VS_USER
su $VS_USER
cd ~
