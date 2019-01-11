#!/bin/bash

set -e

# Enable the zip extension for composer
docker-php-ext-enable zip > /dev/null

# Optionally set the github oauth token
if [[ ! -z "${PLUGIN_GITHUB_TOKEN}" ]]; then
    composer config -g github-oauth.github.com ${PLUGIN_GITHUB_TOKEN}
fi

# Install prestissimo to parallelize composer install downloads
# Can be disabled by setting the `parallel` setting to false
if [[ ! -z "$PLUGIN_PARALLEL" && "$PLUGIN_PARALLEL" == "false" ]]; then
    composer global remove --quiet hirak/prestissimo
fi

# Run composer install (what we came for)
composer install --prefer-dist --no-progress --no-scripts --ignore-platform-reqs
