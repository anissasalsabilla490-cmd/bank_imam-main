<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Models\Transaction;
	use App\Models\TransactionsBsi;

	class AdminTransactionsBsiController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
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
			$this->table = "transactions_bsi";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label" => "No", "callback_php" => '($row->index_number = (++$GLOBALS["index_number"]))'];
			if (in_array(CRUDBooster::myId(), [1, 10])) {
			    $this->col[] = ["label"=>"Nama BSU","name"=>"admin_id","join"=>"cms_users,name"];
			}
			$this->col[] = ["label" => "Jenis Sampah", "name" => "sampah_id", "join" => "sampah,name"];
			$this->col[] = ["label"=>"Berat Total","name"=>"total_weight"];
			$this->col[] = ["label"=>"Harga per kg","name"=>"harga_per_kg",'callback_php' => '"Rp. ".number_format($row->harga_per_kg)'];
			$this->col[] = ["label"=>"Jumlah","name"=>"total_price", 'callback_php' => '"Rp. ".number_format($row->total_price)'];
			// $this->col[] = ["label"=>"Profit","name"=>"profit", 'callback_php' => '"Rp. ".number_format($row->profit)'];
			$this->col[] = ["label" => "Tanggal & Waktu", "name" => "created_at", "callback" => function($row) {
				return date('d/m/Y H:i:s', strtotime($row->created_at)); // Format alternatif
			}];
			$this->col[] = ["label"=>"Periode","name"=>"periode"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
            $this->form[] = ['label' => 'Nama BSU', 'name' => 'admin_id', 'type' => 'hidden', 'validation' => 'required|integer|min:0', 'width' => 'col-sm-10', 'value' => CRUDBooster::myId()];
			$this->form[] = ['label' => 'Jenis Sampah', 'name' => 'sampah_id', 'type' => 'select2', 'validation' => 'required|min:1|max:255', 'width' => 'col-sm-10', 'datatable' => 'sampah,name', 'datatable_where' => 'admin_id = '.CRUDBooster::myId()];
			$this->form[] = ['label' => 'Periode', 'name' => 'periode', 'type' => 'text', 'validation' => 'required|min:1|max:255', 'width' => 'col-sm-10'];
			$this->form[] = ['label' => 'Total Berat', 'name' => 'total_weight', 'type' => 'text', 'validation' => 'required', 'width' => 'col-sm-10', ];
			$this->form[] = ['label'=>'Harga satuan BSI','name'=>'harga_per_kg','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
		
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Admin Id','name'=>'admin_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'admin,id'];
			//$this->form[] = ['label'=>'Total Weight','name'=>'total_weight','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Total Price','name'=>'total_price','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Profit','name'=>'profit','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
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
            $profitSumQuery = DB::table('transactions_bsi')
                ->join('cms_users', 'transactions_bsi.admin_id', '=', 'cms_users.id') // Join dengan tabel cms_users
                ->join('sampah', 'transactions_bsi.sampah_id', '=', 'sampah.id'); // Join dengan tabel sampah
                
            if (!empty( $filterColumn['transactions_bsi.periode']['value'])) {
                $profitSumQuery->where('transactions_bsi.periode', 'like', '%' . $filterColumn['transactions_bsi.periode']['value'] . '%');
            }
            
            // Filter Nama BSU
            if (!empty($filterColumn['cms_users.name']['value'])) {
                $profitSumQuery->where('cms_users.name', 'like', '%' . $filterColumn['cms_users.name']['value'] . '%');
            }
            
            // Filter Jenis Sampah
            if (!empty($filterColumn['sampah.name']['value'])) {
                $profitSumQuery->where('sampah.name', 'like', '%' . $filterColumn['sampah.name']['value'] . '%');
            }
            
            // Filter Harga per Kg
            if (!empty($filterColumn['transactions_bsi.harga_per_kg']['value'])) {
                $profitSumQuery->where('transactions_bsi.harga_per_kg', '=', $filterColumn['transactions_bsi.harga_per_kg']['value']);
            }
            
            // Filter Jumlah
            if (!empty($filterColumn['transactions_bsi.total_price']['value'])) {
                $profitSumQuery->where('transactions_bsi.total_price', '=', $filterColumn['transactions_bsi.total_price']['value']);
            }
            
            if (!empty($filterColumn['transactions_bsi.created_at']['value'])) {
                $createdAtRange = $filterColumn['transactions_bsi.created_at']['value']; // Misalkan formatnya array [start, end]
                
                // Jika diberikan rentang tanggal (array dengan 2 nilai: start dan end)
                if (is_array($createdAtRange) && count($createdAtRange) === 2) {
                    $profitSumQuery->whereBetween('transactions_bsi.created_at', [$createdAtRange[0], $createdAtRange[1]]);
                }
                // Jika hanya satu tanggal yang diberikan
                elseif (!empty($createdAtRange)) {
                    $profitSumQuery->where('transactions_bsi.created_at', '=', $createdAtRange);
                }
            }
            
            // Tambahkan kondisi untuk memfilter berdasarkan admin_id yang sesuai dengan ID Anda saat ini
            if ($adminId == 1 || $adminId == 10) {
                $profitSumQuery->orWhereIn('transactions_bsi.admin_id', [1, 10]);
            }
            $profitSumQuery->where('transactions_bsi.admin_id', $adminId);
            
            $profitSum = $profitSumQuery->sum('total_price');
            
            // Query untuk menghitung total pembelian (buySum) dari tabel transactions
            $buySumQuery = DB::table('transactions')
                ->where('transactions.periode', 'like', '%' . $periodeFilter . '%');
            
            // Filter berdasarkan admin_id kecuali jika admin_id adalah 1 atau 10
           	if (!in_array($adminId, [1, 10])) {
				$buySumQuery->where('transactions.admin_id', $adminId);
			}
            
            $buySum = $buySumQuery->sum('total_income');
            
            $totalProfit = $profitSum - $buySum;
            
            // Format data statistik
            $this->index_statistic[] = [
                'label' => 'Total Profit',
                'count' => 'Rp. ' . number_format($totalProfit, 0, ',', ','),
                'icon' => 'fa fa-check',
                'color' => 'success'
            ];
            $this->index_statistic[] = [
                'label' => 'Total Penjualan',
                'count' => 'Rp. ' . number_format($profitSum, 0, ',', ','),
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
	    public function actionButtonSelected($id_selected,$button_name) {
	        //Your code here
	            
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
				$query->where('transactions_bsi.admin_id', $currentUserId);
			}
	    }

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate row of index table html 
	    | ---------------------------------------------------------------------- 
	    |
	    */    
	    public function hook_row_index($column_index,&$column_value) {	        
	    	//Your code here
	    }

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before add data is execute
	    | ---------------------------------------------------------------------- 
	    | @arr
	    |
	    */
	    public function hook_before_add(&$postdata) {        
	        //Your code here

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
			$transaction_bsi = TransactionsBsi::find($id);
			$periode_bsi = $transaction_bsi->periode;

			$total_income_sum = Transaction::where('periode', $periode_bsi)
				->where('admin_id', $transaction_bsi->admin_id)
				->sum('total_income');

				$jumlah = $transaction_bsi->total_weight * $transaction_bsi->harga_per_kg;
				
				$transaction_bsi->update([
					'total_price' => $jumlah
				]);

				$final_profit = ($transaction_bsi->total_price - $total_income_sum);

				$transaction_bsi->update([
					'profit' => $final_profit
				]);
			
				// dd($transaction_bsi->total_price);
		}




	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before update data is execute
	    | ---------------------------------------------------------------------- 
	    | @postdata = input post data 
	    | @id       = current id 
	    | 
	    */
	    public function hook_before_edit(&$postdata,$id) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after edit public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_after_edit($id) {
			$transaction_bsi = TransactionsBsi::find($id);
			$periode_bsi = $transaction_bsi->periode;

			$total_income_sum = Transaction::where('periode', $periode_bsi)
				->where('admin_id', $transaction_bsi->admin_id)
				->sum('total_income');

				$jumlah = $transaction_bsi->total_weight * $transaction_bsi->harga_per_kg;
				
				$transaction_bsi->update([
					'total_price' => $jumlah
				]);

				$final_profit = ($transaction_bsi->total_price - $total_income_sum);

				$transaction_bsi->update([
					'profit' => $final_profit
				]);
		}
		


	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command before delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_before_delete($id) {
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_after_delete($id) {
	        //Your code here

	    }



	    //By the way, you can still create your own method in here... :) 


	}