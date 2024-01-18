<?php
$title = 'Data Laporan';
require 'koneksi.php';

$query = "SELECT tbl_t_transaksi.*, tbl_m_pelanggan.nama_pelanggan, tbl_m_detail_transaksi.total_harga, tbl_m_outlet.nama_outlet FROM tbl_t_transaksi INNER JOIN tbl_m_pelanggan ON tbl_m_pelanggan.id_pelanggan = tbl_t_transaksi.id_pelanggan INNER JOIN tbl_m_detail_transaksi ON tbl_m_detail_transaksi.id_transaksi = tbl_t_transaksi.id_transaksi INNER JOIN tbl_m_outlet ON tbl_m_outlet.id_outlet = tbl_t_transaksi.outlet_id";
$data = mysqli_query($conn, $query);

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

    <diva class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-items-center">
                        <h4 class="card-title"><?= $title; ?></h4>
                        <a href="cetak.php" target="_blank" class="btn btn-primary btn-round ml-auto">
                            <i class="fas fa-print"></i>
                            Cetak Laporan
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="basic-datatables" class="display table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th style="width: 7%">#</th>
                                    <th>Kode</th>
                                    <th>Nama Pelanggan</th>
                                    <th>Status</th>
                                    <th>Pembayaran</th>
                                    <th>Total</th>
                                    <th>Outlet Pembayaran</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $no = 1;
                                if (mysqli_num_rows($data) > 0) {
                                    while ($trans = mysqli_fetch_assoc($data)) {
                                ?>

                                        <tr>
                                            <td><?= $no++; ?></td>
                                            <td><?= $trans['kode_invoice']; ?></td>
                                            <td><?= $trans['nama_pelanggan']; ?></td>
                                            <td><?= $trans['status']; ?></td>
                                            <td><?= $trans['status_bayar']; ?></td>
                                            <td><?= 'Rp ' . number_format($trans['total_harga']); ?></td>
                                            <td><?= $trans['nama_outlet']; ?></td>
                                        </tr>
                                <?php }
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