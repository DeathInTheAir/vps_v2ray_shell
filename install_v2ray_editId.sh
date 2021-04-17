#!/bin/bash

bash < (curl -s -L https://git.io/v2ray.sh)

sed -i 's/"id": ".*/"id": "fb26fffb-91e1-4a2d-b686-b6f41907014f"/' /etc/v2ray/config.json
v2ray restart
