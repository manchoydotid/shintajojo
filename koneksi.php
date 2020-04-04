<?php
    $host	= "localhost";	
    $user	= "root";		
    $pass	= "";		
    $db		= "spp";	

    $connect = mysqli_connect($host, $user, $pass, $db);
    if(!$connect){
        die("Koneksi ke Engine mySQL gagal");
    }
?>
