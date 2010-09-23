#!/bin/bash
WEBROOT=/Users/boris/Sites
SITE=newsite.com
BUILD_ID=`date +"%d%m%Y_%H%M%S"`
http_proxy="http://localhost:3128/" /usr/local/bin/drush make build.make build/$BUILD_ID
rm -rf build/$BUILD_ID/sites
ln -s $WEBROOT/$SITE/sites build/$BUILD_ID/
cd build && rm current && ln -s $BUILD_ID current && cd ..
