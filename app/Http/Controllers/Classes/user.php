<?php

namespace App\Http\Classes;

class user 
{
    public $id;
    public $name;
    public $image;
    public $rate;

    public function __construct($id, $name, $image, $rate)
    {
        $this->id = $id;
        $this->name = $name;
        $this->image = $image;
        $this->rate = $rate;
    }
}