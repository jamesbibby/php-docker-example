FROM php:5.6-apache
# examples of how to install extensions and enable apache modules
RUN a2enmod rewrite && docker-php-ext-install pdo_mysql

RUN mkdir -p /var/www/html/
COPY index.php /var/www/html/
COPY app /var/www/html/app
