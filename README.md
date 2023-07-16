# docker-rtl-433-mqtt-hass
A Dockerfile for the rtl_433 MQTT HomeAssistant discovery example. Based on Alpine linux.

## Compose Example
```yaml
services:
  rtl-433-mqtt-ha-proxy:
    image: rtl-433-mqtt-ha-proxy:latest
    container_name: rtl-433-mqtt-ha-proxy
    restart: unless-stopped
    environment:
      MQTT_USERNAME: user_name
      MQTT_PASSWORD: password
      OPTIONS: --retain
```