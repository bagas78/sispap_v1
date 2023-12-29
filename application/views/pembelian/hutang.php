
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
          
          <table id="example" class="table table-bordered table-hover" style="width: 100%;">
            <thead>
            <tr>
              <th>Jatuh Tempo</th>
              <th>Faktur</th>
              <th>Supplier</th>
              <th>Nominal</th>
              <th>Pelunasan</th> 
              <th>Keterangan</th>
              <th width="80">Action</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
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
                "url": "<?= base_url('pembelian/hutang_get'); ?>",
                "type": "GET"
            },
            "columns": [                               
                        { "data": "pembelian_jatuh_tempo",
                        "render": 
                        function( data ) {
                            return "<span class='jatuh'>"+data+"</span>";
                          
                          }
                        },
                        { "data": "pembelian_faktur"},
                        { "data": "kontak_nama"},
                        { "data": "pembelian_total",
                        "render": 
                        function( data ) {
                            return "<span> Rp. "+number_format(data)+"</span>";
                          }
                        },
                        { "data": "hutang_tanggal",
                        "render": 
                        function( data ) {
                            if (data == null) {var t = '-';}else{var t = data;}
                            return "<span class='pelunasan'>"+t+"</span>";
                          }
                        },
                        { "data": "hutang_keterangan"},  
                        { "data": "pembelian_id",
                        "render": 
                        function( data ) {
                            return "<a href='<?php echo base_url('pembelian/transaksi_view/')?>"+data+"'><button class='btn btn-xs btn-success'><i class='fa fa-eye'></i></button></a> "+
                            "<button onclick=modal('"+data+"') class='btn btn-xs btn-primary'>Bayar <i class='fa fa-exchange'></i></button>";
                          }
                        },
                        
                    ],
        });

    });

function auto(){

    $.each($('.pelunasan'), function(index, val) {
       var val = $(this).text();
       if (val != '-') {
        
        //lunas
        $(this).closest('tr').find('.btn').attr('disabled', 'true');

       }

    });

    //cek jatuh tempo
    $.each($('.jatuh'), function(index, val) {
         
         var jatuh = new Date($(this).text());
         var tanggal = new Date('<?=date('Y-m-d')?>');
         var cek = $(this).closest('tr').find('.pelunasan').text();

         if (cek == '-') {

            if (jatuh < tanggal) {
                $(this).closest('tr').find('.jatuh').css({
                    background: 'red',
                    color: 'white'
                });;  
             }

         }

    });

    setTimeout(function() {
        auto();
    }, 100);
}

auto();

</script>