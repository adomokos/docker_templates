# Dockerfile
FROM ruby:2.4-slim

RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN gem install bundler

RUN mkdir -p /var/data/app
RUN echo 'alias ll="ls -al"' >> ~/.bashrc

COPY app/* /var/data/app/

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
