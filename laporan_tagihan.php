<?php
if( empty( $_SESSION['iduser'] ) ){
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
   echo '<h2>Laporan Pembayaran SPP Siswa</h2><hr>';
   $sql = mysqli_query($connect,"SELECT nis, nama, kelas from siswa ORDER BY kelas");

   echo '<div class="row">';
   echo '<div class="col-md-12">';
   echo '<table class="table table-bordered">';
   echo '<tr class="info"><th width="50">No</th><th>NIS</th><th>Nama</th><th>Kelas</th>';
	 echo '<th>Jan</th><th>Feb</th><th>Mar</th><th>Apr</th><th>Mei</th><th>Juni</th><th>Juli</th><th>Ags</th><th>Sept</th><th>Okt</th><th>Nov</th><th>Des</th></tr>';

   $no=1;
   while(list($nis, $nama, $kls)=mysqli_fetch_array($sql)){
      echo '<tr><td style="text-align:center;">'.$no.'</td><td>'.$nis.'</td><td>'.strtoupper($nama).'</td><td style="text-align:center;">'.$kls.'</td>';
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
   echo '</table></div></div>';
}
?>
