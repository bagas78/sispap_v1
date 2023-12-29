 <?php
class Stok{  
  protected $sql;
  function __construct(){
        $this->sql = &get_instance();
  }
  function update_kandang(){

      $kandang = $this->sql->db->query("SELECT SUM(kandang_log_jumlah) AS jumlah, kandang_log_barang AS barang, kandang_log_kandang AS kandang FROM t_kandang_log WHERE kandang_log_hapus = 0 GROUP BY kandang_log_kandang")->result_array();

      $recording = $this->sql->db->query("SELECT a.recording_kandang AS kandang, SUM(b.recording_barang_jumlah) AS jumlah FROM t_recording AS a JOIN t_recording_barang AS b ON a.recording_nomor = b.recording_barang_nomor JOIN t_barang AS c ON b.recording_barang_barang = c.barang_id WHERE c.barang_kategori = 2 AND a.recording_hapus = 0 GROUP BY a.recording_kandang")->result_array();

      //0 stok barang
      $this->sql->db->query("UPDATE t_kandang SET kandang_ayam = 0");

      //tambah stok ayam
      foreach ($kandang as $val) { 

        $jumlah = $val['jumlah'];  
        $barang = $val['barang'];
        $kandang = $val['kandang'];

        $set = array(
                      'kandang_ayam' => $jumlah
                    ); 
        $this->sql->db->set($set);
        $this->sql->db->WHERE(['kandang_id' => $kandang]);
        $this->sql->db->update('t_kandang');

      }

      //kurangi stok dari recording
      foreach ($recording as $val) {
        $jumlah = $val['jumlah']; 
        $kandang = $val['kandang'];

        $this->sql->db->query("UPDATE t_kandang SET kandang_ayam = kandang_ayam - {$jumlah} WHERE kandang_id = {$kandang}");

      }
  }
  function update_barang(){ 
   
      $pembelian = $this->sql->db->query("SELECT b.pembelian_barang_barang AS barang, SUM(b.pembelian_barang_qty) AS jumlah FROM t_pembelian AS a JOIN t_pembelian_barang AS b ON a.pembelian_nomor = b.pembelian_barang_nomor WHERE a.pembelian_hapus = 0 GROUP BY b.pembelian_barang_barang")->result_array();

      //pakan produksi
      $pakan = $this->sql->db->query("SELECT b.pakan_qty_kode AS kode ,SUM(b.pakan_qty_qty) AS jumlah FROM t_pakan AS a JOIN t_pakan_qty AS b ON a.pakan_kode = b.pakan_qty_kode WHERE a.pakan_hapus = 0 GROUP BY b.pakan_qty_kode ")->result_array();

      $pakan_produksi = $this->sql->db->query("SELECT a.pakan_barang_barang AS barang, SUM(a.pakan_barang_qty) AS jumlah FROM t_pakan_barang AS a JOIN t_pakan AS b ON a.pakan_barang_kode = b.pakan_kode WHERE b.pakan_hapus = 0 GROUP BY a.pakan_barang_barang")->result_array(); 

      //premix produksi
      $premix = $this->sql->db->query("SELECT b.premix_qty_kode AS kode ,SUM(b.premix_qty_qty) AS jumlah FROM t_premix AS a JOIN t_premix_qty AS b ON a.premix_kode = b.premix_qty_kode WHERE a.premix_hapus = 0 GROUP BY b.premix_qty_kode ")->result_array();

      $premix_produksi = $this->sql->db->query("SELECT a.premix_barang_barang AS barang, SUM(a.premix_barang_qty) AS jumlah FROM t_premix_barang AS a JOIN t_premix AS b ON a.premix_barang_kode = b.premix_kode WHERE b.premix_hapus = 0 GROUP BY a.premix_barang_barang")->result_array();

      $penjualan = $this->sql->db->query("SELECT b.penjualan_barang_barang AS barang, SUM(b.penjualan_barang_qty) AS jumlah FROM t_penjualan AS a JOIN t_penjualan_barang AS b ON a.penjualan_nomor = b.penjualan_barang_nomor WHERE a.penjualan_hapus = 0 GROUP BY b.penjualan_barang_barang")->result_array();

      $kandang = $this->sql->db->query("SELECT SUM(kandang_log_jumlah) AS jumlah, kandang_log_barang AS barang FROM t_kandang_log AS a JOIN t_kandang AS b ON a.kandang_log_kandang = b.kandang_id WHERE b.kandang_hapus = 0 GROUP BY a.kandang_log_barang")->result_array();
      
      $recording = $this->sql->db->query("SELECT a.recording_kandang AS kandang, b.recording_barang_barang AS barang, b.recording_barang_kategori AS kategori, SUM(b.recording_barang_jumlah) AS jumlah FROM t_recording AS a JOIN t_recording_barang AS b ON a.recording_nomor = b.recording_barang_nomor WHERE a.recording_hapus = 0 GROUP BY a.recording_kandang, b.recording_barang_barang")->result_array();

      //recording produksi

      //0 stok barang
      $this->sql->db->query("UPDATE t_barang SET barang_stok = 0");
      $this->sql->db->query("UPDATE t_pakan SET pakan_stok = 0");
      $this->sql->db->query("UPDATE t_premix SET premix_stok = 0");

      //pembelian
      foreach ($pembelian as $val) {
        $jumlah = $val['jumlah'];  
        $barang = $val['barang'];

        $set = array(
                      'barang_stok' => $jumlah
                    ); 
        $this->sql->db->set($set);
        $this->sql->db->WHERE(['barang_id' => $barang]);
        $this->sql->db->update('t_barang');

      }

      //pakan stok
      foreach ($pakan as $val) {
        $jumlah = $val['jumlah'];  
        $kode = $val['kode'];

        $this->sql->db->query("UPDATE t_pakan SET pakan_stok = pakan_stok + {$jumlah} WHERE pakan_kode = '$kode'");
      }

      //pakan produksi
      foreach ($pakan_produksi as $val) {
        $jumlah = $val['jumlah'];  
        $barang = $val['barang'];

        $this->sql->db->query("UPDATE t_barang SET barang_stok = barang_stok - {$jumlah} WHERE barang_id = {$barang}");
      }

      //premix stok
      foreach ($premix as $val) {
        $jumlah = $val['jumlah'];  
        $kode = $val['kode'];

        $this->sql->db->query("UPDATE t_premix SET premix_stok = premix_stok + {$jumlah} WHERE premix_kode = '$kode'");
      }

      //premix produksi
      foreach ($premix_produksi as $val) {
        $jumlah = $val['jumlah'];  
        $barang = $val['barang'];

        $this->sql->db->query("UPDATE t_barang SET barang_stok = barang_stok - {$jumlah} WHERE barang_id = {$barang}");
      }

      //penjualan
      foreach ($penjualan as $val) {
        $jumlah = $val['jumlah'];  
        $barang = $val['barang'];

        $this->sql->db->query("UPDATE t_barang SET barang_stok = barang_stok - {$jumlah} WHERE barang_id = {$barang}");
      }

      //kurangi tambah ayam
      foreach ($kandang as $val) {
        $jumlah = $val['jumlah']; 
        $barang = $val['barang'];

        $this->sql->db->query("UPDATE t_barang SET barang_stok = barang_stok - {$jumlah} WHERE barang_id = {$barang}");

      }

      //recording kurangi stok
      foreach ($recording as $val) {
        
        $kandang = $val['kandang'];
        $barang = $val['barang'];
        $kategori = $val['kategori'];
        $jumlah = $val['jumlah'];

        switch ($kategori) {
          case 'ayam':
            
            $this->sql->db->query("UPDATE t_barang SET barang_stok = barang_stok + {$jumlah} WHERE barang_id = {$barang}");

            break;
          
          case 'telur':
            
            $this->sql->db->query("UPDATE t_barang SET barang_stok = barang_stok + {$jumlah} WHERE barang_id = {$barang}");

            break;

          case 'pakan':
            
            $this->sql->db->query("UPDATE t_pakan SET pakan_stok = pakan_stok - {$jumlah} WHERE pakan_id = {$barang}");

            break;

          case 'premix':
            
            $this->sql->db->query("UPDATE t_premix SET premix_stok = premix_stok - {$jumlah} WHERE premix_id = {$barang}");

            break;
        }

      }

      return;
  }

  function all(){
    $this->update_kandang();
    $this->update_barang();
  }

}