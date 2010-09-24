#!/bin/bash
if [[ $# < 1 ]]; then
  echo 
  echo "specify a site instance url to update that db to match current build:"
  echo 
  ls build/current/sites/ |grep -v all |grep -v default
  echo
  exit
fi
if [ -d build/current/sites/$1 ]; then
  cd build/current/sites/$1
  drush sql-dump > backup.sql
  drush updatedb
  exit
fi
echo "Site instance '$1' not found."
