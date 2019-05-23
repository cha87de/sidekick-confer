FROM alpine:latest
RUN apk upgrade --update && apk add bash gettext
RUN rm -rf /var/cache/apk/* && mkdir /opt
ADD init /init
ENTRYPOINT ["/init"]