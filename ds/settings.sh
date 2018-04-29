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

# If you want to use Redis, put its hostname or IP address here
# Else you can comment out this variable or set as empty.
# Default value is 'redis'.
REDIS_HOST=redis
