FROM php:8.1-fpm as app

# Copy composer.lock and composer.json
COPY composer.lock composer.json /var/www/

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    mariadb-client \
    libpng-dev \
    libjpeg62-turbo-dev \
libonig-dev \
    libfreetype6-dev \
    locales \
    libtidy-dev \
    libzip-dev \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    nano \
    curl

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath
RUN docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# COPY ./docker/nginx/conf.d/app.conf /etc/nginx/conf.d/app.conf

# Copy existing application directory contents
# COPY ./ /var/www

# Copy existing application directory permissions
# COPY --chown=www:www ./ /var/www

# Change current user to www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]

#FROM nginx:alpine as webserver
#
#WORKDIR /var/www
#
#COPY ./docker/nginx/conf.d/ /etc/nginx/conf.d/
#
#COPY --from=appserver /var/www/public /var/www/public
#
#FROM mysql:5.7 as dbserver
#WORKDIR /var/lib/hieat/
#COPY ./docker/mysql/hieat/ /var/lib/hieat/
#COPY ./docker/mysql/my.cnf /etc/mysql/my.cnf
