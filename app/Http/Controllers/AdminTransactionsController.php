<?php

namespace App\Http\Controllers;

use DB;
use Request;
use Session;
use CRUDBooster;
use App\Models\Point;
use App\Models\Saldo;
use App\Models\Transaction;

class AdminTransactionsController extends \crocodicstudio\crudbooster\controllers\CBController
{

	public function cbInit()
	{

		# START CONFIGURATION DO NOT REMOVE THIS LINE
		$this->title_field = "id";
		$this->limit = "20";
		$this->orderby = "created_at,desc";
		$this->global_privilege = false;
		$this->button_table_action = true;
		$this->button_bulk_action = true;
		$this->button_action_style = "button_icon";
		$this->button_add = true;
		$this->button_edit = true;
		$this->button_delete = true;
		$this->button_detail = true;
		$this->button_show = true;
		$this->button_filter = true;
		$this->button_import = false;
		$this->button_export = true;
		$this->table = "transactions";
		# END CONFIGURATION DO NOT REMOVE THIS LINE

		# START COLUMNS DO NOT REMOVE THIS LINE
		$this->col = [];
		$this->col[] = ["label" => "No", "callback_php" => '($row->index_number = (++$GLOBALS["index_number"]))'];
		$this->col[] = ["label"=>"Nama User","name"=>"user_id","join"=>"users,username"];
		if (in_array(CRUDBooster::myId(), [1, 10])) {
			    $this->col[] = ["label"=>"Nama BSU","name"=>"admin_id","join"=>"cms_users,name"];
			}
		$this->col[] = ["label"=>"Jenis Sampah","name"=>"sampah_id","join"=>"sampah,name"];
		$this->col[] = ["label"=>"Harga per Kg","name"=>"price_per_kg", 'callback_php' => '"Rp. ".number_format($row->price_per_kg)'];
		$this->col[] = ["label"=>"Total Berat","name"=>"total_weight"];
		$this->col[] = ["label"=>"Saldo Didapat","name"=>"total_income",'callback_php' => '"Rp. ".number_format($row->total_income)'];
		$this->col[] = ["label"=>"Poin Didapat","name"=>"point_received"];
		$this->col[] = [
			"label" => "Tanggal & Waktu",
			"name" => "created_at",
			"callback" => function($row) {
				return date('d/m/Y H:i:s', strtotime($row->created_at));
			}
		];			
		$this->col[] = ["label"=>"Periode","name"=>"periode"];
		# END COLUMNS DO NOT REMOVE THIS LINE

		# START FORM DO NOT REMOVE THIS LINE
		$this->form = [];
		$this->form[] = ['label' => 'Nama User', 'name' => 'user_id', 'type' => 'select2', 'validation' => 'required|min:1|max:255', 'width' => 'col-sm-10', 'datatable' => 'users,username', 'datatable_where' => 'cms_user_id = '.CRUDBooster::myId()];
		$this->form[] = ['label' => 'Nama BSU', 'name' => 'admin_id', 'type' => 'hidden', 'validation' => 'required|integer|min:0', 'width' => 'col-sm-10', 'value' => CRUDBooster::myId()];
		$this->form[] = [
            'label' => 'Jenis Sampah',
            'name' => 'sampah_id',
            'type' => 'select2',
            'validation' => 'required|min:1|max:255',
            'width' => 'col-sm-10',
            'datatable' => 'sampah,name',
            'datatable_format' => "name,'. Harga per Kg = ',price_per_kg,'. Poin per Kg = ',poin_per_kg",
            'datatable_where' => 'admin_id = '.CRUDBooster::myId()
        ];
		$this->form[] = ['label' => 'Total Berat(kg)', 'name' => 'total_weight', 'type' => 'text', 'validation' => 'required|min:0|numeric', 'width' => 'col-sm-10'];
		$this->form[] = ['label' => 'Total Pendapatan', 'name' => 'total_income', 'type' => 'number', 'validation' => 'required|integer|min:0', 'width' => 'col-sm-10', 'readonly' => 'true'];
		$this->form[] = ['label' => 'Poin Didapat', 'name' => 'point_received', 'type' => 'number', 'validation' => 'required|integer|min:0', 'width' => 'col-sm-10', 'readonly' => 'true'];
		// Snapshot harga & poin per kg saat transaksi dibuat (hidden, diisi otomatis di hook_before_add)
		$this->form[] = ['label' => 'Harga per Kg', 'name' => 'price_per_kg', 'type' => 'hidden', 'validation' => 'required|integer|min:0', 'value' => 0];
		$this->form[] = ['label' => 'Poin per Kg', 'name' => 'poin_per_kg', 'type' => 'hidden', 'validation' => 'required|integer|min:0', 'value' => 0];
		$this->form[] = ['label' => 'Periode', 'name' => 'periode', 'type' => 'text', 'validation' => 'required|min:1|max:255', 'width' => 'col-sm-10'];
		# END FORM DO NOT REMOVE THIS LINE

		# END FORM DO NOT REMOVE THIS LINE

		# OLD START FORM
		//$this->form = [];
		//$this->form[] = ['label'=>'Nama User','name'=>'user_id','type'=>'select2','validation'=>'required|min:1|max:255','width'=>'col-sm-10','datatable'=>'users,username'];
		//$this->form[] = ['label'=>'Nama Admin','name'=>'admin_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'cms_users,name'];
		//$this->form[] = ['label'=>'Jenis Sampah','name'=>'sampah_id','type'=>'select2','validation'=>'required|min:1|max:255','width'=>'col-sm-10','datatable'=>'sampah,name','datatable_format'=>'name,\'. Harga per Kg =  \',price_per_kg'];
		//$this->form[] = ['label'=>'Total Berat','name'=>'total_weight','type'=>'number','validation'=>'required|min:0','width'=>'col-sm-10'];
		//$this->form[] = ['label'=>'Total Pendapatan','name'=>'total_income','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10','readonly'=>'true'];
		//$this->form[] = ['label'=>'Poin Didapat','name'=>'point_received','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10','readonly'=>'true'];
		# OLD END FORM

		/* 
	        | ---------------------------------------------------------------------- 
	        | Sub Module
	        | ----------------------------------------------------------------------     
			| @label          = Label of action 
			| @path           = Path of sub module
			| @foreign_key 	  = foreign key of sub table/module
			| @button_color   = Bootstrap Class (primary,success,warning,danger)
			| @button_icon    = Font Awesome Class  
			| @parent_columns = Sparate with comma, e.g : name,created_at
	        | 
	        */
		$this->sub_module = array();


		/* 
	        | ---------------------------------------------------------------------- 
	        | Add More Action Button / Menu
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @url         = Target URL, you can use field alias. e.g : [id], [name], [title], etc
	        | @icon        = Font awesome class icon. e.g : fa fa-bars
	        | @color 	   = Default is primary. (primary, warning, succecss, info)     
	        | @showIf 	   = If condition when action show. Use field alias. e.g : [id] == 1
	        | 
	        */
		$this->addaction = array();


		/* 
	        | ---------------------------------------------------------------------- 
	        | Add More Button Selected
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @icon 	   = Icon from fontawesome
	        | @name 	   = Name of button 
	        | Then about the action, you should code at actionButtonSelected method 
	        | 
	        */
		$this->button_selected = array();


		/* 
	        | ---------------------------------------------------------------------- 
	        | Add alert message to this module at overheader
	        | ----------------------------------------------------------------------     
	        | @message = Text of message 
	        | @type    = warning,success,danger,info        
	        | 
	        */
		$this->alert        = array();



		/* 
	        | ---------------------------------------------------------------------- 
	        | Add more button to header button 
	        | ----------------------------------------------------------------------     
	        | @label = Name of button 
	        | @url   = URL Target
	        | @icon  = Icon from Awesome.
	        | 
	        */
		$this->index_button = array();

		/* 
	        | ---------------------------------------------------------------------- 
	        | Customize Table Row Color
	        | ----------------------------------------------------------------------     
	        | @condition = If condition. You may use field alias. E.g : [id] == 1
	        | @color = Default is none. You can use bootstrap success,info,warning,danger,primary.        
	        | 
	        */
		$this->table_row_color = array();


		/*
	        | ---------------------------------------------------------------------- 
	        | You may use this bellow array to add statistic at dashboard 
	        | ---------------------------------------------------------------------- 
	        | @label, @count, @icon, @color 
	        |
	        */
			$this->index_statistic = array();

			$adminId = CRUDBooster::myId();
            $filterColumn = Request::get('filter_column');
            
            // Inisialisasi query dengan join tabel terkait
            $buySumQuery = DB::table('transactions')
                ->join('users', 'transactions.user_id', '=', 'users.id') // Join dengan tabel users
                ->join('cms_users', 'transactions.admin_id', '=', 'cms_users.id') // Join dengan tabel cms_users
                ->join('sampah', 'transactions.sampah_id', '=', 'sampah.id'); // Join dengan tabel sampah
                
            if (!empty( $filterColumn['transactions.periode']['value'])) {
                $buySumQuery->where('transactions.periode', 'like', '%' . $filterColumn['transactions.periode']['value'] . '%');
            }
            
            // Filter Nama User
            if (!empty($filterColumn['users.username']['value'])) {
                $buySumQuery->where('users.username', 'like', '%' . $filterColumn['users.username']['value'] . '%');
            }
            
            // Filter Nama BSU
            if (!empty($filterColumn['cms_users.name']['value'])) {
                $buySumQuery->where('cms_users.name', 'like', '%' . $filterColumn['cms_users.name']['value'] . '%');
            }
            
            // Filter Jenis Sampah
            if (!empty($filterColumn['sampah.name']['value'])) {
                $buySumQuery->where('sampah.name', 'like', '%' . $filterColumn['sampah.name']['value'] . '%');
            }
            
            // Filter Harga per Kg (dari snapshot di tabel transactions)
            if (!empty($filterColumn['transactions.price_per_kg']['value'])) {
                $buySumQuery->where('transactions.price_per_kg', '=', $filterColumn['transactions.price_per_kg']['value']);
            }
            
            // Filter Total Berat
            if (!empty($filterColumn['transactions.total_weight']['value'])) {
                $buySumQuery->where('transactions.total_weight', '=', $filterColumn['transactions.total_weight']['value']);
            }
            
            // Filter Saldo Didapat
            if (!empty($filterColumn['transactions.total_income']['value'])) {
                $buySumQuery->where('transactions.total_income', '=', $filterColumn['transactions.total_income']['value']);
            }
            
            // Filter Poin Didapat
            if (!empty($filterColumn['transactions.point_received']['value'])) {
                $buySumQuery->where('transactions.point_received', '=', $filterColumn['transactions.point_received']['value']);
            }
            
            if (!empty($filterColumn['transactions.created_at']['value'])) {
                $createdAtRange = $filterColumn['transactions.created_at']['value']; // Misalkan formatnya array [start, end]
                
                // Jika diberikan rentang tanggal (array dengan 2 nilai: start dan end)
                if (is_array($createdAtRange) && count($createdAtRange) === 2) {
                    $buySumQuery->whereBetween('transactions.created_at', [$createdAtRange[0], $createdAtRange[1]]);
                }
                // Jika hanya satu tanggal yang diberikan
                elseif (!empty($createdAtRange)) {
                    $buySumQuery->where('transactions.created_at', '=', $createdAtRange);
                }
            }

			// Filter berdasarkan admin_id kecuali jika admin_id adalah 1 atau 10
			if (!in_array($adminId, [1, 10])) {
				$buySumQuery->where('transactions.admin_id', $adminId);
			}

			$buySum = $buySumQuery->sum('total_income');
			$totalWeight = $buySumQuery->sum('total_weight');

			// Format data statistik
			$this->index_statistic[] = [
				'label' => 'Total Tabungan Sampah',
				'count' =>  $totalWeight. ' Kg',
				'icon' => 'fa fa-check',
				'color' => 'success'
			];
			$this->index_statistic[] = [
				'label' => 'Total Pembelian',
				'count' => 'Rp. ' . number_format($buySum, 0, ',', ','),
				'icon' => 'fa fa-money',
				'color' => 'primary'
			];




		/*
	        | ---------------------------------------------------------------------- 
	        | Add javascript at body 
	        | ---------------------------------------------------------------------- 
	        | javascript code in the variable 
	        | $this->script_js = "function() { ... }";
	        |


	        */
			
		$this->script_js = "
            $(document).ready(function() {
                let income = $('input[name=\"total_income\"]');
                let pointReceived = $('input[name=\"point_received\"]');
                let totalWeight = $('input[name=\"total_weight\"]');
                
                totalWeight.on('change', function() {
                    // Get Sampah details from the selected option text (price and poin per kg)
                    var sampah = $('.select2-selection__rendered').eq(1).text();
                    
                    // Extract the price per kg from sampah string
                    var priceMatch = sampah.match(/Harga per Kg = (\\d+)/);
                    var price = priceMatch ? parseInt(priceMatch[1]) : null;
        
                    // Extract poin_per_kg from sampah string
                    var poinMatch = sampah.match(/Poin per Kg = (\\d+)/);
                    var poinPerKg = poinMatch ? parseInt(poinMatch[1]) : null;
        
                    // Get total weight
                    var weight = parseFloat(this.value);
                    
                    if (!isNaN(price) && !isNaN(weight)) {
                        // Calculate income and round to nearest integer
                        var calculatedIncome = Math.round(price * weight);
                        income.val(calculatedIncome); // Set income value
                    }
    
                    // Calculate total points and round it
                    var totalPoints = Math.round(poinPerKg * weight);
                    pointReceived.val(totalPoints); // Set point value
                });
            });
        ";


			/*
	        | ---------------------------------------------------------------------- 
	        | Include HTML Code before index table 
	        | ---------------------------------------------------------------------- 
	        | html code to display it before index table
	        | $this->pre_index_html = "<p>test</p>";
	        |
	        */
		$this->pre_index_html = null;



		/*
	        | ---------------------------------------------------------------------- 
	        | Include HTML Code after index table 
	        | ---------------------------------------------------------------------- 
	        | html code to display it after index table
	        | $this->post_index_html = "<p>test</p>";
	        |
	        */
		$this->post_index_html = null;



		/*
	        | ---------------------------------------------------------------------- 
	        | Include Javascript File 
	        | ---------------------------------------------------------------------- 
	        | URL of your javascript each array 
	        | $this->load_js[] = asset("myfile.js");
	        |
	        */
		$this->load_js = array();



		/*
	        | ---------------------------------------------------------------------- 
	        | Add css style at body 
	        | ---------------------------------------------------------------------- 
	        | css code in the variable 
	        | $this->style_css = ".style{....}";
	        |
	        */
		$this->style_css = NULL;



		/*
	        | ---------------------------------------------------------------------- 
	        | Include css File 
	        | ---------------------------------------------------------------------- 
	        | URL of your css each array 
	        | $this->load_css[] = asset("myfile.css");
	        |
	        */
			$this->load_css[] =  asset('we-cycle-app/bootstrap/css/admin.css');
	}


