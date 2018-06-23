APP=labdoo/ds

### Docker settings.
IMAGE=labdoo
CONTAINER=lbd.example.org
DOMAIN="lbd.example.org"

### Uncomment if this installation is for development.
DEV=true

### Other domains.
DOMAINS="dev.$DOMAIN tst.$DOMAIN"

### Gmail account for notifications. This will be used by ssmtp.
### You need to create an application specific password for your account:
### https://www.lifewire.com/get-a-password-to-access-gmail-by-pop-imap-2-1171882
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

### Uncomment REDIS_HOST to enable Drupal Redis module. Change hostname if needed.
### You must have a server running Redis to use this feature, for example install
### 'redis' docker-scripts container: https://github.com/docker-scripts/redis
#REDIS_HOST=redis
#REDIS_PASS='ohhebahQuahghaingeef1ifeitah5yei'
