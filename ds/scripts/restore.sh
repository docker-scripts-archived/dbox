#!/bin/bash -x

restore_custom_scripts() {
    if [[ ! -f /host/backup.sh ]] && [[ -f backup.sh ]]; then
        cp backup.sh /host/
    fi
    if [[ ! -f /host/restore.sh ]] && [[ -f restore.sh ]]; then
        cp restore.sh /host/
    fi
    if [[ ! -d /host/cmd ]] && [[ -d cmd ]]; then
        cp -a cmd /host/
    fi
    if [[ ! -d /host/scripts ]] && [[ -d scripts ]]; then
        cp -a scripts /host/
    fi
}

# go to the backup directory
backup=$1
cd /host/$backup

# restore lbd users
drush @lbd sql-query --file=$(pwd)/lbd_users.sql

# delete any existing content
drush --yes @lbd pm-enable delete_all
drush --yes @lbd delete-all all --reset

# enable features
while read feature; do
    drush --yes @lbd pm-enable $feature
    drush --yes @lbd features-revert $feature
done < lbd_features.txt

# restore private variables
drush @lbd php-script $(pwd)/restore-private-vars-lbd.php

# restore twitter configuration
if [[ -f trc ]]; then
    cp trc /home/twitter/.trc
    chown twitter: /home/twitter/.trc
fi

# restore any custom scripts
restore_custom_scripts

# custom restore script
[[ -f /host/restore.sh ]] && source /host/restore.sh
