<?php

namespace App\Http\Controllers\Classes;

class Account 
{
    public $api_token;
    public $country_code;
    public $phone;
    public $type;

    public function __construct($api_token, $country_code, $phone, $type)
    {
        $this->api_token = $api_token;
        $this->country_code = $country_code;
        $this->phone = $phone;
        $this->type = $type;
    }
}