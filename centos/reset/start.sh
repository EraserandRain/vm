#!/bin/bash
export LC_ALL=C
sudo bash
yum -y install curl
# yum repo
curl http://81.68.78.24:8095/install/yum/centos7_yum.sh | sh 

# github hosts
curl https://raw.githubusercontent.com/EraserandRain/install/7a819d54cb790ccdbd80806e5712544de672f3d1/hosts/hosts_cron.sh | bash
        
# install packages
yum -y install curl \
wget \
make \
inxi \
tree \
vim \
ntp \
netmap \
git \
pciutils \
smartmontools \
epel-release \
net-tools \
lshw 

# set time zone
mv /etc/localtime /etc/localtime.bak
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ntpdate ntp.aliyun.com

# install docker 
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
# start docker
systemctl start docker

exit 0
