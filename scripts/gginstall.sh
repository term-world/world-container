#!/bin/sh

sudo python -m pip install gatorgrade --break-system-packages
site=$(python -c "import site; print(f'{site.getsitepackages()[0]}/gatorgrade/main.py')")
sudo sed -i 's/FILE = "gatorgrade.yml"/FILE = ".gatorgrade.yml"/' $site
