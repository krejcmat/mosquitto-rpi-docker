#!/usr/bin/env bash

cp config/mosquitto.conf /tmp/mosquitto.conf

docker run -it --restart=always \
	-p 9001:9001 \
	-p 127.0.0.1:1883:1883 \
	-p 127.0.0.1:1884:1884 \
        -v /tmp/mosquitto.conf:/mosquitto/config/mosquitto.conf \
        -v mosquitto_data:/mosquitto/data \
        -v mosquitto_data:/mosquitto/data  \
	krejcmat/mosquitto-rpi:latest
