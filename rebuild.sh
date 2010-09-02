#!/bin/bash

PROXY='http_proxy="http://localhost:3128/"'
DRUSH='/usr/local/bin/drush'
PROJECT='newsite'

if [ -f "$PROJECT.make" ]; then
  http_proxy="http://localhost:3128/" $DRUSH make --working-copy --no-core --contrib-destination=. "$PROJECT.make" --yes
else
  echo "no inside profile - not sure what to do"
fi
