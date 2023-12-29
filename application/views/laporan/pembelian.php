
    <!-- Main content --> 
    <section class="content">

      <!-- Default box -->
      <div class="box"> 
        <div class="box-header with-border">

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div>
        <div class="box-body">

        <form method="POST" action="<?=base_url('laporan/pembelian')?>">
            <div class="row">
                <div class="col-md-3">
                  <input name="tanggal" class="form-control" type="month" required value="<?=$tahun_.'-'.$bulan_?>">  
                </div>
                <div class="col-md-1">
                  <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>  
                </div>
            </div>
        </form>

        <hr>
          
          <table id="example" class="table table-bordered table-hover" style="width: 100%;">
            <thead>
            <tr>
              <th>Barang</th>
              <th>Qty</th>
              <th>Harga</th>
              <th>Subtotal</th>
              <th>Tanggal</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
          </table>

          <hr>

          <h4 style="background: steelblue; color: white; padding: 0.4%; width: fit-content;"><b>TOTAL PEMBELIAN</b></h4>

          <?php $dc = date_create($tahun_.'-'.$bulan_); ?>

          <table class="table table-bordered table-responssive">
              <tr style="background: azure;">
                  <td>Bulan <?= date_format($dc, 'F'); ?></td>
                  <td><b><?='Rp. '.@number_format($sum_bulan)?></b></td>
              </tr>
              <tr style="background: cornsilk;">
                  <td>Tahun <?= date_format($dc, 'Y'); ?></td>
                  <td><b><?='Rp. '.@number_format($sum_tahun)?></b></td>
              </tr>
          </table>

        </div>

        
      </div>
      <!-- /.box -->

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
                "url": "<?= base_url('laporan/get_data/pembelian/'.$bulan_.'/'.$tahun_); ?>",
                "type": "GET"
            },
            "columns": [     
                        { "data": "barang_nama"},
                        { "data": "pembelian_barang_qty"},
                        { "data": "pembelian_barang_harga",
                        "render": 
                        function( data ) {
                            return "<span> Rp. "+number_format(data)+"</span>";
                          }
                        },
                        { "data": "pembelian_barang_subtotal",
                        "render": 
                        function( data ) {
                            return "<span> Rp. "+number_format(data)+"</span>";
                          }
                        },
                        { "data": "pembelian_barang_tanggal",
                        "render": 
                        function( data ) {
                            return "<span>"+moment(data).format("DD/MM/YYYY")+"</span>";
                          }
                        },
                        
                    ],
        });

    });
</script>