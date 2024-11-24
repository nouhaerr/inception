#!/bin/bash

# Create necessary directories for WordPress installation


# /var/www/ is typically the default location where web server software like Apache or Nginx serves website content from.

cd /var/www/html

# remove existing files from volume if there are any to install it again
rm -rf /var/www/html/*

#Download WP-CLI for managing WordPress installations
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# Download the WordPress core files
wp core download --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --dbhost=mariadb --allow-root
wp core install --url=$URL --title=$TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=subscriber --user_pass=$WP_USER_PASS --allow-root

echo  $URL $DOMAIN_NAME $TITLE $WP_ADMIN $WP_ADMIN_PASS $WP_ADMIN_EMAIL

mkdir /run/php

sed -i 's/^listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

exec php-fpm7.4 -F
