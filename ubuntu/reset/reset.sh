#!/usr/bin/env bash
export LC_ALL=C

Device=`hostname -s`
cd ~ && git clone https://github.com/eraserandrain/install.git
source $HOME/install/include/common.sh

# Install
disable_needrestart
set_apt_mirror
install_ubuntu_docker
install_docker_compose
install_python3_env
install_cpp_env
install_node_env
install_zsh
# Load
load_path
load_zsh
load_nvm
load_alias
reload_zsh $Device