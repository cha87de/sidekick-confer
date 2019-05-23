FROM alpine:latest
RUN apk upgrade --update && apk add bash gettext
RUN rm -rf /var/cache/apk/* && mkdir -p /opt
ADD init /init
ENTRYPOINT ["/init"]
