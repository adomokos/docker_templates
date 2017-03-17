# Dockerfile
FROM alpine:3.2
MAINTAINER Attila Domokos <adomokos@gmail.com>

ENV BUILD_PACKAGES="bash curl-dev ruby-dev build-base vim" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev postgresql-dev mysql-dev" \
    RUBY_PACKAGES="ruby ruby-io-console ruby-json yaml"

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $DEV_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    gem install -N bundler && \
    rm -rf /var/cache/apk/*

ENV INSTALL_PATH /var/data/app
WORKDIR $INSTALL_PATH

RUN mkdir -p $INSTALL_PATH && \
    echo 'alias ll="ls -al"' >> ~/.bashrc

COPY app/* $INSTALL_PATH/

RUN bundle install --binstubs --path vendor/bundle

CMD ["/bin/bash", "-l"]
