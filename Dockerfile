FROM php:7.4-fpm

RUN apt-get update && apt-get install -y git zip
RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer \
    && echo 'alias sf="php bin/console"' >> ~/.bashrc \
    && pear install PHP_CodeSniffer \
    && composer global require friendsofphp/php-cs-fixer phpmd/phpmd phpunit/phpunit \
    && export PATH="$PATH:$HOME/.composer/vendor/bin"

