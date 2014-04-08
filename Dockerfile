FROM debian:wheezy
MAINTAINER John Regan <john@jrjrtech.com>

RUN apt-get update
RUN apt-get -y install wget
RUN wget -O - "http://nginx.org/keys/nginx_signing.key" | apt-key add -

RUN echo "deb http://nginx.org/packages/debian/ wheezy nginx" >> /etc/apt/sources.list.d/nginx.list

RUN apt-get update
RUN apt-get -y install nginx openssl ca-certificates
RUN rm -rf /etc/nginx/conf.d/*
RUN rm -rf /srv/www/*

ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf
ADD index.html /srv/www/index.html

VOLUME ["/etc/nginx"]
VOLUME ["/srv/www"]

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["nginx"]
