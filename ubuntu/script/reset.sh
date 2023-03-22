#!/usr/bin/env bash
export LC_ALL=C

Device=$(hostname -s)
cd $HOME && git clone https://github.com/eraserandrain/env-manager.git
cd $HOME/env-manager

# Other Settings
bash init.sh
./update_local_zsh.sh -c