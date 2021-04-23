#!/bin/bash

# 安装日常使用软件包
apt install -y nload vim

# 安装233boy-v2ray脚本
bash v2ray.sh

# 替换v2ray id
sed -i 's/"id": ".*/"id": "fb26fffb-91e1-4a2d-b686-b6f41907014f",/' /etc/v2ray/config.json
v2ray restart
if cat /etc/v2ray/config.json |grep "fb26fffb-91e1-4a2d-b686-b6f41907014f";then
  echo "替换完成！"
fi

# 安装测速软件
apt-get install gnupg1 apt-transport-https dirmngr
export INSTALL_KEY=379CE192D401AB61
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY
echo "deb https://ookla.bintray.com/debian generic main" | sudo tee  /etc/apt/sources.list.d/speedtest.list
apt-get update
apt-get install speedtest

# 测速
bash speedtest.sh

# 修改dns解析
username=$1
password=$2
git clone https://github.com/DeathInTheAir/freenom-ddns.git
cd freenom-ddns
sed -i "s/username/${username}" config
sed -i "s/password/${password}" config
bash check.sh
