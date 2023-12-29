  <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- /.col (LEFT) -->
        <div class="col-md-12">

          <!-- BAR CHART -->
          <div class="box box-success">
            <div class="box-header with-border">

              <br/>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <div class="box-body">

              <form method="POST">
                <div class="row">
                  <div class="col-md-3">
                    <div class="form-group">
                      <select class="form-control" name="kandang" required>
                        <option value="" hidden>-- Kandang --</option>
                        <?php foreach ($kandang_data as $value): ?>
                          <option value="<?=@$value['kandang_id']?>"><?=@$value['kandang_nama']?></option>
                        <?php endforeach ?>
                      </select>
                    </div>
                  </div>
                  <div class="col-md-3">
                    <div class="form-group">
                      <input type="text" class="form-control pull-right" id="reservation" name="tanggal">
                    </div>
                  </div>
                  <div class="col-md-2">
                    <button type="submit" id="filter" class="btn btn-primary"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </form>

              <div class="clearfix"></div>

              <h4 style="text-align: center;background: #777;color: white;padding: 1%;">GRAFIK RECORDING <span id="kandang_nama"></span></h4>

              <table class="table table-borderless" style="width: 30%;">
                <tr class="telur_sub">
                  <td style="background: #00a65a; border-top: none;"></td>
                  <td style="border-top: none;"><b>PANEN TELUR</b></td>
                </tr>
                <tr class="ayam_sub">
                  <td style="background: #dd4b39; border-top: none;"></td>
                  <td style="border-top: none;"><b>AYAM KELUAR KANDANG</b></td>
                </tr>
                <tr class="pakan_sub">
                  <td style="background: #3c8dbc; border-top: none;"></td>
                  <td style="border-top: none;"><b>PAKAN DI GUNAKAN</b></td>
                </tr class="">
                <tr class="obat_sub">
                  <td style="background: #333; border-top: none;"></td>
                  <td style="border-top: none;"><b>OBAT DI GUNAKAN</b></td>
                </tr>
              </table>

              <br/>

              <div class="chart">
                <canvas id="barChart" style="height:330px"></canvas>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!-- /.col (RIGHT) -->
      </div>
      <!-- /.row -->

    </section>


<script>

<?php if(@!$data == 0): ?>

  $(function () {

    <?php @$ak = $this->session->userdata('akses');?>

    var areaChartData = {
      labels  : [<?php foreach($data as $d){ echo "'".date_format(date_create($d['tanggal']), 'd M')."',"; } ?>],
      datasets: [

        <?php if (1 == $ak['level_telur'] ): ?>

          {
            fillColor           : '#00a65a',
            data                : [<?php foreach($data as $d){ if ($d['telur']) { echo $d['telur'].","; } } ?>]
          },

        <?php endif ?>

        <?php if (1 == $ak['level_ayam'] ): ?>

          {
            fillColor           : '#dd4b39',
            data                : [<?php foreach($data as $d){ if ($d['ayam']) { echo $d['ayam'].","; } } ?>]
          },

        <?php endif ?>

        <?php if (1 == $ak['level_pakan'] ): ?>

          {
            fillColor           : '#3c8dbc',
            data                : [<?php foreach($data as $d){ if ($d['pakan']) { echo $d['pakan'].","; } } ?>]
          },

        <?php endif ?>
        
        <?php if (1 == $ak['level_obat'] ): ?>

          {
            fillColor           : '#333',
            data                : [<?php foreach($data as $d){ if ($d['obat']) { echo $d['obat'].","; } } ?>]
          }

        <?php endif ?>

      ]
    }

    //-------------
    //- BAR CHART -
    //-------------
    var barChartCanvas                   = $('#barChart').get(0).getContext('2d')
    var barChart                         = new Chart(barChartCanvas)
    var barChartData                     = areaChartData  

    barChart.Bar(barChartData)

    //kandang
    $('#kandang_nama').text('<?= '"'.strtoupper($data[0]['kandang']).'"' ?>');
  })

<?php else: ?>

  $('.chart').text('Data Kosong');

<?php endif ?>

</script>