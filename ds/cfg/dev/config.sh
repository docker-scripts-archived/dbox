#!/bin/bash -x

alias=${1:-@local_lbd}
tag=$2

drush --yes $alias php-script $CODE_DIR/ds/cfg/dev/config.php $tag
