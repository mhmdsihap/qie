<?php
$title = 'Stock Barang';
require 'koneksi.php';

$sql = "SELECT * FROM tbl_stockbarang";

$result = mysqli_query($conn, $sql);

$data_stok_barang = mysqli_fetch_all($result, MYSQLI_ASSOC);

mysqli_free_result($result);
mysqli_close($conn);

require 'header.php';
?>

<div class="panel-header bg-primary-gradient">
    <div class="page-inner py-5">
        <div class="d-flex align-items-left align-items-md-center flex-column flex-md-row">
            <div>
                <h2 class="text-white pb-2 fw-bold">Dashboard</h2>
            </div>
        </div>
        <?php if (isset($_SESSION['msg']) && $_SESSION['msg'] <> '') { ?>
            <div class="alert alert-success" role="alert" id="msg">
                <?= $_SESSION['msg']; ?>
            </div>
        <?php }
        $_SESSION['msg'] = ''; ?>
    </div>
</div>
<div class="page-inner mt--5">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h4 class="card-title"><?= $title; ?></h4>
                        <a href="tambah_stok.php" class="btn btn-primary btn-round ml-auto">
                            <i class="fa fa-plus"></i>
                            Tambah Stok
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="basic-datatables" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 7%">No</th>
                                    <th>Nama Barang</th>
                                    <th style="width: 20%;">Stok</th>
                                    <th style="width: 25%;">Deskripsi</th>
                                    <th style="width: 10%">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                if (!empty($data_stok_barang)) { // Check if data is not empty
                                    foreach ($data_stok_barang as $plg) {
                                ?>
                                        <tr>
                                            <td><?= $no++; ?></td>
                                            <td><?= $plg['namabarang']; ?></td>
                                            <td><?= $plg['stock']; ?></td>
                                            <td><?= $plg['deskripsi']; ?></td>
                                            <td>
                                                <div class="form-button-action">
                                                    <a href="edit_stok.php?id=<?= $plg['idbarang']; ?>" type="button" data-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit">
                                                        <i class="fa fa-edit"></i>
                                                    </a>
                                                    <a href="hapus_stok.php?id=<?= $plg['idbarang']; ?>" onclick="return confirm('Yakin hapus data?');" type="button" data-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Hapus">
                                                        <i class="fa fa-times"></i>
                                                    </a>
                                                </div>
                                            </td>
                                        </tr>
                                <?php }
                                } else {
                                    echo '<tr><td colspan="5">Tidak ada data stok barang</td></tr>';
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php
require 'footer.php';
?>
