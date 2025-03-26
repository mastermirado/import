FROM php:7.4-fpm

# Installer les dépendances
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    curl \
    && docker-php-ext-install pdo pdo_mysql mbstring xml

# Installer Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Installer Symfony CLI (facultatif)
# RUN curl -sS https://get.symfony.com/cli/installer | bash && \
#     mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# Définir le répertoire de travail
WORKDIR /var/www/symfony

# Exposer le port pour PHP-FPM
EXPOSE 9000

CMD ["php-fpm"]