	/*
	    | ---------------------------------------------------------------------- 
	    | Hook for button selected
	    | ---------------------------------------------------------------------- 
	    | @id_selected = the id selected
	    | @button_name = the name of button
	    |
	    */
		
	
	public function actionButtonSelected($id_selected, $button_name)
	{
	}


	/*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate query of index result 
	    | ---------------------------------------------------------------------- 
	    | @query = current sql query 
	    |
	    */
		public function hook_query_index(&$query) {
	        $currentUserId = CRUDBooster::myId();
			
			$GLOBALS['index_number'] = 0;

			if ($currentUserId == 1) {

			}elseif($currentUserId == 10) {
				
			}
			else {
				$query->where('cms_user_id', $currentUserId);
			}
	    }
		// public function hook_query_index(&$query)
		// {
		// 	$currentUserId = CRUDBooster::myId(); 

		// 	// Filter berdasarkan bulan dan tahun saat ini
		// 	$currentMonth = date('m');
		// 	$currentYear = date('Y');
			
		// 	// Cek apakah user adalah admin
		// 	if ($currentUserId == 1) {
		// 		// Ganti 'transactions' dengan nama tabel yang sesuai jika diperlukan
		// 		$query->whereMonth('transactions.created_at', $currentMonth)
		// 			->whereYear('transactions.created_at', $currentYear);
		// 	} else {
		// 		// Ganti 'transactions' dengan nama tabel yang sesuai jika diperlukan
		// 		$query->where('cms_user_id', $currentUserId)
		// 			->whereMonth('transactions.created_at', $currentMonth)
		// 			->whereYear('transactions.created_at', $currentYear);
		// 	}
		// }


