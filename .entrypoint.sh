#!/bin/sh

set -x

usermod --login $VS_USER --home /home/$VS_USER --move-home expendable
su $VS_USER
cd ~
