#!/bin/sh

git clone https://github.com/GatorEducator/gatorgrade.git
cd gatorgrade
cp -r gatorgrade /usr/local/lib/python3.8/dist-packages/
touch /etc/profile.d/gatorgrader.sh
echo "alias gatorgrade='python /usr/local/lib/python3.10/dist-packages/gatorgrade/main.py'" >> /etc/profile.d/gatorgrader.sh