	/*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate row of index table html 
	    | ---------------------------------------------------------------------- 
	    |
	    */
	public function hook_row_index($column_index, &$column_value)
	{
		//Your code here
	}

	/*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before add data is execute
	    | ---------------------------------------------------------------------- 
	    | @arr
	    |
	    */
	public function hook_before_add(&$postdata)
	{
	    // Snapshot harga & poin per kg dari master sampah saat transaksi dibuat
	    // Sehingga perubahan harga di master tidak mempengaruhi history transaksi
	    if (!empty($postdata['sampah_id'])) {
	        $sampah = DB::table('sampah')->where('id', $postdata['sampah_id'])->first();
	        if ($sampah) {
	            $postdata['price_per_kg'] = $sampah->price_per_kg;
	            $postdata['poin_per_kg']  = $sampah->poin_per_kg;
	        }
	    }
	}

	/* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after add public static function called 
	    | ---------------------------------------------------------------------- 
	    | @id = last insert id
	    | 
	    */
	public function hook_after_add($id)
		{
			// [SECURITY] Gunakan request() helper (bukan $_REQUEST) untuk sanitasi Laravel
			$user_id       = (int) request('user_id');
			$point_received = max(0, (int) request('point_received'));
			$total_income   = max(0, (float) request('total_income'));

			// Validasi: pastikan user_id valid dan milik nasabah terdaftar
			if ($user_id <= 0) { return; }

			// Mengupdate atau menambahkan total points
			$user_point = Point::where('user_id', $user_id)->first();

			if ($user_point) {
				$user_point->update([
					'total_points' => $user_point['total_points'] + $point_received
				]);
			} else {
				Point::create([
					'user_id'      => $user_id,
					'total_points' => $point_received
				]);
			}

			// Menambah saldo lewat SaldoService: baris dikunci + tercatat di ledger (saldo_mutasi).
			if ($total_income > 0) {
				app(\App\Services\SaldoService::class)->credit(
					$user_id, (int) round($total_income), 'setor_sampah', 'transaction', $id,
					'Setor sampah #' . $id, CRUDBooster::myId()
				);
			}

		}



		

