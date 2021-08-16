FROM php:7
ARG db_host
ARG db_username
ARG db_password
ARG db_database
RUN apt-get update; apt-get install -y wget libzip-dev
RUN docker-php-ext-install zip pdo_mysql
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer -O - -q | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR /app
COPY . /app
RUN composer install
RUN DB_HOST=$db_host DB_USERNAME=$db_username DB_PASSWORD=$db_password DB_DATABASE=$db_database php artisan migrate
RUN DB_HOST=$db_host DB_USERNAME=$db_username DB_PASSWORD=$db_password DB_DATABASE=$db_database vendor/bin/phpunit
RUN echo "#!/bin/sh\n" \
	"php artisan migrate\n" \
	"php artisan serve --host 0.0.0.0" > /app/start.sh
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]