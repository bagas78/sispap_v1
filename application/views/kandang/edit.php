<script type="text/javascript">
  $('form').attr('action', '<?=base_url('kandang/update/'.@$data['kandang_id'])?>');

  $('.kode').val('<?=@$data['kandang_kode']?>');
  $('.nama').val('<?=@$data['kandang_nama']?>');
  $('.alamat').val('<?=@$data['kandang_alamat']?>');
  $('.luas').val('<?=@$data['kandang_luas']?>');
  $('.keterangan').val('<?=@$data['kandang_keterangan']?>');
</script>