FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install php-fpm php7.4-mysqlnd -y && apt-get install curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/wp_config.sh /

RUN chmod +x wp_config.sh

CMD [ "./wp_config.sh" ]
