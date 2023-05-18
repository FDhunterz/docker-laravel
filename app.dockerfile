FROM php:8.0.2-fpm-buster

RUN apt-get update 2>/dev/null | grep packages | cut -d '.' -f 1 && apt-get install -y libmcrypt-dev vim libfreetype6-dev libjpeg62-turbo-dev libpng-dev && apt clean
RUN pecl install mcrypt-1.0.6 && docker-php-ext-enable mcrypt
RUN docker-php-ext-install -j$(nproc) iconv pdo_mysql gd
# RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-configure gd --with-freetype=/usr/include/

WORKDIR /var/www

