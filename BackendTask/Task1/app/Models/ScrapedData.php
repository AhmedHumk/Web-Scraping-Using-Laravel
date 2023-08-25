<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ScrapedData extends Model
{
    use HasFactory;
    
    protected $table = 'scraped_data';

    protected $fillable = ['BookName', 'Author'];
}
