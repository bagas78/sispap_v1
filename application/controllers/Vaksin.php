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

	    //kandang
		$data['kandang_data'] = $this->query_builder->view("SELECT * FROM t_kandang WHERE kandang_hapus = 0");

		//ayam
		$data['ayam_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_kategori = 5 AND barang_hapus = 0");

		$this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('vaksin/jadwal_add');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function jadwal_get_ayam($id){

		$data = $this->query_builder->view("SELECT DISTINCT b.barang_id AS id, b.barang_nama AS ayam FROM t_kandang_log AS a JOIN t_barang AS b ON a.kandang_log_barang = b.barang_id WHERE a.kandang_log_hapus = 0 AND a.kandang_log_kandang = '$id'");
		echo json_encode($data);
	}
	function jadwal_save(){

		$kandang = strip_tags($_POST['kandang']);
		$ayam = strip_tags($_POST['ayam']);

		$set = array(
						'vaksin_jadwal_kode' => strip_tags($_POST['kode']),
						'vaksin_jadwal_kandang' => $kandang,
						'vaksin_jadwal_ayam' => $ayam,
						'vaksin_jadwal_hari' => strip_tags($_POST['hari']),
						'vaksin_jadwal_keterangan' => strip_tags($_POST['keterangan']),
					);

		//cek
		$cek = $this->query_builder->count("SELECT * FROM t_kandang_log WHERE kandang_log_kandang = '$kandang' AND kandang_log_barang = '$ayam'");

		if ($cek > 0) {
			
			$db = $this->query_builder->add('t_vaksin_jadwal',$set);

			if ($db == 1) {
				$this->session->set_flashdata('success','Data berhasil di tambah');
			} else {
				$this->session->set_flashdata('gagal','Data gagal di tambah');
			}
		}else{

			$this->session->set_flashdata('gagal','Ayam tidak ada di kandang yang dipilih');
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

		//data
		$data['data'] = $this->query_builder->view_row("SELECT * FROM t_vaksin_jadwal where vaksin_jadwal_id = '$id'");

		//kandang
		$data['kandang_data'] = $this->query_builder->view("SELECT * FROM t_kandang WHERE kandang_hapus = 0");

		//ayam
		$data['ayam_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_kategori = 5 AND barang_hapus = 0");

		$data['title'] = 'Jadwal Vaksinasi';

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('vaksin/jadwal_add');
	    $this->load->view('vaksin/jadwal_edit');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function jadwal_update($id){

		$kandang = strip_tags($_POST['kandang']);
		$ayam = strip_tags($_POST['ayam']);

		$set = array(
						'vaksin_jadwal_kandang' => $kandang,
						'vaksin_jadwal_ayam' => $ayam,
						'vaksin_jadwal_hari' => strip_tags($_POST['hari']),
						'vaksin_jadwal_keterangan' => strip_tags($_POST['keterangan']),
					);

		//cek
		$cek = $this->query_builder->count("SELECT * FROM t_kandang_log WHERE kandang_log_kandang = '$kandang' AND kandang_log_barang = '$ayam'");

		if ($cek > 0) {
			
			$where = ['vaksin_jadwal_id' => $id];
			$db = $this->query_builder->update('t_vaksin_jadwal',$set,$where);
			
			if ($db == 1) {
				$this->session->set_flashdata('success','Data berhasil di rubah');
			} else {
				$this->session->set_flashdata('gagal','Data gagal di rubah');
			}
		}else{

			$this->session->set_flashdata('gagal','Ayam tidak ada di kandang yang dipilih');
		}
		
		redirect(base_url('vaksin/jadwal'));
	}

	function reminder(){
		
		$data['title'] = 'Vaksinasi';

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('vaksin/reminder');
	    $this->load->view('v_template_admin/admin_footer');
	}

	function reminder_get_data(){ 

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
	function reminder_proses($id){

		$set = ['vaksin_status' => 1];
		$where = ['vaksin_id' => $id];
		$db = $this->query_builder->update('t_vaksin',$set,$where);
		
		if ($db == 1) {
			$this->session->set_flashdata('success','Data berhasil di simpan');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di simpan');
		}

		redirect(base_url('vaksin/reminder'));
	}

	//add reminder
	function add_reminder(){

		$data = $this->db->query("SELECT * FROM t_vaksin_jadwal WHERE vaksin_jadwal_hapus = 0")->result_array();

		foreach ($data as $v) {

            //set
            $vaksin = $v['vaksin_jadwal_id'];
            $kandang = $v['vaksin_jadwal_kandang'];
            $ayam = $v['vaksin_jadwal_ayam'];

            $u = $v['vaksin_jadwal_hari'];
            $now = date('Y-m-d');

            //cek data vaksin
            $cek = $this->db->query("SELECT * FROM t_vaksin WHERE vaksin_jadwal = '$vaksin' AND vaksin_kandang = '$kandang' AND vaksin_ayam = '$ayam' ORDER BY vaksin_id DESC LIMIT 1")->row_array();

            if (@$cek) {

            	//sudah ada
            	$d = $cek['vaksin_tanggal'];
            	$date = new DateTime($d); 
	            $date->modify("+".$u." day");
	            $jadwal = $date->format('Y-m-d');

	            //simpan
	            if ($jadwal == $now) {
	            	
	            	$cek2 = $this->db->query("SELECT * FROM t_vaksin WHERE vaksin_kandang = '$kandang' AND vaksin_ayam = '$ayam' AND vaksin_tanggal = '$jadwal'")->num_rows();

	            	if (@$cek2 == 0) {
	            		
	            		$set = array(
	            					'vaksin_jadwal' => $vaksin,
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
            	$d = $v['vaksin_jadwal_tanggal'];
				$date = new DateTime($d); 
	            $date->modify("+".$u." day");
	            $jadwal = $date->format('Y-m-d');

	            $cek2 = $this->db->query("SELECT * FROM t_vaksin WHERE vaksin_kandang = '$kandang' AND vaksin_ayam = '$ayam' AND vaksin_tanggal = '$jadwal'")->num_rows();

	            if ($jadwal == $now) {

	            	if (@$cek2 == 0) {
            		
	            		$set = array(
	            					'vaksin_jadwal' => $vaksin,
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