<?php

define('PATH', realpath('.'));
define('SUBFOLDER', false);
define('URL', 'https://subsnom.tk');
define('STYLESHEETS_URL', '//subsnom.tk');

error_reporting(1);
date_default_timezone_set('Asia/Kolkata');

return [
  'db' => [
    'name'    =>  'hukosvex_pro',
    'host'    =>  'localhost',
    'user'    =>  'hukosvex_pro',
    'pass'    =>  'hukosvex_pro',
    'charset' =>  'utf8mb4' 
  ]
];
