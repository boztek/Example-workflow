#!/bin/bash
PROFILE=newsite
WEBROOT="$HOME/Sites"
PROJECT=workflow.com
INSTANCE=$1

if [ "$#" -lt 1 ]; then
  echo "need a site instance"
  exit
fi

cd build/current/sites/$INSTANCE
drush sql-dump --add-drop-table --no-data | grep ^DROP | drush sqlc
open "http://$INSTANCE/install.php?profile=$PROFILE"
