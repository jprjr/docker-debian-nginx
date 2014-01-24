FROM debian:wheezy
MAINTAINER John Regan <john@jrjrtech.com>

RUN apt-get update
RUN apt-get -y install wget
RUN wget -O - "http://nginx.org/keys/nginx_signing.key" | apt-key add -

RUN echo "deb http://nginx.org/packages/debian/ wheezy nginx" >> /etc/apt/sources.list.d/nginx.list

RUN apt-get update
RUN apt-get -y install nginx openssl ca-certificates

ADD nginx.conf /etc/nginx/nginx.conf
VOLUME ["/etc/nginx/conf.d"]
VOLUME ["/srv/www"]

EXPOSE 80
ENTRYPOINT ["nginx"]
