<?php
class AuthController
{
    public function __construct()
    {
        global $_APP, $_ROUTE_PERMISSION, $_HEADER, $_AUTH;
        $key = @$_HEADER['authorization'];
        if (!$key or $key !== $_ENV['API_SECRET']) Http::die(401);
        return true;
    }
}