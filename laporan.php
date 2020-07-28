<?php
function tgl_indo2($tanggal, $day)
{
	$bulan = array(
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

	switch ($day) {
		case 'Sunday':
			$hari_ini = "Minggu";
			break;

		case 'Monday':
			$hari_ini = "Senin";
			break;

		case 'Tuesday':
			$hari_ini = "Selasa";
			break;

		case 'Wednesday':
			$hari_ini = "Rabu";
			break;

		case 'Thursday':
			$hari_ini = "Kamis";
			break;

		case 'Friday':
			$hari_ini = "Jumat";
			break;

		case 'Saturday':
			$hari_ini = "Sabtu";
			break;

		default:
			$hari_ini = "Tidak di ketahui";
			break;
	}

	$pecahkan = explode('-', $tanggal);


	// variabel pecahkan 0 = tanggal
	// variabel pecahkan 1 = bulan
	// variabel pecahkan 2 = tahun

	return $hari_ini . ' ' . $pecahkan[2] . ' ' . $bulan[(int)$pecahkan[1]] . ' ' . $pecahkan[0];
}

if (empty($_SESSION['iduser'])) {
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	if (isset($_REQUEST['sub'])) {
		$sub = $_REQUEST['sub'];

		// include "laporan_tagihan.php";
		switch ($sub) {
			case 'tagihan':
				include 'laporan_tagihan.php';
				break;
			case 'jenis':
				include 'laporan_jenis.php';
				break;
			case 'kelas':
				include 'laporan_kelas.php';
				break;
		}
	} else {

?>
		<div class="container">
	<?php
		echo '<br>';
		echo '<img class="menu-icon" src="images/kop2.png" alt="MI Assa\'adiyah Attahiriyah" width="1200" height="100"></a>';
		echo '<h2><center>Laporan Rekap Pembayaran SPP Siswa periode Januari - Februari</center></h2>';
		// echo '<a class="noprint pull-right btn btn-default" onclick="fnCetak()">Cetak</a>';
		$months = array("Januari", "Februari");
		echo '<div class="flex-container" >';

		foreach ($months as $bln) {

			$q = "SELECT kelas, sum(jumlah) FROM pembayaran WHERE jenis='SPP' AND bulan='$bln' GROUP BY kelas";
			$sql = mysqli_query($connect, $q);

			$total = 0;
			$total_keseluruhan = 0;
			$no = 1;
			echo '<table class="table table-bordered" border="1" style="margin:0 auto;">';
			echo '<tr><td colspan="2" bgcolor="#008c52" style="color:#fff;">' . $bln . '</td></tr>';
			while (list($kls, $jml) = mysqli_fetch_array($sql)) {
				echo '<tr><td style="text-align:right">Kelas ' . $kls . '</td><td><span class="pull-right">Rp. ' . number_format($jml) . '</span></td></tr>';
				$total += $jml;
				$no++;
			}
			echo '<tr><td style="text-align:right"><strong>Total</strong></td><td><span class="pull-right"><strong>Rp. ' . number_format($total) . '</strong></span></td></tr>';
			echo '</table> <br>';
		}
		echo '</div>';
		echo '</div>';
		echo '<div style="text-align: right; margin-right:160px;">';
		echo 'Jakarta, ' . tgl_indo2(date("Y-m-d"), date("l"));
		echo '<br>Ttd&emsp;&emsp;&emsp;&emsp;<br><br><br>';
		echo 'Petugas&emsp;&emsp;&emsp;</div>';
	}
}
	?>