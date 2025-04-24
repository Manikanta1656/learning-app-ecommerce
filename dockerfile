FROM php:8.2-apache

# Install mysqli extension
RUN docker-php-ext-install mysqli

# Set environment variables
ENV DB_HOST=mariadb \
    DB_USER=ecomuser \
    DB_PASSWORD=ecompassword \
    DB_NAME=ecomdb

# Copy app files
COPY . /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
RUN a2enmod rewrite
EXPOSE 80