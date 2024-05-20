#!/bin/sh

git clone https://github.com/term-world/term-util
cd term-util
cd libs
cd couchsurf
pip install . --break-system-packages
cd ../gitit
pip install . --break-system-packages
cd ../inventory
cd inventory
dotenv set INV_PATH ~/.inv
dotenv set INV_REGISTRY .registry
cd ..
pip install . --break-system-packages
cd ../narrator
pip install . --break-system-packages
cd ../helper
pip install . --break-system-packages
cd ../resources
pip install . --break-system-packages
cd ../worldlib
pip install . --break-system-packages
