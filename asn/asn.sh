#!/bin/bash

pyasn_util_asnames.py > asn.json
pyasn_util_download.py -4

rib=$(ls -t rib.*.bz2 | head -1)
pyasn_util_convert.py --single $rib IPASN.DAT;  rm -f $rib

git config user.email "you@example.com" && git config user.name "Your Name"
/usr/bin/git add .
/usr/bin/git commit -am "updates"
/usr/bin/git push
