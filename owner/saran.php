<?php
$title = 'Data Saran';
require 'koneksi.php';


// Query untuk mendapatkan data saran dan masukan
$sql = "SELECT tbl_saran.*, tbl_m_pelanggan.nama_pelanggan FROM tbl_saran
        INNER JOIN tbl_m_pelanggan ON tbl_m_pelanggan.id_pelanggan = tbl_saran.id_pelanggan
        ORDER BY tbl_saran.tgl_saran DESC";

$result = $conn->query($sql);

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
                        <a href="cetak1.php" target="_blank" class="btn btn-primary btn-round ml-auto">
                            <i class="fas fa-print"></i>
                            Cetak Saran
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="basic-datatables" class="display table table-striped table-hover">
                            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Pelanggan</th>
                    <th>Masukan Dan Saran</th>
                    <th>Tanggal </th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($result->num_rows > 0) {
                    $no = 1;
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $no++ . "</td>";
                        echo "<td>" . $row['nama_pelanggan'] . "</td>";
                        echo "<td>" . $row['isi_saran'] . "</td>";
                        echo "<td>" . $row['tgl_saran'] . "</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='4'>Tidak ada saran dan masukan.</td></tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
    </div>
</div>
<?php
require 'footer.php';
?>
