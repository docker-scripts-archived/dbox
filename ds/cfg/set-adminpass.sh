#!/bin/bash -x
### Set the admin password of Drupal.

admin_pass=${1:-$ADMIN_PASS}
drush @lbd user-password admin --password="$admin_pass"
