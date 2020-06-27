<?php
if( empty( $_SESSION['iduser'] ) ){
	//session_destroy();
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	if( isset( $_REQUEST['submit'] )){
		$nis = $_REQUEST['nis'];
		$nama = $_REQUEST['nama'];
		$kls = $_REQUEST['kelas'];
		$idrombel = $_REQUEST['idrombel'];

		$sql = mysqli_query($connect,"UPDATE siswa SET nama='$nama', kelas='$kls', idrombel='$idrombel' WHERE nis='$nis'");

		if($sql > 0){
			header('Location: ./admin.php?hlm=master&sub=siswa');
			die();
		} else {
			echo("Error description: " . $sql -> error);
		}
	} else {
		$nis = $_REQUEST['nis'];
		$sql = mysqli_query($connect,"SELECT * FROM siswa WHERE nis='$nis'");
		list($nis,$nama,$kelas,$idrombel) = mysqli_fetch_array($sql);
?>
<h2>Edit Data Siswa</h2>
<hr>
<form method="post" action="admin.php?hlm=master&sub=siswa&aksi=edit" class="form-horizontal" role="form">
	<div class="form-group">
		<label for="nis" class="col-sm-2 control-label">NIS</label>
		<div class="col-sm-2">
			<input type="text" class="form-control" id="nis" name="nis" value="<?php echo $nis; ?>" readonly>
		</div>
	</div>
	<div class="form-group">
		<label for="nama" class="col-sm-2 control-label">Nama siswa</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="nama" name="nama" value="<?php echo $nama; ?>">
		</div>
	</div>
	<div class="form-group">
		<label for="kelas" class="col-sm-2 control-label">Kelas</label>
		<div class="col-sm-2">
			<select name="kelas" id="kelas" class="form-control">
				<option value="1"<?php echo ($kelas=='1') ? 'selected' : ''; ?>>Kelas 1</option>
				<option value="2"<?php echo ($kelas=='2') ? 'selected' : ''; ?>>Kelas 2</option>
				<option value="3"<?php echo ($kelas=='3') ? 'selected' : ''; ?>>Kelas 3</option>
				<option value="4"<?php echo ($kelas=='4') ? 'selected' : ''; ?>>Kelas 4</option>
				<option value="5"<?php echo ($kelas=='5') ? 'selected' : ''; ?>>Kelas 5</option>
				<option value="6"<?php echo ($kelas=='6') ? 'selected' : ''; ?>>Kelas 6</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label for="rombel" class="col-sm-2 control-label">Rombel</label>
		<div class="col-sm-2">
			<select name="idrombel" id="idrombel" class="form-control">
				<option value="A"<?php echo ($idrombel=='A') ? 'selected' : ''; ?>>A</option>
				<option value="B"<?php echo ($idrombel=='B') ? 'selected' : ''; ?>>B</option>
				<option value="C"<?php echo ($idrombel=='C') ? 'selected' : ''; ?>>C</option>
				<option value="D"<?php echo ($idrombel=='D') ? 'selected' : ''; ?>>D</option>
				<option value="E"<?php echo ($idrombel=='E') ? 'selected' : ''; ?>>E</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" name="submit" class="btn btn-default">Simpan</button>
			<a href="./admin.php?hlm=master&sub=siswa" class="btn btn-link">Batal</a>
		</div>
	</div>
</form>
<?php
	}
}
?>
