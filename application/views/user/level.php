<section class="content-header">
      <h1>
        <?php echo $title; ?>
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section> 

    <!-- Main content --> 
    <section class="content">

      <!-- Default box -->
      <div class="box">
        <div class="box-header with-border">

            <div align="left">
              <button class="btn btn-info" data-toggle="modal" data-target="#modal-level"><i class="fa fa-plus"></i> Tambah Data</button>
            </div>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">
         
          <table id="example1" class="table table-bordered table-hover" style="width: 100%;">
                <thead>
                <tr>
                  <th>Level</th>
                  <th>Tanggal Input</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>

                <?php foreach ($data as $key): ?>
                                  
                  <tr <?php if($key['level_id'] == 1){ echo 'style="pointer-events: none; background: gainsboro;"'; } ?>>
                    <td><?php echo $key['level_nama'] ?></td>
                    <td><?= $key['level_tanggal'] ?></td>
                    <td style="width: 80px;">
                      <div>
                      <button class="btn btn-xs btn-primary" data-toggle="modal" data-target="#modal-edit<?php echo $key['level_id'] ?>"><i class="fa fa-edit"></i></button>
                      <button class="btn btn-xs btn-danger" data-toggle="modal" data-target="#modalHapus<?php echo $key['level_id'] ?>"><i class="fa fa-trash"></i></button>

                      </div>
                    </td>
                  </tr>

                 <!--modal hapus-->
                  <div class="modal fade" id="modalHapus<?php echo $key['level_id'] ?>">
                    <div class="modal-dialog" align="center">
                      <div class="modal-content" style="max-width: 300px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span></button>
                            <h4>Confirmed ?</h4>   
                        </div>
                        <div class="modal-body" align="center">
                           <a href="<?php echo base_url() ?>user/level_delete/<?php echo $key['level_id'] ?>"><button class="btn btn-success" style="width: 49%;">Yes</button></a>
                           <button class="btn btn-danger" data-dismiss="modal" style="width: 49%;">No</button>
                        </div>
                      </div>
                    </div>
                   </div> 

                  <div class="modal fade" id="modal-edit<?php echo $key['level_id'] ?>">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span></button>
                          <h4 class="modal-title">Edit Level</h4>
                        </div>
                        <div class="modal-body">
                          <form role="form" method="post" action="<?php echo base_url() ?>user/level_update/<?php echo $key['level_id'] ?>" enctype="multipart/form-data">
                            <div class="box-body" style="padding: 10px;">
                              <div class="form-group">
                                <label>Nama Level</label>
                                <input required="" type="text" name="level_nama" class="form-control" value="<?=$key['level_nama']?>">
                              </div>
                              <div class="form-group">
                                <label>DOC Data</label>
                                <select id="doc<?=$key['level_id']?>" class="form-control" required name="level_doc" required>
                                  <option value="" hidden>-- Pilih --</option>
                                  <option value="1">Beri</option>
                                  <option value="0">Tidak</option>
                                </select>

                                <script type="text/javascript">
                                  $('#doc<?=$key['level_id']?>').val('<?=$key['level_doc']?>').change();
                                </script>

                              </div>
                              <div class="form-group">
                                <label>Telur Data</label>
                                <select id="telur<?=$key['level_id']?>" class="form-control" required name="level_telur" required>
                                  <option value="" hidden>-- Pilih --</option>
                                  <option value="1">Beri</option>
                                  <option value="0">Tidak</option>
                                </select>

                                <script type="text/javascript">
                                  $('#telur<?=$key['level_id']?>').val('<?=$key['level_telur']?>').change();
                                </script>

                              </div>
                              <div class="form-group">
                                <label>Ayam Data</label>
                                <select id="ayam<?=$key['level_id']?>" class="form-control" required name="level_ayam" required>
                                  <option value="" hidden>-- Pilih --</option>
                                  <option value="1">Beri</option>
                                  <option value="0">Tidak</option>
                                </select>

                                <script type="text/javascript">
                                  $('#ayam<?=$key['level_id']?>').val('<?=$key['level_ayam']?>').change();
                                </script>

                              </div>
                              <div class="form-group">
                                <label>Pakan Data</label>
                                <select id="pakan<?=$key['level_id']?>" class="form-control" required name="level_pakan" required>
                                  <option value="" hidden>-- Pilih --</option>
                                  <option value="1">Beri</option>
                                  <option value="0">Tidak</option>
                                </select>

                                <script type="text/javascript">
                                  $('#pakan<?=$key['level_id']?>').val('<?=$key['level_pakan']?>').change();
                                </script>

                              </div>
                              <div class="form-group">
                                <label>Obat Data</label>
                                <select id="obat<?=$key['level_id']?>" class="form-control" required name="level_obat" required>
                                  <option value="" hidden>-- Pilih --</option>
                                  <option value="1">Beri</option>
                                  <option value="0">Tidak</option>
                                </select>

                                <script type="text/javascript">
                                  $('#obat<?=$key['level_id']?>').val('<?=$key['level_obat']?>').change();
                                </script>

                              </div>
                            </div>
                            <!-- /.box-body -->

                            <div class="box-footer">
                              <button type="submit" class="btn btn-primary">Submit</button>
                               <button type="reset" class="btn btn-danger">Reset</button>
                            </div>
                          </form>
                        </div>
                      </div>
                      <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                  </div>
                  <!-- /.modal -->
                <?php endforeach ?>

                </tfoot>
              </table>

        </div>

        
      </div>
      <!-- /.box -->

  <div class="modal fade" id="modal-level">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">Tambah Level</h4>
        </div>
        <div class="modal-body">
          <form role="form" method="post" action="<?php echo base_url() ?>user/level_add" enctype="multipart/form-data">
            <div class="box-body" style="padding: 10px;">
              <div class="form-group">
                <label>Nama Level</label>
                <input required="" type="text" name="level_nama" class="form-control">
              </div>
              <div class="form-group">
                <label>DOC Data</label>
                <select class="form-control" required name="level_doc" required>
                  <option value="" hidden>-- Pilih --</option>
                  <option value="1">Beri</option>
                  <option value="0">Tidak</option>
                </select>
              </div>
              <div class="form-group">
                <label>Telur Data</label>
                <select class="form-control" required name="level_telur" required>
                  <option value="" hidden>-- Pilih --</option>
                  <option value="1">Beri</option>
                  <option value="0">Tidak</option>
                </select>
              </div>
              <div class="form-group">
                <label>Ayam Data</label>
                <select class="form-control" required name="level_ayam" required>
                  <option value="" hidden>-- Pilih --</option>
                  <option value="1">Beri</option>
                  <option value="0">Tidak</option>
                </select>
              </div>
              <div class="form-group">
                <label>Pakan Data</label>
                <select class="form-control" required name="level_pakan" required>
                  <option value="" hidden>-- Pilih --</option>
                  <option value="1">Beri</option>
                  <option value="0">Tidak</option>
                </select>
              </div>
              <div class="form-group">
                <label>Obat Data</label>
                <select class="form-control" required name="level_obat" required>
                  <option value="" hidden>-- Pilih --</option>
                  <option value="1">Beri</option>
                  <option value="0">Tidak</option>
                </select>
              </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
              <button type="submit" class="btn btn-primary">Submit</button>
               <button type="reset" class="btn btn-danger">Reset</button>
            </div>
          </form>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- /.modal -->
  


    
      