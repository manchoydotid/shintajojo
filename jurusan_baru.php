<?php
if( empty( $_SESSION['iduser'] ) ){
	//session_destroy();
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	if( isset( $_REQUEST['submit'] )){
		$idrombel = $_REQUEST['idrombel'];

		$sql = mysqli_query($connect,"INSERT INTO rombel VALUES('$idrombel')");

		if($sql > 0){
			header('Location: ./admin.php?hlm=master&sub=jurusan');
			die();
		} else {
			echo("Error description: " . $mysqli -> error);
		}
	} else {
?>
<h2>Tambah Sub Kelas</h2>
<hr>
<form method="post" action="admin.php?hlm=master&sub=jurusan&aksi=baru" class="form-horizontal" role="form">
	<div class="form-group">
		<label for="idrombel" class="col-sm-2 control-label">Sub Kelas</label>
		<div class="col-sm-2">
			<input type="text" class="form-control" id="idrombel" name="idrombel" placeholder="Sub Kelas" required autofocus>
		</div>
	</div>
	<!--<div class="form-group">
		<label for="rombel" class="col-sm-2 control-label">Nama rombel</label>
		<div class="col-sm-4">
			<input type="text" class="form-control" id="rombel" name="rombel" placeholder="Nama rombel" required>
		</div>
	</div>-->
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" name="submit" class="btn btn-default">Simpan</button>
			<a href="./admin.php?hlm=master&sub=jurusan" class="btn btn-link">Batal</a>
		</div>
	</div>
</form>
<?php
	}
}
?>
