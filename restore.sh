#! /bin/bash

#should run as root

if [ "$EUID" -ne 0 ]
  then echo "running as root"
  exec sudo "$0" "$@"
  exit
fi

mount -av
docker stop chiafarm
docker rm chiafarm
docker run -it --network host  \
           -v /plots:/plots \
           -v /home/pi/.chia/mainnet/db:/root/.chia/mainnet/db \
           -v /home/pi/.chia/mainnet/log:/root/.chia/mainnet/log \
           -v /home/pi/.chia/mainnet/wallet/db:/root/.chia/mainnet/wallet/db \
       --name chiafarm chia:latest

echo "manually start for now:"
echo "cd chia_blockchain"
echo ". ./activate"
echo "chia start farmer"
