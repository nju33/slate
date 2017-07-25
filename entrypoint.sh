#!/bin/sh

set -eu

case  "$1" in
  "dev" ) node server.js ;;
  "build" ) bundle exec middleman build ;;
  * ) exit 1 ;;
esac

# COUNT=0
# bundle exec middleman server &
# curl localhost:4567 > /dev/null 2>&1
#
# while [ $? -ne 0 ]; do
#   COUNT=$(expr $COUNT + 1)
#   if [ $COUNT -eq 10 ]; then
#     echo "Wrong!"
#     exit 1
#   fi
#
  # sleep 1
#   curl localhost:4567 > /dev/null 2>&1
# done
#
# browser-sync start \
#   --proxy localhost:4567 \
#   --reload-debounce 3000\
#   --files /usr/src/app/source/**/*.md \
#   --no-ghost-mode \
#   --no-ui \
#   --no-open \
#   --no-notify
