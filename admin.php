<?php
	session_start();
	if( empty( $_SESSION['iduser'] ) ){
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
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

	<style type="text/css">
		body {
			min-height: 200px;
			padding-top: 70px;

		}
	@media print {
		.noprint {
			display: none;
		}
	}
	.main_header{
		color: #fdfdfc;
		padding: 20px;
		background-image: url(images/bg.svg);
		border-radius: 5px;
	}
	.admin_panel{
		background-image: url("logo/home.jpeg");
		background-size: cover;
	}
	
	.menu-wrapper {
	position: relative;
	background-color: #fffffe;
	margin: 0 auto;
	text-align: center;
	padding: 30px 0 0 0;
	}

	.main-menu {
	max-width: 1024px;
	width: 100%;
	display: flex;
	margin: 0 auto;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
	}

	.main-menu .menu {
	flex: auto;
	width: 20%;
	padding: 10px;
	}

	.menu-icon {
	max-width: 50%;
	border-radius: 20px;
	}

	.main-menu a {
	color: inherit;
	}

	.main-menu .menu-icon:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	transition-duration: 0.4s;
	}

	.menu p {
	margin-top: 5px;
	}

	.menu a:link {
	text-decoration: none;
	}

	</style>

</head>

  <body>

    <?php include "menu.php"; ?>

  <div class="container">

	<?php
	if( isset($_REQUEST['hlm'] )){

		$hlm = $_REQUEST['hlm'];

		switch( $hlm ){
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
	  <div class="main_header">
        <h2 align="center"><strong>Aplikasi Pembayaran Sekolah MI Assa'adiyah Attahiriyah</strong></h2>
		<p align="center"><strong>JALAN RAYA CIRACAS NO.7 JAKARTA TIMUR - TLP (021)8702327</strong></p>
        <p align="center">Selamat Datang <strong> <?php echo $_SESSION['fullname']; ?></strong></p>
	  </div>
	  <div class="menu-wrapper">
      <div class="container">
        <div class="main-menu">
          <div class="menu">
            <a href="admin.php?hlm=master&sub=siswa&aksi=baru">
              <img class="menu-icon" src="images/add_siswa.png" alt="Tambah Siswa">
              <p>Tambah Siswa</p>
            </a>
          </div>
		  <div class="menu">
            <a href="admin.php?hlm=master&sub=jenis">
              <img class="menu-icon" src="images/payment_type.png" alt="Jenis Pembayaran">
              <p>Jenis Pembayaran</p>
            </a>
          </div>		  
		  <div class="menu">
            <a href="admin.php?hlm=bayar">
              <img class="menu-icon" src="images/payment.png" alt="Pembayaran">
              <p>Pembayaran</p>
            </a>
          </div>
		  <div class="menu">
            <a href="admin.php?hlm=laporan&sub=tagihan">
              <img class="menu-icon" src="images/report.png" alt="Rekap Pembayaran SPP">
              <p>Rekap Pembayaran SPP</p>
            </a>
          </div>
        </div>
      </div>
    </div>
	<?php
	}
	?>


    <!-- Bootstrap core JavaScript, Placed at the end of the document so the pages load faster -->
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
?>
