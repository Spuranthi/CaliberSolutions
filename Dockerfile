FROM php:8.2-apache

WORKDIR /var/www/html

# Installeer Node.js voor frontend builds
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    && docker-php-ext-install pdo pdo_mysql \
    && apt-get clean

COPY . .

# Installeer en build frontend assets (als je package.json hebt)
RUN if [ -f package.json ]; then npm install && npm run build; fi

EXPOSE 80