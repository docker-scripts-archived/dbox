#!/bin/bash -x

source /host/settings.sh

### settings for the database and the drupal site
site_name="Labdoo"
site_mail="$GMAIL_ADDRESS"
account_name=admin
account_pass="$ADMIN_PASS"
account_mail="$GMAIL_ADDRESS"

### start site installation
#sed -e '/memory_limit/ c memory_limit = -1' -i /etc/php/7.2/cli/php.ini
cd $DRUPAL_DIR
drush site-install --verbose --yes labdoo \
      --db-url="mysql://$DBUSER:$DBPASS@$DBHOST:$DBPORT/$DBNAME" \
      --site-name="$site_name" --site-mail="$site_mail" \
      --account-name="$account_name" --account-pass="$account_pass" --account-mail="$account_mail"

### install additional features
drush="drush --root=$DRUPAL_DIR --yes"
$drush pm-enable lbd_layout
$drush features-revert lbd_layout

$drush pm-enable bootstrap
$drush pm-enable labdoo

$drush pm-enable lbd_content

$drush pm-enable lbd_captcha
$drush features-revert lbd_captcha

#$drush pm-enable lbd_invite
#$drush pm-enable lbd_simplenews
#$drush pm-enable lbd_mass_contact
#$drush pm-enable lbd_googleanalytics

### update to the latest version of core and modules
#$drush pm-refresh
#$drush pm-update

### refresh and update translations
if [[ -z $DEV ]]; then
    $drush l10n-update-refresh
    $drush l10n-update
fi
