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
		$sql = mysqli_query($connect, "SELECT kelas.kelas, kelas.th_pelajaran, count(kelas.nis) as jml, siswa.idrombel FROM kelas,siswa WHERE kelas.nis=siswa.nis GROUP BY kelas.kelas,siswa.idrombel");
		echo '<h2>Daftar Kelas</h2><hr>';
      	echo '<div class="row">';
		echo '<div class="col-md-7"><table class="table table-bordered" >';
		echo '<tr class="info"><th width="50" style="text-align:center;">No</th><th width="90" style="text-align:center;">Kelas</th><th style="text-align:center;">Rombel</th>';
		echo '<th width="100"><a href="./admin.php?hlm=master&sub=kelas&aksi=view" class="btn btn-default btn-xs">Tambah Data</a></th></tr>';

		if( mysqli_num_rows($sql) > 0 ){
			$no = 1;
			while(list($kelas,$tapel,$jumlah,$idrombel) = mysqli_fetch_array($sql)){
				echo '<tr><td style="text-align:center;">'.$no.'</td>';
				echo '<td style="text-align:center;">'.$kelas.'</td>';
				echo '<td>'.$idrombel.'<span class="badge pull-right">'.$jumlah.' siswa</span></td>';
				echo '<td><a href="./admin.php?hlm=master&sub=kelas&aksi=view&kelas='.$kelas.'&tapel='.$tapel.'&idrombel='.$idrombel.'&submit=y" class="btn btn-success btn-xs">Edit</a> ';
				echo '<a href="./admin.php?hlm=master&sub=kelas&aksi=hapus&kelas='.$kelas.'&tapel='.$tapel.'" class="btn btn-danger btn-xs">Hapus</a></td>';
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
