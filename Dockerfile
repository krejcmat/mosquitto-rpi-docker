FROM hypriot/rpi-alpine

MAINTAINER Matej Krejci <matejkrejci@gmail.com>

LABEL Description="Eclipse Mosquitto MQTT Broker based on hypriot alpine image"

RUN apk --no-cache add mosquitto && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config && \
    chown -R mosquitto:mosquitto /mosquitto

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]