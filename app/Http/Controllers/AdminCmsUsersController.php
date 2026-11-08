<?php namespace App\Http\Controllers;

use Session;
use Request;
use DB;
use CRUDbooster;
use crocodicstudio\crudbooster\controllers\CBController;

class AdminCmsUsersController extends CBController {


	public function cbInit() {

		# START CONFIGURATION DO NOT REMOVE THIS LINE
		$this->table               = 'cms_users';
		$this->primary_key         = 'id';
		$this->title_field         = "name";
		$this->button_action_style = 'button_icon';	
		$this->button_import 	   = FALSE;	
		$this->button_export 	   = FALSE;	
		# END CONFIGURATION DO NOT REMOVE THIS LINE
	
		# START COLUMNS DO NOT REMOVE THIS LINE
		$this->col = array();
		$this->col[] = ["label" => "No", "callback_php" => '($row->index_number = (++$GLOBALS["index_number"]))'];
		$this->col[] = array("label"=>"Name","name"=>"name");
		$this->col[] = array("label"=>"Email","name"=>"email");
		$this->col[] = array("label"=>"Privilege","name"=>"id_cms_privileges","join"=>"cms_privileges,name");
		$this->col[] = array("label"=>"Photo","name"=>"photo","image"=>1);		
		$this->col[] = array("label"=>"No Whatsapp","name"=>"no_whatsapp");		
		$this->col[] = array("label"=>"Status","name"=>"status"); 
		# END COLUMNS DO NOT REMOVE THIS LINE

		# START FORM DO NOT REMOVE THIS LINE
		$this->form = array(); 		
		$this->form[] = array("label"=>"Name","name"=>"name",'required'=>true,'validation'=>'required|min:3');
		$this->form[] = array("label"=>"Email","name"=>"email",'required'=>true,'type'=>'email','validation'=>'required|email|unique:cms_users,email,'.CRUDBooster::getCurrentId());
		$this->form[] = array("label"=>"No Whatsapp","name"=>"no_whatsapp");		
		$this->form[] = array("label"=>"Photo","name"=>"photo","type"=>"upload","help"=>"Recommended resolution is 200x200px",'required'=>true,'validation'=>'required|image|max:1000','resize_width'=>90,'resize_height'=>90);
		$this->form[] = array("label"=>"Status","name"=>"status","type"=>"select","dataenum"=>"Active;Inactive",'required'=>true);							
		$this->form[] = [
			"label" => "Privilege",
			"name" => "id_cms_privileges",
			"type" => "select",
			"datatable" => "cms_privileges,name",
			'required' => true,
			'datatable_where' => (CRUDBooster::myId() == 10) ? "id != 1 AND id != 2" : ""
		];						
		$this->form[] = array("label"=>"Password","name"=>"password","type"=>"password","help"=>"Please leave empty if not change");
		$this->form[] = array("label"=>"Password Confirmation","name"=>"password_confirmation","type"=>"password","help"=>"Please leave empty if not change");
		// Add status field with active/inactive options		
		# END FORM DO NOT REMOVE THIS LINE
		
		$this->load_css[] =  asset('we-cycle-app/bootstrap/css/admin.css');

	}

	public function getProfile() {			

		$this->button_addmore = FALSE;
		$this->button_cancel  = FALSE;
		$this->button_show    = FALSE;			
		$this->button_add     = FALSE;
		$this->button_delete  = FALSE;	
		$this->hide_form 	  = ['id_cms_privileges'];

		$data['page_title'] = cbLang("label_button_profile");
		$data['row']        = CRUDBooster::first('cms_users',CRUDBooster::myId());

        return $this->view('crudbooster::default.form',$data);
	}
	public function hook_before_edit(&$postdata,$id) { 
		unset($postdata['password_confirmation']);
	}
	public function hook_before_add(&$postdata) {      
	    unset($postdata['password_confirmation']);
	}
	public function hook_query_index(&$query) {
		$currentUserId = CRUDBooster::myId(); 
		
		$GLOBALS['index_number'] = 0;
		
		if ($currentUserId == 1) {

		}elseif($currentUserId == 10) {
			$query->where('cms_users.id', '!=', 1);
		}
	}
}
