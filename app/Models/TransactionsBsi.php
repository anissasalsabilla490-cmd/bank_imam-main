<?php 
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransactionsBsi extends Model
{
    use HasFactory;

    protected $table = 'transactions_bsi'; // Nama tabel di database
    protected $guarded = []; // Menyediakan proteksi mass assignment
}

?>