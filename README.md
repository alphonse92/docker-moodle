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


