<?php
echo '<div class="container">';
echo '<br>';
echo '<img class="menu-icon" src="images/kop2.png" alt="MI Assa\'adiyah Attahiriyah" width="1200" height="100"></a>';
echo '<h2>
        <center>Laporan Jenis Pembayaran</center>
    </h2>';
$sql = mysqli_query($connect, "SELECT * FROM jenis_bayar ORDER BY th_pelajaran DESC, kelas ASC");

echo '<div class="col-md-7" style="margin: 0 auto;">
        <center>
            <table class="table table-bordered" border="1" cellpading="10">';
echo '<tr class="info">
                    <th>No</th>
                    <th width="200">Tahun Pelajaran</th>
                    <th>Kelas</th>
                    <th>Jenis</th>
                    <th>Jumlah Nominal</th>';
echo '
                </tr>';

if (mysqli_num_rows($sql) > 0) {
    $no = 1;
    while (list($id_jenis_bayar, $tapel, $kelas, $jenis, $jumlah) = mysqli_fetch_array($sql)) {
        echo '<tr>
                    <td>' . $no . '</td>';
        echo '<td>' . $tapel . '</td>
                    <td>' . $kelas . '</td>
                    <td>' . $jenis . '</td>
                    <td>Rp <span class="pull-right">' . number_format($jumlah) . '</span></td>';
        echo '
                </tr>';
        $no++;
    }
} else {
    echo '<tr>
                    <td colspan="5"><em>Belum ada data!</em></td>
                </tr>';
}

echo '</table>
        </center>
    </div>
</div>';
echo '</div>';
echo '</div><br>';
echo '<div style="text-align: right; margin-right:160px;">';
echo 'Jakarta, ' . tgl_indo2(date("Y-m-d"), date("l"));
echo '<br>Ttd&emsp;&emsp;&emsp;&emsp;<br><br><br>';
echo 'Petugas&emsp;&emsp;&emsp;</div>';
