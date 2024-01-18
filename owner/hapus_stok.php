<?php
require 'koneksi.php';

if (isset($_GET['id'])) {
    $idbarang = $_GET['id'];

    $sql_hapus_stok = "DELETE FROM tbl_stockbarang WHERE idbarang='$idbarang'";
    $delete_stok = mysqli_query($conn, $sql_hapus_stok);

    if ($delete_stok) {
        $_SESSION['msg'] = 'Berhasil Menghapus Data';
        header('location: stockbarang.php');
    } else {
        $_SESSION['msg'] = 'Gagal Hapus Data!!!';
        header('location: stockbarang.php');
    }
} else {
    header('location: stockbarang.php');
}
?>
