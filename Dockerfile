FROM alpine:latest
RUN apk add --update python3 py3-pip tini
RUN pip3 install paho-mqtt
COPY rtl_433/examples/rtl_433_mqtt_hass.py /usr/local/bin/rtl_433_mqtt_hass
RUN adduser -D -H mqtt
USER mqtt
ENV MQTT_USERNAME=""
ENV MQTT_PASSWORD=""
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/local/bin/rtl_433_mqtt_hass"]