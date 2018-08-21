FROM alpine:3.8
MAINTAINER Alphard

RUN apk --no-cache --update add \
    lighttpd \
    php5-common \
    php5-iconv \
    php5-json \
    php5-gd \
    php5-curl \
    php5-xml \
    php5-pgsql \
    php5-imap \
    php5-cgi \
    fcgi \
    php5-pdo \
    php5-pdo_pgsql \
    php5-soap \
    php5-xmlrpc \
    php5-posix \
    php5-mcrypt \
    php5-gettext \
    php5-ldap \
    php5-ctype \
    php5-dom \
    php5-mysql

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf
RUN mkdir -p /run/lighttpd/
RUN ln -s /usr/bin/php-cgi5 /usr/bin/php-cgi

EXPOSE 80
VOLUME /var/www

ENTRYPOINT ["/usr/sbin/lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
