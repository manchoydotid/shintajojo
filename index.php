<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>MI Assa'adiyah Attahiriyah</title>
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
</head>

<body background="images/bg.png" topmargin="0" text-align="center" style="text-align:center;">
	<div class="login-page">
		<div class="form">
			<!-- <div class="container"> -->
			<?php
			include "koneksi.php";

			if (isset($_REQUEST['submit'])) {
				$username = $_REQUEST['username'];
				$password = $_REQUEST['password'];

				$sql = mysqli_query($connect, "SELECT iduser,username,admin,fullname FROM user WHERE username='$username' AND password='$password'");

				if (mysqli_num_rows($sql) > 0) {
					list($iduser, $username, $admin, $fullname) = mysqli_fetch_array($sql);

					//session_start();
					$_SESSION['iduser'] = $iduser;
					$_SESSION['username'] = $username;
					$_SESSION['admin'] = $admin;
					$_SESSION['fullname'] = $fullname;

					header("Location: ./admin.php");
					die();
				} else {

					$_SESSION['err'] = 'Silahkan periksa kembali username atau password anda!';
					header('Location: ./');
					die();
				}
			} else {
			?>
				<form class="form-signin" method="post" action="" role="form">
					<?php
					if (isset($_SESSION['err'])) {
						$err = $_SESSION['err'];
						echo '<div class="alert alert-warning alert-message">' . $err . '</div>';
					}
					?>
					<br>
					<br>
					<img class="front_logo" src="images/logo_mi.png" bgcolor="#ffffff">
					<h2>
						<font color="#FFF">Aplikasi Pembayaran</font>
					</h2>
					<h2>
						<font color="#FFF"><strong>MI Assa'adiyah Attahiriyah</strong></font>
						</h3>
						<input type="text" name="username" class="form-control" placeholder="Username" required autofocus>
						<br><br>
						<input type="password" name="password" class="form-control" placeholder="Password" required>
						<br><br>
						<button class="btn btn-lg btn-primary btn-block" type="submit" name="submit">Login</button>
						<p>&nbsp;</p>
				</form>
			<?php
			}
			?>
			<!-- </div> /container -->
		</div> <!-- form -->
	</div> <!-- loginpage -->
	</tr>
	</table>
	<!-- Bootstrap core JavaScript, Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$(".alert-message").alert().delay(3000).slideUp('slow');
	</script>

</body>

</html>