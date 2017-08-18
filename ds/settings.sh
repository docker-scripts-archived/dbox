APP=dbox/ds

### Docker settings.
IMAGE=labdoo
CONTAINER=lbd-example-org
SSHD_PORT=2201
#PORTS="80:80 443:443 $SSHD_PORT:22"    ## ports to be forwarded when running stand-alone
PORTS=""    ## no ports to be forwarded when running behind wsproxy

DOMAIN="lbd.example.org"

### Gmail account for notifications.
### Make sure to enable less-secure-apps:
### https://support.google.com/accounts/answer/6010255?hl=en
GMAIL_ADDRESS=
GMAIL_PASSWD=

### Admin settings.
ADMIN_PASS=
ADMIN_EMAIL=

### Uncomment if this installation is for development.
#DEV=true
