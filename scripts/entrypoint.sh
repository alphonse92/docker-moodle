#!/bin/bash
set -e
echo "Environment Vars"
printenv 
cd $APACHE_WWW

MOODLE_CONF_NAME=config.php
PHP_INI_FILE=php.ini

SECRET_CONFIG_PATH=/run/secrets/$MOODLE_CONF_NAME
MOODLE_DEFAULT_CONF=/$MOODLE_CONF_NAME
MOODLE_CONFIG_FILE=$APACHE_WWW/$MOODLE_CONF_NAME
PHP_CONF_PATH=/usr/local/etc/php/
PHP_INI_FILE_PATH=/$PHP_INI_FILE

echo $SECRET_CONFIG_PATH
echo $MOODLE_DEFAULT_CONF
echo $MOODLE_CONFIG_FILE

echo "\nCurrent files in $PWD"
ls -A

echo "\nValidating if $PWD is an empty directory"
if [ -z "$(ls -A)" ]; then
    if [ -n "${AVOID_COPY_FILES}" ];then
        rm -rf $APACHE_WWW
        ln -s $APACHE_WWW /tmp/moodle/
        chown -R www-data:www-data /tmp/moodle/
    else
        echo "Doesnt exist files in $PWD"
        echo "Copy moodle files ..."
        cp -R /tmp/moodle/* $APACHE_WWW
        chown -R www-data:www-data $APACHE_WWW
        printf "[OK]"
        echo ""
    fi
    
else
    echo "Exists files in $PWD" 
fi

#si la variable de entorno no existe busca en secrets, si no existe error.
#si existe la variable de entorno entonces usa el archivo default
echo "Setup config file"
echo "finding for DB_HOST"
if [ -z "${DB_HOST}" ]; then
    echo "DB_HOST envar doesnt exist. Finding config file in secrets"
    echo "Finding config file in $SECRET_CONFIG_PATH"
    if [ -f "$SECRET_CONFIG_PATH" ]; then
        echo "$SECRET_CONFIG_PATH exists copy to $APACHE_WWW"
        cp $SECRET_CONFIG_PATH $MOODLE_CONFIG_FILE
    else
        echo >&2 'Please configure before run, add moodle-config file to secrets or use envars for auto generation'
        exit 255
    fi
else
    echo "envar DB_HOST exists, use default config file."
    cp /$MOODLE_CONF_NAME $MOODLE_CONFIG_FILE
    cp $PHP_INI_FILE_PATH $PHP_CONF_PATH/$PHP_INI_FILE
fi


if [ -d ${MOODLE_DATA} ]; 
then
    echo "Moodle data folder exist."
    echo "Getting files:"
    ls -la ${MOODLE_DATA}
else
    echo "Recreating moodle data"
    mkdir -p MOODLE_DATA
fi

echo "Starting apache"
apache2-foreground

