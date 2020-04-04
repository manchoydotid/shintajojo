<?php
if( empty( $_SESSION['iduser'] ) ){
	//session_destroy();
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	if( isset( $_REQUEST['submit'] )){
		//simpan perubahan jenis pembayaran
		$tapel = $_REQUEST['tapel'];
		$kelas = $_REQUEST['kelas'];
		$jumlah = $_REQUEST['jumlah'];
		$jenis = $_REQUEST['jenis'];
		$sql = mysqli_query($connect,"UPDATE jenis_bayar SET jumlah='$jumlah' WHERE kelas='$kelas' AND jenis='$jenis'");

		if($sql > 0){
			header('Location: ./admin.php?hlm=master&sub=jenis');
			die();
		} else {
			echo 'ada ERROR dg query';
		}
	} else {
		//form edit jenis pembayaran
		$tapel = $_REQUEST['tapel'];
		$kelas = $_REQUEST['kelas'];
		$jumlah = $_REQUEST['jumlah'];
		$jenis = $_REQUEST['jenis'];
		$sql = mysqli_query($connect,"SELECT * FROM jenis_bayar WHERE kelas='$kelas' AND th_pelajaran='$tapel' AND jumlah='$jumlah' AND jenis='$jenis'");
		list($thn,$tk,$jns,$jml) = mysqli_fetch_array($sql);
?>
<h2>Edit Jenis Pembayaran</h2>
<hr>
<form method="post" action="admin.php?hlm=master&sub=jenis&aksi=edit" class="form-horizontal" role="form">
	<div class="form-group">
		<label for="tapel" class="col-sm-2 control-label">Tahun Pelajaran</label>
		<div class="col-sm-2">
			<input type="text" class="form-control" id="tapel" name="tapel" value="<?php echo $thn; ?>" required autofocus>
		</div>
	</div>
	<div class="form-group">
		<label for="kelas" class="col-sm-2 control-label">Kelas</label>
		<div class="col-sm-2">
			<select name="kelas" id="kelas" class="form-control">
				<option value="1"<?php echo ($tk=='1') ? 'selected' : ''; ?>>Kelas 1</option>
				<option value="2"<?php echo ($tk=='2') ? 'selected' : ''; ?>>Kelas 2</option>
				<option value="3"<?php echo ($tk=='3') ? 'selected' : ''; ?>>Kelas 3</option>
				<option value="4"<?php echo ($tk=='4') ? 'selected' : ''; ?>>Kelas 4</option>
				<option value="5"<?php echo ($tk=='5') ? 'selected' : ''; ?>>Kelas 5</option>
				<option value="6"<?php echo ($tk=='6') ? 'selected' : ''; ?>>Kelas 6</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label for="jenis" class="col-sm-2 control-label">Jenis</label>
		<div class="col-sm-2">
		<input type="text" class="form-control" id="jenis" name="jenis" value="<?php echo $jns; ?>"required autofocus>
		</div>
	</div>
	<div class="form-group">
		<label for="jumlah" class="col-sm-2 control-label">Jumlah Nominal</label>
		<div class="col-sm-3">
			<div class="input-group">
			<span class="input-group-addon">Rp.</span>
			<input type="text" class="form-control" id="jumlah" name="jumlah" value="<?php echo $jml; ?>" required>
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" name="submit" class="btn btn-default">Simpan</button>
			<a href="./admin.php?hlm=master&sub=jenis" class="btn btn-link">Batal</a>
		</div>
	</div>
</form>
<?php
	}
}
?>
