# Dockerfile
FROM ruby:2.4.0-alpine

ENV INSTALL_PATH /var/data/app

RUN gem install bundler

RUN apk add --update --no-cache bind-tools && \
    mkdir -p $INSTALL_PATH && \
    echo 'alias ll="ls -al"' >> ~/.bashrc

COPY app/* $INSTALL_PATH/

WORKDIR $INSTALL_PATH

RUN bundle install --binstubs --path vendor/bundle
