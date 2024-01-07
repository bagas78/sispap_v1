<?php
class Kandang extends CI_Controller{

	function __construct(){
		parent::__construct(); 
		$this->load->model('m_kandang');
	}  
	function index(){
		$data['title'] = 'Kandang';

		//DOC
		$data['doc_data'] = $this->query_builder->view("SELECT * FROM t_barang WHERE barang_kategori = 5 AND barang_hapus = 0");

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('kandang/index');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function get_data(){

		$where = array('kandang_hapus' => 0);

	    $data = $this->m_kandang->get_datatables($where);
		$total = $this->m_kandang->count_all($where);
		$filter = $this->m_kandang->count_filtered($where);

		$output = array(
			"draw" => $_GET['draw'],
			"recordsTotal" => $total,
			"recordsFiltered" => $filter,
			"data" => $data,
		);
		//output dalam format JSON
		echo json_encode($output);
	}
	function get_stok($id){

		$get = $this->query_builder->view_row("SELECT * FROM t_barang WHERE barang_id = '$id'");

		echo json_encode($get);
	}
	function tambah_ayam(){

		$jumlah = strip_tags($_POST['jumlah']);
		$barang = strip_tags($_POST['jenis']);
		$kandang = strip_tags($_POST['id']);
		$stok = strip_tags($_POST['stok']);
		$umur = strip_tags($_POST['umur']);
		$vaksin = strip_tags($_POST['vaksin']);

		$set = array(
						'kandang_log_user' => $this->session->userdata('id'),
						'kandang_log_barang' => $barang,
						'kandang_log_kandang' => $kandang,
						'kandang_log_stok' => $stok,
						'kandang_log_jumlah' => $jumlah,
						'kandang_log_umur' => $umur,
					);

		$db = $this->query_builder->add('t_kandang_log', $set);

		if ($db == 1) {
			//update stok
			$this->stok->update_barang();
			$this->stok->update_kandang();

			$this->session->set_flashdata('success','Data berhasil di simpan');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di simpan');
		}

		redirect(base_url('kandang'));
	}
	function histori($id){

		$data['title'] = 'Histori Tambah Ayam';

		//data
		$data['data'] = $this->query_builder->view("SELECT a.kandang_log_id as id, b.barang_nama AS barang, a.kandang_log_jumlah AS jumlah, a.kandang_log_tanggal AS tanggal, a.kandang_log_umur as umur FROM t_kandang_log AS a JOIN t_barang AS b ON a.kandang_log_barang = b.barang_id WHERE a.kandang_log_hapus = 0 AND a.kandang_log_kandang = '$id'");

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('kandang/histori');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function histori_delete($id, $target){

		$set = ['kandang_log_hapus' => 1];
		$where = ['kandang_log_id' => $id];
		$db = $this->query_builder->update('t_kandang_log',$set,$where);
		
		if ($db == 1) {

			//update stok
			$this->stok->update_kandang();

			$this->session->set_flashdata('success','Data berhasil di hapus');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di hapus');
		}
		
		redirect(base_url('kandang/histori/'.$target));

	}
	function add(){ 
		
		$data['title'] = 'Kandang';

	    //generate kode
	    $num = $this->query_builder->count("SELECT * FROM t_kandang") + 1;
	    $data['kode'] = 'KD00'.$num;

		$this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('kandang/add');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function save(){
		$set = array(
						'kandang_kode' => strip_tags($_POST['kode']),
						'kandang_nama' => strip_tags($_POST['nama']),
						'kandang_alamat' => strip_tags($_POST['alamat']),
						'kandang_luas' => strip_tags($_POST['luas']),
						'kandang_keterangan' => strip_tags($_POST['keterangan']),
					);

		$db = $this->query_builder->add('t_kandang',$set);

		if ($db == 1) {
			$this->session->set_flashdata('success','Data berhasil di tambah');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di tambah');
		}
		
		redirect(base_url('kandang'));	

	}
	function delete($id){

		$set = ['kandang_hapus' => 1];
		$where = ['kandang_id' => $id];
		$db = $this->query_builder->update('t_kandang',$set,$where);
		
		if ($db == 1) {
			$this->session->set_flashdata('success','Data berhasil di hapus');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di hapus');
		}
		
		redirect(base_url('kandang'));
	}
	function edit($id){
		$data['data'] = $this->query_builder->view_row("SELECT * FROM t_kandang where kandang_id = '$id'");

		$data['title'] = 'Kandang';

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('kandang/add');
	    $this->load->view('kandang/edit');
	    $this->load->view('v_template_admin/admin_footer');
	}
	function update($id){

		$set = array(
						'kandang_nama' => strip_tags($_POST['nama']),
						'kandang_alamat' => strip_tags($_POST['alamat']),
						'kandang_luas' => strip_tags($_POST['luas']),
						'kandang_keterangan' => strip_tags($_POST['keterangan']),
					);

		$where = ['kandang_id' => $id];
		$db = $this->query_builder->update('t_kandang',$set,$where);
		
		if ($db == 1) {
			$this->session->set_flashdata('success','Data berhasil di rubah');
		} else {
			$this->session->set_flashdata('gagal','Data gagal di rubah');
		}
		
		redirect(base_url('kandang'));
	}
	function view($id){

		$data['data'] = $this->query_builder->view_row("SELECT * FROM t_kandang where kandang_id = '$id'");

		$data['title'] = 'Kandang';

	    $this->load->view('v_template_admin/admin_header',$data);
	    $this->load->view('kandang/view');
	    $this->load->view('v_template_admin/admin_footer');
	}
}