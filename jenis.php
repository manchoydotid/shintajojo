<?php
if( empty( $_SESSION['iduser'] ) ){
	//session_destroy();
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	if( isset( $_REQUEST['aksi'] )){
		//load sub-halaman yang sesuai
		$aksi = $_REQUEST['aksi'];
		switch($aksi){
			case 'baru':
				include 'jenis_baru.php';
				break;
			case 'edit':
				include 'jenis_edit.php';
				break;
			case 'hapus':
				include 'jenis_hapus.php';
				break;
		}
	} else {
		//tampilkan daftar jenis_pembayaran
		$sql = mysqli_query($connect, "SELECT * FROM jenis_bayar ORDER BY th_pelajaran DESC, kelas ASC");

		echo '<h2>Jenis Pembayaran</h2><hr>';
        echo '<div class="row">';
		echo '<div class="col-md-7" style="margin: 0 auto;"><table class="table table-bordered" border="1" cellpading="10">';
		echo '<tr class="info"><th>No</th><th width="200">Tahun Pelajaran</th><th>Kelas</th><th>Jenis</th><th>Jumlah Nominal</th>';
		echo '<th width="200"><a href="admin.php?hlm=master&sub=jenis&aksi=baru" class="btn btn-default btn-xs">Tambah Data</a></th></tr>';

		if(mysqli_num_rows($sql) > 0){
			$no = 1;
			while(list($id_jenis_bayar,$tapel,$kelas,$jenis,$jumlah) = mysqli_fetch_array($sql)){
				echo '<tr><td>'.$no.'</td>';
				echo '<td>'.$tapel.'</td><td>'.$kelas.'</td><td>'.$jenis.'</td><td>Rp <span class="pull-right">'.number_format($jumlah).'</span></td><td style="text-align: center;">';
				echo '<a href="admin.php?hlm=master&sub=jenis&aksi=edit&tapel='.$tapel.'&kelas='.$kelas.'&jenis='.$jenis.'&jumlah='.$jumlah.'" class="btn btn-success btn-xs">Edit</a> ';
				echo '<a href="admin.php?hlm=master&sub=jenis&aksi=hapus&tapel='.$tapel.'&kelas='.$kelas.'&jenis='.$jenis.'" class="btn btn-danger btn-xs">Hapus</a>';
				echo '</td></tr>';
				$no++;
			}
		} else {
			echo '<tr><td colspan="5"><em>Belum ada data!</em></td></tr>';
		}

		echo '</table></div></div>';
	}
}
