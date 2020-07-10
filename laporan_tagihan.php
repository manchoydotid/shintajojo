<?php
if( empty( $_SESSION['iduser'] ) ){
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
   echo '<h2>Rekap Pembayaran SPP Siswa</h2><hr>';
   $sql = mysqli_query($connect,"SELECT nis, nama, kelas, idrombel from siswa ORDER BY kelas");

   echo '<div class="row">';
   echo '<div class="col-md-12">';
   echo '<strong>Pencarian &nbsp; &nbsp</strong>'; 
   echo '<input style="width:  300px;" type="text" id="search" placeholder="Masukan nis atau nama.." onkeyup="searchTable()"/></br></br>';
   echo '<table class="table table-bordered">';
   echo '<thead><tr class="info"><th width="50">No</th><th>NIS</th><th>Nama</th><th>Kelas</th>';
   echo '<th>Jan</th><th>Feb</th><th>Mar</th><th>Apr</th><th>Mei</th><th>Juni</th><th>Juli</th><th>Ags</th><th>Sept</th><th>Okt</th><th>Nov</th><th>Des</th></tr>';
   echo '</thead><tbody id="myTable">';

   $no=1;
   while(list($nis, $nama, $kls, $idrombel)=mysqli_fetch_array($sql)){
      echo '<tr><td style="text-align:center;">'.$no.'</td><td>'.$nis.'</td><td>'.strtoupper($nama).'</td><td style="text-align:center;">'.$kls.''.$idrombel.' </td>';
			$months = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
			foreach ($months as $bln) {
				$query_jml_perbulan = "SELECT jumlah FROM pembayaran WHERE jenis='SPP' AND nis='$nis' AND bulan='$bln'";
				$sql_jml_perbulan = mysqli_query($connect, $query_jml_perbulan);
				if(mysqli_num_rows($sql_jml_perbulan) > 0){
					while(list($jml) = mysqli_fetch_array($sql_jml_perbulan)) {
						echo '<td><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></td>';
					}
				}else{
						echo '<td>-</td>';
				}
			}
      $no++;
   }
   echo '</tbody></table></div></div>';
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

