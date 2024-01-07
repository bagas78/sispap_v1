<script type="text/javascript">
	$('form').attr('action', '<?=base_url('vaksin/jadwal_update/'.@$data['vaksin_jadwal_id'])?>');
	$('.kode').val('<?=@$data['vaksin_jadwal_kode']?>');
	$('.kandang').val('<?=@$data['vaksin_jadwal_kandang']?>').change();
	$('.ayam').val('<?=@$data['vaksin_jadwal_ayam']?>').change();
	$('.hari').val('<?=@$data['vaksin_jadwal_hari']?>');
	$('.keterangan').val('<?=@$data['vaksin_jadwal_keterangan']?>');
</script>