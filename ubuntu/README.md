# ChangeLog

## 2023.04.23

### 安装 Ansible
Master 安装 Ansible
```bash
pip3 install ansible
ansible --version
```

设置各节点 Host
```bash
cat << EOF | sudo tee -a /etc/hosts
172.23.197.229 master
172.23.198.126 host1
172.23.202.21 host2
172.23.206.175 host3
EOF
```

### 配置主机互信
Master 生成密钥对
```bash
ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''
```
将其他节点的信息写入 Master 的 `~/.ssh/known_hosts` 文件
```bash

```