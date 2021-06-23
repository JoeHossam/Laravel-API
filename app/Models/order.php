<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class order extends Model
{
    use HasFactory;

    public $table = 'orders';

    public $timestamps = false;

    protected $fillable = [
        'locations_pickup_id',
        'locations_destination_id',
        'goods_types_id',
        'i_am_recipient',
        'created_at',
        'users_id',
        'trucks_types_id',
        'code'
    ];
}
