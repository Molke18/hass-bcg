#!/usr/bin/with-contenv bashio
set -e

MQTT_USERNAME=$(bashio::config 'mqtt_username')
MQTT_PASSWORD=$(bashio::config 'mqtt_password')
MQTT_HOST=$(bashio::config 'mqtt_host')
MQTT_HOST_PORT=$(bashio::config 'mqtt_host_port')
USB_PORT=$(bashio::config 'usb_port')
DEBUG=$(bashio::config 'debug')
CONFIG_FILE=$(bashio::config 'config_file')
DATA_UNIT=$(<$CONFIG_FILE)

bashio::log.info "Running bcg on ${USB_PORT}. Connecting to ${MQTT_HOST} on port ${MQTT_HOST_PORT} using username ${MQTT_USERNAME} ..."
bashio::log.info "Test ${DATA_UNIT}" 

if [ "$DEBUG" = true ]
 then 
  bashio::log.info "DEBUG is ON"
  bcg -H ${MQTT_HOST} -P ${MQTT_HOST_PORT} --mqtt-username ${MQTT_USERNAME} --mqtt-password ${MQTT_PASSWORD} -d ${USB_PORT} --debug
 else
  bashio::log.info "DEBUG is OFF"
  bcg -H ${MQTT_HOST} -P ${MQTT_HOST_PORT} --mqtt-username ${MQTT_USERNAME} --mqtt-password ${MQTT_PASSWORD} -d ${USB_PORT}
fi
