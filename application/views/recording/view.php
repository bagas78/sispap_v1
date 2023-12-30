<script type="text/javascript">

//data	 
$('#nomor').val('<?=@$data['recording_nomor']?>');
$('#tanggal').val('<?=@$data['recording_tanggal']?>');
$('#kandang').val('<?=@$data['recording_kandang']?>');
$('#populasi').val('<?=@$data['recording_populasi']?>');
$('#mati').val('<?=@$data['recording_mati']?>');
$('#afkir').val('<?=@$data['recording_afkir']?>');
$('#bobot').val('<?=@$data['recording_bobot']?>');
$('form').attr('action', '<?=base_url('recording/update/'.@$data['recording_id'])?>');

//index loop 
<?php $a = 1;?>
<?php $t = 1;?>
<?php $p = 1;?>
<?php $o = 1;?>

<?php foreach ($barang_data as $v): ?>

	//ayam 
	<?php if($v['recording_barang_kategori'] == 'ayam'): ?>

		<?php if($a - 0): ?>

			clone('ayam');

		<?php endif ?>

	<?php $a++ ?>

	<?php endif ?>

	//afkir 
	<?php if($v['recording_barang_kategori'] == 'afkir'): ?>

		<?php if($a - 0): ?>

			clone('afkir');

		<?php endif ?>

	<?php $a++ ?>

	<?php endif ?>

	//telur
	<?php if($v['recording_barang_kategori'] == 'telur'): ?>

		<?php if($t - 0): ?>

			clone('telur');

		<?php endif ?>

	<?php $t++ ?>

	<?php endif ?>

	//pakan
	<?php if($v['recording_barang_kategori'] == 'pakan'): ?>

		<?php if($p - 0): ?>

			clone('pakan');

		<?php endif ?>

	<?php $p++ ?>

	<?php endif ?>

	//premix
	<?php if($v['recording_barang_kategori'] == 'premix'): ?>

		<?php if($o - 0): ?>

			clone('premix');

		<?php endif ?>

	<?php $o++ ?>

	<?php endif ?>

<?php endforeach ?>

//insert data
<?php $i_d = 0; ?>
<?php $i_a = 0; ?>
<?php $i_t = 0; ?>
<?php $i_p = 0; ?>
<?php $i_o = 0; ?>
<?php foreach(@$barang_data as  $key => $v): ?>

	//ayam
	<?php if($v['barang_kategori'] == 5): ?>
		
		$('.ayam:eq(<?=$i_d?>)').val('<?=$v['recording_barang_barang']?>').change();
		$('.ayam_berat:eq(<?=$i_d?>)').val('<?=$v['recording_barang_berat']?>');
		$('.ayam_gejala:eq(<?=$i_d?>)').val('<?=$v['recording_barang_gejala']?>');
		$('.ayam_obat:eq(<?=$i_d?>)').val('<?=$v['recording_barang_obat']?>').change();

		<?php $i_d++; ?>
	<?php endif ?>

	//afkir
	<?php if($v['barang_kategori'] == 2): ?>
		
		$('.afkir:eq(<?=$i_a?>)').val('<?=$v['recording_barang_barang']?>').change();
		$('.afkir_jumlah:eq(<?=$i_a?>)').val('<?=$v['recording_barang_jumlah']?>');

		<?php $i_a++; ?>
	<?php endif ?>

	//afkir
	<?php if($v['barang_kategori'] == 1): ?>
		
		$('.telur:eq(<?=$i_t?>)').val('<?=$v['recording_barang_barang']?>').change();
		$('.telur_jumlah:eq(<?=$i_t?>)').val('<?=$v['recording_barang_jumlah']?>');

		<?php $i_t++; ?>
	<?php endif ?>

	//pakan
	<?php if($v['barang_kategori'] == 3): ?>
		
		$('.pakan:eq(<?=$i_p?>)').val('<?=$v['recording_barang_barang']?>');
		$('.pakan_stok:eq(<?=$i_p?>)').val('<?=$v['recording_barang_stok']?>');
		$('.pakan_jumlah:eq(<?=$i_p?>)').val('<?=$v['recording_barang_jumlah']?>');
		$('.pakan_satuan').text('<?=$v['barang_satuan']?>');

		<?php $i_p++; ?>
	<?php endif ?>

	//premix
	<?php if($v['barang_kategori'] == 4): ?>
		
		$('.premix:eq(<?=$i_o?>)').val('<?=$v['recording_barang_barang']?>');
		$('.premix_stok:eq(<?=$i_o?>)').val('<?=$v['recording_barang_stok']?>');
		$('.premix_jumlah:eq(<?=$i_o?>)').val('<?=$v['recording_barang_jumlah']?>');
		$('.premix_satuan').text('<?=$v['barang_satuan']?>');

		<?php $i_o++; ?>
	<?php endif ?>

<?php endforeach ?>

if (!'<?=@$edit?>') {

	//button
	$('#submit').remove();
	$('#back').removeAttr('hidden');
	
	//off click
	$('.form-group, table').css('pointer-events', 'none');
}

</script>