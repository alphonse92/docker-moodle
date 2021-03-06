<?php

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = getenv('DB_CONNECTOR');
$CFG->dblibrary = 'native';
$CFG->dbhost    = getenv('DB_HOST');
$CFG->dbname    = getenv('DB_NAME');
$CFG->dbuser    = getenv("DB_USERNAME");
$CFG->dbpass    = getenv("DB_PASSWORD");
$CFG->prefix    = getenv("DB_PREFIX");
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => getenv("DB_PORT"),
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_general_ci',
);

$CFG->wwwroot   = getenv('MOODLE_URL');
$CFG->dataroot  = getenv('MOODLE_DATA');;
// Enable when setting up advanced reverse proxy load balancing configurations,
// it may be also necessary to enable this when using port forwarding.
$isReverseProxy = strtolower(getenv('REVERSE_PROXY')) === 'true' ;
$CFG->reverseproxy =  $isReverseProxy;

// Enable when using external SSL appliance for performance reasons.
// Please note that site may be accessible via https: or https:, but not both!
$isSslProxy = strtolower(getenv('SSL_PROXY')) === 'true' ;
$CFG->sslproxy = $isSslProxy;
$CFG->admin     = 'admin';
$CFG->directorypermissions = 0777;
require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!

