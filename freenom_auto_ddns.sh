#!/bin/bash


uername=$1
password=$2
domname=$3
domid=$4

if [[ ! -d freenom-ddns ]];then
  git clone https://github.com/DeathInTheAir/freenom-ddns.git
fi

cd freenom-ddns
sed -i "s/username/${username}/" config
sed -i "s/password/${password}/" config
sed -i "s/domname/${domname}/" config
sed -i "s/domid/${domid}/" config
bash check.sh
