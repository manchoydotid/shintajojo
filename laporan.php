<?php
if( empty( $_SESSION['iduser'] ) ){
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
   if( isset( $_REQUEST['sub'] )){
      $sub = $_REQUEST['sub'];

      include "laporan_tagihan.php";
   } else {

			echo '<h2>Rekap Pembayaran</h2></br>';
?>
			<form class="form-inline" role="form" method="post" action="">
				<label for="jenis" class=" control-label">Jenis Pembayaran</label>
				<div class="form-group">
					<div class="col-sm-8">
					 	<select name="jns" class="form-control" id="jns">
						 <option value="SPP">Pilih Jenis Pembayaran</option>
						 <option value="SPP">SPP</option>
						 <option value="PTS">PTS</option>
						 <option value="PAS">PAS</option>
						 <option value="Kegiatan">Kegiatan</option>
						 <option value="Kurban">Kurban</option>
						 <option value="Zakat">Zakat</option>
						 <option value="Outing">Outing</option>
						 <option value="Manasik">Manasik</option>
						 <option value="Ujian">Ujian</option>
						 <option value="PM">PM</option>
					 </select>
				 </div>
			 </div>
			  <button type="submit" name="submit" class="btn btn-default">Tampilkan</button>
			</form>
			<hr>
			<div class="container">

			<?php
				if(isset($_REQUEST['submit'])){
					$submit = $_REQUEST['submit'];
					$jenis_bayar = $_REQUEST['jns'];

					echo '<h5>Jenis Pembayaran : '.$jenis_bayar.'</h5><hr>';
					echo '<a class="noprint pull-right btn btn-default" onclick="fnCetak()"><span class="glyphicon glyphicon-print" aria-hidden="true"></span> Cetak</a>';

					$months = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
					echo '<div class="flex-container">';

					foreach ($months as $bln) {
					
						$q = "SELECT kelas, sum(jumlah) FROM pembayaran WHERE jenis='$jenis_bayar' AND bulan='$bln' GROUP BY kelas";
						$sql = mysqli_query($connect, $q);

						$total = 0;
						$total_keseluruhan = 0;
						$no=1;
						echo '<table class="table table-bordered">';					
						echo '<tr><td colspan="2" bgcolor="#008c52" style="color:#fff;">'.$bln.'</td></tr>';
						while(list($kls, $jml) = mysqli_fetch_array($sql)){
							echo '<tr><td style="text-align:right">Kelas '.$kls.'</td><td><span class="pull-right">Rp. '.number_format($jml).'</span></td></tr>';
							$total += $jml;
							$no++;
						}
						echo '<tr><td style="text-align:right"><strong>Total</strong></td><td><span class="pull-right"><strong>Rp. '.number_format($total).'</strong></span></td></tr>';
						echo '</table>';
					}
					echo '</div>';
					echo '</div>';

				} else {
      }
   }
}
?>
