#!/bin/bash

#Download WP-CLI for managing WordPress installations
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

# Download the WordPress core files
wp core download --allow-root

#wp config create --dbname=$DBNAME --dbpass=$DBPASS --dbhost=$DB
#wp config create --dbname=your_db_name_here --dbuser=your_db_user_here --prompt=dbpass