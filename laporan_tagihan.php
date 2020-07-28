<?php
//Fungsi untuk merubah tanggal ke format Indonesia
function tgl_indo($tanggal, $day)
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
//End Fungsi


if (empty($_SESSION['iduser'])) {
    $_SESSION['err'] = '<strong>ERROR!</strong> Anda harus login terlebih dahulu.';
    header('Location: ./');
    die();
} else {
    echo '<br>';
    echo '<img class="menu-icon" src="images/kop2.png" alt="MI Assa\'adiyah Attahiriyah" width="1200" height="100"></a>';
    echo '<h2><center>Laporan Rekap Pembayaran SPP Siswa</center></h2>';
    $sql = mysqli_query($connect, "SELECT nis, nama, kelas, idrombel from siswa ORDER BY kelas LIMIT 10");

    echo '<div class="row">';
    echo '<div class="col-md-12">';
    // echo '<strong>Pencarian &nbsp; &nbsp</strong>';
    // echo '<input style="width:  300px;" type="text" id="search" placeholder="Masukan nis atau nama.." onkeyup="searchTable()"/></br></br>';
    echo '<center><table class="table table-bordered" border="1">';
    echo '<thead><tr class="info"><th width="50">No</th><th>NIS</th><th>Nama</th><th>Kelas</th>';
    echo '<th>Jan</th><th>Feb</th><th>Mar</th><th>Apr</th><th>Mei</th><th>Juni</th><th>Juli</th><th>Ags</th><th>Sept</th><th>Okt</th><th>Nov</th><th>Des</th></tr>';
    echo '</thead><tbody id="myTable">';

    $no = 1;
    while (list($nis, $nama, $kls, $idrombel) = mysqli_fetch_array($sql)) {
        echo '<tr><td style="text-align:center;">' . $no . '</td><td>' . $nis . '</td><td>' . strtoupper($nama) . '</td><td style="text-align:center;">' . $kls . '' . $idrombel . ' </td>';
        $months = array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
        foreach ($months as $bln) {
            $query_jml_perbulan = "SELECT jumlah FROM pembayaran WHERE jenis='SPP' AND nis='$nis' AND bulan='$bln' ";
            $sql_jml_perbulan = mysqli_query($connect, $query_jml_perbulan);
            if (mysqli_num_rows($sql_jml_perbulan) > 0) {
                while (list($jml) = mysqli_fetch_array($sql_jml_perbulan)) {
                    echo '<td bgcolor="#05AC72">Lunas</td>';
                }
            } else {
                echo '<td>-</td>';
            }
        }
        $no++;
    }
    echo '</tbody></table></center></div></div><br>';
    echo '<div style="text-align: right; margin-right:160px;">';
    echo 'Jakarta, ' . tgl_indo(date("Y-m-d"), date("l"));
    echo '<br>Ttd&emsp;&emsp;&emsp;&emsp;<br><br><br>';
    echo 'Petugas&emsp;&emsp;&emsp;</div>';
}
?>

<!-- Untuk Pencarian -->
<script>
    function searchTable() {
        var input;
        var saring;
        var status;
        var tbody;
        var tr;
        var td;
        var i;
        var j;
        input = document.getElementById("search");
        saring = input.value.toUpperCase();
        tbody = document.getElementsByTagName("tbody")[0];;
        tr = tbody.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td");
            for (j = 0; j < td.length; j++) {
                if (td[j].innerHTML.toUpperCase().indexOf(saring) > -1) {
                    status = true;
                }
            }
            if (status) {
                tr[i].style.display = "";
                status = false;
            } else {
                tr[i].style.display = "none";
            }
        }
    }
</script>
<!-- end form content -->