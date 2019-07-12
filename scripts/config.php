<?php
//unset($CFG);  
//global $CFG;  
//$CFG = new stdClass();
//$CFG->dbtype    = getenv('DB_CONNECTOR');
//$CFG->dblibrary = 'native';
//$CFG->dbhost    = getenv('DB_HOST');
//$CFG->dbname    = getenv('DB_NAME');
//$CFG->dbuser    = getenv("DB_USERNAME"); 
//$CFG->dbpass    = getenv("DB_PASSWORD"); 
//$CFG->prefix    = getenv("DB_PREFIX");   
//$CFG->dboptions = array(
//    'dbpersist' => false,
//    'dbsocket'  => false,
//    'dbport'    => getenv("DB_PORT"),
//    'dbhandlesoptions' => false,
//    'dbcollation' => 'utf8mb4_unicode_ci', 
//);
//$CFG->wwwroot   = getenv('MOODLE_URL');
//$CFG->dataroot  = '/var/moodle_data';
//$CFG->directorypermissions = 02777;
//$CFG->admin = 'admin';
//require_once(__DIR__ . '/lib/setup.php'); 

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
$CFG->dataroot  = '/var/moodle_data';
$CFG->admin     = 'admin';
$CFG->directorypermissions = 0777;
require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!

