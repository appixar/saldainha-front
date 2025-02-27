<?php
$dependencies = [
    "php-yaml" => [
        "status" => function_exists("yaml_parse"),
        "notes" => "configuration files",
        "cmd" => "sudo apt install php-curl",
        "priority" => 2
    ],
    "php-curl" => [
        "status" => extension_loaded('curl'),
        "notes" => "request api's",
        "cmd" => "sudo apt-get install php-curl",
        "priority" => 2
    ],
    "php-mysql" => [
        "status" => extension_loaded('pdo_mysql'),
        "notes" => "xplend mysql module",
        "cmd" => "sudo apt install php-curl",
        "priority" => 1
    ],
    "php-mbstring" => [
        "status" => extension_loaded('pdo_mysql'),
        "notes" => "handle multibyte chars",
        "cmd" => "sudo apt install php-mbstring",
        "priority" => 0
    ],
    "redis server" => [
        "status" => class_exists('Redis'),
        "notes" => "cache",
        "cmd" => "sudo apt install redis-server / sudo systemctl enable redis-server / sudo apt install php-redis",
        "priority" => 0
    ]
];
