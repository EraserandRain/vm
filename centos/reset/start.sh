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

# github hosts
cat <<'EOF' >>/etc/hosts
# GitHub Host Start

185.199.108.154              github.githubassets.com
140.82.112.21                central.github.com
185.199.108.133              desktop.githubusercontent.com
185.199.108.153              assets-cdn.github.com
185.199.108.133              camo.githubusercontent.com
185.199.108.133              github.map.fastly.net
199.232.69.194               github.global.ssl.fastly.net
140.82.113.3                 gist.github.com
185.199.108.153              github.io
140.82.113.4                 https://github.com
140.82.114.6                 api.github.com
185.199.108.133              raw.githubusercontent.com
185.199.108.133              user-images.githubusercontent.com
185.199.108.133              favicons.githubusercontent.com
185.199.108.133              avatars5.githubusercontent.com
185.199.108.133              avatars4.githubusercontent.com
185.199.108.133              avatars3.githubusercontent.com
185.199.108.133              avatars2.githubusercontent.com
185.199.108.133              avatars1.githubusercontent.com
185.199.108.133              avatars0.githubusercontent.com
185.199.108.133              avatars.githubusercontent.com
140.82.112.9                 codeload.github.com
52.217.136.177               github-cloud.s3.amazonaws.com
52.217.164.49                github-com.s3.amazonaws.com
52.217.164.49                github-production-release-asset-2e65be.s3.amazonaws.com
52.216.134.83                github-production-user-asset-6210df.s3.amazonaws.com
52.217.105.188               github-production-repository-file-5c1aeb.s3.amazonaws.com
185.199.108.153              githubstatus.com
64.71.144.202                github.community
185.199.108.133              media.githubusercontent.com

# Please Star : https://github.com/ineo6/hosts
# Mirror Repo : https://gitee.com/ineo6/hosts
# Update at: 2022-03-04 08:53:06

# GitHub Host End
EOF

# epel repo
yum install -y epel-release
sed -e 's|^metalink=|#metalink=|g' \
        -e 's|^#baseurl=https\?://download.fedoraproject.org/pub/epel/|baseurl=https://mirrors.ustc.edu.cn/epel/|g' \
        -i.bak \
        /etc/yum.repos.d/epel.repo
        
# install packages
yum makecache
yum -y install curl wget make inxi tree vim ntp netmap strongswan 
# set time zone
mv /etc/localtime /etc/localtime.bak
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ntpdate ntp.aliyun.com



## install cu
cd /home/ && mkdir server && ln -s /home/server / && cd /server/
wget http://down.trunkey.com/isms/centos7/abchosting.tar.gz && tar -zxvf abchosting.tar.gz

exit 0
