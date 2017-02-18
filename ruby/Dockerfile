# Dockerfile
FROM ruby:latest

RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN gem install bundler

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
