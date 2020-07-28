<?php
function tgl_indo3($tanggal, $day)
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


    echo '<div class="container">';
    echo '<br>';
    echo '<img class="menu-icon" src="images/kop2.png" alt="MI Assa\'adiyah Attahiriyah" width="1200" height="100"></a>';
    echo '<h2><center>Laporan Jumlah Siswa</center></h2>';
    $sql = mysqli_query($connect, "SELECT kelas, count(nis) as jml, idrombel FROM siswa GROUP BY kelas, idrombel LIMIT 10");
    echo '<div class="col-md-7" style="margin: 0 auto;"><center><table class="table table-bordered" border="1">';
    echo '<tr class="info"><th width="7px" style="text-align:center;">No</th><th width="150">Kelas</th>';
    echo '</tr>';

    if (mysqli_num_rows($sql) > 0) {
        $no = 1;
        while (list($kelas, $jumlah, $idrombel) = mysqli_fetch_array($sql)) {
            echo '<tr><td style="text-align:center;">' . $no . '</td>';
            echo '<td>' . $kelas . " " . $idrombel . '<span class="badge pull-right">&emsp;&emsp;&emsp;' . $jumlah . ' siswa</span></td>';
            echo '</tr>';
            $no++;
        }
    } else {
        echo '<tr><td colspan="5"><em>Belum ada data</em></td></tr>';
    }
    echo '</table></center></div></div>';

    echo '</table></center></div></div>';
    echo '</div>';
    echo '</div><br>';
    echo '<div style="text-align: right; margin-right:160px;">';
    echo 'Jakarta, ' . tgl_indo2(date("Y-m-d"), date("l"));
    echo '<br>Ttd&emsp;&emsp;&emsp;&emsp;<br><br><br>';
    echo 'Petugas&emsp;&emsp;&emsp;</div>';
}
