#!/bin/bash
export LC_ALL=C
sudo bash
mkdir /etc/yum.repos.d/bak
mv /etc/yum.repos.d/CentOS*.repo /etc/yum.repos.d/bak

# yum base repo
cat <<'EOF' >>/etc/yum.repos.d/base.repo
[base]
name=CentOS-$releasever - Base
baseurl=https://mirrors.ustc.edu.cn/centos/$releasever/os/$basearch/
gpgcheck=0

[updates]
name=CentOS-$releasever - Updates
baseurl=https://mirrors.ustc.edu.cn/centos/$releasever/updates/$basearch/
gpgcheck=0

[extras]
name=CentOS-$releasever - Extras
baseurl=https://mirrors.ustc.edu.cn/centos/$releasever/extras/$basearch/
gpgcheck=0
EOF

# epel repo
yum install -y epel-release
sed -e 's|^metalink=|#metalink=|g' \
        -e 's|^#baseurl=https\?://download.fedoraproject.org/pub/epel/|baseurl=https://mirrors.ustc.edu.cn/epel/|g' \
        -i.bak \
        /etc/yum.repos.d/epel.repo
        
# install packages
yum makecache
yum -y install curl wget make inxi tree vim ntp
timedatectl set-timezone 'Asia/Shanghai'
ntpdate ntp.aliyun.com
exit 0
