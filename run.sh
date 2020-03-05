#!/usr/bin/env bash
# set -e
# set -x
export NODE_ENV="${NODE_ENV:development}"
echo "Docker Start To Build ======================================================start"
echo "$NODE_ENV"
echo "$REACT_APP_HOST_IP_ADDRESS"
echo "Docker Start To Build ======================================================end"
if [ $NODE_ENV == "development" ]; then
  # this runs webpack-dev-server with hot reloading
  yarn start
else
  # build the app and serve it via nginx
  yarn build
  mkdir -p $ROOT/logs/nginx
  nginx -g 'daemon off;' -c $ROOT/src/nginx.conf
  nginx -c $ROOT/src/nginx.conf
fi