#!/usr/bin/env bash
export LC_ALL=C

Device=$(hostname -s)
cd $HOME && git clone https://github.com/eraserandrain/install.git
source $HOME/install/include/common.sh

# Other Settings
if_jammy_os disable_needrestart set_apt_mirror
set_git_config


# Install
install_env \
--node \
--python \
--cpp \
--ubuntu_docker \
--zsh

# Load
load_env \
--compose \
--nvm \
--alias \
--zsh $Device

$HOME/install/zsh/update_local.sh -c
source $HOME/.zshrc
