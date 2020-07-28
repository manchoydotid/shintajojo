<?php
if (empty($_SESSION['iduser'])) {
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	/* tahapan pembayaran SPP
		1. masukkan nis
		2. tampilkan histori pembayaran (jika ada) dan form pembayaran
		3. proses pembayaran
	*/
	echo '<h2>Pembayaran SPP</h2><hr>';

	if (isset($_REQUEST['submit'])) {
		//proses pembayaran secara bertahap
		$submit = $_REQUEST['submit'];
		$nis = $_REQUEST['nis'];

		//proses simpan pembayaran
		if ($submit == 'bayar') {
			$tapel = $_REQUEST['tapel'];
			$jns = $_REQUEST['jns'];
			$bln = $_REQUEST['bln'];
			$tgl = $_REQUEST['tgl'];
			$kls = $_REQUEST['kls'];
			$nama_siswa = $_REQUEST['nama'];


			$qjumlah = mysqli_query($connect, "SELECT jumlah FROM jenis_bayar WHERE jenis='$jns' AND kelas='$kls'");
			list($jumlah) = mysqli_fetch_array($qjumlah);
			$jml = $jumlah;

			//Untuk cek, supaya tidak bayar 2 kali untuk bulan yang sama
			$qtidakdouble = mysqli_query($connect, "SELECT * FROM pembayaran WHERE th_pelajaran='$tapel' AND jenis='$jns' AND nis='$nis' AND bulan='$bln'");
			if (mysqli_num_rows($qtidakdouble) > 0) {
				echo '<div class="alert alert-danger" role="alert">';
				echo 'Mohon maaf, ' . $jns . ' pada bulan ' . $bln . ' telah dibayarkan.<br></div>';
			} else {
				$qbayar = mysqli_query($connect, "INSERT INTO pembayaran (th_pelajaran, jenis, nis, nama, kelas, bulan, tgl_bayar, jumlah)
					VALUES('$tapel','$jns','$nis','$nama_siswa','$kls','$bln','$tgl','$jml')");

				if ($qbayar > 0) {
					header('Location: ./admin.php?hlm=bayar&submit=v&nis=' . $nis);
					// echo 'nis : '.$nis.', jenis : '.$jns.', tgl : '.$tgl.', jumlah : '.$jml;
					die();
				} else {
					echo ('ada ERROR dg query' . mysqli_error($connect));
				}
			}
		}

		//proses hapus pembayaran, hanya ADMIN
		if ($submit == 'hapus') {
			$jns = $_REQUEST['jns'];
			$bln = $_REQUEST['bln'];
			$tgl = $_REQUEST['tgl'];

			$qbayar = mysqli_query($connect, "DELETE FROM pembayaran WHERE jenis='$jns' AND nis='$nis' AND bulan='$bln'");

			if ($qbayar > 0) {
				header('Location: ./admin.php?hlm=bayar&submit=v&nis=' . $nis);
				die();
			} else {
				echo ('ada ERROR dg query' . mysqli_error($connect));
			}
		}

		//tampilkan data siswa
		$qsiswa = mysqli_query($connect, "SELECT * FROM siswa WHERE nis='$nis'");
		if (mysqli_num_rows($qsiswa) > 0) {
			list($nis, $nama, $kelas) = mysqli_fetch_array($qsiswa);
			echo '<div class="row">';
			echo '<div class="col-sm-9"><table class="table table-bordered" border="1">';
			echo '<tr><td colspan="2">Nomor Induk</td><td colspan="4">' . $nis . '</td>';
			echo '<td><a href="./cetak.php?nis=' . $nis . '" target="_blank" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-print" aria-hidden="true"></span> cetak semua</a></td></tr>';
			echo '<tr><td colspan="2">Nama Siswa</td><td colspan="5">' . $nama . '</td></tr>';
			echo '<tr><td colspan="2">Kelas</td><td colspan="5">' . $kelas . '</td></tr>';
			echo '<tr><td colspan="2">Pembayaran</td><td colspan="5">';


?>
			<form class="form-inline" role="form" method="post" action="./admin.php?hlm=bayar">
				<input type="hidden" name="nis" id="nis" value="<?php echo $nis; ?>">
				<input type="hidden" name="nama" id="nama" value="<?php echo $nama; ?>">
				<input type="hidden" name="kls" id="kls" value="<?php echo $kelas; ?>">
				<input type="hidden" name="tgl" id="tgl" value="<?php echo date("Y-m-d"); ?>">
				<div class="form-group">
					<label class="sr-only" for="th_pelajaran">Tahun Pelajaran&emsp;</label>
					<select name="tapel" class="form-control" id="tapel">
						<?php
						$qtapel = mysqli_query($connect, "SELECT tapel FROM tapel");
						while (list($tapel) = mysqli_fetch_array($qtapel)) {
							echo '<option value="' . $tapel . '">' . $tapel . '</option>';
						}
						?>
					</select>
				</div>
				<div class="form-group">
					<label class="sr-only" for="bln">Bulan&emsp;&emsp;&emsp;&emsp;&emsp;</label>
					<select name="bln" id="bln" class="form-control">
						<option value="Januari">Januari</option>
						<option value="Februari">Februari</option>
						<option value="Maret">Maret</option>
						<option value="April">April</option>
						<option value="Mei">Mei</option>
						<option value="Juni">Juni</option>
						<option value="Juli">Juli</option>
						<option value="Agustus">Agustus</option>
						<option value="September">September</option>
						<option value="Oktober">Oktober</option>
						<option value="November">November</option>
						<option value="Desember">Desember</option>
					</select>
				</div>
				<div class="form-group">
					<label class="sr-only" for="jenis">Jenis&emsp;&emsp;&emsp;&emsp;&emsp;</label>
					<select name="jns" class="form-control" id="jns">
						<?php
						$qkelas = mysqli_query($connect, "SELECT jenis, jumlah FROM jenis_bayar WHERE kelas='$kelas'");
						while (list($jenis, $jumlah) = mysqli_fetch_array($qkelas)) {
							echo '<option value="' . $jenis . '">' . $jenis . ' (Rp ' . number_format($jumlah) . ' )</option>';
						}
						?>
					</select>
				</div>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button type="submit" class="btn btn-default" name="submit" value="bayar">Bayar</button>
			</form>
		<?php
			echo '</td></tr>';
			echo '<tr class="info"><th width="50">No</th><th width="100">Tahun Pelajaran</th><th width="100">Jenis</th><th>Bulan</th><th>Tanggal Bayar</th><th>Jumlah</th>';
			echo '<th>&nbsp;</th>';
			echo '</tr>';

			//tampilkan histori pembayaran, jika ada
			$qbayar = mysqli_query($connect, "SELECT jenis,th_pelajaran,bulan,tgl_bayar,jumlah FROM pembayaran WHERE nis='$nis' ORDER BY tgl_bayar DESC");
			if (mysqli_num_rows($qbayar) > 0) {
				$no = 1;
				while (list($jenis, $th_pelajaran, $bulan, $tgl, $jumlah) = mysqli_fetch_array($qbayar)) {
					echo '<tr><td>' . $no . '</td>';
					echo '<td>' . $th_pelajaran . '</td>';
					echo '<td>' . $jenis . '</td>';
					echo '<td>' . $bulan . '</td>';
					echo '<td>' . $tgl . '</td>';
					echo '<td>' . number_format($jumlah) . '</td><td>';

					if ($_SESSION['admin'] == 1) {
						echo '<a href="./admin.php?hlm=bayar&submit=hapus&jns=' . $jenis . '&nis=' . $nis . '&bln=' . $bulan . '&tgl=' . $tgl . '" class="btn btn-danger btn-xs">Hapus</a>';
					}
					echo ' <a href="./cetak.php?submit=nota&jns=' . $jenis . '&nis=' . $nis . '&bln=' . $bulan . '&tgl=' . $tgl . '" target="_blank" class="btn btn-success btn-xs">Cetak</a>';
					echo '</td></tr>';

					$no++;
				}
			} else {
				echo '<tr><td colspan="7"><em>Belum ada data!</em></td></tr>';
			}
			echo '</table></div></div>';
		} else {
			echo '<div class="alert alert-danger" role="alert">';
			echo 'Cek kembali NIS yang anda masukan!<br></div>';
			echo '<a href="admin.php?hlm=bayar">Kembali ke Pembayaran</a>';
		}
	} else {
		?>
		<!-- form input nomor induk siswa -->
		<form class="form-horizontal" role="form" method="post" action="./admin.php?hlm=bayar">
			<div class="form-group">
				<label for="nis" class="col-sm-2 control-label">Nomor Induk Siswa</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="nis" name="nis" placeholder="Nomor Induk Siswa" maxlength="7" required autofocus>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-3">
					<button type="submit" name="submit" class="btn btn-default">Lanjut</button>
				</div>
			</div>
		</form>
<?php

	}
}

?>