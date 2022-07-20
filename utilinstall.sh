#!/bin/sh

git clone https://github.com/term-world/term-util
cd term-util
cd libs
cd couchsurf
pip install .
cd ../gitit
pip install .
cd ../inventory
dotenv set INV_PATH ~/.inv
dotenv set INV_REGISTRY .registry
pip install .
cd ../narrator
pip install .
