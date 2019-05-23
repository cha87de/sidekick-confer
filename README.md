[![Docker Pulls](https://img.shields.io/docker/pulls/cha87de/sidekick-confer.svg)](https://hub.docker.com/r/cha87de/sidekick-confer/)

# Base Image for Dynamic Sidekick Config Containers

## Usage example:

Build your image with your template configuration files:

Create a new `Dockerfile` (example with telegraf.conf):

```
FROM cha87de/sidekick-confer
VOLUME /etc/telegraf/
ADD telegraf.conf.tmpl /etc/telegraf/
```

And place a variable in the `telegraf.conf.tmpl` e.g.:

```
...
[[outputs.influxdb]]
  urls = ["$INFLUX_SERVER"]
...
```

Build your config image as `user/yourconfig:latest`. During deploy time use environment variables to set the variable in your configuration file:

```
docker run -e INFLUX_SERVER=http://testblabla:8086 user/yourconfig:latest
```

Or use it with docker-compose:

```
config:
    image: user/yourconfig:latest
    restart: "no"
    environment:
    - INFLUX_SERVER=http://testblabla:8086

telegraf:
    image: telegraf:1.10-alpine
    volumes_from:
    - config
```

