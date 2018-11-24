#!/bin/bash -x

# go to the backup directory
backup=$1
cd /host/$backup

# restore lbd users
drush @lbd sql-query --file=$(pwd)/lbd_users.sql

# enable features
while read feature; do
    drush --yes @lbd pm-enable $feature
    drush --yes @lbd features-revert $feature
done < lbd_features.txt

# restore private variables
drush @lbd php-script $(pwd)/restore-private-vars-lbd.php

# restore twitter configuration
[[ -f trc ]] && cp trc /home/twitter/.trc

# custom restore script
[[ -f /host/restore.sh ]] && source /host/restore.sh

# restore any custom scripts
[[ -f /host/backup.sh ]] || cp backup.sh /host/
[[ -f /host/restore.sh ]] || cp restore.sh /host/
[[ -d /host/cmd ]] || cp -a cmd /host/
[[ -d /host/scripts ]] || cp -a scripts /host/

