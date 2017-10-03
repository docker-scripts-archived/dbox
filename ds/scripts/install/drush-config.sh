#!/bin/bash -x

source /host/settings.sh

mkdir -p /etc/drush

cat <<EOF > /etc/drush/local_lbd.aliases.drushrc.php
<?php
/*
  For more info see:
    drush help site-alias
    drush topic docs-aliases

  See also:
    drush help rsync
    drush help sql-sync
 */

\$aliases['lbd'] = array (
  'root' => '/var/www/lbd',
  'uri' => 'https://$DOMAIN',
  'path-aliases' => array (
    '%profile' => 'profiles/labdoo',
    '%downloads' => '/var/www/downloads',
  ),
);

// \$aliases['lbd_dev'] = array (
//   'parent' => '@lbd',
//   'root' => '/var/www/lbd_dev',
//   'uri' => 'https://dev.$DOMAIN',
// );
EOF

cat <<EOF > /etc/drush/remote.aliases.drushrc.php
<?php

/* uncomment and modify properly

\$aliases['live'] = array (
  'root' => '/var/www/lbd',
  'uri' => 'http://$DOMAIN',

  'remote-host' => '$DOMAIN',
  'remote-user' => 'root',
  'ssh-options' => '-p 2201 -i /root/.ssh/id_rsa',

  'path-aliases' => array (
    '%profile' => 'profiles/labdoo',
    '%exports' => '/var/www/exports',
    '%downloads' => '/var/www/downloads',
  ),

  'command-specific' => array (
    'sql-sync' => array (
      'simulate' => '1',
    ),
    'rsync' => array (
      'simulate' => '1',
    ),
  ),
);

\$aliases['test'] = array (
  'parent' => '@live',
  'root' => '/var/www/lbd_test',
  'uri' => 'http://test.$DOMAIN',

  'command-specific' => array (
    'sql-sync' => array (
      'simulate' => '0',
    ),
    'rsync' => array (
      'simulate' => '0',
    ),
  ),
);

*/
EOF
