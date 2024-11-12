FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

RUN sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/create.sh /

RUN chmod +x create.sh && ./create.sh

CMD [ "mysqld_safe" ]