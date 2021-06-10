#! /bin/bash

for f in corn hay pumpkin squash wheat oats soya nas-chia-1
do
   
   printf '%-11s : %s\n' "$f" `find "/plots/$f" -type f -name \*.plot | wc -l`
done
echo -n "Total: "
find  /plots -type f -name \*.plot | wc -l
