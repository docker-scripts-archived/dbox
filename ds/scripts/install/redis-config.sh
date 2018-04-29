#!/bin/bash -x
source /host/settings.sh

if [ -n "$REDIS_HOST" ];
then
	drupal_settings=$DRUPAL_DIR/sites/default/settings.php
	drush="drush --root=$DRUPAL_DIR --yes"
	$drush `drush sa | head -n 1` dl redis # use first site e.g. @local_proj
	apt install -y php-redis redis-tools
	echo "
// Redis settings
\$conf['redis_client_interface'] = 'PhpRedis';
\$conf['redis_client_host'] = '$REDIS_HOST';
\$conf['lock_inc'] = 'sites/all/modules/redis/redis.lock.inc';
\$conf['path_inc'] = 'sites/all/modules/redis/redis.path.inc';
\$conf['cache_backends'][] = 'sites/all/modules/redis/redis.autoload.inc';
\$conf['cache_default_class'] = 'Redis_Cache';
" >> $drupal_settings

	service apache2 restart
fi

