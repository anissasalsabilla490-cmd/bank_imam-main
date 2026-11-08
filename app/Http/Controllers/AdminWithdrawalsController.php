<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Exceptions\WithdrawalException;
	use App\Models\Withdrawal;
	use App\Services\WithdrawalService;

	/**
	 * Monitoring penarikan saldo digital.
	 * - Super Admin: semua data + tombol "Selesaikan" untuk status review/processing/pending.
	 * - BSU: hanya penarikan nasabahnya, hanya lihat.
	 */
	class AdminWithdrawalsController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "reference_id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = false;
			$this->button_action_style = "button_icon";
			$this->button_add = false;
			$this->button_edit = false;
			$this->button_delete = false;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = true;
			$this->table = "withdrawals";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Referensi","name"=>"reference_id"];
			$this->col[] = ["label"=>"Nasabah","name"=>"user_id","join"=>"users,username"];
			if (CRUDBooster::isSuperadmin()) {
				$this->col[] = ["label"=>"BSU","name"=>"admin_id","join"=>"cms_users,name"];
			}
			$this->col[] = ["label"=>"Tujuan","name"=>"channel_code"];
			$this->col[] = ["label"=>"Nomor","name"=>"account_number"];
			$this->col[] = ["label"=>"Nominal","name"=>"amount",'callback_php'=>'"Rp. ".number_format($row->amount,0,",",".")'];
			$this->col[] = ["label"=>"Status","name"=>"status",'callback_php'=>'strtoupper($row->status)'];
			$this->col[] = ["label"=>"Alasan/Catatan","name"=>"failure_reason"];
			$this->col[] = ["label"=>"Waktu","name"=>"created_at",'callback_php'=>'date("d/m/Y H:i", strtotime($row->created_at))'];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Referensi','name'=>'reference_id','type'=>'text','readonly'=>true,'width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

	        $this->sub_module = array();

	        $this->addaction = array();
	        if (CRUDBooster::isSuperadmin()) {
	            $this->addaction[] = [
	                'label'  => 'Selesaikan',
	                'url'    => CRUDBooster::mainpath('resolve/[id]'),
	                'icon'   => 'fa fa-check-circle',
	                'color'  => 'warning',
	                'showIf' => "[status] == 'review' || [status] == 'processing' || [status] == 'pending'",
	            ];
	        }

	        $this->button_selected = array();
	        $this->alert        = array();
	        $this->index_button = array();
	        $this->table_row_color = array();
	        $this->index_statistic = array();
	        $this->script_js = NULL;
	        $this->pre_index_html = null;
	        $this->post_index_html = null;
	        $this->load_js = array();
	        $this->style_css = NULL;
	        $this->load_css = array();
	    }

	    public function actionButtonSelected($id_selected,$button_name) {
	    }

	    public function hook_query_index(&$query) {
	        if (!CRUDBooster::isSuperadmin()) {
	            $query->where('withdrawals.admin_id', CRUDBooster::myId());
	        }
	    }

	    public function hook_row_index($column_index,&$column_value) {
	    }

	    public function hook_before_add(&$postdata) {
	    }

	    public function hook_after_add($id) {
	    }

	    public function hook_before_edit(&$postdata,$id) {
	    }

	    public function hook_after_edit($id) {
	    }

	    public function hook_before_delete($id) {
	    }

	    public function hook_after_delete($id) {
	    }

	    /* Halaman konfirmasi penyelesaian manual (GET hanya menampilkan form; aksi lewat POST + CSRF) */
	    public function getResolve($id) {
	        if (!CRUDBooster::isSuperadmin()) {
	            CRUDBooster::redirect(CRUDBooster::adminPath(), trans('crudbooster.denied_access'));
	        }
	        $w = Withdrawal::findOrFail($id);
	        $data = ['page_title' => 'Selesaikan Penarikan ' . $w->reference_id, 'w' => $w];
	        return view('admin.withdrawal_resolve', $data);
	    }

	    public function postResolveSave() {
	        if (!CRUDBooster::isSuperadmin()) {
	            CRUDBooster::redirect(CRUDBooster::adminPath(), trans('crudbooster.denied_access'));
	        }
	        $id = (int) request('id');
	        $result = request('result');
	        $note = trim((string) request('note'));

	        if (!in_array($result, ['success', 'failed'], true) || mb_strlen($note) < 5) {
	            CRUDBooster::redirect(CRUDBooster::mainpath('resolve/' . $id), 'Pilih hasil dan isi catatan minimal 5 karakter.', 'warning');
	        }

	        try {
	            app(WithdrawalService::class)->resolveManually($id, $result, CRUDBooster::myId(), $note);
	        } catch (WithdrawalException $e) {
	            CRUDBooster::redirect(CRUDBooster::mainpath(), $e->getMessage(), 'warning');
	        }

	        CRUDBooster::redirect(CRUDBooster::mainpath(), 'Penarikan diselesaikan manual: ' . $result, 'success');
	    }
	}
