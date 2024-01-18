<?php

require 'koneksi.php';
$sql = "SELECT tbl_saran.*, tbl_m_pelanggan.nama_pelanggan FROM tbl_saran
        INNER JOIN tbl_m_pelanggan ON tbl_m_pelanggan.id_pelanggan = tbl_saran.id_pelanggan
        ORDER BY tbl_saran.tgl_saran DESC";

$result = $conn->query($sql);

setlocale(LC_ALL, 'id_id');
setlocale(LC_TIME, 'id_ID.utf8');
?>

<!DOCTYPE html>
<html>

<head>
    <title>Cetak Saran</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>

<body>

    <center>

        <h2>Data Laporan Masukan dan Saran</h2>
        <h6><?= strftime('%A %d %B %Y') ?></h6>
        <h6 class="mr-auto">Oleh : <?= $_SESSION['username']; ?></h6>
        <br>
    </center>
    <table class="table table-bordered" style="width: 100%;">
        <thead>
            <tr>
                <th style="width: 3%">NO</th>
                <th>Id_Pelanggan</th>
                <th>Nama Pelanggan</th>
                <th>Masukan Dan Saran</th>
                <th>Tanggal </th>
            </tr>
        </thead>
        <tbody>
            <?php
            $no = 1;
            if ($result->num_rows > 0) {
                while ($trans = $result->fetch_assoc()) {
            ?>

                    <tr>
                        <td><?= $no++; ?></td>
                        <td><?= $trans['id_pelanggan']; ?></td>
                        <td><?= $trans['nama_pelanggan']; ?></td>
                        <td><?= $trans['isi_saran']; ?></td>
                        <td><?= $trans['tgl_saran']; ?></td>
                    </tr>
            <?php }
            }
            ?>
        </tbody>
    </table>

    <script>
        window.print();
    </script>

</body>

</html>
