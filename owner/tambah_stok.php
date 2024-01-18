<?php
$title = 'Tambah Stok Barang';
require 'koneksi.php';

// Periksa apakah formulir telah disubmit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Tangkap data dari formulir
    $namabarang = $_POST['namabarang'];
    $stok = $_POST['stok'];
    $deskripsi = $_POST['deskripsi'];

    // Query SQL untuk menambahkan data baru ke tabel
    $query = "INSERT INTO tbl_stockbarang (namabarang, stock, deskripsi) VALUES ('$namabarang', '$stok', '$deskripsi')";

    // Eksekusi query
    $result = mysqli_query($conn, $query);

    if ($result) {
        $_SESSION['msg'] = 'Berhasil menambahkan stok barang baru';
        header('location: stockbarang.php');
    } else {
        $_SESSION['msg'] = 'Gagal menambahkan stok barang';
        header('location: tambah_stok_barang.php');
    }
}

require 'header.php';
?>

<div class="panel-header bg-primary-gradient">
    <div class="page-inner py-5">
        <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
            <div>
                <h2 class="text-white pb-2 fw-bold">Tambah Stok Barang</h2>
            </div>
        </div>
    </div>
</div>
<div class="page-inner mt--5">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <form action="" method="POST">
                        <div class="form-group">
                            <label for="namabarang">Nama Barang</label>
                            <input type="text" name="namabarang" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="stok">Stok</label>
                            <input type="number" name="stok" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label for="deskripsi">Deskripsi</label>
                            <textarea name="deskripsi" class="form-control" rows="3" required></textarea>
                        </div>
                        <div class="card-action">
                            <button type="submit" class="btn btn-success">Tambah Stok</button>
                            <a href="stockbarang.php" class="btn btn-danger">Batal</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
require 'footer.php';
?>
