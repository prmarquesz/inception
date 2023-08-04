FROM alpine:3.17

WORKDIR /var/www

RUN apk update && apk add --no-cache php81-fpm php81-json php81-curl php81-xml \
	php81-mysqli php81-pdo php81-pdo_mysql php81-soap php81-gettext \
	php81-ctype \
	php81-dom \
	php81-common \
	php81-session \
	php81-iconv \
	php81-gd \
	php81-imap \
	php81-cgi \
	fcgi \
	php81-posix \
	php81-ldap \
	php81-simplexml \
    && rm /etc/php81/php-fpm.d/www.conf;

RUN wget https://wordpress.org/wordpress-6.0.3.tar.gz \
    && tar xzf wordpress-6.0.3.tar.gz

COPY conf/wordpress.conf /etc/php81/php-fpm.d/www.conf

COPY conf/wp-config.php /var/www/wordpress/wp-config.php

RUN chown nobody:nobody /var/www/wordpress/wp-config.php

EXPOSE 9000

CMD ["php-fpm81", "-F"]
