<?php
if( empty( $_SESSION['iduser'] ) ){
	//session_destroy();
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	if( isset( $_REQUEST['aksi'] )){
		$aksi = $_REQUEST['aksi'];
		switch($aksi){
			case 'baru':
				include 'siswa_baru.php';
				break;
			case 'edit':
				include 'siswa_edit.php';
				break;
			case 'hapus':
				include 'siswa_hapus.php';
				break;
		}
	} else {
		$sql = mysqli_query($connect, "SELECT * FROM siswa ORDER BY nis");
		echo '<h2>Daftar Siswa</h2><hr>';
		echo '<div class="row">';
		echo '<div class="col-md-9" style="margin: 0 auto;">';
		echo '<strong>Pencarian &nbsp; &nbsp</strong>'; 
		echo '<input style="width:  300px;" type="text" id="search" placeholder="Masukan nis, nama atau kelas.." onkeyup="searchTable()"/></br></br>';
		echo '<table class="table table-bordered">';
		echo '<thead><tr class="info"><th>No</th><th width="100">NIS</th><th>Nama Lengkap</th><th>Kelas</th>';
		echo '<th width="200"><a href="./admin.php?hlm=master&sub=siswa&aksi=baru" class="btn btn-default btn-xs">Tambah Data</a></th></tr>';
		echo '</thead><tbody id="myTable">';
		if( mysqli_num_rows($sql) > 0 ){
			$no = 1;
			while(list($nis,$nama,$kelas,$idrombel) = mysqli_fetch_array($sql)){
				echo '<tr><td style="text-align: center;">'.$no.'</td>';
				echo '<td>'.$nis.'</td>';
				echo '<td>'.strtoupper($nama).'</td>';
				echo '<td style="text-align: center;">'.$kelas.' '.$idrombel.'</td>';
				echo '<td style="text-align: center;"><a href="./admin.php?hlm=master&sub=siswa&aksi=edit&nis='.$nis.'" class="btn btn-success btn-xs">Edit</a> ';
				echo '<a href="./admin.php?hlm=master&sub=siswa&aksi=hapus&nis='.$nis.'" class="btn btn-danger btn-xs">Hapus</a></td>';
				echo '</tr>';
				$no++;
			}
		} else {
			echo '<tr><td colspan="5"><em>Belum ada data</em></td></tr>';
		}
		echo '</tbody>';
		echo '</table></div></div>';
	}
}
?>
		<!-- Untuk Pencarian -->
		<script>
		function searchTable() {
			var input;
			var saring;
			var status; 
			var tbody; 
			var tr; 
			var td;
			var i; 
			var j;
			input = document.getElementById("search");
			saring = input.value.toUpperCase();
			tbody = document.getElementsByTagName("tbody")[0];;
			tr = tbody.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td");
				for (j = 0; j < td.length; j++) {
					if (td[j].innerHTML.toUpperCase().indexOf(saring) > -1) {
						status = true;
					}
				}
				if (status) {
					tr[i].style.display = "";
					status = false;
				} else {
					tr[i].style.display = "none";
				}
			}
		}
		</script>
		<!-- end form content -->
