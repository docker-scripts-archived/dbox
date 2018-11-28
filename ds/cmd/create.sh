cmd_create_help() {
    cat <<_EOF
    create
        Create the container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    local code_dir=$(dirname $(realpath $APP_DIR))
    mkdir -p var-www drush-cache
    orig_cmd_create \
        --mount type=bind,src=$code_dir,dst=/usr/local/src/labdoo \
        --mount type=bind,src=$(pwd)/var-www,dst=/var/www \
        --mount type=bind,src=$(pwd)/drush-cache,dst=/root/.drush/cache \
        --workdir /var/www \
        --env CODE_DIR=/usr/local/src/labdoo \
        --env DRUPAL_DIR=/var/www/lbd \
        "$@"    # accept additional options, e.g.: -p 2201:22

    rm -f labdoo
    ln -s var-www/lbd/profiles/labdoo .

    # create the database
    ds mariadb create

    # copy local commands
    mkdir -p cmd/
    [[ -f cmd/remake.sh ]] || cp $APP_DIR/misc/remake.sh cmd/
}
