FROM alpine:latest
RUN apk add --update tini python3 py3-pip
RUN pip3 install paho-mqtt
COPY rtl_433/examples/rtl_433_mqtt_hass.py /usr/local/bin/rtl_433_mqtt_hass
RUN adduser -D -H mqtt
USER mqtt
ENV HOST="127.0.0.1"
ENV OPTIONS=""
ENV MQTT_USERNAME=""
ENV MQTT_PASSWORD=""
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/bin/sh", "-c", "/usr/local/bin/rtl_433_mqtt_hass --host $HOST $OPTIONS"]