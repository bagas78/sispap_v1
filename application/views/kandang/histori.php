
    <!-- Main content --> 
    <section class="content">

      <!-- Default box --> 
      <div class="box"> 
        <div class="box-header with-border">

          <div align="left" class="back">
            <a href="<?=base_url('kandang')?>"><button type="button" class="btn bg-navy"><i class="fa fa-arrow-left"></i> Kembali</button></a>
          </div>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">

          <span style="background: darkred;padding: 1%;color: white;"><i class="fa fa-info-circle"></i> Menghapus histori sama dengan menghapus stok ayam pada kandang</span><div class="clearfix"></div><br/>
          
          <table id="example" class="table table-bordered table-hover" style="width: 100%;">
            <thead>
            <tr>
              <th>Ayam</th>
              <th>Jumlah</th>
              <th>Umur ( Hari )</th>
              <th>Jadwal Vaksin</th>
              <th>Tanggal Di Tambahkan</th>
              <th width="1">Action</th>
            </tr>
            </thead>
            <tbody>

              <?php foreach ($data as $v): ?>
                
                <tr>
                  <td><?=$v['barang']?></td>
                  <td><?=$v['jumlah']?></td>
                  <td><?=($v['umur'] == '')? '-' : $v['umur'];?></td>
                  <td><?=($v['vaksin'] == '')? '-' : $v['vaksin'].' Hari Sekali';?></td>
                  <td><?=date_format(date_create($v['tanggal']), 'd/m/Y')?></td>
                  <td>
                    <button onclick="del('<?=base_url('kandang/histori_delete/'.$v['id'].'/'.$this->uri->segment(3))?>')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>

              <?php endforeach ?>

            </tbody>
          </table>

        </div>

        
      </div>
      <!-- /.box -->