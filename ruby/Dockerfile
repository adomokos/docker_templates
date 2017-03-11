# Dockerfile
FROM ruby:2.4-slim

RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN gem install bundler

ENV INSTALL_PATH /var/data/app

RUN mkdir -p $INSTALL_PATH
RUN echo 'alias ll="ls -al"' >> ~/.bashrc

COPY app/* $INSTALL_PATH/

WORKDIR $INSTALL_PATH

RUN bundle install --binstubs --path vendor/bundle

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
