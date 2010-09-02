#!/bin/bash
cd ~/Sites/newsite.com/htdocs/sites/newsite.local
drush sql-dump > backup.sql
drush sql-dump --add-drop-table --no-data | grep ^DROP | drush sqlc
open "http://newsite.local/install.php?profile=newsite"
