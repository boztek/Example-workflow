#!/bin/bash
WEBROOT="$HOME/Sites"
PROJECT='workflow.com'
BUILD_ID=`date +"%d%m%Y_%H%M%S"`
PROXY="http://localhost:3128/"
DRUSH='/usr/local/drush/drush'

if [ ! -d "build" ]; then
  mkdir -pv build
fi

http_proxy="$PROXY" $DRUSH make --working-copy --prepare-install build.make build/$BUILD_ID

cd build
if [ -d "current" ]; then
  rm current
fi
ln -s $BUILD_ID current
cd ..

mv "build/$BUILD_ID/sites" "$WEBROOT/$PROJECT"
ln -s $WEBROOT/$PROJECT build/$BUILD_ID/sites
