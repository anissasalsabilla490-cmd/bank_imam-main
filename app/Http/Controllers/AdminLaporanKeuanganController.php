<?php

namespace App\Http\Controllers;

use Session;
use Request;
use DB;
use CRUDBooster;

class AdminLaporanKeuanganController extends \crocodicstudio\crudbooster\controllers\CBController
{

	public function cbInit()
	{

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
		$this->table = "laporan_keuangan";
		# END CONFIGURATION DO NOT REMOVE THIS LINE

		# START COLUMNS DO NOT REMOVE THIS LINE
		$this->col = [];
		$this->col[] = ["label" => "No", "callback_php" => '($row->index_number = (++$GLOBALS["index_number"]))'];
		if (in_array(CRUDBooster::myId(), [1, 10])) {
			$this->col[] = ["label" => "Nama BSU", "name" => "admin_id", "join" => "cms_users,name"];
		}
		$this->col[] = ["label" => "Periode", "name" => "periode"];
		$this->col[] = ["label" => "Total Beli", "name" => "total_beli", 'callback_php' => '"Rp. ".number_format($row->total_beli)'];
		$this->col[] = ["label" => "Total Jual", "name" => "total_jual", 'callback_php' => '"Rp. ".number_format($row->total_jual)'];
		$this->col[] = ["label" => "Profit", "name" => "profit", 'callback_php' => '"Rp. ".number_format($row->profit)'];
		$this->col[] = ["label" => "Ambil Saldo", "name" => "ambil_saldo", 'callback_php' => '"Rp. ".number_format($row->ambil_saldo)'];
		$this->col[] = ["label" => "Saldo Akhir", "name" => "saldo_akhir", 'callback_php' => '"Rp. ".number_format($row->saldo_akhir)'];
		# END COLUMNS DO NOT REMOVE THIS LINE

		# START FORM DO NOT REMOVE THIS LINE
		$this->form = [];
		$this->form[] = ['label' => 'Periode', 'name' => 'periode', 'type' => 'text', 'validation' => 'required|string|min:1|max:5000', 'width' => 'col-sm-10'];
		$this->form[] = ['label' => 'Total Beli', 'name' => 'total_beli', 'type' => 'number', 'validation' => 'required|integer|min:0', 'width' => 'col-sm-10'];
		$this->form[] = ['label' => 'Total Jual', 'name' => 'total_jual', 'type' => 'number', 'validation' => 'required|integer|min:0', 'width' => 'col-sm-10'];
		$this->form[] = ['label' => 'Profit', 'name' => 'profit', 'type' => 'number', 'validation' => 'required|integer', 'width' => 'col-sm-10', 'readonly' => 'true'];
		$this->form[] = ['label' => 'Ambil Saldo', 'name' => 'ambil_saldo', 'type' => 'number', 'validation' => 'integer|min:0', 'width' => 'col-sm-10', 'help' => 'Isi jika ingin mengambil saldo, jika tidak kosongkan'];
		$this->form[] = ['label' => 'Saldo Akhir', 'name' => 'saldo_akhir', 'type' => 'number', 'validation' => 'required|integer', 'width' => 'col-sm-10', 'readonly' => 'true'];
		# END FORM DO NOT REMOVE THIS LINE

		# OLD START FORM
		//$this->form = [];
		//$this->form[] = ['label'=>'Periode','name'=>'periode','type'=>'textarea','validation'=>'required|string|min:5|max:5000','width'=>'col-sm-10'];
		//$this->form[] = ['label'=>'Total Beli','name'=>'total_beli','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
		//$this->form[] = ['label'=>'Total Jual','name'=>'total_jual','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
		//$this->form[] = ['label'=>'Profit','name'=>'profit','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
		//$this->form[] = ['label'=>'Ambil Saldo','name'=>'ambil_saldo','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
		//$this->form[] = ['label'=>'Saldo Akhir','name'=>'saldo_akhir','type'=>'number','validation'=>'required|integer|min:0','width'=>'col-sm-10','disabled'=>'true'];
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
	        |  ----------------------------------------------------------------------     
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

		$laporanQuery = DB::table('laporan_keuangan')
			->where('laporan_keuangan.periode', 'like', '%' . $periodeFilter . '%');

		if (!in_array($adminId, [1, 10])) {
			$laporanQuery->where('laporan_keuangan.admin_id', $adminId);
		}

		$saldoAkhir = $laporanQuery->sum('saldo_akhir');

		$ambilSaldo = $laporanQuery->sum('ambil_saldo');

		$totalProfit = $laporanQuery->sum('profit');

		$totalBeli = $laporanQuery->sum('total_beli');

		$totalJual = $laporanQuery->sum('total_jual');

		// Format data statistik
		$this->index_statistic[] = [
			'label' => 'Total Saldo',
			'count' => 'Rp. ' . number_format($saldoAkhir, 0, ',', ','),
			'icon' => 'fa fa-check',
			'color' => 'success'
		];
		$this->index_statistic[] = [
			'label' => 'Total Saldo Diambil',
			'count' => 'Rp. ' . number_format($ambilSaldo, 0, ',', ','),
			'icon' => 'fa fa-money',
			'color' => 'primary'
		];
		$this->index_statistic[] = [
			'label' => 'Total Beli',
			'count' => 'Rp. ' . number_format($totalBeli, 0, ',', ','),
			'icon' => 'fa fa-money',
			'color' => 'red'
		];
		$this->index_statistic[] = [
			'label' => 'Total Profit',
			'count' => 'Rp. ' . number_format($totalProfit, 0, ',', ','),
			'icon' => 'fa fa-money',
			'color' => 'success'
		];
		$this->index_statistic[] = [
			'label' => 'Total Jual',
			'count' => 'Rp. ' . number_format($totalJual, 0, ',', ','),
			'icon' => 'fa fa-money',
			'color' => 'yellow'
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
                    let totalBeli = $('input[name=\"total_beli\"]');
                    let totalJual = $('input[name=\"total_jual\"]');
                    let profit = $('input[name=\"profit\"]');
                    let ambilSaldo = $('input[name=\"ambil_saldo\"]');
                    let saldoAkhir = $('input[name=\"saldo_akhir\"]');
                    
                    // Fungsi untuk menghitung profit
                    function calculateProfit() {
                        var beli = parseFloat(totalBeli.val()) || 0;
                        var jual = parseFloat(totalJual.val()) || 0;
                        var calculatedProfit = jual - beli;
                        profit.val(calculatedProfit); // Set nilai profit
                    }
                    
                    // Fungsi untuk menghitung saldo akhir
                    function calculateSaldoAkhir() {
                        var calculatedProfit = parseFloat(profit.val()) || 0;
						var jual = parseFloat(totalJual.val()) || 0;
                        var saldoAmbil = parseFloat(ambilSaldo.val()) || 0;
                        var calculatedSaldoAkhir = jual - saldoAmbil;
                        saldoAkhir.val(calculatedSaldoAkhir); // Set nilai saldo akhir
                    }
                    
                    // Jalankan perhitungan ketika nilai total_beli atau total_jual berubah
                    totalBeli.on('input', function() {
                        calculateProfit();
                        calculateSaldoAkhir();
                    });
                    
                    totalJual.on('input', function() {
                        calculateProfit();
                        calculateSaldoAkhir();
                    });
                    
                    // Jalankan perhitungan ketika nilai ambil_saldo berubah
                    ambilSaldo.on('input', function() {
                        calculateSaldoAkhir();
                    });
                    
                    // Inisialisasi perhitungan saat pertama kali halaman dimuat
                    calculateProfit();
                    calculateSaldoAkhir();
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
		// $this->style_css = NULL;
		$this->load_css[] =  asset('we-cycle-app/bootstrap/css/admin.css');



		/*
	        | ---------------------------------------------------------------------- 
	        | Include css File 
	        | ---------------------------------------------------------------------- 
	        | URL of your css each array 
	        | $this->load_css[] = asset("myfile.css");
	        |
	        */
		// $this->load_css = array();


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
		//Your code here

	}


	/*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate query of index result 
	    | ---------------------------------------------------------------------- 
	    | @query = current sql query 
	    |
	    */
	public function hook_query_index(&$query)
	{
		$currentUserId = CRUDBooster::myId();

		$GLOBALS['index_number'] = 0;

		if ($currentUserId == 1) {
		} elseif ($currentUserId == 10) {
		} else {
			$query->where('laporan_keuangan.admin_id', $currentUserId);
		}
	}

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
		//Your code here
		$postdata['admin_id'] = CRUDBooster::myId();
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
		//Your code here

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
		//Your code here

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
