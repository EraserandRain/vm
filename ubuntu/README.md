# Quick Start for VMs
---
The Vagrantfile will quick start the Ubuntu VMs.
## VM Info
| VM Info        | Description  |
| -------------- | ------------ |
| Vgrant Version | 2.3.4        |
| VM Linux       | Ubuntu 18.04 |
| VM Provider    | hyperv       |
## Installation
Install Plugins
```bash
vagrant plugin install vagrant-hostmanager
```

VM Proxy Plugin ( If needs )
```bash
vagrant plugin install vagrant-proxyconf
```

## Description
When Vm nodes Up, Master Node will install the following packages.
| Package       | Description                               |
| ------------- | ----------------------------------------- |
| `pyenv`       | Manage python multiple versions of python |
| `python`      | default version is 3.10.4                 |
| `ansible` | Controller for manage nodes |
| `env-manager` | Repo contains playbooks for Vm node management               |
