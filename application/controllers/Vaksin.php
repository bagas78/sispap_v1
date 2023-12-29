<?php
class Vaksin extends CI_Controller{

	function __construct(){
		parent::__construct();
		$this->load->model('m_vaksin_jadwal');
		$this->load->model('m_vaksin');
	}  
	function jadwal(){
		$data['title'] = 'Jadwal Vaksinasi';

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('vaksin/jadwal');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function jadwal_get_data(){ 

		$where = array('vaksin_jadwal_hapus' => 0);

	    $data = $this->m_vaksin_jadwal->get_datatables($where);
		$total = $this->m_vaksin_jadwal->count_all($where);
		$filter = $this->m_vaksin_jadwal->count_filtered($where);

		$output = array(
			"draw" => $_GET['draw'],
			"recordsTotal" => $total,
			"recordsFiltered" => $filter,
			"data" => $data,
		);
		//output dalam format JSON
		echo json_encode($output);
	}
	function jadwal_add(){ 
		
		$data['title'] = 'Jadwal Vaksinasi';

	    //generate kode
	    $num = $this->query_builder->count("SELECT * FROM t_vaksin_jadwal") + 1;
	    $data['kode'] = 'VK00'.$num;

		$this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('vaksin/jadwal_add');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function jadwal_save(){
		$set = array(
						'vaksin_jadwal_kode' => strip_tags($_POST['kode']),
						'vaksin_jadwal_nama' => strip_tags($_POST['nama']),
						'vaksin_jadwal_hari' => strip_tags($_POST['hari']),
						'vaksin_jadwal_keterangan' => strip_tags($_POST['keterangan']),
					);

		$db = $this->query_builder->add('t_vaksin_jadwal',$set);

		if ($db == 1) {
			$this->session->set_flashdata('success','Data berhasil di tambah');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di tambah');
		}
		
		redirect(base_url('vaksin/jadwal'));	

	}
	function jadwal_delete($id){

		$set = ['vaksin_jadwal_hapus' => 1];
		$where = ['vaksin_jadwal_id' => $id];
		$db = $this->query_builder->update('t_vaksin_jadwal',$set,$where);
		
		if ($db == 1) {
			$this->session->set_flashdata('success','Data berhasil di hapus');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di hapus');
		}
		
		redirect(base_url('vaksin/jadwal'));
	}
	function jadwal_edit($id){
		$data['data'] = $this->query_builder->view_row("SELECT * FROM t_vaksin_jadwal where vaksin_jadwal_id = '$id'");

		$data['title'] = 'Jadwal Vaksinasi';

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('vaksin/jadwal_add');
	    $this->load->view('vaksin/jadwal_edit');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function jadwal_update($id){

		$set = array(
						'vaksin_jadwal_nama' => strip_tags($_POST['nama']),
						'vaksin_jadwal_hari' => strip_tags($_POST['hari']),
						'vaksin_jadwal_keterangan' => strip_tags($_POST['keterangan']),
					);

		$where = ['vaksin_jadwal_id' => $id];
		$db = $this->query_builder->update('t_vaksin_jadwal',$set,$where);
		
		if ($db == 1) {
			$this->session->set_flashdata('success','Data berhasil di rubah');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di rubah');
		}
		
		redirect(base_url('vaksin/jadwal'));
	}

	function ayam(){
		
		$data['title'] = 'Vaksinasi';

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('vaksin/ayam');
	    $this->load->view('v_template_admin/admin_footer');
	}

	function ayam_get_data(){ 

		$where = array('vaksin_hapus' => 0);

	    $data = $this->m_vaksin->get_datatables($where);
		$total = $this->m_vaksin->count_all($where);
		$filter = $this->m_vaksin->count_filtered($where);

		$output = array(
			"draw" => $_GET['draw'],
			"recordsTotal" => $total,
			"recordsFiltered" => $filter,
			"data" => $data,
		);
		//output dalam format JSON
		echo json_encode($output);
	}
	function ayam_proses($id){

		$set = ['vaksin_status' => 1];
		$where = ['vaksin_id' => $id];
		$db = $this->query_builder->update('t_vaksin',$set,$where);
		
		if ($db == 1) {
			$this->session->set_flashdata('success','Data berhasil di simpan');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di simpan');
		}

		redirect(base_url('vaksin/ayam'));
	}

	//add jadwal
	function add_jadwal(){

		$data = $this->db->query("SELECT * FROM t_kandang_log AS a JOIN t_vaksin_jadwal AS b ON a.kandang_log_vaksin = b.vaksin_jadwal_id WHERE a.kandang_log_hapus = 0")->result_array();

		foreach ($data as $v) {

            //set
            $log = $v['kandang_log_id'];
            $ayam = $v['kandang_log_barang'];
            $kandang = $v['kandang_log_kandang'];
            $vaksin = $v['kandang_log_vaksin'];
            $u = $v['vaksin_jadwal_hari'];
            $now = date('Y-m-d');

            //cek data vaksin
            $cek = $this->db->query("SELECT * FROM t_vaksin WHERE vaksin_log = '$log' AND vaksin_vaksin = '$vaksin' AND vaksin_ayam = '$ayam' AND vaksin_kandang = '$kandang' ORDER BY vaksin_id DESC LIMIT 1")->row_array();

            if (@$cek) {

            	//sudah ada
            	$d = $cek['vaksin_tanggal'];
            	$date = new DateTime($d); 
	            $date->modify("+".$u." day");
	            $jadwal = $date->format('Y-m-d');

	            //simpan
	            if ($jadwal == $now) {
	            	
	            	$cek2 = $this->db->query("SELECT * FROM t_vaksin WHERE vaksin_log = '$log' AND vaksin_vaksin = '$vaksin' AND vaksin_ayam = '$ayam' AND vaksin_kandang = '$kandang' AND vaksin_tanggal = '$jadwal'")->num_rows();

	            	if (@$cek2 == 0) {
	            		
	            		$set = array(
	            					'vaksin_log' => $log,
	            					'vaksin_vaksin' => $vaksin,
	            					'vaksin_ayam' => $ayam,
	            					'vaksin_kandang' => $kandang,
	            					'vaksin_tanggal' => $jadwal,
	            				);

	            		$this->db->set($set);
	            		$this->db->insert('t_vaksin');
	            	}
	            }

            }else{
				
				//jadwal baru            	
            	$d = $v['kandang_log_tanggal'];
				$date = new DateTime($d); 
	            $date->modify("+".$u." day");
	            $jadwal = $date->format('Y-m-d');

	            $cek2 = $this->db->query("SELECT * FROM t_vaksin WHERE vaksin_log = '$log' AND vaksin_vaksin = '$vaksin' AND vaksin_ayam = '$ayam' AND vaksin_kandang = '$kandang' AND vaksin_tanggal = '$jadwal'")->num_rows();

	            if ($jadwal == $now) {

	            	if (@$cek2 == 0) {
            		
	            		$set = array(
	            					'vaksin_log' => $log,
	            					'vaksin_vaksin' => $vaksin,
	            					'vaksin_ayam' => $ayam,
	            					'vaksin_kandang' => $kandang,
	            					'vaksin_tanggal' => $jadwal,
	            				);

	            		$this->db->set($set);
	            		$this->db->insert('t_vaksin');
	            	}
	            }
            }	
			
		}
	}
}