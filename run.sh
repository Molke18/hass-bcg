#!/usr/bin/with-contenv bashio
set -e
CONFIG_FILE=$(bashio::config 'config_file')
bashio::log.info "BCG reading config file: ${CONFIG_FILE}"
bcg -c ${CONFIG_FILE}
