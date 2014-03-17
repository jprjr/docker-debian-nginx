docker-debian-nginx
=============

A small [Debian](http://www.debian.org/)-based image for [Docker](http://docker.io/), with [NGINX](http://nginx.org/) (ver 1.4.6) and [OpenSSL](http://www.openssl.org/) installed.

Based on Debian Wheezy, and with NGINX configured to:

* Not Daemonize
* Load all configuration files in `/etc/nginx/conf.d/`

The idea is to mount a volume at `/etc/nginx/conf.d/` with your particular configuration. `/srv/www` is a volume for any static files.

There is a default.conf in /etc/nginx/conf.d to serve up a basic "it's running" page.
