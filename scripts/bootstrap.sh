#!/bin/bash

cd /watch || exit

/usr/bin/git config --global user.email "$GIT_EMAIL"
/usr/bin/git config --global user.name "$GIT_NAME"

/usr/bin/git clean -f -d
/usr/bin/git reset --hard HEAD
/usr/bin/git fetch

CHANGED=0
/usr/bin/git remote update && /usr/bin/git status -uno | grep -q 'Your branch is behind' && CHANGED=1
if [ $CHANGED = 1 ]; then
  /bin/rm -rf /watch/.git/index.lock
  /usr/bin/git pull
  if [ -f "/watch/scripts/update.sh" ]; then
    /bin/bash /watch/scripts/update.sh
  else
    echo ""
  fi
else
  echo ""
fi