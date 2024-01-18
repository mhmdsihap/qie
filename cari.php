<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laundry Search Result</title>

    <!-- Bootstrap CSS dari Bootswatch Superhero -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/superhero/bootstrap.min.css">

    <!-- Bootstrap JS dari CDN -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function printPage() {
            window.print();
        }
    </script>

    <style>
        @media print {
            .no-print {
                display: none;
            }
        }
    </style>
</head>
<body>

    <div class="container mt-4">
    <?php
    class LaundrySearch
    {
        private $conn;

        public function __construct($servername, $username, $password, $dbname)
        {
            $this->conn = new mysqli($servername, $username, $password, $dbname);

            if ($this->conn->connect_error) {
                die("Connection failed: " . $this->conn->connect_error);
            }
        }

        public function searchPelanggan($keyword)
        {
            $stmt = $this->conn->prepare("SELECT nama_pelanggan, alamat_pelanggan, telp_pelanggan, status, status_bayar, tgl_pembayaran FROM tbl_m_pelanggan JOIN tbl_t_transaksi on tbl_m_pelanggan.id_pelanggan = tbl_t_transaksi.id_pelanggan WHERE nama_pelanggan = ?");
            $stmt->bind_param("s", $keyword);

            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $this->displayResults($result);
            } else {
                echo '<p class="mt-4">Data laporan tidak ditemukan.</p>';
            }

            $stmt->close();
        }

        private function displayResults($result)
        {
            echo '<div class="mt-4">';
            echo '<h5>Informasi Pelanggan</h5>';
            echo '<div class="table-responsive">';
            echo '<table class="table table-striped table-bordered">';
            echo '<thead class="thead-dark">';
            echo '<tr>';
            echo '<th>Nama</th>';
            echo '<th>Alamat</th>';
            echo '<th>Status</th>';
            echo '<th>Status Bayar</th>';
            echo '<th>Nomor Telepon</th>';
            echo '<th>Tanggal Pembayaran</th>';
            echo '</tr>';
            echo '</thead>';
            echo '<tbody>';

            while ($row = $result->fetch_assoc()) {
                echo '<tr>';
                echo '<td>' . $row['nama_pelanggan'] . '</td>';
                echo '<td>' . $row['alamat_pelanggan'] . '</td>';
                echo '<td>' . $row['status'] . '</td>';
                echo '<td>' . $row['status_bayar'] . '</td>';
                echo '<td>' . $row['telp_pelanggan'] . '</td>';
                echo '<td>' . $row['tgl_pembayaran'] . '</td>';
                echo '</tr>';
            }

            echo '</tbody>';
            echo '</table>';
            echo '</div>';
            echo '</div>';
        }

        public function closeConnection()
        {
            $this->conn->close();
        }
    }

    if (isset($_POST['keyword'])) {
        $keyword = $_POST['keyword'];

        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "db_laundryqie";

        $laundrySearch = new LaundrySearch($servername, $username, $password, $dbname);
        $laundrySearch->searchPelanggan($keyword);
        $laundrySearch->closeConnection();
    }
    ?>
    </div>

    <div class="container mt-3 mb-5 no-print">
        <a href="index.php" class="btn btn-sm btn-primary"><span class="fas fa-arrow-left mr-2"></span>Back</a>
        <button class="btn btn-sm btn-success" onclick="printPage()"><span class="fas fa-print mr-2"></span>Print</button>
    </div>

</body>
</html>
