<?php
if( empty( $_SESSION['iduser'] ) ){
	//session_destroy();
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	if( isset( $_REQUEST['submit'] )){
		$idrombel = $_REQUEST['idrombel'];
		$sql = mysqli_query($connect,"DELETE FROM rombel WHERE idrombel='$idrombel'");
		if($sql > 0){
			header('Location: ./admin.php?hlm=master&sub=jurusan');
			die();
		} else {
			echo 'ada ERROR dengan query';
		}
	} else {
		$idrombel = $_REQUEST['idrombel'];
		$sql = mysqli_query($connect,"SELECT * FROM rombel WHERE idrombel='$idrombel'");
		list($idrombel) = mysqli_fetch_array($sql);

		echo '<div class="alert alert-danger">Yakin akan menghapus Rombel: <strong>'.$idrombel.'</strong><br><br>';
		echo '<a href="./admin.php?hlm=master&sub=jurusan&aksi=hapus&submit=ya&idrombel='.$idrombel.'" class="btn btn-sm btn-success">Ya, Hapus</a> ';
		echo '<a href="./admin.php?hlm=master&sub=jurusan" class="btn btn-sm btn-default">Tidak</a>';
		echo '</div>';
	}
}
?>
