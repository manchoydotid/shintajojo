<?php
session_start();
include "koneksi.php";

//Fungsi untuk merubah tanggal ke format Indonesia
function tgl_indo($tanggal){
	$bulan = array (
		1 =>   'Januari',
		'Februari',
		'Maret',
		'April',
		'Mei',
		'Juni',
		'Juli',
		'Agustus',
		'September',
		'Oktober',
		'November',
		'Desember'
	);
	$pecahkan = explode('-', $tanggal);

	// variabel pecahkan 0 = tanggal
	// variabel pecahkan 1 = bulan
	// variabel pecahkan 2 = tahun

	return $pecahkan[2] . ' ' . $bulan[ (int)$pecahkan[1] ] . ' ' . $pecahkan[0];
}
//End Fungsi


if( empty( $_SESSION['iduser'] ) ){
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
   $nis = $_REQUEST['nis'];
   if(isset($_REQUEST['submit'])){
		 //Cetak Bukti Pembayaran Sesuai NIS dan Tanggal Bayar

      $submit = $_REQUEST['submit'];
      $jns = $_REQUEST['jns'];
      $bln = $_REQUEST['bln'];
			$tgl_bayar = $_REQUEST['tgl'];

			//print nis dan Nama
			$qsiswa = mysqli_query($connect,"SELECT nis, nama FROM siswa WHERE nis='$nis'");
			list($nis,$nama) = mysqli_fetch_array($qsiswa);

			echo "<body style='text-align:center;'>";
			echo "<h1>Madrasah Ibtidaiyah Assa'Adiyah Attahiriyah</h1>";
			echo "<br>";
			echo "<h3>** BUKTI PEMBAYARAN **</h3>";
			echo "=========================================================================================";
			echo "<br>";
			echo "<div class='col-sm-6'>";
			echo "<table style='margin: 0px auto; float: none;' class='table table-bordered'>";
			echo "	<tr>";
			echo "		<td><strong>NIS : </strong></td>";
			echo "		<td><strong>".$nis."</strong></td>";
			echo "		<td width='60px'></td>";
			echo "		<td><strong>Nama : </strong></td>";
			echo "		<td><strong>".$nama."</strong></td>";
			echo "	</tr>";
			echo " </table>";
			echo "=========================================================================================";
			echo "<p>";
			echo "<table style='width: 50%; margin: 0px auto; float: none;' class='table table-bordered'>";

			//print jenis pembayaran, bulan dan jumlah
			$sql = mysqli_query($connect,"SELECT jenis, bulan, jumlah FROM pembayaran WHERE nis='$nis' AND tgl_bayar='$tgl_bayar'");
			$no = 1;
			$total = 0;

			while (list($jns, $bln, $jml) = mysqli_fetch_array($sql)){
				echo "	<tr>";
				echo "		<td>$no. ".$jns." ".$bln."</td>";
				echo "		<td style='text-align:right'>Rp.  ".number_format($jml)."</td>";
				echo "	</tr>";
				$no++;

				//memjumlahkan jumlah jenis pembayaran
				$total += $jml;
			}
			echo "	<tr>";
			echo "		<td></td>";
			echo "		<td style='text-align:right'><strong>----------------</strong></td>";
			echo "	</tr>";
			echo "	<tr>";
			echo "		<td></td>";
			echo "		<td style='text-align:right'><strong>Rp.  ".number_format($total)."</strong></td>";
			echo "	</tr>";

			echo " </table>";
			echo "<br>";
			echo "=========================================================================================";
			echo "<table style='width: 50%; margin: 0px auto; float: none;' class='table table-bordered'>";
			echo "	<tr>";
			echo "		<td align='right'>Jakarta, ".tgl_indo($tgl_bayar);
			echo "			<tr>";
			echo "				<td align='right'>Penerima &nbsp &nbsp &nbsp &nbsp &nbsp</td>";
			echo "			</tr>";
			echo "		</td>";
			echo "	</tr>";
			echo "	<tr>";
			echo "		<td height='50px'></td>";
			echo "	</tr>";
			echo "	<tr>";
			echo "		<td align='right'>(..................................)</td>";
			echo "	</tr>";
			echo " </table>";

      echo '<script>window.print();</script>';
   } else {
      //cetak seluruh pembayaran sesuai NIS
			?>
			<!DOCTYPE html>
			<html lang="en">
			  <head>
			    <meta charset="utf-8">
			    <meta http-equiv="X-UA-Compatible" content="IE=edge">
			    <meta name="viewport" content="width=device-width, initial-scale=1">
			    <meta name="description" content="">
			    <meta name="author" content="">

			    <title>Cetak Rekap Pembayaran</title>

			    <!-- Bootstrap core CSS -->
			    <link href="css/bootstrap.min.css" rel="stylesheet">

				<style type="text/css">
				body {
				  min-height: 200px;
				  padding-top: 50px;
				}
			   @media print {
			      .noprint {
			         display: none;
			      }
			   }
				</style>
			  </head>

			  <body>
			    <div class="container">
			<?php
			   echo '<h3>Cetak Rekap Pembayaran</h3>';
			   $qsiswa1 = mysqli_query($connect,"SELECT * FROM siswa WHERE nis='$nis'");
			   list($nis,$nama,$idprodi) = mysqli_fetch_array($qsiswa1);

			   echo '<div class="row">';
			   echo '<div class="col-sm-6"><table class="table table-bordered">';
			   echo '<tr><td colspan="2">Nomor Induk</td><td colspan="3">'.$nis.'</td></tr>';
			   echo '<tr><td colspan="2">Nama Siswa</td><td colspan="3">'.$nama.'</td></tr>';
			   echo '<tr class="info"><th width="50">#</th><th width="100">Jenis</th><th>Bulan</th><th>Tanggal Bayar</th><th>Jumlah</th>';
			   echo '</tr>';

			   //Menampilkan Histori Pembayaran
			   $qbayar1 = mysqli_query($connect,"SELECT jenis,bulan,tgl_bayar,jumlah FROM pembayaran WHERE nis='$nis' ORDER BY tgl_bayar DESC");
			   if(mysqli_num_rows($qbayar1) > 0){
			      $no = 1;
			      while(list($kelas,$bulan,$tgl,$jumlah) = mysqli_fetch_array($qbayar1)){
			         echo '<tr><td>'.$no.'</td>';
			         echo '<td>'.$kelas.'</td>';
			         echo '<td>'.$bulan.'</td>';
			         echo '<td>'.$tgl.'</td>';
			         echo '<td>'.$jumlah.'</td>';
			         echo '</tr>';

			         $no++;
			      }
			   } else {
			      echo '<tr><td colspan="6"><em>Belum ada data!</em></td></tr>';
			   }
			   echo '</table></div></div>';
			?>

			   <a class="noprint btn btn-default" onclick="fnCetak()">Cetak</a>

			   </div>
			    <script src="js/jquery.min.js"></script>
			    <script src="js/bootstrap.min.js"></script>
				 <script type="text/javascript">
					$(".force-logout").alert().delay(3000).slideUp('slow', function(){
						window.location = "./logout.php";
					});
			      function fnCetak() {
			         window.print();
			      }
				 </script>
			  </body>
			</html>
<?php
   }
}
?>
