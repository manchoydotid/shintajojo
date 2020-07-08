<?php
if( empty( $_SESSION['iduser'] ) ){
	//session_destroy();
	$_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
	header('Location: ./');
	die();
} else {
	if( isset( $_REQUEST['submit'] )){
		//variabel session ditransfer ke variabel lokal yg lebih mudah diingat penamaannya
		$submit = $_REQUEST['submit'];
		$kelas = $_REQUEST['kelas'];
		$idrombel = $_REQUEST['idrombel'];

		//proses simpan siswa ke dalam kelas
		if(($submit=='simpan') AND isset($_REQUEST['nis'])){
			$nis = $_REQUEST['nis'];
			$sql = mysqli_query($connect,"INSERT INTO kelas VALUES('$kelas','$nis','$idrombel')");
		}

		//proses hapus siswa dari kelas
		if(($submit=='hapus') AND isset($_REQUEST['nis'])){
			$nis = $_REQUEST['nis'];
			$qsiswa = mysqli_query($connect,"DELETE FROM kelas WHERE kelas='$kelas' AND nis='$nis'");
		}

		echo '<div class="row">';
		echo '<div class="col-md-12">';
		echo '<h2>Daftar Siswa Kelas '.$kelas.' '.$idrombel.'</h2><br>';

		//tabel daftar siswa
		echo '<div class="row">';
		echo '<div class="col-md-9" style="margin: 0 auto;">';
		echo '<table class="table table-bordered">';
		echo '<tr><td colspan="2">Kelas</td><td colspan="2">'.$kelas.' '.$idrombel.'</td></tr>';
		echo '<tr class="info"><th width="20">No</th><th width="150">NIS</th><th>Nama Siswa</th>';
		echo '<th width="200"><a href="./admin.php?hlm=master&sub=siswa&aksi=baru" class="btn btn-default btn-xs">Tambah Data</a></th></tr>';

		$qkelas = mysqli_query($connect,"SELECT nis FROM siswa WHERE kelas='$kelas' AND idrombel='$idrombel'");
		if( mysqli_num_rows($qkelas) > 0){
			$no=1;
			while(list($nis)=mysqli_fetch_array($qkelas)){
				echo '<tr><td style="text-align:center;">'.$no.'</td>';
				echo '<td>'.$nis.'</td>';
				$qsiswa = mysqli_query($connect,"SELECT nama FROM siswa WHERE nis='$nis'");
				list($siswa) = mysqli_fetch_array($qsiswa);
				echo '<td>'.$siswa.'</td>';
				echo '<td style="text-align: center;"><a href="./admin.php?hlm=master&sub=siswa&aksi=edit&nis='.$nis.'" class="btn btn-success btn-xs">Edit</a> ';
				echo '<a href="./admin.php?hlm=master&sub=siswa&aksi=hapus&nis='.$nis.'" class="btn btn-danger btn-xs">Hapus</a></td></tr>';
				$no++;
			}
		} else {
			echo '<tr><td colspan="4"><em>Belum ada data.</em></td></tr>';
		}
		echo '</table></div></div>';
	} else {
?>
<!--
form pertama untuk tahapan menambahkan kelas baru, yaitu:
1. ketikkan nama kelas
2. ketikkan tahun pelajaran, misalnya: 2014/2015 atau 2014-2015
3. pilih rombel yg bersangkutan dg kelas
4. klik tombol [LANJUT]
//-->
<h2>Tambah Kelas</h2><hr>
<form method="post" action="admin.php?hlm=master&sub=kelas&aksi=view" class="form-horizontal" role="form">
	<div class="form-group">
		<label for="kelas" class="col-sm-2 control-label">Kelas</label>
		<div class="col-sm-2">
			<input type="text" class="form-control" id="kelas" name="kelas" placeholder="Kelas" required autofocus>
		</div>
	</div>
	<div class="form-group">
		<label for="tapel" class="col-sm-2 control-label">Tahun Pelajaran</label>
		<div class="col-sm-2">
			<!-- <input type="text" class="form-control" id="tapel" name="tapel" placeholder="mmmm/nnnn" required> //-->
			<select name="tapel" class="form-control">
			<?php
				$qtapel = mysqli_query($connect,"SELECT tapel FROM tapel ORDER BY tapel DESC");
				while(list($tapel)=mysqli_fetch_array($qtapel)){
					echo '<option value="'.$tapel.'">'.$tapel.'</option>';
				}
			?>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label for="rombel" class="col-sm-2 control-label">Sub Kelas</label>
		<div class="col-sm-2">
			<select class="form-control" id="rombel" name="idrombel">
				<option value="A">A</option>
				<option value="B">B</option>
				<option value="C">C</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" name="submit" value="baru" class="btn btn-default">Lanjut</button>
			<a href="./admin.php?hlm=master&sub=kelas" class="btn btn-link">Batal</a>
		</div>
	</div>
</form>
<?php
	}
}
?>
