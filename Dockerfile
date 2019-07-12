FROM php:7.0.0-apache
ENV APACHE_WWW=/var/www/html/
ENV DEBIAN_FRONTEND noninteractive
ENV MOODLE_BRANCH=master
WORKDIR /var/www/html/
RUN rm -rf ./* && apt-get update -y && apt-get install -y apt-utils  ca-certificates git\
    mysql-client pwgen python-setuptools curl unzip libcurl4-openssl-dev postfix \
    libfreetype6-dev  libjpeg62-turbo-dev libmcrypt-dev libpng-dev libpq-dev \ 
    libxml2 libxml2-dev libldb-dev libldap2-dev libzip-dev zlib1g-dev libicu-dev g++

RUN apt-get upgrade -y && \
    docker-php-ext-install \
    gd                      \
    mysqli                   \  
    pgsql pdo pdo_pgsql       \
    curl                       \
    xmlrpc                      \  
    intl                         \
    xml                           \
    mbstring                       \
    zip                             \
    soap 


# RUN apt-get install -y ldap-utils libldap2-dev && \
#     rm -rf /var/lib/apt/lists/*       
 # Install needed php extensions: ldap
RUN \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap

# RUN docker-php-ext-configure ldap
# RUN docker-php-ext-install ldap

RUN docker-php-ext-install opcache

WORKDIR /tmp/moodle/
RUN git clone https://github.com/moodle/moodle.git /tmp/moodle/ && git checkout $MOODLE_BRANCH
ARG MOODLE_CURRENT_BRANCH=master
RUN git checkout $MOODLE_CURRENT_BRANCH

WORKDIR /var/www/html/
RUN ls -la
COPY ./scripts /

ENTRYPOINT ["bash","/entrypoint.sh"]
