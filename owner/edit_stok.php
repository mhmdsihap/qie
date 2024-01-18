<?php
$title = 'Edit Data Stok Barang';
require 'koneksi.php';

$id_barang = $_GET['id'];
$query = "SELECT * FROM tbl_stockbarang WHERE idbarang = '$id_barang'";
$queryedit = mysqli_query($conn, $query);

if (isset($_POST['btn-simpan'])) {
    $namabarang = $_POST['namabarang'];
    $stock = $_POST['stock'];
    $deskripsi = $_POST['deskripsi'];

    // Pastikan nama kolom di sini sesuai dengan struktur tabel Anda
    $query = "UPDATE tbl_stockbarang SET namabarang = '$namabarang', stock = '$stock', deskripsi = '$deskripsi' WHERE idbarang = '$id_barang'";
    
    $update = mysqli_query($conn, $query);

    if ($update) {
        $_SESSION['msg'] = 'Berhasil mengubah data stok barang';
        header('location: stockbarang.php');
    } else {
        $_SESSION['msg'] = 'Gagal mengubah data stok barang!!!';
        header('location: stockbarang.php');
    }
}

require 'header.php';
?>

<!-- Bagian HTML form untuk edit -->
<div class="content">
    <div class="page-inner">
        <div class="page-header">
            <h4 class="page-title">Forms</h4>
            <ul class="breadcrumbs">
                <!-- ... Bagian breadcrumb ... -->
            </ul>
        </div>
        <div class="row">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title"><?= $title; ?></div>
                    </div>
                    <?php while ($edit = mysqli_fetch_array($queryedit)) { ?>
                        <form action="" method="POST">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="namabarang">Nama Barang</label>
                                    <input type="text" name="namabarang" class="form-control" value="<?= $edit['namabarang']; ?>" required>
                                </div>
                                <div class="form-group">
                                    <label for="stock">Stok</label>
                                    <input type="number" name="stock" class="form-control" value="<?= $edit['stock']; ?>" required>
                                </div>
                                <div class="form-group">
                                    <label for="deskripsi">Deskripsi</label>
                                    <textarea name="deskripsi" class="form-control" required><?= $edit['deskripsi']; ?></textarea>
                                </div>
                                <div class="card-action">
                                    <button type="submit" name="btn-simpan" class="btn btn-success">Submit</button>
                                    <a href="stockbarang.php" class="btn btn-danger">Batal</a>
                                </div>
                            </div>
                        </form>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php require 'footer.php'; ?>
