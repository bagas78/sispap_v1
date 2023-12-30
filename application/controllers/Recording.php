<?php
class Recording extends CI_Controller{

	function __construct(){ 
		parent::__construct();
		$this->load->model('m_recording');
	}  
	function harian(){
		$data['title'] = 'Recording Harian'; 
 
	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('recording/index');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function harian_get(){

		$level = $this->session->userdata('level');
		$user = $this->session->userdata('id');

		if ($level == 1) {
			//admin
			$where = array('recording_hapus' => 0);
		}else{
			//user
			$where = array('recording_hapus' => 0, 'recording_user' => $user);
		}

	    $data = $this->m_recording->get_datatables($where);
		$total = $this->m_recording->count_all($where);
		$filter = $this->m_recording->count_filtered($where);

		$output = array(
			"draw" => $_GET['draw'],
			"recordsTotal" => $total,
			"recordsFiltered" => $filter,
			"data" => $data,
		);
		//output dalam format JSON
		echo json_encode($output);
	} 
	function harian_add(){

		//kandang
		$data['kandang_data'] = $this->query_builder->view("SELECT * FROM t_kandang WHERE kandang_hapus = 0");

		//pakan
		$data['pakan_data'] = $this->query_builder->view("SELECT * FROM t_pakan WHERE pakan_hapus = 0");

		//premix
		$data['premix_data'] = $this->query_builder->view("SELECT * FROM t_premix WHERE premix_hapus = 0");

		//telur
		$data['telur_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 1");

		//afkir
		$data['afkir_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 2");

		//ayam
		$data['ayam_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 5");

		//obat
		$data['obat_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 4");

		$data['title'] = 'Recording Harian';

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('recording/add');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function get_barang($id){

		$get = $this->query_builder->view_row("SELECT * FROM t_barang WHERE barang_id = '$id'");

		echo json_encode($get);

	}
	function get_pakan($id){

		$get = $this->query_builder->view_row("SELECT * FROM t_pakan WHERE pakan_id = '$id'");

		echo json_encode($get);

	}
	function get_premix($id){

		$get = $this->query_builder->view_row("SELECT * FROM t_premix WHERE premix_id = '$id'");

		echo json_encode($get);

	}
	function get_kandang($id){

		$get = $this->query_builder->view_row("SELECT * FROM t_kandang WHERE kandang_id = '$id'");
		echo json_encode($get);
	}
	function save(){

		//generate nomor
		$get = $this->query_builder->count("SELECT * FROM t_recording");
		$nomor = 'RC-'.date('dmy').'-'.($get + 1);

		$set = array(
						'recording_nomor' => $nomor,
						'recording_user' => $this->session->userdata('id'),
						'recording_tanggal' => strip_tags(@$_POST['tanggal']),
						'recording_kandang' => strip_tags(@$_POST['kandang']),
						'recording_bobot' => strip_tags(@$_POST['bobot']),
						'recording_populasi' => strip_tags(@$_POST['populasi']),
					);

		$db = $this->query_builder->add('t_recording', $set);
		if ($db == 1) {

			//save ayam
			if (@$_POST['ayam']) {
				
				$ayam = count($_POST['ayam']);

				for ($i = 0; $i < $ayam; ++$i) {
				
					$this->query_builder->add('t_recording_barang', ['recording_barang_nomor' => $nomor, 'recording_barang_barang' => $_POST['ayam'][$i], 'recording_barang_berat' => $_POST['ayam_berat'][$i], 'recording_barang_gejala' => $_POST['ayam_gejala'][$i], 'recording_barang_obat' => $_POST['ayam_obat'][$i], 'recording_barang_kategori' => $_POST['ayam_kategori'][$i]]);
				}				
			}


			//save afkir
			if (@$_POST['afkir']) {
				
				$afkir = count($_POST['afkir']);

				for ($i = 0; $i < $afkir; ++$i) {
				
					$this->query_builder->add('t_recording_barang', ['recording_barang_nomor' => $nomor, 'recording_barang_barang' => $_POST['afkir'][$i], 'recording_barang_jumlah' => $_POST['afkir_jumlah'][$i], 'recording_barang_kategori' => $_POST['afkir_kategori'][$i]]);
				}				
			}


			//save telur
			if (@$_POST['telur']) {

				$telur = count($_POST['telur']);
				
				for ($i = 0; $i < $telur; ++$i) {
				
					$this->query_builder->add('t_recording_barang', ['recording_barang_nomor' => $nomor, 'recording_barang_barang' => $_POST['telur'][$i], 'recording_barang_jumlah' => $_POST['telur_jumlah'][$i], 'recording_barang_kategori' => $_POST['telur_kategori'][$i]]);
				}	
			}
			

			//save pakan
			if (@$_POST['pakan']) {

				$pakan = count($_POST['pakan']);
				
				for ($i = 0; $i < $pakan; ++$i) {
				
					$this->query_builder->add('t_recording_barang', ['recording_barang_nomor' => $nomor, 'recording_barang_barang' => $_POST['pakan'][$i], 'recording_barang_stok' => $_POST['pakan_stok'][$i], 'recording_barang_jumlah' => $_POST['pakan_jumlah'][$i], 'recording_barang_kategori' => $_POST['pakan_kategori'][$i]]);
				}	
			}
			

			//save premix
			if (@$_POST['premix']) {

				$premix = count($_POST['premix']);
				
				for ($i = 0; $i < $premix; ++$i) {
				
					$this->query_builder->add('t_recording_barang', ['recording_barang_nomor' => $nomor, 'recording_barang_barang' => $_POST['premix'][$i], 'recording_barang_stok' => $_POST['premix_stok'][$i], 'recording_barang_jumlah' => $_POST['premix_jumlah'][$i], 'recording_barang_kategori' => $_POST['premix_kategori'][$i]]);
				}	
			}

			//update stok
			$this->stok->update_kandang();
			$this->stok->update_barang();

			$this->session->set_flashdata('success', 'Data berhasil di simpan');
		}else{
			$this->session->set_flashdata('gagal', 'Data gagal di simpan');
		}

		redirect(base_url('recording/harian'));
	}
	function delete($id){

		$set = ['recording_hapus' => 1];
		$where = ['recording_id' => $id];
		$db = $this->query_builder->update('t_recording',$set,$where);
		
		if ($db == 1) {

			//update stok
			$this->stok->update_kandang();
			$this->stok->update_barang();

			$this->session->set_flashdata('success','Data berhasil di hapus');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di hapus');
		}
		
		redirect(base_url('recording/harian'));
	}
	function harian_view($id){

		//data
		$data['data'] = $this->query_builder->view_row("SELECT * FROM t_recording WHERE recording_id = '$id'");

		//barang
		$data['barang_data'] = $this->query_builder->view("SELECT * FROM t_recording as a JOIN t_recording_barang as b ON a.recording_nomor = b.recording_barang_nomor JOIN t_barang as c ON b.recording_barang_barang = c.barang_id WHERE a.recording_id = '$id'");

		//kandang
		$data['kandang_data'] = $this->query_builder->view("SELECT * FROM t_kandang WHERE kandang_hapus = 0");

		//pakan
		$data['pakan_data'] = $this->query_builder->view("SELECT * FROM t_pakan WHERE pakan_hapus = 0");

		//premix
		$data['premix_data'] = $this->query_builder->view("SELECT * FROM t_premix WHERE premix_hapus = 0");

		//telur
		$data['telur_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 1");

		//afkir
		$data['afkir_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 2");

		//ayam
		$data['ayam_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 5");

		//obat
		$data['obat_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 4");

		$data['title'] = 'Recording Harian';

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('recording/add');
	    $this->load->view('recording/view');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function harian_edit($id){

		//data
		$data['data'] = $this->query_builder->view_row("SELECT * FROM t_recording WHERE recording_id = '$id'");

		//barang
		$data['barang_data'] = $this->query_builder->view("SELECT * FROM t_recording as a JOIN t_recording_barang as b ON a.recording_nomor = b.recording_barang_nomor JOIN t_barang as c ON b.recording_barang_barang = c.barang_id WHERE a.recording_id = '$id'");

		//kandang
		$data['kandang_data'] = $this->query_builder->view("SELECT * FROM t_kandang WHERE kandang_hapus = 0");

		//pakan
		$data['pakan_data'] = $this->query_builder->view("SELECT * FROM t_pakan WHERE pakan_hapus = 0");

		//premix
		$data['premix_data'] = $this->query_builder->view("SELECT * FROM t_premix WHERE premix_hapus = 0");

		//telur
		$data['telur_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 1");

		//afkir
		$data['afkir_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 2");

		//ayam
		$data['ayam_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 5");

		//obat
		$data['obat_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_hapus = 0 AND barang_kategori = 4");

		$data['title'] = 'Recording Harian';

		$data['edit'] = 1;

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('recording/add');
	    $this->load->view('recording/view');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function update($id){

		$nomor = strip_tags(@$_POST['nomor']);

		$set = array(
						'recording_user' => $this->session->userdata('id'),
						'recording_tanggal' => strip_tags(@$_POST['tanggal']),
						'recording_kandang' => strip_tags(@$_POST['kandang']),
						'recording_bobot' => strip_tags(@$_POST['bobot']),
						'recording_populasi' => strip_tags(@$_POST['populasi']),
					);

		$where = ['recording_id' => $id];
		$db = $this->query_builder->update('t_recording',$set,$where);
		if ($db == 1) {

			//delete
			$this->query_builder->delete('t_recording_barang',['recording_barang_nomor' => $nomor]);

			//save ayam
			if (@$_POST['ayam']) {
				
				$ayam = count($_POST['ayam']);

				for ($i = 0; $i < $ayam; ++$i) {
				
					$this->query_builder->add('t_recording_barang', ['recording_barang_nomor' => $nomor, 'recording_barang_barang' => $_POST['ayam'][$i], 'recording_barang_berat' => $_POST['ayam_berat'][$i], 'recording_barang_gejala' => $_POST['ayam_gejala'][$i], 'recording_barang_obat' => $_POST['ayam_obat'][$i], 'recording_barang_kategori' => $_POST['ayam_kategori'][$i]]);
				}				
			}


			//save afkir
			if (@$_POST['afkir']) {
				
				$afkir = count($_POST['afkir']);

				for ($i = 0; $i < $afkir; ++$i) {
				
					$this->query_builder->add('t_recording_barang', ['recording_barang_nomor' => $nomor, 'recording_barang_barang' => $_POST['afkir'][$i], 'recording_barang_jumlah' => $_POST['afkir_jumlah'][$i], 'recording_barang_kategori' => $_POST['afkir_kategori'][$i]]);
				}				
			}


			//save telur
			if (@$_POST['telur']) {

				$telur = count($_POST['telur']);
				
				for ($i = 0; $i < $telur; ++$i) {
				
					$this->query_builder->add('t_recording_barang', ['recording_barang_nomor' => $nomor, 'recording_barang_barang' => $_POST['telur'][$i], 'recording_barang_jumlah' => $_POST['telur_jumlah'][$i], 'recording_barang_kategori' => $_POST['telur_kategori'][$i]]);
				}	
			}
			

			//save pakan
			if (@$_POST['pakan']) {

				$pakan = count($_POST['pakan']);
				
				for ($i = 0; $i < $pakan; ++$i) {
				
					$this->query_builder->add('t_recording_barang', ['recording_barang_nomor' => $nomor, 'recording_barang_barang' => $_POST['pakan'][$i], 'recording_barang_stok' => $_POST['pakan_stok'][$i], 'recording_barang_jumlah' => $_POST['pakan_jumlah'][$i], 'recording_barang_kategori' => $_POST['pakan_kategori'][$i]]);
				}	
			}
			

			//save premix
			if (@$_POST['premix']) {

				$premix = count($_POST['premix']);
				
				for ($i = 0; $i < $premix; ++$i) {
				
					$this->query_builder->add('t_recording_barang', ['recording_barang_nomor' => $nomor, 'recording_barang_barang' => $_POST['premix'][$i], 'recording_barang_stok' => $_POST['premix_stok'][$i], 'recording_barang_jumlah' => $_POST['premix_jumlah'][$i], 'recording_barang_kategori' => $_POST['premix_kategori'][$i]]);
				}	
			}

			//update stok
			$this->stok->update_kandang();
			$this->stok->update_barang();

			$this->session->set_flashdata('success', 'Data berhasil di simpan');
		}else{
			$this->session->set_flashdata('gagal', 'Data gagal di simpan');
		}

		redirect(base_url('recording/harian'));
	}
	function grafik(){

		$kandang = @$_POST['kandang'];
		
		if (@$kandang) {

			$tgl = explode('-', @$_POST['tanggal']);
			$a = date_format(date_create($tgl[0]), 'Y-m-d');
			$b = date_format(date_create($tgl[1]), 'Y-m-d');
			
			$get = $this->query_builder->view("SELECT kandang_nama AS kandang, barang_kategori AS kategori, SUM(IF(barang_kategori='2', recording_barang_jumlah, 0)) AS afkir, SUM(IF(barang_kategori='1', recording_barang_jumlah, 0)) AS telur, SUM(IF(barang_kategori='3', recording_barang_jumlah, 0)) AS pakan, SUM(IF(barang_kategori='4', recording_barang_jumlah, 0)) AS obat, recording_tanggal AS tanggal FROM t_recording AS a JOIN t_recording_barang AS b ON a.recording_nomor = b.recording_barang_nomor LEFT JOIN t_barang AS c ON b.recording_barang_barang = c.barang_id LEFT JOIN t_kandang AS d ON a.recording_kandang = d.kandang_id WHERE a.recording_hapus = 0 AND a.recording_kandang = '$kandang' AND a.recording_tanggal BETWEEN '$a' AND '$b' GROUP BY a.recording_tanggal");

			if (@$get) {
				$data['data'] = $get;
			}else{
				$data['data'] = 0;
			}
		}

		//kandang
		$data['kandang_data'] = $this->query_builder->view("SELECT * FROM t_kandang WHERE kandang_hapus = 0"); 

		$data['title'] = 'Recording Grafik';

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('recording/grafik');
	    $this->load->view('v_template_admin/admin_footer');
	}
}