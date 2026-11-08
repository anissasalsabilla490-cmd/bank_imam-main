<?php

namespace App\Http\Controllers;

use Session;
use Request;
use DB;
use CRUDBooster;

class AdminLaporanKompostingController extends \crocodicstudio\crudbooster\controllers\CBController
{
    public function cbInit()
    {
        # START CONFIGURATION
        $this->title_field        = "id";
        $this->limit              = "20";
        $this->orderby            = "id,desc";
        $this->global_privilege   = false;
        $this->button_table_action= true;
        $this->button_bulk_action = false;
        $this->button_action_style= "button_icon";        
        $this->button_add         = true;
        $this->button_edit        = true;
        $this->button_delete      = true;
        $this->button_detail      = true;
        $this->button_show        = true;
        $this->button_filter      = true;
        $this->button_import      = false;
        $this->button_export      = true;
        $this->table              = "laporan_komposting";
        $this->table_row_color    = [];
        // $this->style_css = "
        //     /* Samakan font & ukuran seperti laporan keuangan */
        //     .dataTable thead th, 
        //     .dataTable tbody td {
        //         font-size: 14px !important;
        //         padding: 8px 12px !important;
        //         vertical-align: middle !important;
        //     }

        //     /* Header tabel bold */
        //     .dataTable thead th {
        //         font-weight: bold !important;
        //     }

        //     /* Samakan border */
        //     table.dataTable.no-footer {
        //         border-bottom: 1px solid #ddd !important;
        //     }

        //     /* Samakan search & filter positioning */
        //     .dataTables_wrapper .dataTables_filter,
        //     .dataTables_wrapper .dataTables_length {
        //         margin-bottom: 10px !important;
        //     }
        // ";

        # END CONFIGURATION

        # START COLUMNS
        $this->col = [];
        $this->col[] = ["label" => "No", "callback_php" => '($row->index_number = (++$GLOBALS["index_number"]))'];
        if (in_array(CRUDBooster::myId(), [1,10])) {
            $this->col[] = ["label" => "Nama BSU", "name" => "admin_id", "join" => "cms_users,name"];
        }
        $this->col[] = ["label" => "Periode", "name" => "periode"];
        $this->col[] = ["label" => "Sampah Basah (Kg)", "name" => "sampah_basah_kg"];
        $this->col[] = ["label" => "Tanggal Panen", "name" => "tanggal_panen"];
        $this->col[] = ["label" => "Hasil Kompos (Kg)", "name" => "hasil_kompos_kg"];
        # END COLUMNS

        # START FORM
        $this->form = [];
        $this->form[] = ['label'=>'Periode','name'=>'periode','type'=>'text','validation'=>'required|string|min:1|max:255','width'=>'col-sm-10'];
        $this->form[] = ['label'=>'Jumlah Sampah Basah (Kg)','name'=>'sampah_basah_kg','type'=>'number','step'=>'0.01','validation'=>'required|numeric|min:0','width'=>'col-sm-10'];
        $this->form[] = ['label'=>'Tanggal Panen','name'=>'tanggal_panen','type'=>'date','validation'=>'nullable|date','width'=>'col-sm-10'];
        $this->form[] = ['label'=>'Hasil Kompos (Kg)','name'=>'hasil_kompos_kg','type'=>'number','step'=>'0.01','validation'=>'required|numeric|min:0','width'=>'col-sm-10'];
        # END FORM

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

        // Statistik: total sampah & total kompos
        $adminId = CRUDBooster::myId();
        $query   = DB::table('laporan_komposting');
        if(!in_array($adminId, [1,10])){
            $query->where('admin_id',$adminId);
        }

        $totalSampah = $query->sum('sampah_basah_kg');
        $totalKompos = $query->sum('hasil_kompos_kg');

        $this->index_statistic[] = [
            "label"=>"Total Sampah Basah",
            "count"=>$totalSampah." Kg",
            "icon"=>"fa fa-trash",
            "color"=>"info"
        ];
        $this->index_statistic[] = [
            "label"=>"Total Hasil Kompos",
            "count"=>$totalKompos." Kg",
            "icon"=>"fa fa-leaf",
            "color"=>"success"
        ];

        // Tambahkan setelah statistikub
        $chartData = DB::table('laporan_komposting')
            ->select('periode','sampah_basah_kg','hasil_kompos_kg')
            ->where(function($q){
                if(!in_array(CRUDBooster::myId(), [1,10])){
                    $q->where('admin_id', CRUDBooster::myId());
                }
            })
            ->orderBy('periode','asc')
            ->get();

        $labels = $chartData->pluck('periode')->toArray();
        $sampah = $chartData->pluck('sampah_basah_kg')->toArray();
        $kompos = $chartData->pluck('hasil_kompos_kg')->toArray();

        $this->post_index_html = view('admin.laporan_komposting_chart',[
            'labels'=>json_encode($labels),
            'sampah'=>json_encode($sampah),
            'kompos'=>json_encode($kompos)
        ])->render();

        


        // Script js opsional jika butuh hitung otomatis
        $this->script_js = "
            $(function() {
                $('input[name=\"periode\"]').on('change', function() {
                    let periode = $(this).val();
                    if(periode) {
                        let date = new Date(periode);
                        date.setMonth(date.getMonth() + 3); // tambah 3 bulan
                        let month = ('0' + (date.getMonth() + 1)).slice(-2);
                        let day = ('0' + date.getDate()).slice(-2);
                        let formatted = date.getFullYear() + '-' + month + '-' + day;
                        $('input[name=\"tanggal_panen\"]').val(formatted);
                    }
                });
            });
        ";
    }

    public function hook_query_index(&$query)
    {
        $GLOBALS['index_number'] = 0;
        $currentUserId = CRUDBooster::myId();
        if(!in_array($currentUserId, [1,10])){
            $query->where('laporan_komposting.admin_id',$currentUserId);
        }
    }
    public function hook_row_index($column_index, &$column_value) {
        // Kolom pertama (No)
        if($column_index == 0) {
            $column_value = "<div style='text-align:center;'>$column_value</div>";
        }
        // Kolom terakhir (aksi)
        if($column_index == count($this->col)) {
            $column_value = "<div style='text-align:center;'>$column_value</div>";
        }
    }


    public function hook_before_add(&$postdata)
    {
        $postdata['admin_id'] = CRUDBooster::myId();
        if (!empty($postdata['periode'])) {
            try {
                $periodeDate = \DateTime::createFromFormat('F Y', $postdata['periode']);
                if($periodeDate) {
                    $periodeDate->modify('+3 months');
                    $postdata['tanggal_panen'] = $periodeDate->format('Y-m-d');
                }    
            } catch (\Exception $e) {
                // fallback kalau format periode tidak valid
                $postdata['tanggal_panen'] = null;
            }
        }
    }

    public function hook_before_edit(&$postdata,$id)
    {
        // jaga agar admin_id tidak diubah manual
        $postdata['admin_id'] = CRUDBooster::myId();
        if (!empty($postdata['periode'])) {
            try {
                $periodeDate = \DateTime::createFromFormat('F Y', $postdata['periode']);
                if($periodeDate) {
                    $periodeDate->modify('+3 months');
                    $postdata['tanggal_panen'] = $periodeDate->format('Y-m-d');
                }
            } catch (\Exception $e) {
                $postdata['tanggal_panen'] = null;
            }
        }
    }
}
