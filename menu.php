<?php
if (!empty($_SESSION['iduser'])) {
?>
    <style>

    </style>

    <head>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    </head>
    <center>
    <table width="1200" cellspacing="0" cellpadding="12" border="0" bgcolor="#05AC72">
        <tr>
            <td><a href="./admin.php">
                    <font face="Helvetica" color="#FFF"><b>Home</b></font>
                </a></td>
            <td><a href="./admin.php?hlm=master&sub=siswa"">
            <font face=" Helvetica" color="#FFF"><b>Data Siswa</b></font></a></td>
            <td><a href="./admin.php?hlm=master&sub=kelas">
                    <font face="Helvetica" color="#FFF"><b>Data Kelas</b></font>
                </a></td>
            <td><a href="./admin.php?hlm=master&sub=tapel">
                    <font face="Helvetica" color="#FFF"><b>Tahun Pelajaran</b></font>
                </a></td>
            <td><a href="./admin.php?hlm=master&sub=jenis">
                    <font face="Helvetica" color="#FFF"><b>Jenis Pembayaran</b></font>
                </a></td>
            <td><a href="./admin.php?hlm=master">
                    <font face="Helvetica" color="#FFF"><b>User</b></font>
                </a></td>
            <td><a href="./admin.php?hlm=bayar">
                    <font face="Helvetica" color="#FFF"><b>Pembayaran</b></font>
                </a></td>
            <td><a href="./admin.php?hlm=laporan&sub=jenis">
                    <font face="Helvetica" color="#FFF"><b>Laporan Jenis Pembayaran</b></font>
                </a></td>
            <td><a href="./admin.php?hlm=laporan&sub=kelas">
                    <font face="Helvetica" color="#FFF"><b>Laporan Jumlah Siswa</b></font>
                </a></td>
            <td><a href="./admin.php?hlm=laporan&sub=tagihan">
                    <font face="Helvetica" color="#FFF"><b>Laporan Rekap Pembayaran SPP Perbulan</b></font>
                </a></td>
            <td><a href="./admin.php?hlm=laporan">
                    <font face="Helvetica" color="#FFF"><b>Laporan Pembayaran SPP</b></font>
                </a></td>
            <td><a href="logout.php">
                    <font face="Helvetica" color="#FFF"><b>Logout</b></font>
                </a></td>
        </tr>
    </table>
</center>
<?php
} else {
    header("Location: ./");
    die();
}
?>