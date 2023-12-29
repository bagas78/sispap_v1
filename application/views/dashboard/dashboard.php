<style type="text/css">
  .box-style{
    background: white;
    color: #999;
    border-width: 5px;
    border-style: solid;
    border-color: whitesmoke;
  }
  .box-style:hover{
    background: lightgrey;
  }
  .tit{
    max-width: fit-content;
    background: black;
    padding: 0.5%;
    color: white; 
  }
</style>
 
    <!-- Main content --> 
    <section class="content"> 
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
         <a href="<?=base_url('barang/telur')?>">
          <div class="small-box box-style" style="padding: 8px;">
            <div class="inner">
              <h3 style="font-size: 28px;"><?=@number_format($telur_)?></h3>
 
              <p>Total Telur</p>
            </div>
            <div class="icon" style="top: -20px;">
              <img width="80" height="80" src="<?=base_url('assets/gambar/telur.png')?>">
            </div>
          </div>
        </a>
        </div> 
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <a href="<?=base_url('barang/ayam')?>">
            <div class="small-box box-style" style="padding: 8px;">
              <div class="inner">
                <h3 style="font-size: 28px;"><?=@number_format($ayam_)?></h3>

                <p>Total Ayam</p>
              </div>
              <div class="icon" style="top: -20px;">
                <img width="80" height="80" src="<?=base_url('assets/gambar/chiken.png')?>">
              </div>
            </div>
          </a>
        </div>

        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <a href="<?=base_url('barang/pakan')?>">
            <div class="small-box box-style" style="padding: 8px;">
              <div class="inner">
                <h3 style="font-size: 28px;"><?=@number_format($pakan_)?></h3>

                <p>Total Pakan</p>
              </div>
              <div class="icon" style="top: -20px">
                <img width="80" height="80" src="<?=base_url('assets/gambar/pakan.png')?>">
              </div>
            </div>
          </a>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <a href="<?=base_url('barang/obat')?>">
            <div class="small-box box-style" style="padding: 8px;">
              <div class="inner">
                <h3 style="font-size: 28px;"><?=@number_format($obat_)?></h3>

                <p>Total Obat</p>
              </div>
              <div class="icon" style="top: -20px;">
                <img width="80" height="80" src="<?=base_url('assets/gambar/obat.png')?>">
              </div>
            </div>
          </div>
        </a>
        <!-- ./col -->
      </div>

      <div class="box">
        <div class="box-header with-border">

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
      
          <h4 class="tit"><?=strtoupper('JADWAL VAKSINASI')?></h4>

          <a style="color: black;" href="<?=base_url('vaksin/ayam')?>">
          <table class="table table-bordered">
            <thead>
              <tr>
                <th>Kandang</th>
                <th>Ayam</th>
                <th>Umur</th>
                <th width="120">Tanggal</th>
              </tr>
            </thead>
            <tbody>
              <?php $no = 1; ?>
              <?php foreach ($vaksin_data as $vaksin): ?>

                <?php

                    $d = $vaksin['kandang_log_tanggal'];
                    $u = $vaksin['kandang_log_umur'];

                    $date = new DateTime($d); 
                    $date->modify("-".$u." day");
                    $today = new DateTime('today');
                    
                    $y = $today->diff($date)->y;
                    $m = $today->diff($date)->m;
                    $d = $today->diff($date)->d;

                    $arr = array();
                    switch (true) {
                      case $y > 0:
                        $arr[] = $y.' tahun';
                      case $m > 0:
                        $arr[] = $m.' bulan';
                      case $d > 0:
                        $arr[] = $d.' hari'; 
                    }

                    $umur = implode(' ',$arr);

                ?>

                <tr>
                  <td><?=@$vaksin['kandang_nama']?></td>
                  <td><?=@$vaksin['barang_nama']?></td>
                  <td><?=@$umur?></td>
                  <td class="bg-red"><?=date_format(date_create(@$vaksin['vaksin_tanggal']), 'd/m/Y');?></td>
                </tr>
              <?php $no++; ?>
              <?php endforeach ?>
            </tbody>
          </table>
          </a>

        </div>
        <!-- /.box-body -->
      </div>

      <div class="box">
        <div class="box-header with-border">

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
            </button>
            <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
      
          <h4 class="tit"><?=strtoupper('PEFORMA KARYAWAN '.date('M Y'))?></h4>

          <table class="table table-bordered">
            <thead>
              <tr>
                <th width="100">Peringkat</th>
                <th>Nama</th>
                <th>Pekerjaan</th>
                <th>Masuk</th>
                <th>Tidak Masuk</th>
              </tr>
            </thead>
            <tbody>
              <?php $no = 1; ?>
              <?php foreach ($peforma as $value): ?>
                <tr>
                  <td><?=$no?></td>
                  <td><?=$value['nama']?></td>
                  <td><?=$value['pekerjaan']?></td>
                  <td><?=$value['masuk']?></td>
                  <td><?=$value['tidak']?></td>
                </tr>
              <?php $no++; ?>
              <?php endforeach ?>
            </tbody>
          </table>

        </div>
        <!-- /.box-body -->
      </div>