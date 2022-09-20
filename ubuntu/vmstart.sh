#!/usr/bin/env bash

print_usage() {
    cat <<EOF
    
    Usage: $0 [OPTIONS]    

    OPTIONS:
        -u : start Ubuntu 22.04 VMs from Vagrantfile
        -h : show this help and exit    

EOF
    exit 1
}

up() {
    vagrant up --debug
}

# main
while getopts "h u q i" OPT; do
    case $OPT in
    h)
        print_usage
        ;;
    u)
        up 2>&1 | tee log/up.log
        ;;
    esac
done
