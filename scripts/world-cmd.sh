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

# Additional package settings

source /etc/profile.d/world-market.sh
source /etc/profile.d/world-helper.sh

# Chompchain

alias cmd_txn='f(){ last_cmd=$(history 1 | cut -c 8- | sed '\''s#\x22#\\x22#g'\'')
python -c "from chompchainwallet.transaction import CmdTransaction;
CmdTransaction(\"$last_cmd\")"; unset -f f;}; f'

PROMPT_COMMAND=cmd_txn
