#! /bin/bash

for f in corn hay pumpkin squash wheat oats soya nas-chia-1
do
   
   count=$(find "/plots/$f" -type f -name \*.plot | wc -l)
   echo $count
   if [[ $count -eq 0 ]]
       then
           echo "drive /plots/$f is offline"
   fi
done
echo -n "Total: "
find  /plots -type f -name \*.plot | wc -l
