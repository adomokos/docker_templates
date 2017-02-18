# Dockerfile
FROM ruby:latest

RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN gem install bundler

RUN mkdir -p /var/data/app
RUN alias ll='ls -al'

COPY app/hello.rb /var/data/app/hello.rb

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
