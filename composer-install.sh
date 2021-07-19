#!/bin/bash

set -e

# Enable the zip extension for composer
docker-php-ext-enable zip > /dev/null

# Optionally set the github oauth token
if [[ ! -z "${PLUGIN_GITHUB_TOKEN}" ]]; then
    composer config -g github-oauth.github.com ${PLUGIN_GITHUB_TOKEN}
fi

# Run composer install (what we came for)
composer install --prefer-dist --no-progress --no-scripts --ignore-platform-reqs
