cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    ds inject ssmtp.sh
    ds inject mysql.sh
    ds inject install/drupal-make.sh
    ds inject install/drupal-install.sh
    ds inject install/drupal-config.sh
    ds inject install/drush-config.sh
    ds inject install/apache2.sh
    ds inject install/set-prompt.sh
    ds inject install/misc-config.sh

    ds inject set-emailsmtp.sh
    #ds inject set-domain.sh $DOMAIN
    #ds inject set-adminpass.sh "$ADMIN_PASS"

    if [[ -n $DEV ]]; then
        ds inject phpmyadmin.sh
        ds inject dev/make-dev-clone.sh
        ds inject dev/config.sh @lbd_dev
    fi

    # drush may create some files with wrong permissions, fix them
    ds inject fix-file-permissions.sh
}
