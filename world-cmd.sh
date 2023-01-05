#!/bin/bash

# term-world world commands, settings, and preferences

alias get='f(){ python -c "from inventory import Acquire
Acquire(\"$1\",\"$2\")"; unset -f f;}; f'
alias use='f(){ python -c "import inventory
import sys
inventory.items.use(\"$1\")" "$@"; unset -f f;}; f'
alias inventory='f(){ python -c "import inventory
inventory.list.display()"; unset -f f;}; f'
alias remove='f(){ python -c "import inventory
import sys
inventory.items.trash(\"$1\",\"$2\")" "$@"; unset -f f;}; f'
alias drop='f(){ python -c "import inventory
inventory.items.drop(\"$1\",\"$2\")" "$@"; unset -f f;}; f'
export PYTHONDONTWRITEBYTECODE=1