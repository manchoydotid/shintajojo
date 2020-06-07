<?php
if( empty( $_SESSION['iduser'] ) ){
	//session_destroy();
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	if( isset( $_REQUEST['aksi'] )){
		$aksi = $_REQUEST['aksi'];

		if($aksi == 'view'){
			//menampilkan daftar siswa dalam kelas
			include 'kelas_baru.php';
		}
		if($aksi == 'hapus'){
			//menghapus kelas beserta siswa yg ada di dalamnya
			include 'kelas_hapus.php';
		}

	} else {
		//query untuk menampilkan daftar kelas sesuai dengan tahun pelajaran yg ditentukan, dalam hal ini 2014/2015.
		//tahun pelajaran mestinya bersifat dinamis, temukan cara agar th_pelajaran dapat ditentukan saat menampilkan kelas
		// $sql = mysqli_query($connect, "SELECT siswa.kelas, count(kelas.nis) as jml, siswa.idrombel FROM kelas,siswa WHERE kelas.nis=siswa.nis GROUP BY kelas.kelas,siswa.idrombel");
		$sql = mysqli_query($connect, "SELECT kelas, count(nis) as jml, idrombel FROM siswa GROUP BY kelas, idrombel");
		echo '<h2>Daftar Kelas</h2><hr>';
      	echo '<div class="row">';
		echo '<div class="col-md-7" style="margin: 0 auto;"><table class="table table-bordered" >';
		echo '<tr class="info"><th width="7px" style="text-align:center;">No</th><th width="60">Kelas</th>';
		echo '<th width="100" >View</th></tr>';

		if( mysqli_num_rows($sql) > 0 ){
			$no = 1;
			while(list($kelas,$jumlah,$idrombel) = mysqli_fetch_array($sql)){
				echo '<tr><td style="text-align:center;">'.$no.'</td>';
				echo '<td>'.$kelas." ".$idrombel.'<span class="badge pull-right">'.$jumlah.' siswa</span></td>';
				echo '<td style="text-align: center;"><a href="./admin.php?hlm=master&sub=kelas&aksi=view&kelas='.$kelas.'&idrombel='.$idrombel.'&submit=y" class="btn btn-success btn-xs">View</a> ';
				echo '</tr>';
				$no++;
			}
		} else {
			echo '<tr><td colspan="5"><em>Belum ada data</em></td></tr>';
		}
		echo '</table></div></div>';
	}
}
?>
