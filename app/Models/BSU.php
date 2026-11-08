<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BSU extends Model
{
    use HasFactory;

    protected $table = 'cms_users';
    protected $primaryKey = 'id'; 
    public $incrementing = true;
    protected $keyType = 'int';
    public $timestamps = true; 

    /** Hanya akun BSU (privilege 4), urut A-Z — bukan Super Admin/Admin/BSI. */
    public function scopeUnit($query)
    {
        return $query->where('id_cms_privileges', 4)->orderBy('name');
    }
}
