<?php
session_start();
if (empty($_SESSION['iduser'])) {
	//session_destroy();
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	include "koneksi.php";
?>
	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>Aplikasi Pembayaran SPP</title>
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
		<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	</head>

	<body>

		<?php include "menu.php"; ?>

		<div class="container">

			<?php
			if (isset($_REQUEST['hlm'])) {

				$hlm = $_REQUEST['hlm'];

				switch ($hlm) {
					case 'bayar':
						include "pembayaran.php";
						break;
					case 'laporan':
						include "laporan.php";
						break;
					case 'master':
						include "master.php";
						break;
					case 'user':
						include "profil.php";
						break;
				}
			} else {
			?>
				<br>
				<center><img class="menu-icon" src="images/banner.png" alt="Tambah Siswa" width="1200px"></center>
				<br>
				<br>
				<div style="text-align:center;">
					<a href="admin.php?hlm=master&sub=siswa&aksi=baru">
						<img class="menu-icon" src="images/add_siswa.png" alt="Tambah Siswa"></a>
					&emsp;&emsp;&emsp;
					<a href="admin.php?hlm=master&sub=jenis">
						<img class="menu-icon" src="images/payment_type.png" alt="Jenis Pembayaran"></a>
					&emsp;&emsp;&emsp;
					<a href="admin.php?hlm=bayar">
						<img class="menu-icon" src="images/payment.png" alt="Pembayaran"></a>
					&emsp;&emsp;&emsp;
					<a href="admin.php?hlm=laporan&sub=tagihan">
						<img class="menu-icon" src="images/report.png" alt="Rekap Pembayaran SPP"></a>
					&emsp;&emsp;&emsp;
					<br>
					<a>Tambah Siswa</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<a>Jenis Pembayaran </a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					<a>Pembayaran </a>&emsp;&emsp;&emsp;&emsp;&emsp;
					<a>Rekap Pembayaran SPP </a>
				</div>
			<?php
			}
			?>


			<!-- Bootstrap core JavaScript, Placed at the end of the document so the pages load faster -->
			<script src="js/jquery.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script type="text/javascript">
				$(".force-logout").alert().delay(3000).slideUp('slow', function() {
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
?>