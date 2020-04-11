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
				<label for="jenis" class=" control-label">Sort by Jenis Pembayaran</label>
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

			<div class="row">
			<div class="col-md-5">
			<table class="table table-bordered">

			<?php
      if(isset($_REQUEST['submit'])){
         $submit = $_REQUEST['submit'];
				 $jenis_bayar = $_REQUEST['jns'];

          echo '<h5>Jenis Pembayaran : '.$jenis_bayar.'</h5><hr>';
          echo '<a class="noprint pull-right btn btn-default" onclick="fnCetak()"><span class="glyphicon glyphicon-print" aria-hidden="true"></span> Cetak</a>';

				 $months = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
				 foreach ($months as $bln) {

	         $q = "SELECT kelas, sum(jumlah) FROM pembayaran WHERE jenis='$jenis_bayar' AND bulan='$bln' GROUP BY kelas";
					 $sql = mysqli_query($connect, $q);

					 $total = 0;
					 $total_keseluruhan = 0;
		       $no=1;
					 echo '<tr><td colspan="2" bgcolor="#00FF00">'.$bln.'</td></tr>';
					 while(list($kls, $jml) = mysqli_fetch_array($sql)){
						 echo '<tr><td style="text-align:right">Kelas '.$kls.'</td><td><span class="pull-right">Rp. '.number_format($jml).'</span></td></tr>';
						 $total += $jml;
						 $no++;
					 }
					 echo '<tr><td style="text-align:right"><strong>Total</strong></td><td><span class="pull-right"><strong>Rp. '.number_format($total).'</strong></span></td></tr>';
				 }

			} else {
         // $tgl = date("Y/m/d");
				 //
				 // $months = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
				 // foreach ($months as $bln) {
	       //   $q = "SELECT kelas, sum(jumlah) FROM pembayaran WHERE jenis='SPP' AND bulan='$bln' GROUP BY kelas";
					//  $sql = mysqli_query($connect, $q);
				 //
					//  $total = 0;
		     //   $no=1;
					//  echo '<tr><td colspan="2" bgcolor="#00FF00">'.$bln.'</td></tr>';
					//  while(list($kls, $jml) = mysqli_fetch_array($sql)){
					// 	 echo '<tr><td style="text-align:right">Kelas '.$kls.'</td><td><span class="pull-right">'.number_format($jml).'</span></td></tr>';
					// 	 $total += $jml;
					// 		$no++;
					//  }
				 //
				 //
				 // }
				 // echo '<tr><td colspan="2"><span class="pull-right">T O T A L</span></td><td><span class="pull-right">'.number_format($total).'</span></td></tr>';
				 // echo '</table>';
      }
   }
}
?>
