# Dockerfile
FROM alpine:latest

# Influenced by this: https://github.com/smebberson/docker-alpine/tree/master/alpine-base
MAINTAINER Attila Domokos (https://github.com/adomokos/docker_templates)

RUN apk add --update bash vim && \
    rm -rf /var/cache/apk/* && \
    echo 'alias ll="ls -al"' >> ~/.bashrc

CMD ["/bin/bash", "-l"]
