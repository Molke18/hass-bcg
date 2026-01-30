ARG BUILD_FROM
FROM $BUILD_FROM

WORKDIR /data
# Install requirements for add-on
RUN \
  apk add --no-cache \
  git \
    python3 py3-pip
# RUN pip3 install --no-cache-dir bcg
RUN pip3 install git+https://github.com/Molke18/bch-gateway.git@master
ADD run.sh /run.sh
RUN chmod a+x /run.sh
CMD ["/run.sh"]

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="hass-bcg" \
    io.hass.description="home assistant bcg-bigclown add-on" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Molke18" \
    org.label-schema.description="Home Assistant bcg-bigclown add-on" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="bcg-bigclown" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://github.com/Molke18/hass-bcg" \
    org.label-schema.usage="https://github.com/Molke18/hass-bcg/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/Molke18/hass-bcg" \
    org.label-schema.vendor="Hass.io Addons"
