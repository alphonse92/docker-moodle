# docker-moodle

This repo contains the dockerfile and the required scripts to build it.


# Build

## Arguments

1. MOODLE_CURRENT_BRANCH:  the moodle version that you want to install in the container

# Running

## Environment vars

1. DB_CONNECTOR: Moodle database connector. Example: mysql
2. DB_HOST: database host
3. DB_PORT: database port
4. DB_NAME: moodle database name (should exist)
5. DB_USERNAME: moodle database user
6. DB_PASSWORD: moodle database user password
7. DB_PREFIX: database table prefix
8. MOODLE_URL: moodle FQDN
9. CACERT: path to your ca-certificate. Use it if some code of your moodle will request to a custom server with SSL and you need to trust it.

## Persist

You need to mount two volumes to persist the moodle data with plugins:

1. /path/to/folder/in/host/moodle_data:/var/moodle_data
2. /path/to/folder/in/host/moodle:/var/www/html

