# Laravel Quickstart - Basic

## Quick Installation

    git clone https://github.com/laravel/quickstart-basic quickstart

    cd quickstart

    composer install

    php artisan migrate

    php artisan serve
    
 ## Docker Installation
 
    docker run -d --name mysql -p 3306:3306 -e MYSQL_RANDOM_ROOT_PASSWORD=true -e MYSQL_DATABASE=laravel -e MYSQL_USER=laravel -e MYSQL_PASSWORD=Password01! mysql
    docker run -d -p 8000:8000 -e DB_HOST=172.17.0.1 -e DB_DATABASE=laravel -e DB_USERNAME=laravel -e DB_PASSWORD=Password01! mcasperson/laravelapp

[Complete Tutorial](https://laravel.com/docs/5.2/quickstart)
