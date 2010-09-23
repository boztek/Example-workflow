#!/bin/bash
PROFILE=newsite
WEBROOT=/Users/boris/Sites
SITE=newsite.com
INSTANCE=newsite.local

cd ~/Sites/newsite.com/htdocs/sites/newsite.local
cd $WEBROOT/$SITE/htdocs/sites/$INSTANCE
drush sql-dump > backup.sql
drush sql-dump --add-drop-table --no-data | grep ^DROP | drush sqlc
open "http://$INSTANCE/install.php?profile=$PROFILE"
