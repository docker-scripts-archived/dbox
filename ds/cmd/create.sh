cmd_create_help() {
    cat <<_EOF
    create
        Create the container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    orig_cmd_create \
        --volume $APPS/dbox:/usr/local/src/labdoo \
        --volume $(pwd)/var-www:/var/www \
        --workdir /var/www \
        --env CODE_DIR=/usr/local/src/labdoo \
        --env DRUPAL_DIR=/var/www/lbd

    rm -f labdoo
    ln -s var-www/lbd/profiles/labdoo .
}
