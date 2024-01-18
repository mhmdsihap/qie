<?php
// Koneksi ke database (sesuaikan dengan konfigurasi database Anda)
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_laundryqie";

$conn = new mysqli($servername, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi ke database gagal: " . $conn->connect_error);
}

// Ambil data dari formulir
$nama_pelanggan = $_POST['nama_pelanggan'];
$isi_saran = $_POST['isi_saran'];

// Query untuk menyimpan saran ke dalam tabel tbl_saran
$sql = "INSERT INTO tbl_saran (id_pelanggan, isi_saran, tgl_saran) VALUES (
    (SELECT id_pelanggan FROM tbl_m_pelanggan WHERE nama_pelanggan = '$nama_pelanggan'),
    '$isi_saran',
    NOW()
)";

if ($conn->query($sql) === TRUE) {
    echo "Terima kasih! Saran Anda telah berhasil dikirim.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Tutup koneksi
$conn->close();
?>


