FROM	debian:bullseye

LABEL	author="fwong"
LABEL	version="1.0"

RUN		apt update -y \
		&& apt upgrade -y \
		&& apt install -y curl \
		&& apt install -y nginx \
		&& mkdir -p /etc/nginx/ssl \
		&& apt install openssl -y

RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=fwong.42.fr/UID=fwong"

RUN		chmod 755 /var/www/html && \
		chown -R www-data:www-data /var/www/html

EXPOSE	443

COPY	conf/nginx.conf /etc/nginx/nginx.conf

CMD		["nginx", "-g", "daemon off;"]