#!/usr/bin/env bash
export LC_ALL=C

Device=`hostname -s`
cd $HOME && git clone https://github.com/eraserandrain/install.git
source $HOME/install/include/common.sh

# Install
disable_needrestart
set_apt_mirror
install_env --node --python --cpp --ubuntu_docker --zsh
# Load
$HOME/install/zsh/update_local.sh -c
souce $HOME/.zshrc