	/* 
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before update data is execute
	    | ---------------------------------------------------------------------- 
	    | @postdata = input post data 
	    | @id       = current id 
	    | 
	    */
	public function hook_before_edit(&$postdata, $id)
	{
		//Your code here

	}

	/* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after edit public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	public function hook_after_edit($id)
	{
		//Your code here 

	}

	/* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command before delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	public function hook_before_delete($id)
	{
		$transaction = Transaction::find($id);
        
        // Pastikan data transaksi ditemukan
        if ($transaction) {
            $user_id = $transaction->user_id;
            $point_received = $transaction->point_received;
            $total_income = $transaction->total_income;
        
            // Kurangi poin pengguna berdasarkan transaksi yang dihapus
            $user_point = Point::where('user_id', $user_id)->first();
            if ($user_point) {
                $new_total_points = $user_point->total_points - $point_received;
                
                // Jika hasilnya negatif, set total_points menjadi 0
                $user_point->update([
                    'total_points' => $new_total_points < 0 ? 0 : $new_total_points
                ]);
            }
        
            // Kurangi saldo (tidak pernah negatif) lewat SaldoService + catat di ledger
            app(\App\Services\SaldoService::class)->debitUpTo(
                $user_id, (int) round($total_income), 'batal_setor_sampah', 'transaction', $id,
                'Pembatalan setor sampah #' . $id, CRUDBooster::myId()
            );
        }
	}

	/* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	public function hook_after_delete($id)
	{
		//Your code here

	}



	//By the way, you can still create your own method in here... :) 


}