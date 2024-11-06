#From base image: debian
FROM debian

RUN apt-get update -y && apt-get install nginx openssl -y

COPY conf/file.conf /etc/nginx/conf.d

COPY tools/file.html /var/www/html

COPY tools/script.sh /

RUN chmod +x script.sh && ./script.sh

# Start NGINX in the foreground as the main process
CMD ["nginx", "-g", "daemon off;"]
