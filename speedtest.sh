#!/bin/bash

server_ids=(
28225
4870
)
for server_id in ${server_ids[@]};do
  speedtest -s ${server_id}
done
