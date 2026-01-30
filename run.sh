#!/usr/bin/with-contenv bashio
set -e
CONFIG_FILE=$(bashio::config 'config_file')
DATA_UNIT=$(<$CONFIG_FILE)
bashio::log.info "Reading configuration from  ${CONFIG_FILE}"
#bashio::log.info "Test ${DATA_UNIT}" 
bcg -c ${CONFIG_FILE}
