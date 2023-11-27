#!/bin/bash

cd /root/stocks || exit

/usr/bin/git config --global user.email "martin.franke@datenwissenschaften.com"
/usr/bin/git config --global user.name "Martin Franke"

/usr/bin/git clean -f -d
/usr/bin/git reset --hard HEAD
/usr/bin/git fetch

CHANGED=0
/usr/bin/git remote update && /usr/bin/git status -uno | grep -q 'Your branch is behind' && CHANGED=1
if [ $CHANGED = 1 ]; then
  rm -rf /root/stocks/.git/index.lock
  /usr/bin/git pull
  /bin/bash /root/stocks/scripts/install.sh
else
  echo ""
fi
