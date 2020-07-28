<?php
if (empty($_SESSION['iduser'])) {
	//session_destroy();
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	if (isset($_REQUEST['submit'])) {
		//simpan jenis pembayaran baru
		$tapel = $_REQUEST['tapel'];
		$kelas = $_REQUEST['kelas'];
		$jenis = $_REQUEST['jenis'];
		$jumlah = $_REQUEST['jumlah'];

		$sql = mysqli_query($connect, "INSERT INTO jenis_bayar (th_pelajaran, kelas, jenis, jumlah)
		 VALUES('$tapel','$kelas','$jenis','$jumlah')");

		if ($sql > 0) {
			header('Location: ./admin.php?hlm=master&sub=jenis');
			die();
		} else {
			echo 'ada ERROR dg query';
		}
	} else {
		//form jenis pembayaran
?>
		<h2>Jenis Pembayaran</h2>
		<hr>
		<form method="post" action="admin.php?hlm=master&sub=jenis&aksi=baru" class="form-horizontal" role="form">
			<div class="form-group">
				<label for="tapel" class="col-sm-2 control-label">Tahun Pelajaran</label>
				<div class="col-sm-2">
					<!-- <input type="text" class="form-control" id="tapel" name="tapel" placeholder="mmmm/nnnn" required autofocus> -->
					<select name="tapel" class="form-control" id="tapel">
						<?php
						$qtapel = mysqli_query($connect, "SELECT tapel FROM tapel");
						while (list($tapel) = mysqli_fetch_array($qtapel)) {
							echo '<option value="' . $tapel . '">' . $tapel . '</option>';
						}
						?>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="kelas" class="col-sm-2 control-label">Kelas</label>
				<div class="col-sm-2">
					<select name="kelas" id="kelas" class="form-control">
						<option value="1">Kelas 1</option>
						<option value="2">Kelas 2</option>
						<option value="3">Kelas 3</option>
						<option value="4">Kelas 4</option>
						<option value="5">Kelas 5</option>
						<option value="6">Kelas 6</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="jenis" class="col-sm-2 control-label">Jenis</label>
				<div class="col-sm-2">
					<select name="jenis" id="jenis" class="form-control">
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
			<div class="form-group">
				<label for="jumlah" class="col-sm-2 control-label">Jumlah Nominal</label>
				<div class="col-sm-3">
					<div class="input-group">
						<span class="input-group-addon">Rp.</span>
						<input type="text" class="form-control" id="jumlah" name="jumlah" placeholder="Nominal pembayaran" required>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" name="submit" class="btn btn-default">Simpan</button>
					<a href="./admin.php?hlm=master&sub=jenis" class="btn btn-link">Batal</a>
				</div>
			</div>
		</form>
<?php
	}
}
?>