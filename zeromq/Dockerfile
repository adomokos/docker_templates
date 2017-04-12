FROM node:7.7.4-alpine

LABEL maintainer "Attila Domokos <adomokos@gmail.com>"

ENV BUILD_PACKAGES="bash curl-dev ruby-dev build-base vim" \
    DEV_PACKAGES="make gcc g++ python krb5-dev zeromq-dev"

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $DEV_PACKAGES && \
    rm -rf /var/cache/apk/*

CMD ["/bin/bash", "-l"]

EXPOSE 3000
