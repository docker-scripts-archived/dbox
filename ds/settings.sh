APP=labdoo/ds

### Docker settings.
IMAGE=labdoo
CONTAINER=lbd-example-org
DOMAIN="lbd.example.org"

### Uncomment if this installation is for development.
DEV=true

### Other domains.
DOMAINS="dev.lbd.example.org tst.lbd.example.org"

### Gmail account for notifications.
### Make sure to enable less-secure-apps:
### https://support.google.com/accounts/answer/6010255?hl=en
GMAIL_ADDRESS=lbd.example.org@gmail.com
GMAIL_PASSWD=

### Admin settings.
ADMIN_PASS=123456

### DB settings
DBHOST=mariadb
DBPORT=3306
DBNAME=lbd
DBUSER=lbd
DBPASS=lbd

### Uncomment #REDIS_HOST=redis to enable Drupal Redis module.
### Change hostname if needed.
### You must have a server running Redis to use this feature 
### (e.g. install `redis` docker-scripts container, https://github.com/docker-scripts/redis)

REDIS_HOST=
#REDIS_HOST=redis
