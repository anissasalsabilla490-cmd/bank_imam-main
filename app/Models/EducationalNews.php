<?php 

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EducationalNews extends Model
{
    use HasFactory;

    protected $table = 'education'; 

    public function news()
    {
        return $this->hasMany(News::class);
    }
}

?>