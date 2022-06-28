#!/bin/sh

git clone https://github.com/term-world/term-util
cd libs
cd couchsurf
pip install .
cd ../gitit
pip install .
