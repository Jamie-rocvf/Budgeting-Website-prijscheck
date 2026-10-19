FROM php:8.3-apache
RUN apt-get update && apt-get install -y libzip-dev \
    && docker-php-ext-install mysqli zip \
    && docker-php-ext-enable mysqli zip
