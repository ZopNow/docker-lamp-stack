FROM ubuntu:16.04
MAINTAINER Vikash Kumar <vikash.iitb@gmail.com>

# Install Development tools
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y vim unzip wget curl

# Install PHP

RUN apt-get install -y \
    php7.0 \
    php7.0-cli \
    php7.0-mbstring \ 
    php7.0-zip \
    php7.0-dom \
    php7.0-curl \
    php7.0-mysql \
    composer

# Install Apache
RUN apt-get install -y apache2 libapache2-mod-php7.0
RUN a2enmod rewrite

# Install MySQL and start
RUN apt-get install -y mysql-client mysql-server
RUN /etc/init.d/mysql start

# Copy configurations
COPY apache.config /etc/apache2/sites-available/000-default.conf
COPY index.php /var/www/application/public/
COPY start.sh /usr/bin/


# Expose apache and mysql ports
EXPOSE 80
EXPOSE 3306

CMD ["/usr/bin/start.sh"]
