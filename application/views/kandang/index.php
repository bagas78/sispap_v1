
    <!-- Main content --> 
    <section class="content">

      <!-- Default box -->
      <div class="box"> 
        <div class="box-header with-border">
 
            <div align="left">
              <a href="<?= base_url('kandang/add') ?>"><button class="btn btn-primary"><i class="fa fa-plus"></i> Tambah</button></a>
            </div>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div> 
        <div class="box-body">
          
          <table id="example" class="table table-bordered table-hover" style="width: 100%;">
            <thead>
            <tr>
              <th>Kode</th>
              <th>Nama</th>
              <th>Jumlah Ayam</th>
              <th>Tambah Ayam</th>
              <th width="70">Action</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
          </table>

        </div>

        
      </div>
      <!-- /.box -->

<div class="modal fade" id="modal-tambah">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header" style="background: black;color: white;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">TAMBAH AYAM</h4>
        </div>
        <div class="modal-body">
          <form role="form" method="post" action="<?php echo base_url('kandang/tambah_ayam') ?>" enctype="multipart/form-data">
            <div class="box-body" style="padding: 10px;">
              <div class="form-group">
                <label>Jenis</label>
                <select id="jenis" class="form-control" required name="jenis">
                  <option value="" hidden>-- Pilih --</option>
                  <?php foreach ($doc_data as $value): ?>
                    <option value="<?=$value['barang_id']?>"><?=$value['barang_nama']?></option>
                  <?php endforeach ?>
                </select>
              </div>
              <div class="form-group">
                <label>Stok</label>
                <input id="stok" required readonly type="text" name="stok" class="form-control">
              </div>
              <div class=" form-group">
                <label>Jumlah</label>
                <input id="jumlah" required type="number" name="jumlah" class="form-control">
                <small class="text-danger" id="alert" style="font-weight: 700;"></small>
              </div>
              <div class="form-group">
                <label>Umur Ayam ( Hari )</label>
                <input id="umur" required type="number" name="umur" class="form-control">
              </div>

              <!--hidden -->
              <input id="id" type="hidden" name="id" value="">

            </div>
            <!-- /.box-body -->

            <div class="box-footer">
              <button type="submit" class="btn btn-primary">Submit</button>
               <button type="reset" class="btn btn-danger">Reset</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

<script type="text/javascript">
    var table;
    $(document).ready(function() {

        //datatables
        table = $('#example').DataTable({ 

            "responsive"  : true,
            "scrollX"     : true,
            "processing"  : true, 
            "serverSide"  : true,
            "order"       :[],  
            
            "ajax": {
                "url": "<?= base_url('kandang/get_data'); ?>",
                "type": "GET"
            },
            "columns": [                               
                        { "data": "kandang_kode"},
                        { "data": "kandang_nama"},
                        { "data": "kandang_ayam",
                        "render": 
                        function( data, type, row, meta ) {
                            return "<span>"+number_format(data)+"</span>";
                          }
                        },
                        { "data": "kandang_id",
                        "render": 
                        function( data, type, row, meta ) {
                            return "<button onclick=tambah_ayam("+data+") class='btn btn-sm bg-navy'><i class='fa fa-plus'></i> Tambah</button> "+
                              "<a href='<?=base_url('kandang/histori/')?>"+data+"' class='btn btn-sm btn-danger'>Histori <i class='fa fa-angle-double-right'></i></a>";
                          }
                        },
                        { "data": "kandang_id",
                        "render": 
                        function( data, type, row, meta ) {
                            return "<a href='<?php echo base_url('kandang/view/')?>"+data+"'><button class='btn btn-xs btn-success'><i class='fa fa-eye'></i></button></a> "+
                            "<a href='<?php echo base_url('kandang/edit/')?>"+data+"'><button class='btn btn-xs btn-primary'><i class='fa fa-edit'></i></button></a> "+
                            "<button onclick=del('<?php echo base_url('kandang/delete/')?>"+data+"') class='btn btn-xs btn-danger'><i class='fa fa-trash'></i></button>";
                          }
                        },
                        
                    ],
        });

    });

function tambah_ayam(id){
  
  //modal
  $("#modal-tambah").modal("toggle");

  //id
  $('#id').val(id);
  $('#jenis').val('').change();
  $('#stok').val('');
  $('#jumlah').val('');

}  

//stok DOC
$( document ).ready(function() {

    $('#jenis').on('change', function() {
      
      var id = $(this).val();
      $.get('<?=base_url('kandang/get_stok/')?>'+id, function(data) {
        
        var val = $.parseJSON(data);

        $('#stok').val(val.barang_stok);
        $('#jumlah').val('');
        $('#alert').val('');

      });

    });

    $('#jumlah').on('keyup', function() {
      
      var val = parseInt($(this).val());
      var stok = parseInt($('#stok').val());

      if (val > stok) {
        $('#alert').html("Jumlah melebihi stok <i class='fa fa-info-circle'></i>");
      }else{
        $('#alert').html("");
      }

    });

});

</script>