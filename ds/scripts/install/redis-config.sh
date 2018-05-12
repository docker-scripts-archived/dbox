#!/bin/bash -x

source /host/settings.sh

[[ -n $REDIS_HOST ]] || exit 0

apt -y install php-redis
drush --root=$DRUPAL_DIR --yes dl redis

cat << EOF >> $DRUPAL_DIR/sites/default/settings.php
// Redis settings
\$conf['redis_client_interface'] = 'PhpRedis';
\$conf['redis_client_host'] = '$REDIS_HOST';
\$conf['redis_client_password'] = '$REDIS_PASS';
\$conf['lock_inc'] = 'sites/all/modules/redis/redis.lock.inc';
\$conf['path_inc'] = 'sites/all/modules/redis/redis.path.inc';
\$conf['cache_backends'][] = 'sites/all/modules/redis/redis.autoload.inc';
\$conf['cache_default_class'] = 'Redis_Cache';
\$conf['cache_prefix'] = '$CONTAINER:lbd';
EOF
