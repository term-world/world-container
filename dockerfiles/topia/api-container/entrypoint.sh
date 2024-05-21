#!/bin/sh

echo "export WORLD_NAME=topia"

ln -s /world/.python/bin/python3 /usr/bin/python

sudo code --install-extension /term-world-theme.vsix
sudo code --install-extension /term-world-launcher.vsix
sudo code --install-extension /bierner.markdown-checkbox-0.4.0.vsix
sudo code --disable-getting-started-override
