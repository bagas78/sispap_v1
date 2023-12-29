<script type="text/javascript">
	$('form').attr('action', '<?=base_url('vaksin/jadwal_update/'.@$data['vaksin_jadwal_id'])?>');
	$('.kode').val('<?=@$data['vaksin_jadwal_kode']?>');
	$('.nama').val('<?=@$data['vaksin_jadwal_nama']?>');
	$('.hari').val('<?=@$data['vaksin_jadwal_hari']?>');
	$('.keterangan').val('<?=@$data['vaksin_jadwal_keterangan']?>');
</script>