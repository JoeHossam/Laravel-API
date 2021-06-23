<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class bill extends Model
{
    use HasFactory;

    public $table = 'bills';
    public $timestamps = false;

    protected $fillable = [
        'orders_id',
        'cost',
        'created_at'
    ];
}
