<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Data extends Model 
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'text', 'order',
    ];

    protected $table = 'data';
}
