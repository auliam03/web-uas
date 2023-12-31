-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 09:52 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `19220304_bab10`
--
CREATE DATABASE IF NOT EXISTS `19220304_bab10` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `19220304_bab10`;
--
-- Database: `app_laundry`
--
CREATE DATABASE IF NOT EXISTS `app_laundry` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `app_laundry`;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail` int(11) NOT NULL,
  `kuantitas` float NOT NULL,
  `keterangan` text NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_paket` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail`, `kuantitas`, `keterangan`, `id_transaksi`, `id_paket`) VALUES
(1, 2, 'Celana Jeans 2 potong', 1, 1),
(2, 2, 'Jaket Kulit 2 potong', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `nama_jabatan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(1, 'Super administrator'),
(2, 'Administrator'),
(3, 'kasir'),
(4, 'owner');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_paket`
--

CREATE TABLE `jenis_paket` (
  `id_jenis_paket` int(11) NOT NULL,
  `nama_jenis_paket` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_paket`
--

INSERT INTO `jenis_paket` (`id_jenis_paket`, `nama_jenis_paket`) VALUES
(1, 'celana'),
(2, 'jaket\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama_member` varchar(100) NOT NULL,
  `jenis_kelamin` enum('pria','wanita') NOT NULL,
  `telepon_member` varchar(25) NOT NULL,
  `email_member` varchar(200) NOT NULL,
  `alamat_member` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `jenis_kelamin`, `telepon_member`, `email_member`, `alamat_member`) VALUES
(1, 'Gabriel', 'pria', '8767876546', 'batigol@gmail.com', 'Jl. Tengku Fachrudin'),
(2, 'Claudio ', 'wanita', '9876678765678', 'lopez@gmail.com', 'Jl. Dipenogoro');

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `id_outlet` int(11) NOT NULL,
  `nama_outlet` varchar(50) NOT NULL,
  `alamat_outlet` text NOT NULL,
  `telepon_outlet` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `outlet`
--

INSERT INTO `outlet` (`id_outlet`, `nama_outlet`, `alamat_outlet`, `telepon_outlet`) VALUES
(1, 'Cabang Bekasi', 'Jln raya narogong', '081212347654'),
(2, 'cabang bogor', 'jln raya bogor', '08134568547'),
(3, 'Cabang Jakarta', 'jakarta timur', '081267458936'),
(4, 'Cabang Jogjakarta', 'jln\r\n', '081245638752');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id_paket` int(11) NOT NULL,
  `nama_paket` varchar(100) NOT NULL,
  `harga_paket` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `id_jenis_paket` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id_paket`, `nama_paket`, `harga_paket`, `id_outlet`, `id_jenis_paket`) VALUES
(1, 'Jeans Kiloan', 7500, 1, 1),
(2, 'Jeans Reguler', 4000, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `uang_yg_dibayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_transaksi`, `id_user`, `total_harga`, `uang_yg_dibayar`, `kembalian`) VALUES
(1, 2, 3, 15000, 15000, 0),
(2, 2, 3, 15000, 20000, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `kode_invoice` varchar(100) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `batas_waktu` datetime NOT NULL,
  `tanggal_bayar` datetime NOT NULL,
  `biaya_tambahan` int(11) NOT NULL,
  `diskon` float NOT NULL,
  `pajak` int(11) NOT NULL,
  `status_transaksi` enum('proses','dicuci','siap diambil','sudah diambil') NOT NULL,
  `status_bayar` enum('belum dibayar','dicuci','siap diambil','sudah dibayar') NOT NULL,
  `id_member` int(11) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `kode_invoice`, `tanggal_transaksi`, `batas_waktu`, `tanggal_bayar`, `biaya_tambahan`, `diskon`, `pajak`, `status_transaksi`, `status_bayar`, `id_member`, `id_outlet`, `id_user`) VALUES
(1, '0900239000Y9867', '2023-11-23 09:56:46', '2023-11-25 09:56:46', '2023-11-25 10:56:46', 0, 0, 10, 'siap diambil', '', 1, 1, 1),
(2, '09876545678909T987', '2023-11-25 03:56:46', '2023-11-25 03:56:46', '2023-11-25 03:56:46', 0, 0, 10, 'proses', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_outlet` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `id_outlet`, `id_jabatan`) VALUES
(1, 'super admin', 'super admin', 1, 2),
(2, 'admin', 'admin', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `jenis_paket`
--
ALTER TABLE `jenis_paket`
  ADD PRIMARY KEY (`id_jenis_paket`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jenis_paket`
--
ALTER TABLE `jenis_paket`
  MODIFY `id_jenis_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `outlet`
--
ALTER TABLE `outlet`
  MODIFY `id_outlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paket`
--
ALTER TABLE `paket`
  MODIFY `id_paket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `bsi_web`
--
CREATE DATABASE IF NOT EXISTS `bsi_web` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bsi_web`;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `pekerjaan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `alamat`, `pekerjaan`) VALUES
(1, 'Andi', 'Surabaya', 'web programmer'),
(2, 'Budi', 'Bandung', 'Web Designer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `dbpenjualan`
--
CREATE DATABASE IF NOT EXISTS `dbpenjualan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbpenjualan`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `NBrg` char(4) NOT NULL,
  `NmBrg` char(20) DEFAULT NULL,
  `Hrg` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faktur`
--

CREATE TABLE `faktur` (
  `Nfak` char(4) NOT NULL,
  `Langganan_NLgn` char(4) NOT NULL,
  `Tgl` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `langganan`
--

CREATE TABLE `langganan` (
  `NLgn` char(4) NOT NULL,
  `NmLgn` char(20) DEFAULT NULL,
  `KtLgn` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `Faktur_Nfak` char(4) NOT NULL,
  `Barang_NBrg` char(4) NOT NULL,
  `QTY` int(11) DEFAULT NULL,
  `HrgTrans` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`NBrg`);

--
-- Indexes for table `faktur`
--
ALTER TABLE `faktur`
  ADD PRIMARY KEY (`Nfak`),
  ADD KEY `Faktur_FKIndex1` (`Langganan_NLgn`);

--
-- Indexes for table `langganan`
--
ALTER TABLE `langganan`
  ADD PRIMARY KEY (`NLgn`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`Faktur_Nfak`,`Barang_NBrg`),
  ADD KEY `Faktur_has_Barang_FKIndex1` (`Faktur_Nfak`),
  ADD KEY `Faktur_has_Barang_FKIndex2` (`Barang_NBrg`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `faktur`
--
ALTER TABLE `faktur`
  ADD CONSTRAINT `faktur_ibfk_1` FOREIGN KEY (`Langganan_NLgn`) REFERENCES `langganan` (`NLgn`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`Faktur_Nfak`) REFERENCES `faktur` (`Nfak`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`Barang_NBrg`) REFERENCES `barang` (`NBrg`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `db_join_buku`
--
CREATE DATABASE IF NOT EXISTS `db_join_buku` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_join_buku`;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(3) NOT NULL,
  `judul` varchar(40) NOT NULL,
  `thn_terbit` year(4) NOT NULL,
  `id_kategori` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `thn_terbit`, `id_kategori`) VALUES
(1, 'PTIK', '2017', 1),
(2, 'SIM', '2015', 2),
(3, 'APSI', '2014', 2),
(4, 'RPL', '2016', 4),
(5, 'LINUX', '2014', 5),
(6, 'SO', '2013', 6);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_buku`
--

CREATE TABLE `kategori_buku` (
  `id_kategori` int(3) NOT NULL,
  `nm_kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_buku`
--

INSERT INTO `kategori_buku` (`id_kategori`, `nm_kategori`) VALUES
(1, 'Manajemen Informatika'),
(2, 'Sistem Informasi'),
(3, 'Ilmu Komputer'),
(4, 'Teknik Komputer'),
(5, 'Jaringan Komputer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  ADD PRIMARY KEY (`id_kategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kategori_buku`
--
ALTER TABLE `kategori_buku`
  MODIFY `id_kategori` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `db_join_kampus`
--
CREATE DATABASE IF NOT EXISTS `db_join_kampus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_join_kampus`;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` char(5) NOT NULL,
  `nm_dosen` varchar(35) NOT NULL,
  `thn_masuk` year(4) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nm_dosen`, `thn_masuk`, `alamat`) VALUES
('01011', 'Budi Santoso', '2003', 'Tangerang'),
('01012', 'Rio Hermawan', '2009', 'Jakarta'),
('01013', 'Tio Sandewa', '2005', 'Jakarta'),
('01014', 'Agus Supandi', '2011', 'Bogor'),
('01015', 'Nurlaela Sari', '2014', 'Depok');

-- --------------------------------------------------------

--
-- Table structure for table `mengajar`
--

CREATE TABLE `mengajar` (
  `id` int(3) NOT NULL,
  `nip` char(5) NOT NULL,
  `kd_mtkul` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mengajar`
--

INSERT INTO `mengajar` (`id`, `nip`, `kd_mtkul`) VALUES
(1, '01011', '101'),
(2, '01011', '303'),
(3, '01012', '202'),
(4, '01012', '404'),
(5, '01012', '303'),
(6, '01013', '505'),
(7, '01013', '101'),
(8, '01014', '404'),
(9, '01015', '202'),
(10, '01015', '303');

-- --------------------------------------------------------

--
-- Table structure for table `mt_kuliah`
--

CREATE TABLE `mt_kuliah` (
  `kd_mtkul` char(3) NOT NULL,
  `nm_mtkul` varchar(30) NOT NULL,
  `sks` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mt_kuliah`
--

INSERT INTO `mt_kuliah` (`kd_mtkul`, `nm_mtkul`, `sks`) VALUES
('101', 'Algoritma', 4),
('202', 'PTIK', 3),
('303', 'SIM', 4),
('404', 'E-Commerce', 2),
('505', 'Agama', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `mengajar`
--
ALTER TABLE `mengajar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mt_kuliah`
--
ALTER TABLE `mt_kuliah`
  ADD PRIMARY KEY (`kd_mtkul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mengajar`
--
ALTER TABLE `mengajar`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `db_join_rental`
--
CREATE DATABASE IF NOT EXISTS `db_join_rental` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_join_rental`;

-- --------------------------------------------------------

--
-- Table structure for table `mobil_baru`
--

CREATE TABLE `mobil_baru` (
  `kd_mobil` char(3) NOT NULL,
  `napol` varchar(20) NOT NULL,
  `jenis_mobil` varchar(20) NOT NULL,
  `harga` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mobil_baru`
--

INSERT INTO `mobil_baru` (`kd_mobil`, `napol`, `jenis_mobil`, `harga`) VALUES
('M01', 'B 1234 KO', 'Sedan', 600),
('M02', 'B 4321 BL', 'Mini Bus', 500),
('M03', 'B 6789 MH', 'Mini Bus', 500),
('M04', 'B 9876 MN', 'Mini Bus', 450),
('M05', 'B 3333 LS', 'Mini Bus', 600);

-- --------------------------------------------------------

--
-- Table structure for table `penyewa`
--

CREATE TABLE `penyewa` (
  `no_ktp` char(8) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `alamat` varchar(70) NOT NULL,
  `no_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyewa`
--

INSERT INTO `penyewa` (`no_ktp`, `nama`, `alamat`, `no_telp`) VALUES
('12345678', 'Cadas Atmojo', 'Sukabumi', '07123334444'),
('23456789', 'Ria Ella Nurmala', 'Tasikmalaya', '07123335555'),
('34567890', 'Egi Kusumawati', 'Bandung', '07123336666'),
('56789012', 'Satria Mandala', 'Karawang', '07123337777'),
('67890123', 'Agung Gumelar', 'Cikampek', '07123338888');

-- --------------------------------------------------------

--
-- Table structure for table `penyewaan`
--

CREATE TABLE `penyewaan` (
  `notrans` int(8) NOT NULL,
  `no_ktp` char(8) NOT NULL,
  `kd_mobil` char(3) NOT NULL,
  `tgl_sewa` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `lama_sewa` date DEFAULT NULL,
  `jumlah_sewa` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyewaan`
--

INSERT INTO `penyewaan` (`notrans`, `no_ktp`, `kd_mobil`, `tgl_sewa`, `tgl_kembali`, `lama_sewa`, `jumlah_sewa`) VALUES
(1, '12345678', 'M01', '2017-11-05', '2017-11-06', '0000-00-00', '0000-00-00'),
(2, '3467890', 'M04', '2017-11-20', '2017-11-21', '0000-00-00', '0000-00-00'),
(3, '56789012', 'M03', '2017-12-07', '2017-12-09', '0000-00-00', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mobil_baru`
--
ALTER TABLE `mobil_baru`
  ADD PRIMARY KEY (`kd_mobil`);

--
-- Indexes for table `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`no_ktp`);

--
-- Indexes for table `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD PRIMARY KEY (`notrans`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `penyewaan`
--
ALTER TABLE `penyewaan`
  MODIFY `notrans` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `db_latihan_sepatu`
--
CREATE DATABASE IF NOT EXISTS `db_latihan_sepatu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_latihan_sepatu`;

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `No_fak` char(6) NOT NULL,
  `Kd_sepatu` char(4) NOT NULL,
  `Jumlah` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`No_fak`, `Kd_sepatu`, `Jumlah`) VALUES
('FK0101', 'S001', 1),
('FK0101', 'S002', 2),
('FK0102', 'S001', 1),
('FK0103', 'S005', 3),
('FK0104', 'S003', 1),
('FK0104', 'S006', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `Id_pembeli` int(5) NOT NULL,
  `Nm_pembeli` varchar(35) NOT NULL,
  `Alamat` varchar(60) NOT NULL,
  `No_hp` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`Id_pembeli`, `Nm_pembeli`, `Alamat`, `No_hp`) VALUES
(1, 'Joko', 'Pontianak', '091212123434'),
(2, 'Butet', 'Yogyakarta', '091213134545'),
(3, 'Daeng', 'Tegal', '091214145656'),
(4, 'Putu', 'Tasikmalaya', '091215156767'),
(5, 'Neng', 'Bandung', '091216167878');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `No_fak` char(6) NOT NULL,
  `Tgl_fak` varchar(35) NOT NULL,
  `Id_pembeli` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`No_fak`, `Tgl_fak`, `Id_pembeli`) VALUES
('FK0101', '2017-11-02', 1),
('FK0102', '2017-11-03', 3),
('FK0103', '2017-11-04', 4),
('FK0104', '2017-11-05', 5);

-- --------------------------------------------------------

--
-- Table structure for table `sepatu`
--

CREATE TABLE `sepatu` (
  `Kd_sepatu` char(4) NOT NULL,
  `merk` varchar(30) NOT NULL,
  `Ukuran` varchar(10) NOT NULL,
  `Harga` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sepatu`
--

INSERT INTO `sepatu` (`Kd_sepatu`, `merk`, `Ukuran`, `Harga`) VALUES
('S001', 'Nike', '40', 300000),
('S002', 'Adidas', '41', 320000),
('S003', 'Xander', '40', 350000),
('S004', 'Mutiara', '40', 240000),
('S005', 'Bata', '41', 280000),
('S006', 'Penx', '41', 230000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD KEY `Kd_sepatu` (`Kd_sepatu`),
  ADD KEY `No_fak` (`No_fak`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`Id_pembeli`),
  ADD KEY `Id_pembeli` (`Id_pembeli`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`No_fak`),
  ADD KEY `Id_pembeli` (`Id_pembeli`),
  ADD KEY `No_fak` (`No_fak`);

--
-- Indexes for table `sepatu`
--
ALTER TABLE `sepatu`
  ADD PRIMARY KEY (`Kd_sepatu`),
  ADD KEY `Kd_sepatu` (`Kd_sepatu`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `Id_pembeli` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`Kd_sepatu`) REFERENCES `sepatu` (`Kd_sepatu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`Id_pembeli`) REFERENCES `pembeli` (`Id_pembeli`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`No_fak`) REFERENCES `detail_penjualan` (`No_fak`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `db_perpustakaan`
--
CREATE DATABASE IF NOT EXISTS `db_perpustakaan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_perpustakaan`;
--
-- Database: `db_pilkades.sl`
--
CREATE DATABASE IF NOT EXISTS `db_pilkades.sl` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_pilkades.sl`;

-- --------------------------------------------------------

--
-- Table structure for table `kelamin`
--

CREATE TABLE `kelamin` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kelamin`
--

INSERT INTO `kelamin` (`id`, `nama`) VALUES
(1, 'Laki laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_calon`
--

CREATE TABLE `tbl_calon` (
  `id` int(11) NOT NULL,
  `thn_pemilihan` varchar(4) NOT NULL,
  `kdkab` varchar(4) NOT NULL,
  `kdkec` varchar(7) NOT NULL,
  `kddesa` varchar(10) NOT NULL,
  `nourut` char(1) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `tmp_lahir` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `kelamin` char(1) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `alamat1` varchar(200) DEFAULT NULL,
  `alamat2` varchar(200) DEFAULT NULL,
  `id_pendidikan` int(11) DEFAULT NULL,
  `pendidikan` varchar(50) DEFAULT NULL,
  `id_pekerjaan` int(11) DEFAULT NULL,
  `organisasi` text DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `s_hasil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_calon`
--

INSERT INTO `tbl_calon` (`id`, `thn_pemilihan`, `kdkab`, `kdkec`, `kddesa`, `nourut`, `nama`, `nik`, `tmp_lahir`, `tgl_lahir`, `kelamin`, `agama`, `alamat1`, `alamat2`, `id_pendidikan`, `pendidikan`, `id_pekerjaan`, `organisasi`, `keterangan`, `photo`, `s_hasil`) VALUES
(11, '2019', '3210', '3210031', '3210031008', '3', 'ENDANG BENY GERHANA', '3210230702640001', 'Majalengka', '1964-05-26', 'L', 'Islam', 'Blok Senen RT.002 RW.002 Desa Cimanggugirang Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Post 45467', NULL, 5, NULL, 88, 'Kepala Desa Cimanggugirang tahun 2012-2018', '', 'ENDANG_BENY_GERHANA-2019_3210031008_1.jpg', 271),
(13, '2019', '3210', '3210031', '3210031008', '4', 'DEDI RITA TANPATI', '3210231405750021', 'Majalengka', '1973-02-24', 'L', 'Islam', 'Blok Ahad RT.002 RW.004 Desa Cimanggugirang Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 4, NULL, 88, '-', '1. Wirausaha distributor helm di Kudus\r\n2. Wirausaha produksi helm GAD di Kudus\r\n3. Wirausaha distributror rokok kretek 569 di Majalengka', 'DEDI_RITA_TANPATI-2019_3210031008_1.jpg', 344),
(16, '2019', '3210', '3210031', '3210031008', '5', 'AGUS AHMAD JUANDA', '3210230711690001', 'Majalengka', '1969-11-07', 'L', 'Islam', 'Blok Kamis RT.002 RW.003 Desa Cimanggugirang Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 4, NULL, 88, '1. Ketua Karang Taruna Desa Cimanggugirang tahun 2003 - 2011\r\n2. Badan Amil Zakat Desa Cimanggugirang tahun 2011 - 2019', '-', 'AGUS_AHMAD_JUANDA-2019_3210031008_1.jpg', 297),
(17, '2019', '3210', '3210031', '3210031004', '2', 'NANANG SUHERMAN', '3210231106760001', 'Majalengka', '1976-02-11', 'L', 'Islam', 'Blok Sidanghurip RT.004 RW.004 Desa Maniis Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 85, '-', '-', 'NANANG_SUHERMAN-2019_3210031004_1.jpg', 1121),
(18, '2019', '3210', '3210031', '3210031004', '3', 'ABDUL HOLID', '3210232504720041', 'Majalengka', '1972-04-25', 'L', 'Islam', 'Blok Ciburang RT.007 RW.003 Desa Maniis Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 86, '', 'Kepala Desa Maniis tahun 2013 sampai dengan sekarang', 'ABDUL_HOLID-2019_3210031004_1.jpg', 1249),
(19, '2019', '3210', '3210091', '3210091004', '1', 'PAHRUDIN SUBANDI', '3210251906690001', 'Majalengka', '1969-06-19', 'L', 'Islam', 'Blok Kamis Rt. 007 Rw. 002 Desa Indrakila Kecamatan Sindang Kabuparen Majalengka 45471', NULL, 8, NULL, 5, '-', '-', 'PAHRUDIN_SUBANDI-2019_3210091004_1.jpg', 790),
(20, '2019', '3210', '3210031', '3210031001', '3', 'SOFYAN HIDAYAT', '3212151303850003', 'Indramayu', '1985-03-13', 'L', 'Islam', 'Blok Prajasari RT.001 RW.001 Desa Sedaraja Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 88, '-', '-', 'SOFYAN_HIDAYAT-2019_3210031001_1.jpg', 1259),
(21, '2019', '3210', '3210031', '3210031004', '1', 'AWAR WAHRUDIN', '3210230505690081', 'Majalengka', '1973-02-01', 'L', 'Islam', 'Blok Sindanghurip RT.001 RW.004 Desa Maniis Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 4, NULL, 88, 'Bendahara DKM Mesjid Al-Ma\'sum Desa Maniis', '-', 'AWAR_WAHRUDIN-2019_3210031004_1.jpg', 877),
(22, '2019', '3210', '3210031', '3210031002', '5', 'AHIDIN', '3210231304720001', 'Majalengka', '1972-04-13', 'L', 'Islam', 'Blok Tarikolot RT.002 RW.003 Desa Cintaasih Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 88, '-', 'Perangkat Desa Rawa Tahun 2011 - 2015', 'AHIDIN-2019_3210031002_1.jpg', 117),
(27, '2019', '3210', '3210130', '3210130002', '2', 'H. NANANG SURYANA', '3210192011660042', 'Majalengka', '1966-11-20', 'L', 'Islam', 'Blok Jum\'at RT 3 RW 1', NULL, 5, NULL, 8, '', '', 'H__NANANG_SURYANA-2019_3210130002_1.png', 1433),
(29, '2019', '3210', '3210130', '3210130008', '1', 'H.EYE SUKARYA,SE', '3210191111780001', 'MAJALENGKA', '1978-11-11', 'L', 'Islam', 'DUSUN MARGAJAYA RT.001 RW.002 DESA PASIR KECAMATAN PALASAH KABUPATEN MAJALENGKA', NULL, 8, NULL, 15, '', '', 'H_EYE_SUKARYA_SE-2019_3210130008_1.JPG', 985),
(34, '2019', '3210', '3210130', '3210130002', '1', 'SOLEHUDIN YOGAPRANA', '3210191510560041', 'MAJALENGKA', '1956-10-15', 'L', 'Islam', 'BLOK AHAD RT.002 RW.003 DESA TRAJAYA KECAMATAN PALASAH KABUPATEN MAJALENGKA', NULL, 5, NULL, 4, '', '', 'SOLEHUDIN_YOGAPRANA-2019_3210130002_2.png', 1403),
(44, '2019', '3210', '3210031', '3210031010', '2', 'YAYA BUDAYA SAPUTRA', '3210231607640041', 'Majalengka', '1964-07-16', 'L', 'Islam', 'Blok Kulisi RT.001 RW.002 Desa Cingambul Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 5, '', '1. Sekretaris Desa Cingambul dari tahun 1995 sampai dengan tahun 2015\r\n2. Pelaksana di OPD Kecamatan Cingambul dari tahun 2015 sampai dengan sekarang', 'YAYA_BUDAYA_SAPUTRA-2019_3210031010_1.jpg', 1091),
(46, '2019', '3210', '3210130', '3210130013', '1', 'DEDEN SAPUTRA,SE', '3210191502810061', 'MAJALENGKA', '1981-02-15', 'L', 'Islam', 'DUSUN MAJAMUKTI RT.001 RW.003 DESA MAJASUKA KECAMATAN PALASAH', NULL, 8, NULL, 15, '', '', 'DEDEN_SAPUTRA_SE-2019_3210130013_1.png', 1214),
(47, '2019', '3210', '3210130', '3210130011', '1', 'MIMIN MINARSIH,S.IP', '3210194904700001', 'MAJALENGKA', '1970-04-29', 'P', 'Islam', 'BLOK POS RT.001 RW.001 DESA SINDANGWASA KECAMATAN PALASAH', NULL, 8, NULL, 88, '', '', 'MIMIN_MINARSIH_S_IP-2019_3210130011_1.png', 394),
(48, '2019', '3210', '3210030', '3210030015', '1', 'SUPRIATNA CUCUP', '3210033105690001', 'MAJALENGKA', '1969-05-31', 'L', 'Islam', 'BLOK KEMIS RT. 003 RW. 002 DESA SINDANGPANJI', NULL, 5, NULL, 88, '-', '-', 'SUPRIATNA_CUCUP-2019_3210030015_1.png', 1662),
(49, '2019', '3210', '3210030', '3210030022', '3', 'AHMAD YANI', '3210032912630001', 'MAJALENGKA', '1963-12-29', 'L', 'Islam', 'BLOK PARENTAH RT. 009 RW. 003 DESA SUKASARI', NULL, 5, NULL, 5, '-', '-', 'AHMAD_YANI-2019_3210030022_1.png', 598),
(51, '2019', '3210', '3210130', '3210130011', '3', 'SUHEDI', '3210191103650041', 'MAJALENGKA', '1965-03-11', 'L', 'Islam', 'BLOK DEPOK RT.002 RW.005 DESA SINDANGWASA KECAMATAN PALASAH', NULL, 5, NULL, 88, '', '', 'SUHEDI-2019_3210130011_1.png', 791),
(52, '2019', '3210', '3210030', '3210030022', '2', 'DIDI SUPARDI', '3210030511730061', 'MAJALENGKA', '1974-01-01', 'L', 'Islam', 'BLOK PARENTAH RT. 010 RW.003 DESA SUKASARI', NULL, 5, NULL, 84, '-', '-', 'DIDI_SUPARDI-2019_3210030022_2.png', 1232),
(54, '2019', '3210', '3210030', '3210030022', '1', 'H. DEDE KUSNO ADI, ST', '3210030108710001', 'MAJALENGKA', '1971-08-01', 'L', 'Islam', 'BLOK RAKSABUMI RT. 005 RW. 001 DESA SUKSASARI', NULL, 8, NULL, 86, '-', '-', 'H__DEDE_KUSNO_ADI__ST-2019_3210030022_3.png', 1305),
(55, '2019', '3210', '3210030', '3210030014', '1', 'AGUS KOSWARA', '3210032611700001', 'MAJALENGKA', '1970-11-26', 'L', 'Islam', 'BLOK SOKAJAYA RT. 001 RT. 004 DESA CISOKA', NULL, 5, NULL, 84, '-', '-', 'AGUS_KOSWARA-2019_3210030014_2.gif', 1003),
(56, '2019', '3210', '3210130', '3210130011', '2', 'AGUS TRISNO', '3210191608790001', 'BREBES', '1979-08-16', 'L', 'Islam', 'BLOK POS RT.001 RW.007 DESA SINDANGWASA KECAMATAN PALASAH', NULL, 5, NULL, 88, '', '', 'AGUS_TRISNO-2019_3210130011_2.png', 210),
(57, '2019', '3210', '3210030', '3210030015', '2', 'ADING SUARSONO', '3210030206590001', 'MAJALENGKA', '1959-06-02', 'L', 'Islam', 'BLOK JUMAT RT. 002 RW. 005 DESA SINDANGPANJI', NULL, 6, NULL, 4, 'AMPI\r\nKNPI\r\nPGRI', '-', 'ADING_SUARSONO-2019_3210030015_2.png', 1147),
(58, '2019', '3210', '3210030', '3210030015', '3', 'NENI ROHWINA', '3210036209760041', 'MAJALENGKA', '1976-09-22', 'P', 'Islam', 'BLOK JUMAT RT. 001 RW, 005 DESA SINDANGPANJI', NULL, 4, NULL, 2, '-', '-', 'NENI_ROHWINA-2019_3210030015_3.png', 353),
(59, '2019', '3210', '3210031', '3210031010', '1', 'SARIPIN', '3210080606650081', 'Majalengka', '1965-06-03', 'L', 'Islam', 'Blok Raksabumi RT.001 RW.001 Desa Cingambul Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 4, NULL, 86, '-', 'Kepala Desa Cingambul dari tahun 2014 sampai dengan sekarang', 'SARIPIN-2019_3210031010_1.jpg', 916),
(60, '2019', '3210', '3210030', '3210030023', '1', 'DADANG KURNIAWAN', '3210030606770081', 'MAJALENGKA', '1977-06-06', 'L', 'Islam', 'BLOK SUKARESMI RT. 001 RW. 001 DESA SUNALARI', NULL, 5, NULL, 84, '-', '-', 'DADANG_KURNIAWAN-2019_3210030023_1.png', 699),
(61, '2019', '3210', '3210091', '3210091004', '2', 'ROIN', '3210084211770021', 'Majalengka', '1976-05-14', 'P', 'Islam', 'Blok Jum\'at Rt. 001 Rw. 001 Desa Indrakila Kecamatan Sindang Kabupaten Majalengka 45471', NULL, 4, NULL, 2, '-', '-', 'ROIN-2019_3210091004_1.jpg', 847),
(62, '2019', '3210', '3210030', '3210030018', '1', 'ENDI SUHENDI', '3210031512790021', 'MAJALENGKA', '1976-04-05', 'L', 'Islam', 'BLOK SUKARAOS RT. 005 RT. 003 DESA SUKAMUKTI', NULL, 5, NULL, 86, '-', '-', 'ENDI_SUHENDI-2019_3210030018_1.jpg', 1841),
(63, '2019', '3210', '3210080', '3210080010', '4', 'NANA RUSMANA, S.Sos', '3210201012580021', 'MAJALENGKA', '1958-12-10', 'L', 'Islam', 'BLOK HULUDAYEUH RT.003 RW.007 DESA KARAYUNAN KEC. CIGASONG KAB. MAJALENGKA', NULL, 8, NULL, 4, '', '', 'NANA_RUSMANA__S_SOS-2019_3210080010_1.jpg', 419),
(64, '2019', '3210', '3210080', '3210080010', '3', 'RUSMAN', '3210201104544000', 'MAJALENGKA', '1954-04-11', 'L', 'Islam', 'BLOK HULUDAYEUH RT. 002 RW. 008 DESA KARAYUNAN KEC. CIGASONG KAB. MAJALENGKA', NULL, 5, NULL, 88, '', '', 'RUSMAN-2019_3210080010_2.jpg', 783),
(65, '2019', '3210', '3210080', '3210080010', '1', 'DIDING AHYADI', '3210200709690061', 'MAJALENGKA', '1969-09-07', 'L', 'Islam', 'BLOK HULUDAYEUH RT. 001 RW. 007 DESA KARAYUNAN  KEC. CIGASONG KAB. MAJALENGKA', NULL, 5, NULL, 88, '', '', 'DIDING_AHYADI-2019_3210080010_3.jpg', 1445),
(66, '2019', '3210', '3210060', '3210060002', '1', 'ADE CHANDRA SOMANTRI, SE', '3210063009850060', 'Majalengka, 30-09-1985', '1985-09-30', 'L', 'Islam', 'Blok Sukaresmi RT.012 RW.004 \r\nDesa Wanahayu  Kecamatan Maja\r\n', NULL, 8, NULL, 88, 'Pernah sebagai Ketua BPD Desa Wanahayu', '', 'ADE_CHANDRA_SOMANTRI-2019_3210060002_1.jpg', 586),
(67, '2019', '3210', '3210080', '3210080002', '2', 'JAJANG AGUSTINA, ST.', '3210201408900021', 'MAJALENGKA', '1990-08-14', 'L', 'Islam', 'BLOK KRAMAT MULYA RT. 005 RW. 002 DESA TAJUR KEC. CIGASONG KAB. MAJALENGKA', NULL, 8, NULL, 15, '', '', 'JAJANG_AGUSTINA__ST_-2019_3210080002_2.jpg', 378),
(69, '2019', '3210', '3210080', '3210080002', '1', 'HJ. NANIH SUMARNI', '3210204509760061', 'MAJALENGKA', '1976-09-06', 'P', 'Islam', 'BLOK MEKARJAYA RT.  019 RW. 007 DESA TAJUR KEC. CIGASONG KAB. MAJALENGKA', NULL, 5, NULL, 2, '', '', 'HJ__NANIH_SUMARNI-2019_3210080002_1.jpg', 1008),
(70, '2019', '3210', '3210060', '3210060002', '3', 'IIP  HOLIPAH, S.Ag., M.Si.', '3273020807730001', 'Majalengka, 08-07-1973', '1973-07-08', 'L', 'Islam', 'Blok Senin RT.003 Rw.001\r\nDesa Wanahayu  Kecamatan Maja', NULL, 9, NULL, 88, 'Pernah menjadi Ketua LPM', '', 'IIP__HOLIPAH-2019_3210060002_2.jpg', 563),
(71, '2019', '3210', '3210080', '3210080002', '3', 'IMAN PIRMANSAH', '3210200203890061', 'MAJAKENGKA', '1989-10-06', 'L', 'Islam', 'BLOK KRAMAT MULYA RT. 002 RW.  001 DESA TAJUR KEC. CIGASONG KAB. MAJALENGKA', NULL, 5, NULL, 88, '', '', 'IMAN_PIRMANSAH-2019_3210080002_3.jpg', 549),
(72, '2019', '3210', '3210060', '3210060002', '2', 'ENJU  SUJANA', '3212270711660001', 'Majalengka, 07-11-1966', '1966-11-07', 'L', 'Islam', 'Blok Sukaresmi  RT.009 Rw.004\r\nDesa Wanahayu  Kecamatan Maja', NULL, 5, NULL, 86, 'Pernah menjadi Ketua LPM', 'Anggota Perhimpunan Penyuluh Pertanian', 'ENJU__SUJANA-2019_3210060002_3.jpg', 557),
(74, '2019', '3210', '3210031', '3210031003', '2', 'SUNTONO', '3210231204660061', 'Majalengka', '1966-04-12', 'L', 'Islam', 'Blok Cidahu RT.012 RW.006 Desa Cidadap Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa  Barat Kode Pos 45467', NULL, 5, NULL, 88, '-', '-', 'SUNTONO-2019_3210031003_1.jpg', 869),
(75, '2019', '3210', '3210100', '3210100010', '2', 'NURHOTIM', '3210091010750081', 'MAJALENGKA', '1975-09-10', 'L', 'Islam', 'BLOK KLIWON RT/RW:002/005 DESA/KEC.RJAGALUH', NULL, 5, NULL, 84, '', '', 'NURHOTIM-2019_3210100010_1.jpg', 1504),
(76, '2019', '3210', '3210100', '3210100010', '1', 'SUKUR', '3175040505730002', 'MAJALENGKA', '1972-05-05', 'L', 'Islam', 'BLOK KLIWON RT. 002 RW. 005 \r\nDESA/KELURAHAN RAJAGALUH KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVINSI JAWA BARAT', NULL, 4, NULL, 88, '', '', 'SUKUR-2019_3210100010_1.jpg', 1307),
(77, '2019', '3210', '3210020', '3210020010', '1', 'Drs. YASKUR, M.Pd.I', '3210020709620002', 'MAJALENGKA', '1962-09-07', 'L', 'Islam', 'Blok Kulisi I (Satu) Rt 001 Rw 001 Desa Cipeundeuy Kecamatan Bantarujeg Kabupaten Majalengka.', NULL, 9, NULL, 5, 'a.HMI\r\n\r\nb.HIUMAKA\r\n\r\nC.HIMAKSOS\r\nAMS', '-', 'DRS__YASKUR__M_PD_I-2019_3210020010_1.jpg', 1690),
(78, '2019', '3210', '3210210', '3210210004', '3', 'ENDANG SETIAWAN', '3209180307800007', 'MAJALENGKA', '1980-07-03', 'L', 'Islam', 'BLOK II, RT.002, RW.004, DESA SEPAT, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 8, NULL, 88, '-', '-', 'ENDANG_SETIAWAN-2019_3210210004_3.jpg', 242),
(79, '2019', '3210', '3210210', '3210210004', '1', 'AKBAR SUDRAJAT', '3210172401820061', 'MAJALENGKA', '1982-01-24', 'L', 'Islam', 'BLOK II, RT.001, RW. 003, DESA SEPAT, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'AKBAR_SUDRAJAT-2019_3210210004_2.jpg', 356),
(80, '2019', '3210', '3210210', '3210210004', '2', 'MAMAN SULAEMAN', '3210173103890001', 'MAJALENGKA', '1989-03-31', 'L', 'Islam', 'BLOK II, RT.002, RW.003, DESA SEPAT, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'MAMAN_SULAEMAN-2019_3210210004_1.jpg', 313),
(81, '2019', '3210', '3210020', '3210020021', '1', 'H. ABDUL MAJID', '3210021904550021', 'MAJALENGKA', '1955-04-19', 'L', 'Islam', 'Dusun Haurgeulis II RT 001 RW 007 Desa haurgeulis Kecamatan Bantarujeg Kabupaten Majalengka', NULL, 5, NULL, 84, '-\r\n\r\n\r\nKepala Desa Hauegeulis 2 Periode', '-', 'H__ABDUL_MAJID-2019_3210020021_1.jpg', 844),
(82, '2019', '3210', '3210020', '3210020016', '2', 'ADE ZAENAL ARIFIN', '3210020711630101', 'MAJALENGKA', '1963-11-07', 'L', 'Islam', 'Blok Ciranggon Rt 002 Rw 006 Desa Bantarujeg  Kecamatan Bantarujeg Kabupaten Majalengka.', NULL, 5, NULL, 88, 'Menjabat Kepala Desa Bantarujeg Tahun 1998-2008\r\nAnggota BPD Masa Bakti 2013-2019', '-', 'ADE_ZAENAL_ARIFIN-2019_3210020016_1.jpg', 849),
(84, '2019', '3210', '3210021', '3210021004', '2', 'R RAMLAN SETIAWAN', '3210262304810001', 'MAJALENGKA', '1981-04-23', 'L', 'Islam', 'DSN CILIMUS RT. 001 RW. 001 DESA BANYUSARI KECAMATAN MALAUSMA', NULL, 4, NULL, 88, '', '', 'R_RAMLAN_SETIAWAN-2019_3210021004_1.jpg', 1383),
(86, '2019', '3210', '3210021', '3210021004', '1', 'JUNADI', '3210261407650021', 'MAJALENGKA', '1965-07-14', 'L', 'Islam', 'DUSUN BANYUSARI RT. 001 RW. 001 DESA BANYUSARI KECAMATAN MALAUSMA', NULL, 4, NULL, 86, '', '', 'JUNADI-2019_3210021004_1.jpg', 1605),
(87, '2019', '3210', '3210021', '3210021011', '2', 'TATAN CIPTAN SOBIRIN, S.IP', '3210022901670001', 'BANDUNG', '1967-01-29', 'L', 'Islam', 'DUSUN BABAKAN RT. 001 RW. 001 DESA KRAMATJAYA KECAMATAN MALAUSMA', NULL, 8, NULL, 86, '1. FKPPI\r\n2. KBP3K', '', 'TATAN_CIPTAN_SOBIRIN__S_IP-2019_3210021011_2.jpg', 642),
(88, '2019', '3210', '3210090', '3210090017', '2', 'H. AHMAD UCIN, S.Pd', '3210082402590001', 'Majalengka', '1959-02-24', 'L', 'Islam', 'BLOK PON RT 001 RW 003 DESA SALAGEDANG KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 8, NULL, 4, 'PGRI\r\nKOPERASI', '', 'H__AHMAD_UCIN__S_PD-2019_3210090017_1.jpg', 1360),
(89, '2019', '3210', '3210060', '3210060014', '1', 'SYAEFUL  UYUN', '3210061105680021', 'Majalengka, 11-05-1968', '1968-05-11', 'L', 'Islam', 'Blok Hegarmanah RT.004 RW.002\r\nDesa Banjaran  Kecamatan Maja', NULL, 5, NULL, 15, '', '', 'SYAEFUL__UYUN-2019_3210060014_1.jpg', 249),
(90, '2019', '3210', '3210060', '3210060014', '2', 'ENDOY  HIDAYAT, S.E.', '3210061911620001', 'Majalengka, 19-11-1962', '1962-11-19', 'L', 'Islam', 'Blok Sukaasih RT.001 RW.003\r\nDesa Banjaran  Kecamatan Maja', NULL, 8, NULL, 5, 'Karang Taruna, KNPI, BPD, LPM', '', 'ENDOY__HIDAYAT__S_E_-2019_3210060014_2.jpg', 731),
(92, '2019', '3210', '3210030', '3210030026', '2', 'MUHIDIN', '3210031505650202', 'MAJALENGKA', '1965-05-15', 'L', 'Islam', 'BLOK MAWARSARI RT. 002 RW. 004 DESA CILANGCANG', NULL, 4, NULL, 88, 'ANGGOTA BPD', '-', 'MUHIDIN-2019_3210030026_1.gif', 165),
(93, '2019', '3210', '3210030', '3210030026', '3', 'Drs. AGUS NASORI', '3210031506680481', 'MAJALENGKA', '1968-06-15', 'L', 'Islam', 'BLOK WARNASARI RT. 002 RW. 001 DESA CILANGCANG', NULL, 8, NULL, 88, 'KETUA BPD', '-', 'DRS__AGUS_NASORI-2019_3210030026_1.png', 191),
(94, '2019', '3210', '3210030', '3210030026', '1', 'ASEP ISWANDAR SAPUTRA, S.Sos', '3210031304770061', 'MAJALENGKA', '1977-04-13', 'L', 'Islam', 'BLOK MAWARSARI RT. 001 RW. 003 DESA CILANGCANG', NULL, 8, NULL, 18, 'KETUA KARANG TARUNA', '-', 'ASEP_ISWANDAR_SAPUTRA__S_SOS-2019_3210030026_1.png', 578),
(95, '2019', '3210', '3210030', '3210030014', '2', 'OMAN SUHERMAN, SE', '3210030611570040', 'MAJALENGKA', '1957-11-06', 'L', 'Islam', 'BLOK SOKAJAYA RT. 002 RW. 002 DESA CISOKA', NULL, 8, NULL, 4, '-', '-', 'OMAN_SUHERMAN__SE-2019_3210030014_1.gif', 457),
(98, '2019', '3210', '3210090', '3210090010', '2', 'H. DANY SISWANTO', '3210080102720001', 'MAJALENGKA', '1972-02-01', 'L', 'Islam', 'BLOK JUMAT RT 006 RW 006 DESA PADAHANTEN KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 7, NULL, 88, '1. KETUA PC. PEMUDA PUI KEC. SUKAHAJI\r\n2. PD. PUI KEC. SUKAHAJI\r\n3. DIVISI EKONOMI PEMUDA PD PUI KEC. SUKAHAJI\r\n4. SEKRETARIS II MASIKA ICMI KAB. MAJALNGKA\r\n', '', 'H__DANY_SISWANTO-2019_3210090010_1.jpg', 873),
(99, '2019', '3210', '3210090', '3210090011', '1', 'NANA SUPRIATNA', '3210080701730041', 'MAJALENGKA', '1973-01-07', 'L', 'Islam', 'BLOK AHAD RT 003 RW 001 DESA SUKAHAJI KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, 'Ketua PAC PDI Perjuangan', '', 'NANA_SUPRIATNA-2019_3210090011_1.jpg', 1503),
(101, '2019', '3210', '3210070', '3210070003', '4', 'NYAI YUNENGSIH', '3210076008650021', 'MAJALENGKA', '1965-08-20', 'P', 'Islam', 'BLOK CIJUREY RT 25 RW 10', NULL, 5, NULL, 85, '', 'PERNAH MENJABAT KEPALA DESA KULUR PERIODE 2012 - 2018', 'NYAI_YUNENGSIH-2019_3210070003_1.jpg', 651),
(102, '2019', '3210', '3210070', '3210070003', '2', 'SANTI NURHAYATI', '3210074310780001', 'GARUT', '1978-10-03', 'P', 'Islam', 'BLOK TARIKOLOT RT 10 RW 06', NULL, 5, NULL, 2, '', '', 'SANTI_NURHAYATI-2019_3210070003_1.jpg', 264),
(103, '2019', '3210', '3210080', '3210080008', '2', 'OTONG ABDUL MUHYI, S.IP.', '3210101503630001', 'MAJALENGKA', '1963-03-15', 'L', 'Islam', 'BLOK LINGGASARI RT. 010 RW.. 004 DESA BARIBIS KEC. CIGASONG KAB. MAJALENGKA', NULL, 8, NULL, 5, '', '', 'OTONG_ABDUL_MUHYI-2019_3210080008_1.jpg', 1207),
(104, '2019', '3210', '3210080', '3210080008', '1', 'DUDUNG ABDUL KARIM', '3210202509700021', 'MAJALENGKA', '1969-09-25', 'L', 'Islam', 'BLOK LINGGASARI RT. 014 RW.  005 DESA BARIBIS KEC. MAJALENGKA KAB. MAJALENGKA', NULL, 5, NULL, 88, '', '', 'DUDUNG_ABDUL_KARIM-2019_3210080008_2.jpg', 1608),
(106, '2019', '3210', '3210031', '3210031002', '2', 'H. ENDA JUNENDA', '3210230610700001', 'Majalengka', '1970-10-06', 'L', 'Islam', 'Blok Sarimukti RT.002 RW.001 Desa Cintaasih Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 88, '1. Ketua Karang Taruna Desa Cidadap\r\n2. Ketua DPD LSM Laskar NKRI', 'Kepala Desa Cidadap 1 (satu) periode', 'H__ENDA_JUNENDA-2019_3210031002_1.jpg', 802),
(107, '2019', '3210', '3210031', '3210031002', '3', 'UCU SUPRIATNA', '3210230908720061', 'Majalengka', '1972-08-09', 'L', 'Islam', 'Blok Cianja RT.002 RW.004 Desa Cintaasih Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 4, NULL, 84, '-', '-', 'UCU_SUPRIATNA-2019_3210031002_3.JPG', 304),
(108, '2019', '3210', '3210100', '3210100007', '1', 'RAHMAT YUDIA', '3210090307660001', 'MAJALENGKA', '1966-07-03', 'L', 'Islam', 'BLOK AHAD RT. 001 RW. 001 \r\nDESA/KELURAHAN KUMBUNG KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVINSI JAWA BARAT', NULL, 5, NULL, 5, '', '', 'RAHMAT_YUDIA-2019_3210100007_1.JPG', 1169),
(109, '2019', '3210', '3210100', '3210100007', '3', 'KOMARUDIN', '3210090604680001', 'MAJALENGKA', '1968-04-06', 'L', 'Islam', 'DUSUN PASIR RT. 013 RW. 004 \r\nDESA/KELURAHAN KUMBUNG KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVINSI JAWA BARAT', NULL, 4, NULL, 88, '', '', 'KOMARUDIN-2019_3210100007_1.JPG', 1196),
(110, '2019', '3210', '3210100', '3210100011', '3', 'M. IBRAHIM RISYAD ELFAHMI	', '3210090801920001', 'MAJALENGKA', '1992-01-08', 'L', 'Islam', 'BLOK C RT. 003 RW. 003 \r\nDESA/KELURAHAN RAJAGALUH LOR KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVINSI JAWA BARAT\r\n', NULL, 8, NULL, 85, '', '', 'M__IBRAHIM_RISYAD_ELFAHMI_-2019_3210100011_1.jpg', 1112),
(111, '2019', '3210', '3210100', '3210100011', '2', 'AZIZ SISWANDA	', '3210090806680041', 'MAJALENGKA', '1968-06-08', 'L', 'Islam', 'BLOK C RT. 001 RW. 003 \r\nDESA/KELURAHAN RAJAGALUH LOR KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVINSI JAWA BARAT\r\n', NULL, 5, NULL, 88, '', '', 'AZIZ_SISWANDA_-2019_3210100011_1.jpg', 16),
(112, '2019', '3210', '3210060', '3210060017', '3', 'ARIF  RIFAI', '3210060305620001', 'Majalengka, 03-05-1962', '1962-05-03', 'L', 'Islam', 'Blok Jagaraksa RT.002 RW.002\r\nDesa Pageraji  Kecamatan Maja', NULL, 5, NULL, 5, '', '', 'ARIF__RIFAI-2019_3210060017_1.jpg', 247),
(113, '2019', '3210', '3210060', '3210060017', '1', 'DEDE  BUDIMAN', '3210062209620021', 'Majalengka, 22-09-1962', '1962-09-22', 'L', 'Islam', 'Blok Jagaraksa RT.002 Rw.002\r\nDesa Pageraji Kecamatan Maja', NULL, 5, NULL, 88, '', '', 'DEDE__BUDIMAN-2019_3210060017_2.jpg', 329),
(114, '2019', '3210', '3210060', '3210060002', '4', 'AGUS  SUHARTO', '3210060609660041', 'Majalengka, 06-09-1966', '1966-09-06', 'L', 'Islam', 'Blok Senin RT.003 RW.001\r\nDesa Wanahayu  Kecamatan Maja', NULL, 5, NULL, 5, 'Pernah menjadi Ketua BPD', '', 'AGUS__SUHARTO-2019_3210060002_4.jpg', 360),
(115, '2019', '3210', '3210060', '3210060009', '1', 'DIDI  JUHARI', '3210062501660001', 'Majalengka, 25-01-1966', '1966-01-25', 'L', 'Islam', 'Blok Jum\'at  RT.003 RW.003\r\nDesa Maja Utara  Kecamatan Maja', NULL, 5, NULL, 88, '', '', 'DIDI__JUHARI-2019_3210060009_1.jpg', 1929),
(116, '2019', '3210', '3210060', '3210060009', '2', 'ADE  AGUS  SETIAWAN', '3210060908720001', 'Majalengka, 09-08-1972', '1972-08-09', 'L', 'Islam', 'Blok Senin  RT.002 RW.001\r\nDesa Maja Utara  Kecamatan Maja', NULL, 5, NULL, 86, '', '', 'ADE__AGUS__SETIAWAN-2019_3210060009_2.png', 1443),
(119, '2019', '3210', '3210031', '3210031002', '1', 'JAENUDIN', '3210233007760001', 'Majalengka', '1976-07-30', 'L', 'Islam', 'Blok Candana RT.005 RW.005 Desa Cintaasih Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 86, '-', 'Kepala Desa Cintaasih tahun 2004 sampai dengan sekarang', 'JAENUDIN-2019_3210031002_1.jpg', 514),
(120, '2019', '3210', '3210030', '3210030023', '2', 'RUDI HERDIAWANTO', '3210032209930041', 'MAJALENGKA', '1993-09-22', 'L', 'Islam', 'BLOK SUKARESMI RT. 001 RW. 001 DESA SUNALARI', NULL, 5, NULL, 88, '-', '-', 'RUDI_HERDIAWANTO-2019_3210030023_2.png', 17),
(121, '2019', '3210', '3210090', '3210090013', '2', 'SAHIDIN', '3210080202710021', 'MAJALENGKA', '1971-02-02', 'L', 'Islam', 'BLOK SUKARAHARJA RT 02 RW 03 DESA BABAKAN MANJETI KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 5, NULL, 86, '', '', 'SAHIDIN-2019_3210090013_1.jpg', 784),
(122, '2019', '3210', '3210090', '3210090013', '1', 'H. ALI RACHMAN, S.Sos', '3210081304550041', 'MAJALENGKA', '1955-04-13', 'L', 'Islam', 'BLOK SUKARAHARJA RT 02 RW 03 DESABABAKAN MANJETI KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 8, NULL, 4, '', '', 'H__ALI_RACHMAN__S_SOS-2019_3210090013_1.jpg', 1433),
(123, '2019', '3210', '3210090', '3210090018', '2', 'DEDE WANGSA DIPANEGARA, S.IP', '3216192002760004', 'MAJALENGKA', '1978-02-20', 'L', 'Islam', 'BLOK REKESAN  RT 003 RW 003 DESA TANJUNGSARI KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 8, NULL, 88, '', '', 'DEDE_WANGSA_DIPANEGARA__S_IP-2019_3210090018_1.jpg', 1399),
(124, '2019', '3210', '3210060', '3210060001', '1', 'YOYO  SUNARYO', '3210061909620021', 'Majalengka, 19-09-1962', '1962-09-19', 'L', 'Islam', 'Blok Mekarmulya  RT.001 RW.004\r\nDesa Cihaur  Kecamatan Maja', NULL, 5, NULL, 5, 'Penjabat Kepala Desa PAW Desa Cihaur', '', 'YOYO__SUNARYO-2019_3210060001_1.jpg', 2116),
(125, '2019', '3210', '3210030', '3210030024', '2', 'USUP SUPRATMAN, SE', '3210030808580041', 'MAJALENGKA', '1958-08-08', 'L', 'Islam', 'BLOK KATANGGUR LANDEUH RT 004 RW. 002 DESA BAGJASARI', NULL, 8, NULL, 4, '-', '-', 'USUP_SUPRATMAN__SE-2019_3210030024_1.png', 1026),
(126, '2019', '3210', '3210030', '3210030024', '3', 'ASEP NURHAEDI', '3210031211800101', 'MAJALENGKA', '1980-11-12', 'L', 'Islam', 'BLOK KATANGGUR TONGGOH RT. 005 RW. 002 DESA BAGJASARI', NULL, 4, NULL, 88, 'PAGUYUBAN PEMUDA PELAJAR CIKIJING CINGAMBUL\r\nDKM AL-MU\'MIN DESA BAGJASARI', '', 'ASEP_NURHAEDI-2019_3210030024_2.png', 701),
(127, '2019', '3210', '3210031', '3210031002', '4', 'DEDE MUHDOR, SE', '3210230109670021', 'Majalengka', '1967-09-01', 'L', 'Islam', 'Blok Cianja RT.001 RW.004 Desa Cintaasih Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 8, NULL, 88, '-', 'Perangkat Desa Sedaraja', 'DEDE_MUHDOR__SE-2019_3210031002_1.jpg', 164),
(128, '2019', '3210', '3210090', '3210090011', '2', 'Drs. ANDI ROS AMANSYAH', '3210080909670000', 'MAJALENGKA', '1967-09-09', 'L', 'Islam', 'BLOK AHAD RT 03 RW 01 DESA SUKAHAJI KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 8, NULL, 15, '', '', 'ANDI_ROS_AMANSYAH-2019_3210090011_1.jpg', 664),
(129, '2019', '3210', '3210160', '3210160007', '1', 'ELON', '3210180512730001', 'MAJALENGKA', '1973-12-05', 'L', 'Islam', 'BLOK II RT 011 RW 004', NULL, 5, NULL, 86, 'A. SEKRETARIS PAC PARTAI POLITIK \r\nB. KETUA RANTING PARTAI POLITIK\r\nC. KETUA PEMUDA KARANG TARUNA DUSUN', 'A. KEPALA UNIT PERUSAHAAN KREDIT\r\nB. PERANGKAT DESA\r\nC. KEPALA DESA', 'ELON-2019_3210160007_1.jpg', 1421),
(130, '2019', '3210', '3210160', '3210160007', '3', 'IMAN SUNANDAR,S.SOS', '3210180507690041', 'MAJALENGKA', '1969-07-05', 'L', 'Islam', 'BLOK I RT 001 RW 001', NULL, 8, NULL, 88, 'A. KETUA BPD TAHUN 2001 - 2006\r\nB. KETUA LPM TAHUN 2014 - 2019\r\nC. SEKRETARIS BADAN KERJA SAMA ANTAR DESA (BKAD) 2010\r\nD. KETUA TIM PELAKSANA KEGIATAN (TPK) PROGRAM PNPM MANDIRI PERDESAAN\r\nE. KETUA FORUM KELOMPOK INFORMASI MASYARAKAT (KIM) KABUPATEN MAJALENGKA SAMPAI SEKARANG\r\nF. ANGGOTA FORUM KOMUNIKASI DESA KAWASAN (FKDK)\r\nG. KETUA BADAN PENGURUS KABUPATEN  (BPK)\r\nH. ANGGOTA DEWAN KESENIAN KEBUDAYAAN MAJALENGKA (DEKKMA)\r\nI. SEKRETARIS KNPI KECAMATAN PANYINGKIRAN TAHUN 2007\r\nJ. KETUA POSYANTEK KECAMATAN PANYINGKIRAN TAHUN 2015\r\nK. ANGGOTA IPMMI\r\nL. TIM INOVASI KABUPATEN (TIK)\r\nM. ANGGOTA RTIK MAJALENGKA', 'A. PANWASLU KECAMATAN TAHUN 2008\r\nB. FASILITATOR KECAMATAN PNPM MANDIRI PERDESAAN TAHUN 2009 DI KECAMATAN CIBEBER KABUPATEN CIANJUR, TAHUN 2010 - 2012 DI KECAMATAN KASOKANDEL, TAHUN 2013-2015 DI KECAMATAN JATITUUH\r\nC. MENJADI PENDAMPING DESA KECAMATAN DI KECAMATAN PANYINGKIRAN TAHUN 2016\r\nD. PENDAMPING PROGRAM BBWS PPSDA TAHUN 2017 DI DESA BONANG DAN DESA RANJIWETAN\r\nE. PENDAMPING RUTILAHU PROPINSI JABAR TAHUN 2018 DI DESA MEKARJAYA DAN DESA PAL', 'IMAN_SUNANDAR_S_SOS-2019_3210160007_1.jpg', 163),
(131, '2019', '3210', '3210160', '3210160007', '2', 'SAEFUL', '3210180601620001', 'MAJALENGKA', '1962-01-06', 'L', 'Islam', 'BLOK III KEDUNGBUNI', NULL, 5, NULL, 88, '', '', 'SAEFUL-2019_3210160007_1.jpg', 1506),
(132, '2019', '3210', '3210080', '3210080009', '2', 'LILIK SUKATININGSIH', '3210205508700001', 'NGAWI', '1970-08-15', 'P', 'Islam', 'BLOK KARYALAKSANA RT. 004 RW. 001 DESA BATUJAYA KEC. CIGASONG KAB. MAJALENGKA', NULL, 5, NULL, 2, '', '', 'LILIK_SUKATININGSIH-2019_3210080009_1.jpg', 712),
(133, '2019', '3210', '3210041', '3210041006', '1', 'H. AJID', '3210221105620041', 'MAJALENGKA', '1950-06-15', 'L', 'Islam', 'BLOK LEGOK DESA SANGIANG KECAMATAN BANJARAN KABUPATEN MAJALENGKA', NULL, 5, NULL, 9, '', '', 'AJID-2019_3210041006_1.jpg', 1621),
(134, '2019', '3210', '3210090', '3210090010', '3', 'SUDARTA', '3210081710610000', 'MAJALENGKA', '1961-10-17', 'L', 'Islam', ' BLOK MINGGU RT 001 RW 001 DESA PADAHANTEN KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 5, NULL, 5, '', '', 'SUDARTA-2019_3210090010_1.JPG', 733),
(135, '2019', '3210', '3210090', '3210090017', '1', 'MAHMUDIN', '3210082412670001', 'MAJALENGKA', '1967-12-24', 'L', 'Islam', 'BLOK MANIS RT 001 RW 001DESA SALAGEDANG KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 5, NULL, 86, '', '', 'MAHMUDIN-2019_3210090017_1.jpg', 1216),
(136, '2019', '3210', '3210170', '3210170004', '3', 'OTONG TAHYA MULYANA', '3210132606680001', 'MAJALENGKA', '1968-06-26', 'L', 'Islam', 'BLOK MEKARSARI RT 06 RW 06 TELUK JAMBE UTARA', NULL, 5, NULL, 88, 'PEMUDA PANCASILA', '', 'OTONG_TAHYA_MULYANA-2019_3210170004_1.png', 1226),
(139, '2019', '3210', '3210170', '3210170004', '2', 'AAN GANEA', '3210132807700001', 'MAJALENGKA', '1970-07-28', 'L', 'Islam', 'JATIRAGA BARAT RT/RW 02/02 KADIPATEN', NULL, 5, NULL, 88, '-', 'KEPALA DESA KADIPATEN 2012-2018 ', 'AAN_GANEA-2019_3210170004_2.png', 1383),
(141, '2019', '3210', '3210170', '3210170004', '1', 'EDI KURNAEDI', '3210130108680001', 'SUMEDANG', '1968-08-01', 'L', 'Islam', 'CANGKRING RT 03 RW 01 KADIPATEN', NULL, 5, NULL, 88, '-', '-', 'EDI_KURNAEDI-2019_3210170004_4.png', 1004),
(142, '2019', '3210', '3210170', '3210170004', '4', 'ROBY WAHYUDIN', '3210160111800041', 'MAJALENGKA', '1980-11-01', 'L', 'Islam', 'BLOK SAWALA RT 02 RW 12', NULL, 5, NULL, 88, '', '', 'ROBY_WAHYUDIN-2019_3210170004_5.png', 2344),
(144, '2019', '3210', '3210091', '3210091001', '2', 'SUTARMO', '3210252510730002', 'Majalengka', '1973-10-25', 'L', 'Islam', 'Blok Pon Rt.  003 Rw.  001 Desa Pasirayu Kecamatan Sindang Kabupaten Majalengka 45471', NULL, 5, NULL, 86, '-', '-', 'SUTARMO-2019_3210091001_1.jpg', 561),
(145, '2019', '3210', '3210170', '3210170005', '3', 'BUDI WAHYU DARMADI', '3210130104700021', 'MAJALENGKA', '1970-04-01', 'L', 'Islam', 'BLOK KAPALA RT 08 RW 02 BABAKANANYAR', NULL, 5, NULL, 88, 'KARANG TARUNA\r\nBPD\r\nPPS DESA BABAKANANYAR', '', 'BUDI_WAHYU_DARMADI-2019_3210170005_3.jpg', 688),
(146, '2019', '3210', '3210170', '3210170005', '1', 'OO MULYANA', '3275082404720035', 'MAJALENGKA', '1972-04-24', 'L', 'Islam', 'BLOK NGALAMBANG RT 09 RW 03 DESA BABAKANANYAR KECAMATAN KADIPATEN', NULL, 4, NULL, 15, 'OSIS\r\nPANWASCAM\r\nKARANG TARUNA', '', 'OO_MULYANA-2019_3210170005_2.png', 276),
(147, '2019', '3210', '3210170', '3210170005', '2', 'GINNA STEVIANY KUSUMAH', '3210135101800001', 'MAJALENGKA', '1980-01-11', 'P', 'Islam', 'BLOK RAKSABUMI RT 01 RW 01 DESA BABAKANANYAR KECAMATAN KADIPATEN', NULL, 5, NULL, 2, '-', '-', 'GINNA_STEVIANY_KUSUMAH-2019_3210170005_2.png', 73),
(148, '2019', '3210', '3210060', '3210060015', '2', 'JARUKI', '3210061506630261', 'Majalengka, 15-06-1963', '1963-06-15', 'L', 'Islam', 'BLOK SUKAMULYA RT 001 RW 001 DESA PANIIS KEC. MAJA KAB. MAJALENGKA', NULL, 5, NULL, 85, '', '', 'JARUKI-2019_3210060015_1.jpg', 1159),
(149, '2019', '3210', '3210060', '3210060015', '1', 'SALMON', '3210060907620041', 'Majalengka, 09-07-1962', '1962-07-09', 'L', 'Islam', 'BLOK SUKAMAJU RT 006 RW 003 DESA PANIIS KEC. MAJA KAB. MAJALENGKA', NULL, 5, NULL, 5, 'ANGGOTA BPD TAHUN 2007-2013', 'KEPALA DESA PANIIS TAHUN 2013-2019', 'SALMON-2019_3210060015_2.jpg', 1213),
(150, '2019', '3210', '3210060', '3210060017', '4', 'H. AON NURSOBAH', '3210060401780041', 'Majalengka, 04-01-1978', '1978-01-04', 'L', 'Islam', 'Blok Singajaya RT. 001 RW. 001 \r\nDesa Pageraji Kecamatan Maja ', NULL, 5, NULL, 15, '', '', 'H__AON_NURSOBAH-2019_3210060017_3.jpg', 232),
(151, '2019', '3210', '3210060', '3210060017', '2', 'RIDWANUDDIN', '3210060610620041', 'Majalengka, 06-10-1962', '1962-10-06', 'L', 'Islam', 'Blok Singajaya RT. 003 RW. 002\r\nDesa Pageraji Kecamatan Maja', NULL, 5, NULL, 88, 'Pernah menjadi Kepala Desa', '', 'RIDWANUDDIN-2019_3210060017_4.jpg', 75),
(153, '2019', '3210', '3210060', '3210060001', '2', 'DEDEH KURNIASIH', '32006510640001', 'Majalengka, 17-10-1964', '1964-10-17', 'P', 'Islam', 'Blok Mekarmulya RT.001 RW.004\r\nDesa Cihaur  Kecamatan Maja', NULL, 5, NULL, 2, '', '', 'DEDEH_KURNIASIH-2019_3210060001_2.jpg', 133),
(156, '2019', '3210', '3210170', '3210170004', '5', 'ASEP SOLIHIN', '3210131304760001', 'MAJALENGKA', '1976-04-13', 'L', 'Islam', 'BLOK CIKEMPAR RT 01 RW 05 DESA KADIPATEN', NULL, 5, NULL, 88, '', '', 'A_SOLIHIN-2019_3210170004_1.jpg', 40),
(158, '2019', '3210', '3210091', '3210091001', '1', 'NUNUNG NURIAH', '3210256705760001', 'Majalengka', '1976-05-27', 'P', 'Islam', 'Blok Pon Rt.  003 Rw. 001 Desa Pasirayu Kecamatan Sindang Kabupaten Majalengka 45471', NULL, 5, NULL, 2, '-', '-', 'NUNUNG_NURIAH-2019_3210091001_1.jpg', 149),
(159, '2019', '3210', '3210110', '3210110010', '1', 'DIDI SUHARDI', '3210212812820001', 'MAJALENGKA', '1982-12-28', 'L', 'Islam', 'BLOK SABTU RT. 012 RW 006 DESA BALAGEDOG KECAMATAN SINDANGWANGI KABUPATEN MAJALENGKA PROVINSI JAWA BARAT', NULL, 4, NULL, 86, '', '', 'DIDI_SUHARDI-2019_3210110010_1.jpg', 1961),
(160, '2019', '3210', '3210110', '3210110010', '2', 'SUPENDI', '3210213004740001', 'MAJALENGKA', '1974-04-30', 'L', 'Islam', 'BLOK SABTU RT. 012 RW. 006 DESA BALAGEDOG KECAMATAN SINDANGWANGI KABUPATEN MAJALENGKA PROVINSI JAWA BARAT', NULL, 5, NULL, 88, '', '', 'SUPENDI-2019_3210110010_2.jpg', 1296),
(162, '2019', '3210', '3210030', '3210030018', '2', 'ELOM KOMARIAH', '3210035512850001', 'MAJALENGKA', '1981-07-02', 'P', 'Islam', 'BLOK SUKARAOS RT. 005 RW. 003 DESA SUKAMUKTI', NULL, 4, NULL, 2, '-', '-', 'ELOM_KOMARIAH-2019_3210030018_2.jpg', 431),
(163, '2019', '3210', '3210020', '3210020010', '3', 'RIKI HERMAWAN', '3210061001840041', 'MAJALENGKA', '1984-01-10', 'L', 'Islam', 'Blok Parentah Rt  001 Rw 004  Desa Cipeundeuy', NULL, 5, NULL, 88, 'a. Ketua PMII\r\nb. Pemuda Pancasila\r\nc. KNPI', '-', 'RIKI_HERMAWAN-2019_3210020010_3.jpg', 366),
(164, '2019', '3210', '3210140', '3210140005', '3', 'ADE HERYANTO', '3210112609710061', 'Majalengka', '1971-09-26', 'L', 'Islam', 'Blok Ahad RT 001 RW 004  Desa Leuweunggede Kec. Jatiwangi', NULL, 5, NULL, 88, 'Apdesi', 'Incumbent', 'ADE_HERYANTO-2019_3210140005_1.jpg', 1851),
(165, '2019', '3210', '3210030', '3210030024', '1', 'Drs. KOSASIH AJID', '3210032911580001', 'MAJALENGKA', '1958-11-29', 'L', 'Islam', 'BLOK DESA RT. 012 RW. 006 DESA BAGJASARI', NULL, 8, NULL, 4, 'OSIS\r\nKARANGTARUNA', '-', 'DRS__KOSASIH_AJID-2019_3210030024_3.png', 557),
(166, '2019', '3210', '3210020', '3210020010', '2', 'MUHAMAD IKBAL', '3210021307880001', 'MAJALENGKA', '1988-07-13', 'L', 'Islam', 'Desa Cipeundeuy Rt 002 Rw 003 Desa Cipeundeuy Kecamatan Bantarujeg Kabupaten Majalengka.', NULL, 5, NULL, 88, '-', '-', 'MUHAMAD_IKBAL-2019_3210020010_2.JPG', 6),
(167, '2019', '3210', '3210140', '3210140005', '1', 'NATA', '3210112606540021', 'Majalengka', '1954-06-26', 'L', 'Islam', 'Blok Minggu RT 001 RW 004 Desa Leuweunggede Kec. Jatiwangi', NULL, 4, NULL, 4, '-', 'Mantan Kepala Desa Leuweunggede Tahun 2013', 'NATA-2019_3210140005_1.jpg', 302),
(168, '2019', '3210', '3210140', '3210140005', '2', 'DADAN ROSADA', '3210112303930101', 'Majalengka', '1993-03-23', 'L', 'Islam', 'Blok Ahad RT 001 RW 005 Desa Leuweunggede Kec. Jatiwangi', NULL, 5, NULL, 88, '-', '-', 'DADAN_ROSADA-2019_3210140005_1.jpg', 952),
(169, '2019', '3210', '3210100', '3210100011', '1', 'UDIN TAJUDIN', '3210091507620041', 'MAJALENGKA', '1962-07-15', 'L', 'Islam', 'BLOK D RT. 003 RW. 004 DESA/KELURAHAN RAJAGALUHLOR KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVISI JAWA BARAT\r\n\r\n', NULL, 5, NULL, 85, '', '', 'UDIN_TAJUDIN-2019_3210100011_1.jpg', 1005),
(170, '2019', '3210', '3210100', '3210100007', '2', 'FERY SUSANDI', '3210090809750041', 'MAJALENGKA', '1975-09-08', 'L', 'Islam', 'BLOK AHAD RT. 001 RW. 001 \r\nDESA/KELURAHAN KUMBUNG KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVINSI JAWA BARAT\r\n', NULL, 6, NULL, 86, '', '', 'FERY_SUSANDI-2019_3210100007_1.jpg', 236),
(171, '2019', '3210', '3210020', '3210020016', '1', 'AGUS BAHAGIA,SH', '3273241708580001', 'MAJALENGKA', '1958-08-17', 'L', 'Islam', 'Aspol Sukamiskin Blok B8 No8 Desa Sukamiskin Kecamatan Arcamanik Kota Bandung', NULL, 8, NULL, 4, '-', '-', 'AGUS_BAHAGIA_SH-2019_3210020016_1.jpg', 1282),
(174, '2019', '3210', '3210090', '3210090014', '1', 'KUSNADI', '3210081111640001', 'MAJALENGKA', '1964-10-11', 'L', 'Islam', 'BLOK I RT 001 RW 001  DESA CIKONENG KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 5, NULL, 86, '', '', 'KUSNADI-2019_3210090014_1.jpg', 1213),
(175, '2019', '3210', '3210090', '3210090014', '2', 'AGUS KUSWANDA', '3210080708900001', 'MAJALENGKA', '1990-08-07', 'L', 'Islam', 'BLOK I DESA CIKONENG KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'AGUS_KUSWANDA-2019_3210090014_1.jpg', 80),
(177, '2019', '3210', '3210090', '3210090019', '2', 'SETIA HERLAMBANG', '3210081708770040', 'MAJALENGKA', '1977-08-17', 'L', 'Islam', 'BLOK MANIS RT 001 RW 001 DESA JAYI KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'SETIA_HERLAMBANG-2019_3210090019_1.jpg', 767),
(178, '2019', '3210', '3210090', '3210090019', '1', 'WASTA', '3210081505630020', 'MAJALENGKA', '1963-06-15', 'L', 'Islam', 'RT 002 RW 001 DESA JAYI KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 4, NULL, 86, '', '', 'WASTA-2019_3210090019_1.jpg', 1163),
(179, '2019', '3210', '3210031', '3210031011', '1', 'DEDI HIDAYAT, S.Pd.I', '3210232407760021', 'Majalengka', '1976-07-24', 'L', 'Islam', 'Blok Karangsari RT.001 RW.002 Desa Muktisari Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 8, NULL, 18, '1. Ketua Pemuda Desa Muktisari\r\n2. Wakil Ketua Karang Taruna Desa Muktisari', '1. Pendamping Kader Posyandu\r\n2. TFL BSPS Kemetrian PUPR\r\n3. Instruktur Bahasa Jepang LPK PT. VVTEQ Corporation Jepang', 'DEDI_HIDAYAT__S_PD_I-2019_3210031011_1.jpg', 782),
(180, '2019', '3210', '3210031', '3210031011', '2', 'EBA', '3210231712620001', 'Majalengka', '1962-12-17', 'L', 'Islam', 'Blok Karangsari RT.002 RW.002 Desa Muktisari Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 8, NULL, 86, '1. BPD Desa Muktisari Tahun 1983 - 1987\r\n2. LKMD Desa Muktisari tahun 1998 - 2003  ', 'Guru Honorer SMP PUI Muktisari', 'EBA-2019_3210031011_1.jpg', 688),
(181, '2019', '3210', '3210031', '3210031003', '1', 'KAPIYUDIN', '3210232804640001', 'Majalengka', '1964-04-28', 'L', 'Islam', 'Blok Saradan RT.009 RW.005 Desa Cidadap Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 86, 'Ketua BPD Cidadap Tahun 1999 - 2002', '1. Kepala Desa Cidadap tahun 2002 - 2007\r\n2. Kepala Desa Cidadap tahun 2014 - sekarang', 'KAPIYUDIN-2019_3210031003_1.jpg', 856),
(182, '2019', '3210', '3210090', '3210090018', '1', 'TASRIP', '3210081706690081', 'MAJALENGKA', '1969-06-17', 'L', 'Islam', 'BLOK TARIKOLOT RT 001 RW 001 DESA TANJUNGSARI KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'TASRIP-2019_3210090018_1.jpg', 1055),
(183, '2019', '3210', '3210100', '3210100011', '4', 'ROHAENDI', '3210090604590001', 'MAJALENGKA', '1959-04-06', 'L', 'Islam', 'BLOK B RT. 003 RW. 002 \r\nDESA/KELURAHAN RAJAGALUH LOR KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVINSI JAWA BARAT', NULL, 5, NULL, 88, '', '', 'ROHAENDI-2019_3210100011_1.jpg', 88),
(184, '2019', '3210', '3210100', '3210100006', '2', 'NURKENDA', '3210092707680021', 'MAJALENGKA', '1968-07-27', 'L', 'Islam', 'BLOK TENGAH RT. 003 RW. 002 \r\nDESA/KELURAHAN SADOMAS KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVINSI JAWA BARAT', NULL, 4, NULL, 88, '', '', 'NURKENDA-2019_3210100006_1.JPG', 542),
(188, '2019', '3210', '3210030', '3210030025', '1', 'AHMAD JUANDA', '3210031306690001', 'MAJALENGKA', '1969-06-13', 'L', 'Islam', 'BLOK COLOM TONGGOH RT. 002 RW. 009 DESA JAGASARI', NULL, 5, NULL, 88, '-', '-', 'AHMAD_JUANDA-2019_3210030025_1.png', 1536),
(189, '2019', '3210', '3210030', '3210030025', '2', 'AGUS DEDI RAHMAT, S.Pd.I', '3210031208820121', 'MAJALENGKA', '1982-08-12', 'L', 'Islam', 'BLOK KALER RT. 002 RW. 003 DESA JAGASARI', NULL, 8, NULL, 88, '-', '-', 'AGUS_DEDI_RAHMAT__S_PD_I-2019_3210030025_2.png', 1368),
(190, '2019', '3210', '3210031', '3210031008', '1', 'BUDI SANTOSO', '3210230608820002', 'Majalengka', '1982-06-06', 'L', 'Islam', 'Blok Salasa RT.001 RW.001 Desa Cimanggugirang Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 85, '-', 'Perangkat Desa Cimanggugirang  dari tahun 2015 sampai dengan sekarang', 'BUDI_SANTOSO-2019_3210031008_1.jpg', 232),
(191, '2019', '3210', '3210031', '3210031008', '2', 'IMAN BADRUJAMAN', '3210230612750001', 'Majalengka', '1975-12-06', 'L', 'Islam', 'Blok Senen RT.002 RW.002 Desa Cimanggugirang Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 88, '1. Ketua Presidium Daerah Parade Nusantara Majalengka\r\n2. Kepala Desa Cimanggugirang tahun 2006-2012', '1. Staf PT. Fajar Tekhnik - Bandung\r\n2. Vendor Order PT. Biensie Fashiorindo', 'IMAN_BADRUJAMAN-2019_3210031008_1.jpg', 203),
(192, '2019', '3210', '3210140', '3210140016', '3', 'AGUS DJAUHAR ULUMUDIN, S.Sos.', '3210110503760121', 'Majalengka', '1976-03-05', 'L', 'Islam', 'Dusun 01 RT. 004 RW. 002 Desa Loji Kec. Jatiwangi', NULL, 8, NULL, 88, 'KNPI Kecamatan Jatiwangi', 'Mantan Kepala Desa Burujulkulon Tahun 2012 s. d.  2018', 'AGUS_DJAUHAR_ULUMUDIN__S_SOS_-2019_3210140016_1.jpg', 611),
(193, '2019', '3210', '3210140', '3210140016', '2', 'TURWIYATI, S.Pd.', '3210115508570001', 'Kuningan', '1957-08-15', 'P', 'Islam', 'Dusun 02 RT. 007 RW. 004 Desa Loji Kec. Jatiwangi', NULL, 8, NULL, 4, 'Anggota PGRI s.d Tahun 2017, Ketua HIMPAUDI Kec. Jatiwangi Th 2005-2012, FK PKBM Kab. Majalengka Th. 2015 s.d 2019', '-', 'TURWIYATI__S_PD_-2019_3210140016_1.jpg', 124),
(194, '2019', '3210', '3210210', '3210210001', '1', 'EDI SURYADI', '3210170508690001', 'MAJALENGKA', '1968-08-05', 'L', 'Islam', 'BLOK CURUG, RT. 001/004, DESA SUMBERJAYA, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'EDI_SURYADI-2019_3210210001_1.jpg', 1114),
(195, '2019', '3210', '3210210', '3210210001', '2', 'UNANG KURNIADI', '3210172311690001', 'MAJALENGKA', '1969-11-23', 'L', 'Islam', 'BLOK DUKUH LUHUR, RT. 001/001, DESA SUMBERJAYA, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 8, NULL, 15, 'KEPALA DESA', '-', 'UNANG_KURNIADI-2019_3210210001_2.jpg', 1709),
(196, '2019', '3210', '3210031', '3210031001', '2', 'AJID, S.Ag.', '3210230405760002', 'Majalengka', '1976-05-04', 'L', 'Islam', 'Blok Kroncongsari RT.010 RW.005 Desa Sedaraja Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 8, NULL, 86, '-', '-', 'AJID__S_AG_-2019_3210031001_1.jpg', 604),
(197, '2019', '3210', '3210031', '3210031001', '1', 'RAHMAT ', '3210230107790443', 'Majalengka', '1979-07-01', 'L', 'Islam', 'Blok Intisari RT.003 RW.002 Desa Sedaraja Kecamatan Cingambul Kabupaten Majalengka Provinsi Jawa Barat Kode Pos 45467', NULL, 5, NULL, 88, '-', '-', 'RAHMAT_KARYADI-2019_3210031001_1.jpg', 8),
(198, '2019', '3210', '3210021', '3210021003', '1', 'ADING SETIADIN, S.AG', '3210020907710061', 'MAJALENGKA', '1971-07-09', 'L', 'Islam', 'BLOK SINDANGLAMA RT. 001 RW. 005 DESA MALAUSMA KECAMATAN MALAUSMA', NULL, 8, NULL, 86, 'KEPALA DESA MALAUSMA SELAMA 2 PERIODE', '', 'ADING_SETIADIN__S_AG-2019_3210021003_1.jpg', 3430),
(199, '2019', '3210', '3210021', '3210021003', '2', 'NIA TIMTIM FATIMAH', '3210026211890021', 'MAJALENGKA', '1985-03-02', 'P', 'Islam', 'DUSUN SINDANGLAMA RT. 001 RW. 005 DESA MALAUSMA KECAMATAN MALAUSMA', NULL, 4, NULL, 2, 'PKK DESA MALAUSMA SELAMA 2 PERIODE', '', 'NIA_TIMTIM_FATIMAH-2019_3210021003_1.jpg', 140),
(200, '2019', '3210', '3210070', '3210070003', '3', 'AFING FAOZA', '', 'MAJALENGKA', '1975-03-19', 'L', 'Islam', 'BLOK SAPTU', NULL, 5, NULL, 88, '', '', 'AFING_FAOZA-2019_3210070003_1.jpg', 216),
(202, '2019', '3210', '3210210', '3210210015', '5', 'BAMBANG WINOTO', '3210172009780081', 'MAJALENGKA', '1078-09-20', 'L', 'Islam', 'BLOK TENGAH, RT. 001/002, DESA PANCAKSUJI, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 85, 'PEMERINTAHAN', 'KASI PEMERINTAHAN', 'BAMBANG_WINOTO-2019_3210210015_5.jpg', 482),
(203, '2019', '3210', '3210130', '3210130008', '2', 'RUDI RUHYADI', '3275031406740014', 'MAJALENGKA', '1974-06-14', 'L', 'Islam', 'DUSUN MARGAJAYA RT.002 RW.002 DESA PASIR KECAMATAN PALASAH', NULL, 5, NULL, 88, '', '', 'RUDI_RUHYADI-2019_3210130008_2.png', 837),
(204, '2019', '3210', '3210070', '3210070014', '3', 'WANIN', '', 'MAJALENGKA', '1970-09-18', 'L', 'Islam', 'BLOK CURUG RT 02 RW 07', NULL, 4, NULL, 88, 'KETUA DKM AL FARUQ BLOK CURUG', '1. KADUS CURUG TAHUN 2014-2015', 'WANIN-2019_3210070014_1.png', 847),
(205, '2019', '3210', '3210210', '3210210015', '3', 'DEDE BUDI SETIAWAN', '3210170104650001', 'MAJALENGKA', '1965-04-01', 'L', 'Islam', 'BLOK KIDUL, RT. 004/001, DESA PANCAKSUJI, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'DEDE_BUDI_SETIAWAN-2019_3210210015_3.jpg', 120),
(207, '2019', '3210', '3210210', '3210210015', '2', 'ADE KUSUMAH', '3210170412670001', 'MAJALENGKA', '1966-12-04', 'L', 'Islam', 'BLOK KALER, RT. 001/003, DESA PANCAKSUJI, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'ADE_KUSUMAH-2019_3210210015_2.jpg', 101),
(208, '2019', '3210', '3210130', '3210130013', '2', 'ERI JAERI', '3210192711720021', 'MAJALENGKA', '1972-11-27', 'L', 'Islam', 'DUSUN MAJAMULIA RT.004 RW.002 DESA MAJASUKA KECAMATAN PALASAH', NULL, 5, NULL, 86, '', '', 'ERI_JAERI-2019_3210130013_2.png', 610),
(209, '2019', '3210', '3210210', '3210210015', '1', 'YUYUM RUMINI', '3210175005780001', 'MAJALENGKA', '1978-05-10', 'P', 'Islam', 'BLOK KIDUL, RT. 003/001, DESA PANCAKSUJI, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 8, NULL, 2, 'KADER POSYANDU', '-', 'YUYUM_RUMINI-2019_3210210015_1.jpg', 190),
(210, '2019', '3210', '3210070', '3210070014', '1', 'HERLINAH', '', 'BOGOR', '1972-05-04', 'P', 'Islam', 'BLOK BUAH LEGA RT 01 RW 02', NULL, 5, NULL, 85, '1. Anggota LKM tahun 2006 - 2014\r\n2. Ketua UPK Kotaku tahun 2015 s/d Sekarang', 'Sebagai Perangkat Desa Sidanukti dari tahun 2004 s/d sekarang', 'HERLINAH-2019_3210070014_1.png', 384),
(211, '2019', '3210', '3210070', '3210070014', '2', 'KARWAN', '3210070809750001', 'MAJALENGKA', '1976-09-08', 'L', 'Islam', 'BLOK BABAKAN CIANDEU RT 01 RW 11', NULL, 4, NULL, 86, 'Ketua Karang Taruna ', 'Kepala Desa Tahun 2014 s/d Sekarang', 'KARWAN-2019_3210070014_1.png', 1256),
(212, '2019', '3210', '3210210', '3210210015', '4', 'DEDE ROMANSYAH', '3210171411880001', 'MAJALENGKA', '1988-11-14', 'L', 'Islam', 'BLOK KALER, RT. 001/003, DESA PANCAKSUJI, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 8, NULL, 15, '-', '-', 'DEDE_ROMANSYAH-2019_3210210015_4.jpg', 269),
(213, '2019', '3210', '3210210', '3210210002', '1', 'BAMBANG RUHENDI', '3210172506800101', 'CIREBON', '1980-06-25', 'L', 'Islam', 'BLOK KAMUNING KALER, RT. 004/006, DESA GARAWANGI, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 85, 'PEMERINTAHAN', 'SERETARIS DESA', 'BAMBANG_RUHENDI-2019_3210210002_1.jpg', 1239),
(214, '2019', '3210', '3210210', '3210210002', '3', 'AGUS SETIAWAN', '3210171312710061', 'MAJALENGKA', '1970-06-11', 'L', 'Islam', 'BLOK SENIN, RT. 001/003, DESA GARAWANGI, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 84, '-', '-', 'AGUS_SETIAWAN-2019_3210210002_2.jpg', 1296),
(215, '2019', '3210', '3210210', '3210210002', '2', 'RASIM', '3210171806660001', 'MAJALENGKA', '1966-06-18', 'L', 'Islam', 'BLOK PAJAGAN, RT. 002/006, DESA GARAWANGI, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'RASIM-2019_3210210002_3.jpg', 856),
(216, '2019', '3210', '3210210', '3210210012', '3', 'KARSONO', '3210172607650003', 'MAJALENGKA', '1965-07-26', 'L', 'Islam', 'BLOK SELASA, RT. 002/002, DESA CIDENOK, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 88, 'PEMERINTAHAN', 'MANTAN KEPALA DESA', 'KARSONO-2019_3210210012_3.jpg', 686),
(217, '2019', '3210', '3210210', '3210210012', '2', 'MAMAN SUPARMAN', '3210170206770041', 'MAJALENGKA', '1978-06-02', 'L', 'Islam', 'BLOK RABU, RT. 002/003, DESA CIDENOK, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'MAMAN_SUPARMAN-2019_3210210012_2.jpg', 827),
(218, '2019', '3210', '3210210', '3210210012', '1', 'YOS SUDARSONO', '3210171510620021', 'MAJALENGKA', '1962-08-07', 'L', 'Islam', 'BLOK KAMIS, RT. 002/004, DESA CIDENOK, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 4, '-', 'SCURITY  BUMN', 'YOS_SUDARSONO-2019_3210210012_1.jpg', 737),
(219, '2019', '3210', '3210210', '3210210008', '2', 'ELI  HERAWATI', '3210174304740021', 'MAJALENGKA', '1973-04-03', 'P', 'Islam', 'BLOK SENTRA, RT. 002/002, DESA RANCAPUTAT, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 2, '-', '-', 'ELI__HERAWATI-2019_3210210008_2.jpg', 983),
(220, '2019', '3210', '3210210', '3210210008', '1', 'DEDI KUSNADI', '3210171603610001', 'MAJALENGKA', '1961-03-16', 'L', 'Islam', 'BLOK SATU, RT. 001/001, DESA RANCAPUTAT, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 86, 'PEMERINTAHAN', '-', 'DEDI_KUSNADI-2019_3210210008_1.jpg', 451),
(221, '2019', '3210', '3210210', '3210210008', '3', 'PARID FAHRUROJI', '3210171611780001', 'MAJALENGKA', '1978-11-16', 'L', 'Islam', 'BLOK SATU, RT. 001/001, DESA RANCAPUTAT, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'PARID_FAHRUROJI-2019_3210210008_3.JPG', 56),
(222, '2019', '3210', '3210210', '3210210010', '3', 'ABDUL JAELANI', '3210171303700001', 'MAJALENGKA', '1970-03-13', 'L', 'Islam', 'BLOK CILIGUR, RT. 001/003, DESA BONGAS KULON, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 5, NULL, 88, 'PEMERINTAHAN', '-', 'ABDUL_JAELANI-2019_3210210010_3.jpg', 1238),
(223, '2019', '3210', '3210210', '3210210010', '1', 'CUSI SETIAWATI', '3210176402760021', 'CILEGON', '1976-02-24', 'P', 'Islam', 'BLOK SABTU, RT. 007/001, DESA BONGAS KULON, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 8, NULL, 65, '-', '-', 'CUSI_SETIAWATI-2019_3210210010_1.jpg', 898);
INSERT INTO `tbl_calon` (`id`, `thn_pemilihan`, `kdkab`, `kdkec`, `kddesa`, `nourut`, `nama`, `nik`, `tmp_lahir`, `tgl_lahir`, `kelamin`, `agama`, `alamat1`, `alamat2`, `id_pendidikan`, `pendidikan`, `id_pekerjaan`, `organisasi`, `keterangan`, `photo`, `s_hasil`) VALUES
(224, '2019', '3210', '3210210', '3210210010', '2', 'RICHI APRILIAN EDWINA', '3210171604830001', 'MAJALENGKA', '1983-04-16', 'L', 'Islam', 'BLOK SABTU, RT. 007/001, DESA BONGAS KULON, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 8, NULL, 18, '-', '-', 'RICHI_APRILIAN_EDWINA-2019_3210210010_2.jpg', 244),
(225, '2019', '3210', '3210021', '3210021011', '1', 'DADAN HENDRA GUNAWAN', '3210260809790041', 'MAJALENGKA', '1979-09-18', 'L', 'Islam', 'DUSUN BABAKAN RT. 001 RW. 001 DESA KRAMATJAYA KECAMATAN MALAUSMA ', NULL, 5, NULL, 88, '', '', 'DADAN_HENDRA_GUNAWAN-2019_3210021011_1.JPG', 113),
(228, '2019', '3210', '3210090', '3210090010', '1', 'UDI RUSWADI', '3210082404560001', 'MAJALENGKA', '1956-04-24', 'L', 'Islam', 'BLOK KAMIS RT 005 RW 005 DESA PADAHANTEN KECAMATAN SUKAHAJI KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, 'KETUA PAC PDIP KECAMATAN SUKAHAJI TAHUN 1989-2009', '', 'UDI_RUSWADI-2019_3210090010_1.jpg', 333),
(229, '2019', '3210', '3210200', '3210200018', '2', 'INDAH YUNIAR PURNAMAWATI', '3210164606740001', 'MOJOKERTO', '1974-06-06', 'P', 'Islam', 'BLOK LEUWIMALIS RT.002 RW.001\r\nDESA LEUWILIANG BARU KECAMATAN LIGUNG KABUPATEN MAJALENGKA.', NULL, 8, NULL, 5, '', '', 'INDAH_YUNIAR_PURNAMAWATI-2019_3210200018_1.JPG', 213),
(231, '2019', '3210', '3210200', '3210200018', '1', 'ACENG DARMAJI', '3210162810730001', 'MAJALENGKA', '1973-10-28', 'L', 'Islam', 'BLOK LEUWIMALIS RT.002 RW.001\r\nDESA LEUWILIANG BARU KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 86, '', 'INCAMBEN', 'ACENG_DARMAJI-2019_3210200018_1.JPG', 962),
(232, '2019', '3210', '3210200', '3210200002', '1', 'CAHYONO', '3210161008880141', 'MAJALENGKA', '1988-08-10', 'L', 'Islam', 'DUSUN KERTALAYA RT.002 RW.003\r\nDESA KERTASARI KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'CAHYONO-2019_3210200002_1.jpg', 1156),
(234, '2019', '3210', '3210200', '3210200002', '2', 'AGUS SETIAWAN', '3210161708750021', 'MAJALENGKA', '1975-08-17', 'L', 'Islam', 'DUSUN KALIJAYA RT.005 RW.005\r\nDESA KERTASARI KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'AGUS_SETIAWAN-2019_3210200002_1.JPG', 786),
(235, '2019', '3210', '3210200', '3210200002', '3', 'KOMALAWATI', '3210164503760001', 'MAJALENGKA', '1976-03-05', 'P', 'Islam', 'DUSUN KERTALAYA RT.004 RW.002\r\nDESA KERTASARI KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 4, NULL, 2, '', '', 'KOMALAWATI-2019_3210200002_1.jpg', 500),
(239, '2019', '3210', '3210200', '3210200008', '3', 'HERIJUDIN', '3210160401800021', 'MAJALENGKA', '1980-01-04', 'L', 'Islam', 'BLOK KAMIS RT.005 RW.003\r\nDESA WANASALAM KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'HERIJUDIN-2019_3210200008_1.jpg', 571),
(241, '2019', '3210', '3210200', '3210200008', '1', 'CECEP CASMITA', '3210160201790061', 'MAJALENGKA', '1979-01-02', 'L', 'Islam', 'BLOK KAMIS RT.005 RW.003\r\nDESA WANASALAM KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 86, '', 'INCUMBEN', 'CECEP_CASMITA-2019_3210200008_1.jpg', 507),
(242, '2019', '3210', '3210200', '3210200008', '2', 'APAN SUTARPAN', '3210160401770001', 'MAJALENGKA', '1977-01-04', 'L', 'Islam', 'BLOK SENIN RT.002 RW.001\r\nDESA WANASALAM KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'APAN_SUTARPAN-2019_3210200008_1.jpg', 927),
(243, '2019', '3210', '3210200', '3210200004', '1', 'AGUS', '3210160103710001', 'MAJALENGKA', '1971-03-01', 'L', 'Islam', 'BLOK SAPTU TR.002 RW.001\r\nDESA BEUSI KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 85, '', '', 'AGUS-2019_3210200004_1.jpg', 1251),
(244, '2019', '3210', '3210200', '3210200004', '4', 'EMAN SOLEMAN', '3210160503730041', 'MAJALENGKA', '1973-03-05', 'L', 'Islam', 'BLOK KEMIS RT.001 RW.003\r\nDESA BEUSI KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'EMAN_SOLEMAN-2019_3210200004_1.jpg', 149),
(245, '2019', '3210', '3210200', '3210200004', '3', 'UUS USMAN', '3210161003720021', 'MAJALENGKA', '1972-03-10', 'L', 'Islam', 'BLOK JUM\'AT RT.002 RW.002\r\nDESA BEUSI KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'UUS_USMAN-2019_3210200004_1.jpg', 1677),
(247, '2019', '3210', '3210041', '3210041002', '1', 'ANDI ABDUROHMAN', '3210220707910041', 'Majalengka', '1991-07-07', 'L', 'Islam', 'Desa Hegarmanah', NULL, 8, NULL, 88, '', '', 'ANDI_ABDUROHMAN-2019_3210041002_2.jpg', 520),
(250, '2019', '3210', '3210041', '3210041005', '1', 'DADAN SUKMANA', '3210221609850021', 'Majalengka', '1985-09-16', 'L', 'Islam', 'Desa Suniabaru', NULL, 5, NULL, 88, '', '', 'DADAN_SUKMANA-2019_3210041005_1.jpg', 1543),
(252, '2019', '3210', '3210210', '3210210014', '1', 'WAWAN SUTIAWAN', '3210171111750001', 'MAJALENGKA', '1975-11-11', 'L', 'Islam', 'BLOK GELOK, RT. 004/001, DESA GELOK MULYA, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 4, NULL, 88, 'PEMERINTAHAN', 'KEPALA DESA', 'WAWAN_SUTIAWAN-2019_3210210014_1.JPG', 591),
(254, '2019', '3210', '3210210', '3210210014', '2', 'EDI KURNIAWAN', '3210172401840001', 'MAJALENGKA', '1984-01-24', 'L', 'Islam', 'BLOK NEBLO, RT. 002/002, DESA GELOK MULYA, KEC. SUMBERJAYA, KAB. MAJALENGKA', NULL, 8, NULL, 88, '-', '-', 'EDI_KURNIAWAN-2019_3210210014_2.jpg', 707),
(255, '2019', '3210', '3210151', '3210151006', '1', 'H. SAEFUL IMAM', '3210121505730142', 'MAJALENGKA,', '1973-05-15', 'L', 'Islam', 'BLOK MINGGU RT. 002 RW. 005 DESA RANJIWETAN', NULL, 5, NULL, 15, '', 'INCUMBENT', 'H__SAEFUL_IMAM-2019_3210151006_1.jpg', 2747),
(256, '2019', '3210', '3210010', '3210010007', '3', 'JEJE SUDRAJAT', '6105010212710001', 'MAJALENGKA/17 MARET 1972', '1972-03-17', 'L', 'Islam', 'MANANTI RT 08 RW 08 DESA MARGAJAYA', NULL, 4, NULL, 88, '', '', 'JEJE_SUDRAJAT-2019_3210010007_1.jpg', 1048),
(257, '2019', '3210', '3210010', '3210010007', '4', 'BABAN SUTISMAN', '3210013309650001', 'MAJALENGKA/30 SEPTEMBER 1965', '1965-09-30', 'L', 'Islam', 'RT 04 RW 06 BLOK MANANTI DESA MARGAJAYA', NULL, 4, NULL, 88, '', '', 'BABAN_SUTISMAN-2019_3210010007_1.jpg', 391),
(258, '2019', '3210', '3210041', '3210041006', '2', 'HASANUDIN', '3210221506900001', 'Majalengka', '1991-03-16', 'L', 'Islam', 'Desa Sangiang', NULL, 4, NULL, 9, '', '', 'HASANUDIN-2019_3210041006_2.jpg', 188),
(259, '2019', '3210', '3210010', '3210010007', '1', 'APUDIN, S.Pd', '3210011006600061', 'MAJALENGKA/10 JUNI 1960', '1960-06-10', 'L', 'Islam', 'RT 04 RW 01 BLOK CIBULAKAN DESA MARGAJAYA', NULL, 8, NULL, 5, '', '', 'APUDIN__S_PD-2019_3210010007_1.jpg', 269),
(260, '2019', '3210', '3210010', '3210010007', '2', 'KALSA RUSWANDA', '3210010309590001', 'MAJALENGKA/3 SEPTEMBER 1959', '1959-09-03', 'L', 'Islam', 'RT 02 RW 01 BLOK CIBULAKAN DESA MARGAJAYA', NULL, 6, NULL, 4, '', '', 'KALSA_RUSWANDA-2019_3210010007_1.jpg', 578),
(261, '2019', '3210', '3210140', '3210140016', '4', 'SUPRIYONO', '3210113009630001', 'Blora', '1963-09-30', 'L', 'Islam', 'Dusun 03 RT. 011 RW. 006 Desa Loji Kec. Jatiwangi', NULL, 5, NULL, 4, 'Senat OSIS', '-', 'SUPRIYONO-2019_3210140016_1.jpg', 1658),
(262, '2019', '3210', '3210140', '3210140016', '1', 'ALI BASUNI', '3212240912630001', 'Majalengka', '1963-12-09', 'L', 'Islam', 'Dusun 02 RT.005 RW.003 Desa Loji Kec. Jatiwangi', NULL, 5, NULL, 15, 'Sekretaris Umum OSIS,    Pemuda Patra Lap. Cemara', '-', 'ALI_BASUNI-2019_3210140016_1.jpg', 345),
(266, '2019', '3210', '3210010', '3210010008', '2', 'AGUS SUBHAN MULYANA', '3210011008700041', 'MAJALENGKA/10 AGUSTUS 1970', '1970-08-10', 'L', 'Islam', 'BLOK REBO RT 005 RW 002 DESA KALAPADUA', NULL, 5, NULL, 85, '', '', 'AGUS_SUBHAN_MULYANA-2019_3210010008_1.jpg', 518),
(267, '2019', '3210', '3210151', '3210151006', '2', 'NUNUNG NURAENI', '3210125401770081', 'MAJALENGKA', '1977-01-14', 'P', 'Islam', 'BLOK RABU RT. 005 RW. 006 DESA RANJIWETAN', NULL, 5, NULL, 32, '', '', 'NUNUNG_NURAENI-2019_3210151006_1.jpg', 1589),
(268, '2019', '3210', '3210010', '3210010008', '3', 'NANANG NIRWANA', '3210010405640041', 'MAJALENGKA/4 MEI 1964', '1964-05-04', 'L', 'Islam', 'BLOK SENEN RT 010 RW 003 DESA KALAPADUA', NULL, 5, NULL, 85, '', '', 'NANANG_NIRWANA-2019_3210010008_1.jpg', 604),
(270, '2019', '3210', '3210010', '3210010008', '5', 'DEDI KURNIADI', '3210010711630081', 'MAJALENGKA/7 NOVEMBER 1963', '1963-11-07', 'L', 'Islam', 'BLOK SENEN RT 009 RW 003', NULL, 4, NULL, 86, '', '', 'DEDI_KURNIADI-2019_3210010008_1.jpg', 583),
(271, '2019', '3210', '3210010', '3210010008', '4', 'NURYADIN', '3210010507790041', 'MAJALENGKA/5 JULI 1979 ', '1979-07-05', 'L', 'Islam', 'BLOK MINGGU RT011 RW 003 DESA KALAPADUA', NULL, 4, NULL, 8, '', '', 'NURYADIN-2019_3210010008_1.JPG', 84),
(272, '2019', '3210', '3210010', '3210010008', '1', 'JAENAL ASIKIN E, S.Pd', '3210012709540021', 'MAJALENGKA/27 SEPTEMBER 1954', '1954-09-27', 'L', 'Islam', 'BLOK KEMIS RT 001 RW 001 DESA KALAPADUA', NULL, 8, NULL, 4, '', '', 'JAENAL_ASIKIN_E__S_PD-2019_3210010008_1.jpg', 134),
(273, '2019', '3210', '3210151', '3210151010', '1', 'BUDIMAN', '3210241309670021', 'MAJALENGKA', '1967-09-13', 'L', 'Islam', 'BLOK MAWARSARI I RT. 001 RW. 003 DESA GANDASARI', NULL, 5, NULL, 88, '', '', 'BUDIMAN-2019_3210151010_1.jpg', 621),
(274, '2019', '3210', '3210151', '3210151010', '3', 'TATANG WIHARNA YUDA', '3210120610650001', 'MAJALENGKA', '1965-10-06', 'L', 'Kristen', 'BLOK MAWARSARI II RT. 002 RW. 004 DESA GANDASARI', NULL, 5, NULL, 88, '', '', 'TATANG_WIHARNA_YUDA-2019_3210151010_3.jpg', 671),
(275, '2019', '3210', '3210010', '3210010017', '1', 'SLAMET, A.Ma.Pd', '3210012108620001', 'KUNINGAN/21 AGUSTUS 1962', '1962-08-21', 'L', 'Islam', 'PANGGILINGAN KALER RT 003 RW 004 DESA LEMAHSUGIH', NULL, 7, NULL, 5, '', '', 'SLAMET__A_MA_PD-2019_3210010017_1.JPG', 489),
(276, '2019', '3210', '3210010', '3210010017', '3', 'DEDE SUDRAJAT', '3210010506680010', 'MAJALENGKA/5 JUNI 1968', '1968-06-05', 'L', 'Islam', 'DUSUN CIKUPA RT 003 RW 001 DESA LEMAHSUGIH', NULL, 5, NULL, 86, '', '', 'DEDE_SUDRAJAT-2019_3210010017_1.jpg', 661),
(277, '2019', '3210', '3210151', '3210151010', '2', 'AHMAD TAJUDIN', '3210120109700001', 'MAJALENGKA', '1970-09-01', 'L', 'Islam', 'BLOK MAWARSARI I RT. 001 RW. 003 DESA GANDASARI', NULL, 5, NULL, 86, '', 'INCUMBENT', 'AHMAD_TAJUDIN-2019_3210151010_1.jpg', 514),
(278, '2019', '3210', '3210010', '3210010017', '2', 'IYOS', '3210010401590001', 'MAJALENGKA/4 JANUARI 1959', '1959-01-04', 'L', 'Islam', 'DUSUN CIKUPA RT 004 RW 003 DESA LEMAHSUGIH', NULL, 8, NULL, 5, '', '', 'IYOS-2019_3210010017_1.jpg', 471),
(279, '2019', '3210', '3210151', '3210151004', '3', 'ISMAYANI, S.Pd.I', '3210124606730021', 'MAJALENGKA', '1973-06-06', 'P', 'Islam', 'BLOK BENDA ASIH RT. 001 RW. 006 DESA JATIMULYA', NULL, 8, NULL, 18, '', '', 'ISMAYANI__S_PD_I-2019_3210151004_1.jpg', 452),
(280, '2019', '3210', '3210151', '3210151004', '2', 'ROSADI', '3210241301780001', 'MAJALENGKA', '1978-01-13', 'L', 'Islam', 'BLOK LEUWIOROK RT. 003 RW. 001 DESA JATIMULYA', NULL, 5, NULL, 85, '', '', 'ROSADI-2019_3210151004_1.jpg', 1012),
(281, '2019', '3210', '3210151', '3210151004', '1', 'AHMAD BAEDOWI, S.Pd.', '3210122210840061', 'MAJALENGKA', '1984-10-22', 'L', 'Islam', 'BLOK JATISEMA RT. 001 RW. 004 DESA JATIMULYA', NULL, 8, NULL, 65, '', '', 'AHMAD_BAEDOWI__S_PD_-2019_3210151004_1.jpg', 789),
(282, '2019', '3210', '3210151', '3210151004', '5', 'ADE SAEFUL ROHMAT', '3210122707720001', 'MAJALENGKA', '1972-07-27', 'L', 'Islam', 'BLOK BODAS RT. 002 RW. 008 DESA JATIMULYA', NULL, 5, NULL, 85, '', '', 'ADE_SAEFUL_ROHMAT-2019_3210151004_1.jpg', 649),
(283, '2019', '3210', '3210151', '3210151004', '4', 'MULYADI', '3210122406650041', 'MAJALENGKA', '1965-06-24', 'L', 'Islam', 'BLOK BENDA ASIH RT. 002 RW. 006 DESA JATIMULYA', NULL, 5, NULL, 88, '', '', 'MULYADI-2019_3210151004_1.jpg', 222),
(284, '2019', '3210', '3210140', '3210140012', '3', 'YUYUM SRI RUMSARI', '3210116712630001', 'Majalengka', '1963-12-27', 'P', 'Islam', 'Blok Pon RT 002 RW 003 Desa Surawangi \r\nKec.  Jatiwangi', NULL, 5, NULL, 32, 'FKPPI,   PNPM , Anggota LPM', 'Incumbent', 'YUYUM_SRI_RUMSARI-2019_3210140012_1.jpg', 370),
(285, '2019', '3210', '3210140', '3210140012', '2', 'ADNAN RATAM BASHARA', '3210111504840061', 'Majalengka', '1984-04-15', 'L', 'Islam', 'Dusun Pahing RT 002 RW 002 Desa Surawangi  Kec. Jatiwangi\r\n', NULL, 5, NULL, 88, 'PBI (Pelestarian Burung Indonesia),  PORKI wilayah Cirebon,  PSM Majalengka', '-', 'ADNAN_RATAM_BASHARA-2019_3210140012_1.jpg', 1510),
(286, '2019', '3210', '3210140', '3210140012', '1', 'CECEP KARNAYA', '3210111502940022', 'Majalengka', '1994-02-15', 'L', 'Islam', 'Dusun Wage RT 003 RW 004 Desa Surawangi Kec. Jatiwangi', NULL, 5, NULL, 85, '-', '-', 'CECEP_KARNAYA-2019_3210140012_1.jpg', 1261),
(287, '2019', '3210', '3210151', '3210151002', '1', 'YAYA NURYADI', '3210240908700001', 'MAJALENGKA', '1970-08-09', 'L', 'Islam', 'BLOK V RT. 002 RW. 002 DESA LEUWIKIDANG', NULL, 5, NULL, 88, '', '', 'YAYA_NURYADI-2019_3210151002_1.jpg', 1943),
(288, '2019', '3210', '3210151', '3210151002', '2', 'H. ERWAN RAHMAWAN, SH.', '3210242212620021', 'MALANG', '1962-12-22', 'L', 'Islam', 'LEUWIKIDANG RT. 001 RW. 006 DESA LEUWIKIDANG', NULL, 8, NULL, 5, '', 'INCUMBENT', 'H__ERWAN_RAHMAWAN__SH_-2019_3210151002_1.jpg', 1017),
(291, '2019', '3210', '3210010', '3210010019', '2', 'SAEHUDIN, S.Pd.I', '3210010402690001', 'MAJALENGKA/4 FEBRUARI 1969', '1969-02-04', 'L', 'Islam', 'BLOK CISIMPUR RT 004 RW 002 DESA CISALAK', NULL, 8, NULL, 18, '', '', 'SAEHUDIN__S_PD_I-2019_3210010019_1.jpg', 974),
(292, '2019', '3210', '3210010', '3210010015', '3', 'UDIN', '321001309530001', 'MAJALENGKA/13 SEPTEMBER 1951', '1951-09-13', 'L', 'Islam', 'RT 003 RW 001 DESA MEKARWANGI', NULL, 5, NULL, 88, '', '', 'UDIN-2019_3210010015_1.jpg', 109),
(293, '2019', '3210', '3210010', '3210010015', '1', 'OTONG USMAN', '3210012503720021', 'MAJALENGKA/25 MARET 1972', '1972-03-25', 'L', 'Islam', 'SADAWANGI LANDEUH RT 009 RW 003 DESA MEKARWANGI', NULL, 4, NULL, 88, '', '', 'OTONG_USMAN-2019_3210010015_1.jpg', 333),
(294, '2019', '3210', '3210010', '3210010015', '4', 'JEJEN JAENAL MUTAQIN', '3210010701820001', 'MAJALENGKA/7 JANUARI 1982', '1982-01-07', 'L', 'Islam', 'PASIR JENGKOL RT 001 RW 004 DESA MEKARWANGI', NULL, 5, NULL, 88, '', '', 'JEJEN_JAENAL_MUTAQIN-2019_3210010015_1.jpg', 889),
(295, '2019', '3210', '3210010', '3210010015', '5', 'ASKO SUGIANTO', '3210011706610001', 'MAJALENGKA/17 JUNI 1961', '1961-06-17', 'L', 'Islam', 'MEKARWANGI RT 004 RW 002 DESA MEKARWANGI', NULL, 5, NULL, 88, '', '', 'ASKO_SUGIANTO-2019_3210010015_1.jpg', 687),
(296, '2019', '3210', '3210010', '3210010015', '2', 'MUMU SARIP HIDAYATULOH', '3210011708680101', 'MAJALENGKA/17 AGUSTUS 1968', '1968-08-17', 'L', 'Islam', 'MEKARWANGI RT 005 RW 001 DESA MEKARWANGI', NULL, 4, NULL, 88, '', '', 'MUMU_SARIP_HIDAYATULOH-2019_3210010015_1.JPG', 317),
(297, '2019', '3210', '3210150', '3210150014', '1', 'H.M SUMARNO', '3210120302650001', 'MAJALENGKA', '1965-02-03', 'L', 'Islam', 'BLOK MINGGU RT 003 RW 003', NULL, 4, NULL, 88, 'KETUA AMS (ANGKATAN MUDA SILIWANGI) KECAMATAN DATAWUAN TAHUN 2002-2006\r\nKETUA PEMUDA PANCASILA KECAMTAN DAWUAN TAHUN 2015-SEKARANG', '', 'H_M_SUMARNO-2019_3210150014_1.jpg', 1502),
(299, '2019', '3210', '3210150', '3210150012', '5', 'KOMARUDIN', '3210122512690021', 'MAJALENGKA', '1969-12-25', 'L', 'Islam', 'PERUM BUMI SAWALA BARU RT02 RW 07 DESA DAWUAN KECAMATAN ', NULL, 5, NULL, 88, '', '', 'KOMARUDIN-2019_3210150012_1.jpg', 623),
(300, '2019', '3210', '3210150', '3210150012', '2', 'A ROHIMAN BAEHAKI.S.SY', '321012130592001', 'MAJALENGKA', '1992-05-13', 'L', 'Islam', 'BLOK JOMBOL, RT 01 RW 02', NULL, 8, NULL, 88, 'PMII\r\nBADAN EKSEKUTIF MAHASISWA (BEM)\r\nKARANG TARUNA KABUPATEN MAJALENGKA\r\nLIGANTARA', '', 'A_ROHIMAN_BAEHAKI_S_SY-2019_3210150012_1.jpg', 1077),
(301, '2019', '3210', '3210150', '3210150012', '4', 'SAMSUL ARIF HIDAYAT, S.Pdi', '3210121802850041', 'MAJALENGKA', '1985-02-18', 'L', 'Islam', 'JL PESANTREN RT 01 RW 02 DESA DAWUAN KECAMATAN DAWUAN', NULL, 8, NULL, 88, 'KETUA SENAT FAI UNIVERSITAS MAJALENGKA TAHUN 2010-2011\r\nKETUA KARANG TARUNA DESA DAWUAN TAHUN  2012-2015', '', 'SAMSUL_ARIF_HIDAYAT__S_PDI-2019_3210150012_1.jpg', 309),
(302, '2019', '3210', '3210150', '3210150012', '3', 'OTONG RAHMAT HIDAYAT S.HUT', '3210121403750061', 'MAJALENGKA', '1975-03-14', 'L', 'Islam', 'JL DESA DAWUAN  RT 01 RW 02 KECAMATAN DAWUAN', NULL, 8, NULL, 88, 'ANGGOTA BPD DESA DAWUAN TAHUN 2010-2014 \r\nANGGOTA PPS TAHUN 2017-2018\r\nSEKRETARIS DKM MASJID AL ITIHAD 2019', '', 'OTONG_RAHMAT_HIDAYAT_S_HUT-2019_3210150012_1.jpg', 84),
(303, '2019', '3210', '3210150', '3210150012', '1', 'DEDI MARSADI', '3210122406650061', 'MAJALENGKA', '1965-06-24', 'L', 'Islam', 'BLOK JOMBOL RT 04 RW 06 KECAMATAN DAWUAN', NULL, 8, NULL, 88, 'KETUA KELOMPOK TANI TAHUN 2012 \r\nKETUA DKM MASJID MIFTAHUL HUDA SAMPAI 2015\r\nKETUA PPS PILEG 2017 \r\nPENGURUS GAPOKTAN', '', 'DEDI_MARSADI-2019_3210150012_1.jpg', 394),
(309, '2019', '3210', '3210050', '3210050006', '1', 'ROSIDIN', '3210050104680001', 'MAJALENGKA', '1968-04-01', 'L', 'Islam', 'BLOK DESA RT 006 RW 003 DESA SADASARI KEC. ARGAPURA KAB. MAJALENGKA', NULL, 5, NULL, 88, '', '', 'ROSIDIN-2019_3210050006_1.png', 1843),
(310, '2019', '3210', '3210050', '3210050006', '2', 'GUGUN GUNAWAN', '3210052307940001', 'MAJALENGKA', '1994-07-23', 'L', 'Islam', 'BLOK DESA RT 006 RW 003 DESA SADASARI KEC. ARGAPURA KAB. MAJALENGKA', NULL, 5, NULL, 88, '', '', '', 132),
(311, '2019', '3210', '3210120', '3210120007', '2', 'UHA SUHADI', '3210101708620001', 'MAJALENGKA', '1962-08-17', 'L', 'Islam', 'BLOK SELASA RT.011 RW.005 DESA PATUANAN KECAMATAN LEUWIMUNDIG KABUPATEN MAJALENGKA', NULL, 4, NULL, 86, '', '', 'UHA_SUHADI-2019_3210120007_2.jpg', 1420),
(312, '2019', '3210', '3210120', '3210120007', '3', 'CASMA SUHENDRA', '3210102708740001', 'MAJALENGKA', '1974-08-27', 'L', 'Islam', 'BLOK JUMAT RT.001 RW.001 DESA PATUANAN KECAMATAN LEUWIMUNDING KABUPATEN MAJALENGKA', NULL, 4, NULL, 84, '', '', 'CASMA_SUHENDRA-2019_3210120007_3.JPG', 254),
(313, '2019', '3210', '3210120', '3210120007', '1', 'NIRI SUNIRI', '3210105608750001', 'MAJALENGKA', '1975-08-16', 'P', 'Islam', 'BLOK SABTU RT.003 RW.002 DESA PTUANAN KECAMATAN LEUWIMUNDING KABUPATEN MAJALENGKA', NULL, 5, NULL, 84, '', '', 'NIRI_SUNIRI-2019_3210120007_1.jpg', 869),
(314, '2019', '3210', '3210120', '3210120005', '1', 'JUHAENI', '3210100704690001', 'MAJALENGKA', '1969-04-07', 'L', 'Islam', 'DUSUN MUARA RT.004/RW.002 DESA LEUWIKUJANG KECAMATAN LEUWIMUNDING KABUPATEN MAJALENGKA', NULL, 5, NULL, 86, '', '', 'JUHAENI-2019_3210120005_1.jpg', 2887),
(315, '2019', '3210', '3210120', '3210120005', '2', 'ENO SUWARNO', '3210102101830001', 'MAJALENGKA', '1983-01-21', 'L', 'Islam', 'DUSUN MAJAPAHIT RT.003/RW.004 DESA LEUWIKUJANG KECAMATAN LEUWIMUNDING KABUPATEN MAJALENGKA', NULL, 4, NULL, 19, '', '', 'ENO_SUWARNO-2019_3210120005_2.jpg', 158),
(316, '2019', '3210', '3210120', '3210120012', '2', 'AANG RUKMAN LESMANA', '3210103112740001', 'MAJALENGKA', '1974-12-31', 'L', 'Islam', 'DUSUN BARU RT.002/RW.005 DESA LEUWIMUNDING KECAMATAN LEUWIMUNDING KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'AANG_RUKMAN_LESMANA-2019_3210120012_2.jpg', 1317),
(317, '2019', '3210', '3210120', '3210120012', '4', 'TAUFIK  SALMAN KHOTOMI', '5171041503730004', 'MAJALENGKA', '1973-03-15', 'L', 'Islam', 'DUSUN BARU RT.001/RW.004 DESA LEUWIMUNDING KECAMATAN LEUWIMUNDING KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'TAUFIK__SALMAN_KHOTOMI-2019_3210120012_4.jpg', 741),
(318, '2019', '3210', '3210150', '3210150018', '1', 'AAY IRYANDO, S.IP', '3210122702880061', 'SORONG', '1988-02-27', 'L', 'Islam', 'BLOK SABTU RT 005 RW 002 DESA BALIDA KECAMATAN DAWUAN KABUPATEN MAJALENGKA.\r\n\r\n', NULL, 8, NULL, 88, '', '', 'AAY_IRYANDO__S_IP-2019_3210150018_1.jpg', 2801),
(319, '2019', '3210', '3210120', '3210120012', '3', 'LILI SADILI', '3210102912640001', 'MAJALENGKA', '1964-12-29', 'L', 'Islam', 'DUSUN PEKAUMAN RT.003/RW.001 DESA LEUWIMUNDING KECAMATAN LEUWIMUNDING KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'LILI_SADILI-2019_3210120012_3.jpg', 0),
(320, '2019', '3210', '3210150', '3210150018', '2', 'SUWANTA RUSTIM, SP', '3210120608630021', 'MAJALENGKA', '1963-08-06', 'L', 'Islam', 'BLOK MINGGU RT 002 RW 003 DESA BALIDA KECAMATAN DAWUAN KABUPATEN MAJALENGKA', NULL, 8, NULL, 5, '', '', 'SUWANTA_RUSTIM__SP-2019_3210150018_1.JPG', 1695),
(321, '2019', '3210', '3210120', '3210120012', '1', 'ASEP SETIADI', '3210103007680001', 'MAJALENGKA', '1968-07-30', 'L', 'Islam', 'DUSUN BARU RT.004/RW.003 DESA LEUWIMUNDING KECAMATAN LEUWIMUNDNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 86, '', '', 'ASEP_SETIADI-2019_3210120012_1.jpg', 974),
(322, '2019', '3210', '3210120', '3210120012', '5', 'DARSONO', '3210012207810022', 'INDRAMAYU', '1981-07-22', 'L', 'Islam', 'LINGKUNGAN GIRI WULAN RT.005/RW.001 KELURAHAN MAJALENGKA WETAN KECAMATAN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'DARSONO-2019_3210120012_5.jpg', 406),
(323, '2019', '3210', '3210120', '3210120013', '1', 'YAYA HAWIJAYA, S.Pd.I.', '3210101608820101', 'MAJALENGKA', '1982-08-16', 'L', 'Islam', 'Dusun Mekar Saluyu RT.002 RW.004 Desa Mirat Kecamatan Leuwimunding Kabupaten Majalengka', NULL, 8, NULL, 15, '', '', 'YAYA_HAWIJAYA__S_PD_I_-2019_3210120013_1.jpg', 934),
(324, '2019', '3210', '3210120', '3210120013', '2', 'ASEP SUMEKAR', '3210102309700021', 'MAJALENGKA', '1970-09-23', 'L', 'Islam', 'Dusun Pekauman RT.002 RW,006 Desa Leuwimunding Kecamatan Leuwimunding Kabupaten Majalengka', NULL, 5, NULL, 88, '', '', 'ASEP_SUMEKAR-2019_3210120013_2.jpg', 1316),
(325, '2019', '3210', '3210120', '3210120013', '4', 'AMAT', '3210103012700001', 'MAJALENGKA', '1970-12-30', 'L', 'Islam', 'Dusun Pasir Endah RT. 002 RW.008 Desa Mirat Kecamatan Leuwimunding Kabupaten Majalengka', NULL, 5, NULL, 86, '', '', 'AMAT-2019_3210120013_3.jpg', 851),
(326, '2019', '3210', '3210120', '3210120013', '3', 'DADANG', '3210102707690001', 'MAJALENGKA', '1969-07-27', 'L', 'Islam', 'Dusun Mekar Saluyu RT.007 RW.007 Desa Mirat Kecamatan Leuwimunding Kabupaten Majalengka', NULL, 8, NULL, 88, '', '', 'DADANG-2019_3210120013_3.JPG', 354),
(327, '2019', '3210', '3210020', '3210020021', '2', 'URIP PRIBADI', '3216092402800010', 'MAJALENGKA', '1981-02-24', 'L', 'Islam', 'Perum Graha Asri sektor Graha Mattel Jl Cisadane I D Blok N No 15 Kelurahan Simpangan Kecamatan Cikarang Utara Kabupaten Bekasi.', NULL, 5, NULL, 15, '-', '-', 'URIP_PRIBADI-2019_3210020021_1.jpg', 45),
(328, '2019', '3210', '3210190', '3210190012', '2', 'CARSIDIK', '3210151611690041', 'MAJALENGKA', '1969-11-16', 'L', 'Islam', 'DUSUN SENIN,  RT.003 RW.002 DESA JATIRAGA\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 88, '', '', 'CARSIDIK-2019_3210190012_1.jpg', 748),
(329, '2019', '3210', '3210190', '3210190012', '4', 'KASDI', '3210151207670001', 'MAJALENGKA', '1967-07-12', 'L', 'Islam', 'BLOK SELASA,  RT.005 RW.003 DESA JATIRAGA\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 17, '', '', 'KASDI-2019_3210190012_2.jpg', 461),
(330, '2019', '3210', '3210190', '3210190012', '1', 'DADANG KURNIAWAN', '3210151107700001', 'MAGELANG', '1970-07-11', 'L', 'Islam', 'BLOK SELASA,  RT.007 RW004 DESA JATIRAGA\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 88, '', '', 'DADANG_KURNIAWAN-2019_3210190012_1.jpg', 116),
(331, '2019', '3210', '3210190', '3210190012', '3', 'JAENUDIN', '3210150212640101', 'MAJALENGKA', '1964-12-02', 'L', 'Islam', 'BLOK SELASA  RT.008 RW.004 DESA JATIRAGA\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 88, '', '', 'JAENUDIN-2019_3210190012_4.jpg', 198),
(332, '2019', '3210', '3210190', '3210190002', '1', 'H. ACAM WASCAM', '3210152207670001', 'MAJALENGKA', '1964-03-28', 'L', 'Islam', 'BLOK SINDANG  RT.002 RW.001 DESA PASINDANGAN\r\nKEC. JATITUJUH', NULL, 5, NULL, 5, '', '', 'H__ACAM_WASCAM-2019_3210190002_1.jpg', 574),
(333, '2019', '3210', '3210190', '3210190002', '2', 'CARYO', '3210152303730101', 'MAJALENGKA', '1973-03-23', 'L', 'Islam', 'BLOK RANCA BOLANG  RT.003 RW.002 DESA PASINDANGAN', NULL, 5, NULL, 5, '', '', 'CARYO-2019_3210190002_2.jpg', 1436),
(334, '2019', '3210', '3210190', '3210190003', '1', 'TAUFIQ', '3210152512680041', 'MAJALENGKA', '1968-12-25', 'L', 'Islam', 'BLOK SABTU RT.001 RW.007 DESA PANONGAN', NULL, 8, NULL, 5, '', '', 'TAUFIQ-2019_3210190003_1.jpg', 2144),
(335, '2019', '3210', '3210190', '3210190003', '2', 'ARWATI', '3210156305810001', 'MAJALENGKA', '1981-05-23', 'P', 'Islam', 'blok sabtu rt.001 rw.007 desa panongan', NULL, 4, NULL, 2, '', '', 'ARWATI-2019_3210190003_2.jpg', 303),
(336, '2019', '3210', '3210190', '3210190007', '3', 'TOTO SUHARTO', '3671062407590001', 'MAJALENGKA', '1959-07-24', 'L', 'Islam', 'BLOK SELASA RT.005 RW.003 DESA PUTRIDALEM\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 86, '', '', 'TOTO_SUHARTO-2019_3210190007_1.jpg', 692),
(337, '2019', '3210', '3210190', '3210190007', '2', 'ENDAH HENDRAWATI', '3175095707760011', 'MAJALENGKA', '1976-07-17', 'P', 'Islam', 'JL. JAMBORE RAYA NO.36  RT.006 RW.013\r\nDESA CIBUBUR KECAMATAN CIRACAS  JAKARTA TIMUR', NULL, 5, NULL, 88, '', '', 'ENDAH_HENDRAWATI-2019_3210190007_2.jpg', 943),
(338, '2019', '3210', '3210190', '3210190007', '1', 'SUGANDI', '3210151104730121', 'MAJALENGKA', '1973-04-11', 'L', 'Islam', 'BLOK JUMAT,  RT.008 RW.004 DESA PUTRIDALEM\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 88, '', '', 'SUGANDI-2019_3210190007_3.jpg', 249),
(339, '2019', '3210', '3210190', '3210190008', '3', 'H. EEP SAIFUL AZIS', '3210150805650021', 'MAJALENGKA', '1965-05-08', 'L', 'Islam', 'BLOK KAMIS,  RT.001 RW.005 DESA JATITENGAH\r\nKEC. JATITUJUH', NULL, 5, NULL, 5, '', '', 'H__EEP_SAIFUL_AZIS-2019_3210190008_3.jpg', 1233),
(340, '2019', '3210', '3210190', '3210190008', '2', 'UTOYO', '3210151201690101', 'MAJALENGKA', '1969-01-12', 'L', 'Islam', 'BLOK JUMAT, RT.001 RW.006 DESA JATITENGAH\r\nKEC. JATITUJUH', NULL, 4, NULL, 1, '', '', 'UTOYO-2019_3210190008_2.jpg', 739),
(341, '2019', '3210', '3210190', '3210190008', '1', 'H. TAMIM', '3210150508637771', 'MAJALENGKA', '1963-08-05', 'L', 'Islam', 'BLOK RABU RT.003 RW.004 DESA JATITENGAH', NULL, 5, NULL, 5, '', '', 'H__TAMIM-2019_3210190008_1.jpg', 892),
(342, '2019', '3210', '3210190', '3210190013', '1', 'KISWANUDIN', '3210150104850041', 'MAJALENGKA', '1985-04-01', 'L', 'Islam', 'Blok SI BATOK RT.010 RW. 005  DESA SUMBER KULON\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 88, '', '', 'KISWANUDIN-2019_3210190013_1.jpg', 51),
(343, '2019', '3210', '3210190', '3210190013', '3', 'KASTA ', '3273020205650004', 'MAJALENGKA', '1965-05-02', 'L', 'Islam', 'Blok SIBATOK RT.012 RW. 006 DESA SUMBER KULON\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 88, '', '', 'KASTA_-2019_3210190013_2.jpg', 877),
(344, '2019', '3210', '3210190', '3210190013', '2', 'KIBAGUS WARDILAH', '3210151102770081', 'MAJALENGKA', '1977-02-11', 'L', 'Islam', 'BLOK PANDE RT.003 RW.002 DESA SUMBER KULON\r\nKECAMATAN JATITUJUH', NULL, 4, NULL, 88, '', '', 'KIBAGUS_WARDILAH-2019_3210190013_3.jpg', 1358),
(345, '2019', '3210', '3210190', '3210190014', '1', 'USI SANUSI', '3210151002770061', 'MAJALENGKA', '1977-02-10', 'L', 'Islam', 'BLOK SUMUR SINDU  RT.001 RW.003  DESA SUMBER WETAN\r\nKEC. JATITUJUH', NULL, 8, NULL, 5, '', '', 'USI_SANUSI-2019_3210190014_1.jpg', 1530),
(346, '2019', '3210', '3210190', '3210190014', '3', 'CARMIN', '3210142705730001', 'MAJALENGKA', '1973-04-29', 'L', 'Islam', 'BLOK SUMUR SINDU, RT.001  Rw.004 DESA SUMBER WETAN\r\nKEC. JATITUJUH', NULL, 5, NULL, 88, '', '', 'CARMIN-2019_3210190014_3.jpg', 117),
(347, '2019', '3210', '3210190', '3210190014', '2', 'KOHAR', '3210150704600102', 'MAJALENGKA', '1960-04-07', 'L', 'Islam', 'BLOK SIBATOK  RT.002 RW.007  DESA SUMBER  WETAN\r\nKEC. JATITUJUH', NULL, 4, NULL, 88, '', '', 'KOHAR-2019_3210190014_2.jpg', 945),
(348, '2019', '3210', '3210190', '3210190010', '2', 'TARMIDI', '3210150908550001', 'MAJALENGKA', '1955-08-09', 'L', 'Islam', 'BLOK MAWAR  RT.004 RW.001 DESA BABAJURANG\r\nKECAMATAN JATITUJUH', NULL, 4, NULL, 8, '', '', 'TARMIDI-2019_3210190010_2.jpg', 181),
(349, '2019', '3210', '3210190', '3210190010', '1', 'AHMAD BASAR', '3210152106790001', 'MAJALENGKA', '1979-06-21', 'L', 'Islam', 'BLOK MELATI  RT.003 RW.002DESA BABAJURANG\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 88, '', '', 'AHMAD_BASAR-2019_3210190010_1.jpg', 312),
(350, '2019', '3210', '3210190', '3210190010', '3', 'ASEP YAGI, S.Kep', '3210152902880001', 'MAJALENGKA', '1988-03-01', 'L', 'Islam', 'BLOK MELATI, RT.003 RW.002 DESA BABAJURANG\r\nKECAMATAN JATITUJUH', NULL, 8, NULL, 88, '', '', 'ASEP_YAGI__S_KEP-2019_3210190010_3.jpg', 273),
(351, '2019', '3210', '3210190', '3210190006', '3', 'AHMAD UMBARA', '3210151402658022', 'MAJALENGKA', '1965-02-14', 'L', 'Islam', 'BLOK BOJONG BADAK RT.009 RW.005 DESA RANDEGAN WETAN\r\nKECAMATAN JATITUJUH', NULL, 8, NULL, 88, '', '', 'AHMAD_UMBARA-2019_3210190006_3.jpg', 1219),
(352, '2019', '3210', '3210190', '3210190006', '1', 'USTOM SAHLAN SAPUTRA', '3210152203840021', 'MAJALENGKA', '1984-03-22', 'L', 'Islam', 'BLOK SALUYU RT.002 RW.001 DESA RANDEGAN WETAN\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 88, '', '', 'USTOM_SAHLAN_SAPUTRA-2019_3210190006_1.jpg', 826),
(353, '2019', '3210', '3210190', '3210190006', '2', 'NASMITA', '3210071803640021', 'MAJALENGKA', '1964-03-18', 'L', 'Islam', 'DESA RANDEGAN WETAN,  BLOK BOJONG BADAK RT.009 RW.005\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 4, '', '', 'NASMITA-2019_3210190006_2.jpg', 288),
(354, '2019', '3210', '3210190', '3210190001', '2', 'WARJUM SETIA BUDI', '3210152712730002', 'MAJALENGKA', '1973-12-27', 'L', 'Islam', 'DESA BIYAWAK,  RT.005 RW.002\r\nKECAMATAN JATITUJUH', NULL, 5, NULL, 1, '', '', 'WARJUM_SETIA_BUDI-2019_3210190001_2.jpg', 2543),
(355, '2019', '3210', '3210190', '3210190001', '1', 'SOLEMAN', '3210150911720021', 'MAJALENGKA', '1972-11-09', 'L', 'Islam', 'DESA BIYAWAK,  RT.005 RW.002\r\nKEC. JATITUJUH', NULL, 5, NULL, 88, '', '', 'SOLEMAN-2019_3210190001_1.jpg', 619),
(356, '2019', '3210', '3210180', '3210180010', '1', 'NONO DARSONO, SH', '3210141210730061', 'MAJALENGKA', '1973-10-12', 'L', 'Islam', 'Blok Senin RT. 003 RW. 001 Desa Sukamulya Kecamatan Kertajati Kabupaten Majalengka', NULL, 8, NULL, 86, 'OSIS, PRAMUKA', '', 'NONO_DARSONO__SH-2019_3210180010_1.jpg', 1671),
(357, '2019', '3210', '3210180', '3210180010', '2', 'ENI TURHAENI', '3210145106860021', 'MAJALENGKA', '1986-06-11', 'P', 'Islam', 'Blok Senin RT. 003 RW. 001 Desa Sukamulya Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 2, '', '', 'ENI_TURHAENI-2019_3210180010_2.jpg', 430),
(358, '2019', '3210', '3210180', '3210180006', '3', 'KOMARUDIN, S.Pd.I', '3210141304810001', 'MAJALENGKA', '1981-04-13', 'L', 'Islam', 'Blok Desa RT. 006 RW. 002 Desa Babakan Kecamatan Kertajati Kabupaten Majalengka', NULL, 8, NULL, 88, '', '', 'KOMARUDIN__S_PD_I-2019_3210180006_1.jpg', 1906),
(359, '2019', '3210', '3210180', '3210180006', '1', 'UUY ABDUL SYUKUR, S.IP', '3210141103730001', 'BOGOR', '1973-03-11', 'L', 'Islam', 'Jalan Nusa Indah RT. 005 RW. 002 Desa Babakan Kecamatan Kertajati Kabupaten Majalengka', NULL, 8, NULL, 5, '', '', 'UUY_ABDUL_SYUKUR__S_IP-2019_3210180006_2.jpg', 1353),
(360, '2019', '3210', '3210180', '3210180006', '2', 'SUNNARTA', '3210140508650081', 'MAJALENGKA', '1965-08-05', 'L', 'Islam', 'Blok Desa RT. 005 RW. 003 Desa Babakan Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 88, '', '', 'SUNNARTA-2019_3210180006_3.jpg', 349),
(361, '2019', '3210', '3210050', '3210050007', '1', 'DEDE ENDANG KUSWARA, S.Si. APt', '3210051706790061', 'MAJALENGKA', '1979-06-17', 'L', 'Islam', 'BLOK DESA RT 001 RW 003 DESA SUKADANA KEC. ARGAPURA KAB. MAJALENGKA', NULL, 8, NULL, 88, '', '', 'DEDE_ENDANG_KUSWARA__S_SI__APT-2019_3210050007_1.jpg', 1409),
(362, '2019', '3210', '3210050', '3210050007', '2', 'ASEP SUHERMAN', '3210051407770001', 'MAJALENGKA', '1977-07-14', 'L', 'Islam', 'BLOK DESA RT 001 RW 003 DESA SUKADANA KEC. ARGAPURA KAB. MAJALENGKA', NULL, 5, NULL, 88, '', '', 'ASEP_SUHERMAN-2019_3210050007_1.jpg', 852),
(363, '2019', '3210', '3210180', '3210180007', '1', 'AJAT SUDRAJAT, SH', '3210141104780041', 'MAJALENGKA', '1978-04-11', 'L', 'Islam', 'Blok Minggu RT. 001 RW. 001 Desa Kertajati Kecamatan Kertajati Kabupaten Majalengka', NULL, 8, NULL, 86, '', '', 'AJAT_SUDRAJAT__SH-2019_3210180007_1.jpg', 1666),
(365, '2019', '3210', '3210180', '3210180007', '2', 'MAHPUDIN, SE', '3210142001750041', 'MAJALENGKA', '1975-01-20', 'L', 'Islam', 'Blok Selasa RT. 003 RW. 003 Desa Kertajati Kecamatan Kertajati Kabupaten Majalengka', NULL, 8, NULL, 88, '', '', 'MAHPUDIN__SE-2019_3210180007_2.png', 1241),
(366, '2019', '3210', '3210180', '3210180011', '1', 'H. SUHARNO', '3210140505700041', 'MAJALENGKA', '1970-05-05', 'L', 'Islam', 'Blok Sabtu RT. 005 RW. 003 Desa Bantarjati Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 86, '', '', 'H__SUHARNO-2019_3210180011_1.jpg', 932),
(367, '2019', '3210', '3210180', '3210180011', '2', 'ALPIH HENDRA', '3210141907740021', 'MAJALENGKA', '1974-07-19', 'L', 'Islam', 'Blok Jumat RT. 004 RW. 002 Desa Bantarjati Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 88, '', '', 'ALPIH_HENDRA-2019_3210180011_2.jpg', 438),
(368, '2019', '3210', '3210050', '3210050004', '1', 'OJI SARJIAH', '3210052304700001', 'MAJALENGKA', '1970-04-23', 'L', 'Islam', 'BLOK MEKARSARI RT 007 RW 004 DESA SUKASARI KIDUL KEC. ARGAPURA', NULL, 5, NULL, 88, '', '', 'OJI_SARJIAH-2019_3210050004_1.jpg', 1890),
(370, '2019', '3210', '3210180', '3210180013', '1', 'EDI JUNAEDI', '3210140202790004', 'MAJALENGKA', '1979-02-02', 'L', 'Islam', 'Blok Kliwon RT. 003 RW. 002 Desa Sukakerta Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 88, '', '', 'EDI_JUNAEDI-2019_3210180013_1.jpg', 926),
(372, '2019', '3210', '3210180', '3210180013', '2', 'ASPIN', '3210140802780021', 'MAJALENGKA', '1978-02-08', 'L', 'Islam', 'Blok Kemis RT. 001 RW. 001 Desa Sukakerta Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 88, '', '', 'ASPIN-2019_3210180013_2.jpg', 531),
(373, '2019', '3210', '3210050', '3210050004', '2', 'RUSTINI', '3210054803770001', 'MAJALENGKA', '1977-03-08', 'P', 'Islam', 'BLOK MEKARSARI RT 007 RW 004 DESA SUKASARI KIDUL KEC. ARGAPURA', NULL, 4, NULL, 2, '', '', 'RUSTINI-2019_3210050004_1.jpg', 117),
(374, '2019', '3210', '3210180', '3210180013', '3', 'ANTON SUSANTO', '3210140908800001', 'MAJALENGKA', '1980-08-09', 'L', 'Islam', 'Blok Kemis RT. 002 RW. 001 Desa Sukakerta Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 88, 'a. Ketua Karang Taruna Desa Sukakerta \r\nb. Ketua Pemuda Pancasila Ranting Desa Sukakerta', '', 'ANTON_SUSANTO-2019_3210180013_3.jpg', 102),
(375, '2019', '3210', '3210050', '3210050012', '2', 'UMAR TAUFIK', '3210051203690061', 'MAJALENGKA', '1969-03-12', 'L', 'Islam', 'BLOK SENIN RT 005 RW 003 DESA GUNUNGWANGI KEC. ARGAPURA', NULL, 4, NULL, 88, '', '', 'UMAR_TAUFIK-2019_3210050012_1.jpg', 334),
(376, '2019', '3210', '3210050', '3210050012', '1', 'H. NASRULAH', '6271010703680003', 'MAJALENGKA', '1965-02-07', 'L', 'Islam', 'BLOK SENIN RT 001 RW 002 DESA MEKARWANGI KEC. ARGAPURA', NULL, 5, NULL, 88, '', '', 'H__NASRULAH-2019_3210050012_1.jpg', 943),
(377, '2019', '3210', '3210180', '3210180002', '1', 'OTONG HIDAYAT, SE', '', 'MAJALENGKA', '1982-10-16', 'L', 'Islam', 'Dusun Sukamulya RT. 009 RW. 003 Desa Paseh Kidul Kecamatan Paseh Kabupaten Sumedang', NULL, 8, NULL, 88, '', '', 'OTONG_HIDAYAT__SE-2019_3210180002_1.jpg', 373),
(378, '2019', '3210', '3210180', '3210180002', '2', 'TEDI HERMAWAN', '3210141007870062', 'MAJALENGKA', '1987-07-10', 'L', 'Islam', 'Dusun Banggala RT. 012 RW. 006 Desa Palasah Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 85, '', '', 'TEDI_HERMAWAN-2019_3210180002_2.jpg', 676),
(379, '2019', '3210', '3210180', '3210180002', '3', 'CUCU SUTARNA', '3210141705750001', 'MAJALENGKA', '1975-05-17', 'L', 'Islam', 'Dusun Antranaya RT. 001 RW. 001 Desa Palasah Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 85, '', '', 'CUCU_SUTARNA-2019_3210180002_3.png', 1097),
(380, '2019', '3210', '3210180', '3210180014', '2', 'TETE', '3210141705750081', 'SUMEDANG', '1975-05-17', 'L', 'Islam', 'Dusun Kiara Dangkak RT. 002 RW. 001 Desa Sahbandar Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 88, '', '', 'TETE-2019_3210180014_1.jpg', 343),
(381, '2019', '3210', '3210180', '3210180014', '3', 'SUDINTA', '3210140903650001', 'MAJALENGKA', '1965-05-09', 'L', 'Islam', 'Dusun Pulo Damar RT. 002 RW. 002 Desa Sahbandar Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 88, '', '', 'SUDINTA-2019_3210180014_2.jpg', 283),
(383, '2019', '3210', '3210140', '3210140007', '3', 'DADANG SONJAYA', '3210110706740001', 'Majalengka', '1974-06-07', 'L', 'Islam', 'Dusun Cihujan RT 003 RW 001 Desa Cicadas Kec.  Jatiwangi', NULL, 5, NULL, 88, 'BUMDes Cicadas sebagai Bendahara (2018-2019)', '-', 'DADANG_SONJAYA-2019_3210140007_1.jpg', 775),
(384, '2019', '3210', '3210180', '3210180001', '1', 'AMA SUMARNA, BSC', '3210140808500001', 'BANDUNG', '1950-08-08', 'L', 'Islam', 'Dusun Kertamukti RT. 003 RW. 001 Desa Mekarjaya Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 88, '', '', 'AMA_SUMARNA__BSC-2019_3210180001_1.jpg', 377),
(385, '2019', '3210', '3210180', '3210180001', '2', 'CARSONO', '3210142908740002', 'MAJALENGKA', '1974-08-29', 'L', 'Islam', 'Dusun Kertamulya RT. 002 RW. 003 Desa Mekarjaya Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 85, '', '', 'CARSONO-2019_3210180001_2.jpg', 1673),
(386, '2019', '3210', '3210180', '3210180001', '3', 'CARSUDIN', '3210141511680001', 'MAJALENGKA', '1968-11-15', 'L', 'Islam', 'Dusun Kertamulya RT. 002 RW. 002 Desa Mekarjaya Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 9, '', '', 'CARSUDIN-2019_3210180001_3.jpg', 1232),
(387, '2019', '3210', '3210140', '3210140007', '1', 'UMAR ZEN', '3210110111760001', 'Majalengka', '1976-11-01', 'L', 'Islam', 'Dusun Gugunungan RT 003 RW 003  Desa Cicadas Kec.  Jatiwangi', NULL, 5, NULL, 88, 'Pemuda Pancasila', '-', 'UMAR_ZEN-2019_3210140007_1.jpg', 933),
(388, '2019', '3210', '3210180', '3210180001', '5', 'SAMSUDIN', '3210143009570001', 'INDRAMAYU', '1957-09-30', 'L', 'Islam', 'Dusun Kertamulya RT. 002 RW. 003 Desa Mekarjaya Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 86, '', '', 'SAMSUDIN-2019_3210180001_4.jpg', 146),
(389, '2019', '3210', '3210180', '3210180001', '4', 'TARWIN', '3210140608680001', 'MAJALENGKA', '1968-08-06', 'L', 'Islam', 'Dusun Kertajaya RT. 001 RW. 001 Desa Mekarjaya Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 88, '', '', 'TARWIN-2019_3210180001_5.jpg', 509),
(390, '2019', '3210', '3210140', '3210140007', '2', 'DADANG SUDRAJAT', '3210111108780041', 'Majalengka', '1978-08-11', 'L', 'Islam', 'Dusun Cihujan RT 001 RW 002 Desa Cicadas Kec.  Jatiwangi', NULL, 5, NULL, 19, '-', '-', 'DADANG_SUDRAJAT-2019_3210140007_1.jpg', 261),
(392, '2019', '3210', '3210140', '3210140007', '4', 'JUNAEDI', '3210110308630001', 'Majalengka', '1963-08-03', 'L', 'Islam', 'Dusun Gugunungan RT 001 RW 003 Desa Cicadas Kec. Jatiwangi', NULL, 5, NULL, 88, '-', 'Mantan Kepala Desa Cicadas Tahun 2013', 'JUNAEDI-2019_3210140007_1.jpg', 203),
(394, '2019', '3210', '3210050', '3210050008', '1', 'ADE UMBARA', '3210051411840001', 'MAJALENGKA', '1983-02-28', 'L', 'Islam', 'BLOK BABAKAN KULON RT 001 RW 003 DESA ARGAMUKTI KEC. ARGAPURA', NULL, 5, NULL, 9, '', '', 'ADE_UMBARA-2019_3210050008_1.jpg', 1731),
(395, '2019', '3210', '3210050', '3210050008', '2', 'YEYET', '3210056705890001', 'MAJALENGKA', '1989-04-27', 'P', 'Islam', 'BLOK BABAKAN KULON RT 007 RW 003 DESA ARGAMUKTI KEC. ARGAPURA', NULL, 4, NULL, 2, '', '', 'YEYET-2019_3210050008_2.jpg', 67),
(399, '2019', '3210', '3210050', '3210050003', '2', 'KUSNADI', '3210051508760021', 'MAJALENGKA', '1976-08-15', 'L', 'Islam', 'BLOK DESA RT 001 RW 001 DESA TEJAMULYA KEC. ARGAPURA', NULL, 4, NULL, 88, '', '', 'KUSNADI-2019_3210050003_1.jpg', 1367),
(400, '2019', '3210', '3210050', '3210050003', '1', 'DEDI SUPRIADI', '3210052804750001', 'MAJALENGKA', '1975-04-28', 'L', 'Islam', 'BLOK DESA RT 001 RW 001 DESA TEJAMULYA KEC. ARGAPURA', NULL, 5, NULL, 88, '', '', 'DEDI_SUPRIADI-2019_3210050003_1.jpg', 155),
(403, '2019', '3210', '3210080', '3210080010', '2', 'UJANG DIRMANA', '3210070805740101', 'TANJUNG KARANG', '1974-05-08', 'L', 'Islam', 'BLOK CANDRA RT. 03 RW. 02 DESA KARAYUNAN KEC. CIGASONG KABUPATEN MAJALENGKA', NULL, 5, NULL, 13, '', '', 'UJANG_DIRMANA-2019_3210080010_4.jpg', 96),
(404, '2019', '3210', '3210150', '3210150014', '2', 'IWAN KURNIAWAN, SH', '3210120710700041', 'MAJALENGKA', '1970-10-07', 'L', 'Islam', 'BLOK SENIN RT 001 RW 004', NULL, 8, NULL, 88, 'ANGGOTA HMI TAHUN 1990-1993\r\nKARANG TARUNA TAHUN  2007-2010', '', 'IWAN_KURNIAWAN__SH-2019_3210150014_1.jpg', 1920),
(405, '2019', '3210', '3210180', '3210180005', '1', 'H. SUHERMAN', '3210140709580001', 'MAJALENGKA', '1958-02-07', 'L', 'Islam', 'Blok Desa RT. 008 RW. 001 Desa Kertawinangun Kecamatan Kertajati Kabupaten Majalengka', NULL, 5, NULL, 86, '', '', 'H__SUHERMAN-2019_3210180005_1.jpg', 1711),
(416, '2019', '3210', '3210010', '3210010004', '3', 'NINING KARWATI', '3210016607710021', 'MAJALENGKA/26 SEPTEMBER 1969', '1969-09-26', 'P', 'Islam', 'RT 002 RW 001 DESA CIBULAN KEC. LEMAHSUGIH', NULL, 5, NULL, 86, '', '', 'NINING_KARWATI-2019_3210010004_1.jpg', 189),
(417, '2019', '3210', '3210010', '3210010004', '4', 'ADE MUTOLIB, S.Pd', '3210011004750001', 'MAJALENGKA/10 APRIL 1975', '1975-04-10', 'L', 'Islam', 'RT 004  RW 001 DESA CIBULAN KEC. LEMAHSUGIH', NULL, 8, NULL, 18, '', '', 'ADE_MUTOLIB__S_PD-2019_3210010004_1.jpg', 362),
(418, '2019', '3210', '3210010', '3210010004', '1', 'DODIH ', '321011112740002', 'MAJALENGKA/15 JULI 1972', '1972-07-15', 'L', 'Islam', 'RT 002 RW 001 Desa Cibulan Kec. Lemahsugih', NULL, 5, NULL, 88, '', '', 'DODIH_-2019_3210010004_1.jpg', 245),
(419, '2019', '3210', '3210010', '3210010004', '2', 'NURMAN, S.HI', '3210010509770021', 'MAJALENGKA/5 SEPTEMBER 1977', '1977-09-05', 'L', 'Islam', 'RT 002 RW 001 DESA CIBULAN KEC. LEMAHSUGIH', NULL, 8, NULL, 88, '', '', 'NURMAN__S_HI-2019_3210010004_1.jpg', 76),
(421, '2019', '3210', '3210080', '3210080009', '1', 'SANUSI', '3210201008730001', 'MAJALENGKA', '1973-08-10', 'L', 'Islam', 'BLOK KARYALAKSANA RT. 005 RW. 002 DESA BATUJAYA KEC. CIGASONG KAB. MAJALENGKA', NULL, 5, NULL, 12, '', '', 'SANUSI-2019_3210080009_2.jpg', 1194),
(424, '2019', '3210', '3210140', '3210140007', '5', 'ZENAL ASIKIN', '3210110509760021', 'Majalengka', '1976-09-05', 'L', 'Islam', 'Dusun Cangkuang RT 002 RW 007 Desa Cicadas Kec. Jatiwangi', NULL, 5, NULL, 88, '-', 'Incumbent', 'ZENAL_ASIKIN-2019_3210140007_1.jpg', 276),
(425, '2019', '3210', '3210140', '3210140008', '1', 'H. OTONG SOLIHIN', '3210110605690101', 'Majalengka', '1969-05-06', 'L', 'Islam', 'Blok Saptu RT 003 RW 011 Desa Burujul Wetan Kec. Jatiwangi', NULL, 5, NULL, 88, '-', '-', 'H__OTONG_SOLIHIN-2019_3210140008_1.jpg', 4932),
(426, '2019', '3210', '3210140', '3210140008', '2', 'Hj. EUIS SURYATNI', '3210116507700041', 'Majalengka', '1970-07-25', 'P', 'Islam', 'Blok Saptu RT 003 RW 011 Desa Burujul Wetan Kec. Jatiwangi', NULL, 5, NULL, 2, '-', '-', 'HJ__EUIS_SURYATNI-2019_3210140008_1.jpg', 351),
(427, '2019', '3210', '3210140', '3210140010', '1', 'CASTAM', '3210111503660041', 'Majalengka', '1968-02-03', 'L', 'Islam', 'Blok Cibogo RT 002 RW 015 Desa Burujulkulon Kec. Jatiwangi', NULL, 5, NULL, 88, '-', '-', 'CASTAM-2019_3210140010_1.jpg', 30),
(428, '2019', '3210', '3210140', '3210140010', '2', 'Hj. TRIAN NURITA, SE.', '3210116903820101', 'Majalengka', '1982-03-29', 'P', 'Islam', 'Dusun Pahing RT 002 RW 013 Desa Mekarsari Kec. Jatiwangi', NULL, 8, NULL, 88, '1. BMI (Benteng Muda Indonesia)\r\n2. HIPMI', '-', 'TRIAN_NURITA-2019_3210140010_1.jpg', 1662),
(429, '2019', '3210', '3210140', '3210140010', '3', 'SUNATA', '3210111504820041', 'Majalengka', '1982-04-15', 'L', 'Islam', 'Dusun Wage  RT 001 RW 006 Desa Mekarsari Kec. Jatiwangi', NULL, 5, NULL, 19, '1. Gibas\r\n2. LMPI', '-', 'SUNATA-2019_3210140010_1.jpg', 433),
(430, '2019', '3210', '3210140', '3210140006', '1', 'H. UUNG MAHRUDIN', '3210111806630001', 'Majalengka', '1963-06-18', 'L', 'Islam', 'Dusun Manis RT 001 RW 002 Desa Andir Kec.  Jatiwangi', NULL, 5, NULL, 88, 'PNPM sebagai Koordinator', 'Incumbent', 'H__UUNG_MAHRUDIN-2019_3210140006_1.jpg', 1701),
(431, '2019', '3210', '3210140', '3210140006', '2', 'HERMANA', '3210113112660102', 'Majalengka', '1966-12-31', 'L', 'Islam', 'Dusun Pahing RT 003 RW 004 Desa Andir Kec. Jatiwangi', NULL, 5, NULL, 88, '-', 'Mantan Kepala Desa Andir Tahun 2002  s.d.  2007', 'HERMANA-2019_3210140006_1.jpg', 846),
(432, '2019', '3210', '3210050', '3210050014', '2', 'AHYANI', '3210052505610001', 'MAJALENGKA', '1961-05-25', 'L', 'Islam', 'BLOK RABU RT 012 RW 006 DESA CIKARACAK KEC. ARGAPURA', NULL, 5, NULL, 88, '', '', 'AHYANI-2019_3210050014_1.jpg', 880),
(435, '2019', '3210', '3210200', '3210200004', '2', 'EENG TAAM', '3210160304770141', 'MAJALENGKA', '1977-04-03', 'L', 'Islam', 'BLOK REBO RT.004 RW.004 DESA BEUSI KECAMATAN LIGUNG KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'EENG_TAAM-2019_3210200004_1.jpg', 276),
(436, '2019', '3210', '3210050', '3210050014', '3', 'U. SANUDIN', '3210051602590001', 'MAJALENGKA', '1959-02-16', 'L', 'Islam', 'BLOK RABU RT 011 RW 006 DESA CIKARACAK KEC. ARGAPURA', NULL, 8, NULL, 4, '', '', 'U__SANUDIN-2019_3210050014_1.jpg', 598),
(438, '2019', '3210', '3210070', '3210070003', '1', 'HASAN SUNARTO', '3210070706710041', 'MAJALENGKA', '1971-06-07', 'L', 'Islam', 'BLOK AHAD RT 10 RW 03', NULL, 5, NULL, 88, '', '1. ANGGOTA BPD PERIODE 2012 - -2019\r\n2. KETUA KELOMPOK TANI MEKARJAYA LAKSANA', 'HASAN_SUNARTO-2019_3210070003_1.png', 1230),
(439, '2019', '3210', '3210160', '3210160003', '2', 'AMIN MULYANA', '3210182301640001', 'MAJALENGKA', '1964-01-23', 'L', 'Islam', 'BLOK PAMARON RT 004 RW 002 DESA JATIPAMOR KECAMATAN PANYINGKIRAN', NULL, 5, NULL, 85, '1. ANGGOTA KARANG TARUNA\r\n2. ANGGOTA BPD TAHUN 2007 - 2009', '1. KONSORSIUM HUTAMA YALA TAHUN 1994 - 1996\r\n2. KONSORSIUM YALA HUTAMA TAHUN 1996 - 1997', 'AMIN_MULYANA-2019_3210160003_2.jpg', 1194),
(440, '2019', '3210', '3210160', '3210160003', '1', 'YEYET SETIAWATI', '3210184705640021', 'MAJALENGKA', '1964-05-07', 'P', 'Islam', 'BLOK PAMARON RT 004 RW 002 DESA JATIPAMOR KECAMATAN PANYINGKIRAN', NULL, 5, NULL, 2, '1. ANGGOTA KARANG TARUNA\r\n2. TP.PKK DESA', '', 'YEYET_SETIAWATI-2019_3210160003_1.jpg', 75),
(441, '2019', '3210', '3210010', '3210010011', '1', 'KARMIN', '3210011010600021', 'MAJALENGKA, 14 MEI 1963', '1963-05-14', 'L', 'Islam', 'BLOK CIBIRU RT 004 RW 003 DESA SINARGALIH', NULL, 4, NULL, 88, '', '', 'KARMIN-2019_3210010011_1.jpg', 784),
(442, '2019', '3210', '3210010', '3210010011', '2', 'SUSWANA', '3210012810600041', 'MAJALENGKA, 28 OKTOBER 1960', '1960-10-28', 'L', 'Islam', 'GUNUNG SEUREUH RT 001 RW 005 DESA SINARGALIH', NULL, 5, NULL, 4, '', '', 'SUSWANA-2019_3210010011_1.jpg', 1699),
(443, '2019', '3210', '3210010', '3210010011', '3', 'TATANG SUJONO', '3210011010680121', 'MAJALENGKA, 10 OKTOBER 1968', '1968-10-10', 'L', 'Islam', 'PANYALAHAN RT 001 RW 004 DESA SINARGALIH', NULL, 8, NULL, 88, '', '', 'TATANG_SUJONO-2019_3210010011_1.jpg', 265),
(446, '2019', '3210', '3210010', '3210010019', '1', 'KAYUMAH', '3210014107790241', 'MAJALENGKA, 22 JULI 1981', '1981-07-22', 'P', 'Islam', 'CISIMPUR RT 002 RW 004 DESA CISALAK', NULL, 4, NULL, 88, '', '', 'KAYUMAH-2019_3210010019_1.jpg', 41),
(447, '2019', '3210', '3210180', '3210180014', '1', 'LUKMAN HERUDIN', '3210171911870041', 'MAJALENGKA', '1987-11-19', 'L', 'Islam', 'Dusun Kiaradangkak RT. 001 RW. 001 Desa Sahbandar Kecamatan Kertajati Kabupaten Majalengka', NULL, 4, NULL, 88, '', '', 'LUKMAN_HAERUDIN-2019_3210180014_3.jpg', 273),
(448, '2019', '3210', '3210100', '3210100006', '1', 'KUSNADI', '3210092004720061', 'MAJALENGKA', '1972-10-20', 'L', 'Islam', 'BLOK DESA RT. 004 RW. 002 DESA SADOMAS KECAMATAN RAJAGALUH\r\n KABUPATEN MAJALENGKA PROVINSI JAWA BARAT', NULL, 4, NULL, 86, '', '', 'KUSNADI-2019_3210100006_1.jpg', 619),
(449, '2019', '3210', '3210100', '3210100001', '1', 'SULAEMAN HIDAYAT', '3210091207720001', 'MAJALENGKA', '1972-10-12', 'L', 'Islam', 'BLOK KAMIS RT. 007 RW. 004 DESA PAJAJAR KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVINSI JAWA BARAT', NULL, 8, NULL, 88, '', '', 'SULAEMAN_HIDAYAT-2019_3210100001_1.jpg', 418),
(450, '2019', '3210', '3210100', '3210100001', '2', 'PAUNG', '3210162810710001', 'MAJALENGKA', '1971-10-28', 'L', 'Islam', 'BLOK RABU RT. 005 RW. 003 DESA PAJAJAR KECAMATAN RAJAGALUH\r\nKABUPATEN MAJALENGKA PROVISI JAWA BARAT', NULL, 4, NULL, 88, '', '', 'PAUNG-2019_3210100001_1.jpg', 1517),
(451, '2019', '3210', '3210041', '3210041002', '2', 'IRPAN', '3210221503660041', 'Majalengka', '1966-11-28', 'L', 'Islam', 'Desa Hegarmanah', NULL, 5, NULL, 88, '', '', 'IRPAN-2019_3210041002_2.jpg', 476),
(453, '2019', '3210', '3210010', '3210010010', '1', 'SADELI', '321001070260001', 'MAJALENGKA, 7 FEBRUARI 1963', '1963-02-07', 'L', 'Islam', 'JAMILEGA RT 012 RW 003', NULL, 5, NULL, 85, '', '', 'SADELI-2019_3210010010_1.jpg', 737),
(454, '2019', '3210', '3210010', '3210010010', '2', 'UJANG MASTUR, SH', '3210010203710102', 'MAJALENGKA, 2 MARET 1971', '1971-03-02', 'L', 'Islam', 'BLOK CIKULUWUT RT 005 RW 002 DESA MEKARMULYA', NULL, 8, NULL, 88, '', '', 'UJANG_MASTUR__SH-2019_3210010010_1.JPG', 1056),
(455, '2019', '3210', '3210140', '3210140001', '2', 'ACEP SARIPUDIN', '3210111508660041', 'Majalengka', '1966-08-15', 'L', 'Islam', 'Dusun Yudawacana RT 011 RW 006  Desa Pinangraja Kec.  Jatiwangi', NULL, 5, NULL, 88, '-', 'Incumbent', 'ACEP_SARIPUDIN-2019_3210140001_1.jpg', 1504),
(456, '2019', '3210', '3210140', '3210140001', '1', 'H.  RASIDI', '3210111108680001', 'Majalengka', '1969-08-11', 'L', 'Islam', 'Dusun Sinduastra RT 003 RW 002 Desa Pinangraja Kec. Jatiwangi', NULL, 5, NULL, 88, '-', '-', 'RASIDI-2019_3210140001_1.jpg', 845),
(458, '2019', '3210', '3210010', '3210010018', '3', 'AID SARIP HIDAYAT, S.Pd', '3210011002630001', 'SUMEDANG/ 10 FEBRUARI 1963', '1963-02-10', 'L', 'Islam', 'SIMPUR RT 002 RW 002 DESA DAYEUHWANGI', NULL, 8, NULL, 5, '', '', 'AID_SARIP_HIDAYAT-2019_3210010018_1.jpg', 195),
(459, '2019', '3210', '3210010', '3210010018', '2', 'DIHYUM', '3210010404600041', 'MAJALENGKA/ 4 APRIL 1960', '1960-04-04', 'L', 'Islam', 'SIMPUR RT 003 RW 002 DESA DAYEUHWANGI', NULL, 4, NULL, 86, '', '', 'DIHYUM-2019_3210010018_1.jpg', 694);
INSERT INTO `tbl_calon` (`id`, `thn_pemilihan`, `kdkab`, `kdkec`, `kddesa`, `nourut`, `nama`, `nik`, `tmp_lahir`, `tgl_lahir`, `kelamin`, `agama`, `alamat1`, `alamat2`, `id_pendidikan`, `pendidikan`, `id_pekerjaan`, `organisasi`, `keterangan`, `photo`, `s_hasil`) VALUES
(460, '2019', '3210', '3210010', '3210010018', '1', 'ATIK WYUNINGSIH', '2171066705800001', 'BATAM/ 27 MEI 1980', '1980-05-27', 'P', 'Islam', 'JL. SILIWANGI NO 41-43 RT 003 RW 005 DESA BANTARUJEG KEC. BANTARUJEG', NULL, 8, NULL, 2, '', '', 'ATIK_WYUNINGSIH-2019_3210010018_1.jpg', 816),
(461, '2019', '3210', '3210010', '3210010014', '1', 'ADENG RAMLI, S.Ag', '3210010203600022', 'MAJALENGKA/2 MARET 1960', '1960-03-02', 'L', 'Islam', 'BLOK KARANGANYAR RT 006 RW 002 DESA KEPUH', NULL, 8, NULL, 5, '', '', 'ADENG_RAMLI__S_AG-2019_3210010014_1.jpg', 880),
(462, '2019', '3210', '3210180', '3210180005', '2', 'RIMA MULYANI, SE', '', 'BANDUNG', '1990-11-20', 'P', 'Islam', 'Blok Desa RT. 008 RW. 001 Desa Kertawinangun Kecamatan Kertajati Kabupaten Majalengka', NULL, 8, NULL, 2, '', '', 'RIMA_MULYANI__SE-2019_3210180005_1.jpg', 278),
(465, '2019', '3210', '3210010', '3210010014', '3', 'YAYA', '3601140506670004', 'MAJALENGKA/5 JUNI 1967', '1972-06-05', 'L', 'Islam', 'KAMPUNG PASAR SABUT RT 005 RW 003 DESA SINDANG HAYU KEC. SAKETI KAB. PANDEGLANG', NULL, 4, NULL, 88, '', '', 'YAYA-2019_3210010014_1.jpg', 697),
(466, '2019', '3210', '3210010', '3210010014', '2', 'JAJANG SAEPUDIN, A.Ma', '3210010905720001', 'MAJALENGKA/9 MEI 1972', '1972-05-09', 'L', 'Islam', 'BLOK KARANG ANYAR RT 005 RW 002 DESA KEPUH', NULL, 7, NULL, 18, '', '', 'JAJANG_SAEPUDIN__A_MA-2019_3210010014_1.jpg', 541),
(468, '2019', '3210', '3210041', '3210041001', '1', 'NONO SUTISNA', '3210221802630001', 'Majalengka', '1963-02-18', 'L', 'Islam', 'Genteng', NULL, 4, NULL, 88, '', '', 'NONO_SUTISNA-2019_3210041001_1.jpg', 1089),
(472, '2019', '3210', '3210041', '3210041001', '2', 'CUCU CANDRAWATI', '3210225507710021', 'Majalengka', '1971-07-13', 'P', 'Islam', 'Genteng', NULL, 5, NULL, 2, '', '', 'CUCU_CANDRAWATI-2019_3210041001_3.jpg', 88),
(473, '2019', '3210', '3210130', '3210130009', '1', 'UMAR', '3210190202750081', 'MAJALENGKA', '1975-02-02', 'L', 'Islam', 'BLOK PANGARANGSARI RT.005 RW.003 DESA WARINGIN KECAMATAN PALASAH', NULL, 5, NULL, 86, '', '', 'UMAR-2019_3210130009_1.jpg', 3758),
(474, '2019', '3210', '3210130', '3210130009', '2', 'NENI NURNAENI', '3201124308800006', 'MAJALENGKA', '1980-08-03', 'L', 'Islam', 'BLOK PANGARANGSARI RT.005 RW.003 DESA WARINGIN KECAMATAN PALASAH', NULL, 5, NULL, 2, '', '', 'NENI_NURNAENI-2019_3210130009_2.jpg', 393),
(475, '2019', '3210', '3210050', '3210050013', '2', 'ADE MAMAT BUDIANTO', '3210050604800101', 'MAJALENGKA', '1980-04-09', 'L', 'Islam', 'BLOK RABU RT 004 RW 002 DESA HEUBEULISUK KEC. ARGAPURA KAB. MAJALENGKA', NULL, 5, NULL, 88, '', '', 'ADE_MAMAT_BUDIANTO-2019_3210050013_1.jpg', 775),
(476, '2019', '3210', '3210050', '3210050013', '1', 'IDAH HADIJAH', '3210055200284006', 'MAJALENGKA', '1984-02-12', 'P', 'Islam', 'BLOK RABU RT 004 RW 002 DESA HEUBEULISUK KEC. ARGAPURA', NULL, 5, NULL, 2, '', '', 'IDAH_HADIJAH-2019_3210050013_1.jpg', 17),
(479, '2019', '3210', '3210010', '3210010003', '2', 'MUSTARI', '3210010408540001', 'MAJALENGKA/4 AGUSTUS 1954', '1954-08-04', 'L', 'Islam', 'RT 004 RW 001 DESA BANGBAYANG', NULL, 4, NULL, 88, '', '', 'MUSTARI-2019_3210010003_1.jpg', 463),
(480, '2019', '3210', '3210010', '3210010003', '1', 'NUNU NUGRAHA', '3210010706720021', 'MAJALENGKA/4 NOPEMBER 1969', '1969-11-04', 'L', 'Islam', 'CIMINDI RT 001 RW 002 DESA BANGBAYANG', NULL, 5, NULL, 86, '', '', 'NUNU_NUGRAHA-2019_3210010003_1.jpg', 657),
(483, '2019', '3210', '3210040', '3210040014', '3', 'HENDRAYANA', '3210041507730101', 'MAJALENGKA', '1973-07-15', 'L', 'Islam', 'BLOK. CIGOWONG RT. 003  RW. 002 DESA GANEAS KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'HENDRAYANA-2019_3210040014_3.jpg', 401),
(484, '2019', '3210', '3210040', '3210040014', '2', 'ABUNG ABUBAKAR', '3210043009730001', 'MAJALENGKA', '1973-09-30', 'L', 'Islam', 'BLOK. CIGOWONG RT. 002 RW. 001 DESA GANEAS KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 5, NULL, 5, '-  PENJABAT KEPALA DESA GANEAS', '-', 'ABUNG_ABUBAKAR-2019_3210040014_2.jpg', 287),
(485, '2019', '3210', '3210040', '3210040014', '1', 'ABAS SAMBAS NUR', '320041406570321', 'MAJALENGKA', '1957-06-15', 'L', 'Islam', 'BLOK. CIGOWONG RT.004  RW. 002 DESA GANEAS KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '-  MANTAN SEKRETARIS DESA GANEAS', '-', 'ABAS_SAMBAS_NUR-2019_3210040014_1.jpg', 613),
(486, '2019', '3210', '3210040', '3210040004', '2', 'ACHMAD SYAHRIAL', '3210041804690001', 'PANGKALPINANG', '1969-04-18', 'L', 'Islam', 'BLOK. DESA RT. 006  RW. 002 DESA JATIPAMOR KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 5, NULL, 86, '-  KETUA BPD DESA JATIPAMOR PERIODE TAHUN 2009 S/D 2013\r\n-  KEPALA DESA JATIPAMOR PERIODE TAHUN 2014 S/D 2019 ', '-', 'ACHMAD_SYAHRIAL-2019_3210040004_2.jpg', 933),
(487, '2019', '3210', '3210040', '3210040004', '1', 'UNDANG KUSNAEDI', '3210041002720041', 'GARUT', '1972-02-05', 'L', 'Islam', 'BLOK. DESA RT. 006  RW. 002 DESA JATIPAMOR KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 4, NULL, 88, '-', '-', 'UNDANG_KUSNAEDI-2019_3210040004_1.jpg', 1078),
(488, '2019', '3210', '3210040', '3210040002', '2', 'AGUS SOPAR SODIK. S.IP', '3210042105790081', 'MAJALENGKA', '1979-05-21', 'L', 'Islam', 'BLOK. CIBEUREUM KALER RT. 008  RW. 004 DESA CIBEUREUM  KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 8, NULL, 86, '-  PERANGKAT DESA\r\n-  KEPALA DESA PERIODE TAHUN 2014 S/D 2019', '-', 'AGUS_SOPAR_SODIK__S_IP-2019_3210040002_2.jpg', 959),
(489, '2019', '3210', '3210040', '3210040002', '1', 'ASEP NANANG PERMANA. S.Pd', '321003007870041', 'MAJALENGKA', '1987-07-30', 'L', 'Islam', 'BLOK. DESA  RT. 007  RW. 004  DESA CIBEUREUM KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 8, NULL, 18, '-', '-', 'ASEP_NANANG_PERMANA__S_PD-2019_3210040002_1.jpg', 21),
(490, '2019', '3210', '3210040', '3210040017', '2', 'ANDRIYANA', '3210042906840001', 'MAJALENGKA', '1984-06-29', 'L', 'Islam', 'BLOK. SADAHURIP RT. 001  RW. 001  DESA MEKARHURIP KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '-  PENGURUS KARANG TARUNA', '-', 'ANDRIYANA-2019_3210040017_2.jpg', 802),
(491, '2019', '3210', '3210040', '3210040017', '1', 'DADI KUSWANDI', '3210040201830001', 'MAJALENGKA', '1983-01-02', 'L', 'Islam', 'BLOK. SADAHURIP RT. 001  RW. 001  DESA MEKARHURIP KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 5, NULL, 86, '-  PERANGKAT DESA\r\n-  KEPALA DESA PERIODE TAHUN 2014 S/D 2019', '-', 'DADI_KUSWANDI-2019_3210040017_1.jpg', 327),
(492, '2019', '3210', '3210040', '3210040008', '2', 'CUCU SUNANTA', '3210043004750041', 'MAJALENGKA', '1975-04-30', 'L', 'Islam', 'BLOK. SUKAMANDI RT.005  RW. 001 DESA MEKARRAHARJA KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'CUCU_SUNANTA-2019_3210040008_2.jpg', 1345),
(493, '2019', '3210', '3210040', '3210040008', '1', 'ARIF RAHMAN. SE', '3210042201670001', 'BANDUNG', '1967-01-22', 'L', 'Islam', 'BLOK. CIKONDANG RT. 004  RW. 003  DESA MEKARRAHARJA KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 8, NULL, 86, '-  PENGURUS FKPPI\r\n-  PENGURUS PRAMUKA\r\n-  KEPALA DESA PERIODE TAHUN 2014 S/D 2019', '-', 'ARIF_RAHMAN__SE-2019_3210040008_1.jpg', 904),
(494, '2019', '3210', '3210130', '3210130006', '1', 'KUSMA', '3276020811720002', 'MAJALENGKA', '1972-11-08', 'L', 'Islam', 'DUSUN SUKAMANAH RT.003 RW.002 DESA BUNIWANGI KECAMATAN PALASAH', NULL, 5, NULL, 86, '', '', 'KUSMA-2019_3210130006_1.png', 519),
(495, '2019', '3210', '3210130', '3210130006', '2', 'KARMADI', '3210192505790021', 'MAJALENGKA', '1979-05-25', 'L', 'Islam', 'DUSUN SUKAASIH', NULL, 4, NULL, 88, '', '', 'KARMADI-2019_3210130006_2.png', 634),
(496, '2019', '3210', '3210130', '3210130006', '3', 'SAMSUL HANAN', '3210191004720081', 'MAJALENGKA', '1972-04-10', 'L', 'Islam', 'DUSUN SUKAASIH RT.002 RW.003 DESA BUNIWANGI KECAMATAN PALASAH', NULL, 5, NULL, 8, '', '', 'SAMSUL_HANAN-2019_3210130006_3.png', 510),
(497, '2019', '3210', '3210130', '3210130005', '2', 'WINANTA', '3275052202800018', 'MAJALENGKA', '1980-02-22', 'L', 'Islam', 'BLOK NEGLASARI RT.002 RW.002 DESA ENGGALWANGI KECAMATAN PALASAH', NULL, 4, NULL, 8, '', '', 'WINANTA-2019_3210130005_1.jpg', 536),
(498, '2019', '3210', '3210130', '3210130005', '1', 'ABIDIN', '3210190805750041', 'MAJALENGKA', '1975-05-08', 'L', 'Islam', 'BLOK NEGLASARI RT.002 RW.001 DESA ENGGALWANGI KECAMATAN PALASAH', NULL, 5, NULL, 86, '', '', 'ABIDIN-2019_3210130005_1.png', 684),
(499, '2019', '3210', '3210130', '3210130005', '3', 'SUHARJO', '3173080505800014', 'MAJALENGKA', '1980-05-05', 'L', 'Islam', 'DUSUN NEGLASARI RT.002 RW.002 DESA ENGGALWANGI KECAMATAN PALASAH', NULL, 5, NULL, 15, '', '', 'SUHARJO-2019_3210130005_1.png', 66),
(500, '2019', '3210', '3210130', '3210130005', '4', 'RUSDI', '3276031411800004', 'MAJALENGKA', '1980-11-14', 'L', 'Islam', 'BLOK NEGLASARI RT.004 RW.001 DESA ENGGALWANGI KECAMATAN PALASAH', NULL, 5, NULL, 15, '', '', 'RUSDI-2019_3210130005_1.jpg', 448),
(501, '2019', '3210', '3210050', '3210050014', '1', 'KARJA', '3210051109690021', 'MAJALENGKA', '1969-09-11', 'L', 'Islam', 'BLOK KAMIS RT 014 RW 007 DESA CIKARACAK KEC. ARGAPURA', NULL, 5, NULL, 9, '', '', 'KARJA-2019_3210050014_1.jpg', 605),
(502, '2019', '3210', '3210120', '3210120010', '3', 'RAHMAT KOSASIH', '3174100812680005', 'MAJALENGKA', '1968-12-08', 'L', 'Islam', 'BLOK KILALAWANG RT.001 RW.005 DESA HEULEUT KECAMATAN LEUWIMUNDING KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '', '', 'RAHMAT_KOSASIH-2019_3210120010_1.jpg', 1349),
(503, '2019', '3210', '3210120', '3210120010', '1', 'ANDRI SP', '3275032107790020', 'MAJALENGKA', '1979-07-21', 'L', 'Islam', 'BLOK KADATON RT.002 RW.001 DESA HEULEUT KECAMATAN LEUWIMUNDING KABUPATEN MAJALENGKA', NULL, 8, NULL, 88, '', '', 'ANDRI_SP-2019_3210120010_1.jpg', 1361),
(504, '2019', '3210', '3210120', '3210120010', '2', 'OPIK CHAEROPI, A.Md.', '3210100404800121', 'MAJALENGKA', '1980-04-04', 'L', 'Islam', 'BLOK KADATON RT.001 RW.001 DESA HEULEUT KECAMATAN LEUWIMUNDING KABUPATEN MAJALENGKA', NULL, 7, NULL, 88, '', '', 'OPIK_CHAEROPI__A_MD_-2019_3210120010_1.jpg', 14),
(508, '2019', '3210', '3210040', '3210040009', '2', 'INDRI ANDIYANI. SE', '3210045104940001', 'MAJALENGKA', '1994-04-11', 'P', 'Islam', 'BLOK. PASAPEN RT. 015  RW. 005  DESA TALAGAKULON KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 8, NULL, 18, '-', '-', 'INDRI_ANDIYANI__SE-2019_3210040009_2.jpg', 282),
(510, '2019', '3210', '3210040', '3210040009', '1', 'MUMUD MUJAHIDIN SOLEH', '3210041506670602', 'MAJALENGKA', '1967-06-15', 'L', 'Islam', 'BLOK. PASAPEN  RT. 015  RW. 005 DESA TALAGKULON KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '-', '-', 'MUMUD_MUJAHIDIN_SOLEH-2019_3210040009_1.jpg', 2847),
(511, '2019', '3210', '3210041', '3210041005', '2', 'BEBEN KUSNADI,  S.Pd', '3210222206890021', 'Majalengka', '1989-08-22', 'L', 'Islam', 'Desa Darmalarang', NULL, 8, NULL, 88, '', '', 'BEBEN_KUSNADI___S_PD-2019_3210041005_2.jpg', 73),
(512, '2019', '3210', '3210040', '3210040012', '2', 'AGUS', '3210041712800141', 'MAJALENGKA', '1980-12-17', 'L', 'Islam', 'BLOK. LEGASARI KULON RT. 023  RW.006 DESA ARGASARI KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 5, NULL, 88, '-  PERUSAHAAN UMUM KERETA API\r\n-  PERUSAHAAN PERKREDITAN\r\n-  PERTANIAN', '-', 'AGUS-2019_3210040012_2.jpg', 491),
(513, '2019', '3210', '3210040', '3210040012', '1', 'H.PUPU SYARIFUDIN', '3210040207700002', 'MAJALENGKA', '1970-07-02', 'L', 'Islam', 'BLOK. CINENJO II RT. 016  RW. 004 DESA ARGASARI KECAMATAN TALAGA KABUPATEN MAJALENGKA', NULL, 5, NULL, 86, '-  KEPALA DESA ARGASARI PERIODE TAHUN 2008 S.D 2013\r\n-  KEPALA DESA ARGASARI PERIODE TAHUN 2014 S.D 2019', '-', 'H_PUPU_SYARIFUDIN-2019_3210040012_1.jpg', 1553),
(514, '2019', '3210', '3210091', '3210091002', '1', 'SUBAHAN', '', 'Majalengka', '1973-06-11', 'L', 'Islam', 'Garawastu', NULL, 4, NULL, 88, '', '', 'SUBAHAN-2019_3210091002_1.jpg', 699),
(515, '2019', '3210', '3210091', '3210091002', '2', 'DIKA HENDRIKA', '', 'Majalengka', '1994-07-01', 'L', 'Islam', 'Garawastu', NULL, 5, NULL, 15, '', '', 'DIKA_HENDRIKA-2019_3210091002_2.jpg', 505);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tbl_calon_extended`
-- (See below for the actual view)
--
CREATE TABLE `tbl_calon_extended` (
`id` int(11)
,`thn_pemilihan` varchar(4)
,`kdkab` varchar(4)
,`kdkec` varchar(7)
,`kddesa` varchar(10)
,`nourut` char(1)
,`nama` varchar(200)
,`nik` varchar(16)
,`tmp_lahir` varchar(50)
,`tgl_lahir` date
,`kelamin` char(1)
,`agama` varchar(20)
,`alamat1` varchar(200)
,`alamat2` varchar(200)
,`id_pendidikan` int(11)
,`pendidikan` varchar(50)
,`id_pekerjaan` int(11)
,`organisasi` text
,`keterangan` text
,`photo` text
,`s_hasil` int(11)
,`CALON1` int(11)
,`CALON2` int(11)
,`CALON3` int(11)
,`CALON4` int(11)
,`CALON5` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tbl_calon_terpilih`
-- (See below for the actual view)
--
CREATE TABLE `tbl_calon_terpilih` (
`thn_pemilihan` varchar(4)
,`kdkec` varchar(7)
,`nama_kec` varchar(30)
,`kddesa` varchar(10)
,`nama_desa` varchar(40)
,`nourut` char(1)
,`nama` varchar(200)
,`perolehan` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_desa_penyelenggara`
--

CREATE TABLE `tbl_desa_penyelenggara` (
  `id` int(11) NOT NULL,
  `kdkab` varchar(4) NOT NULL,
  `kdkec` varchar(7) NOT NULL,
  `kddesa` varchar(10) NOT NULL,
  `thn_pemilihan` char(4) NOT NULL,
  `dpt_l` int(11) NOT NULL,
  `dpt_p` int(11) NOT NULL,
  `dpt_jml` int(11) NOT NULL,
  `suratsuara` int(11) NOT NULL,
  `ssrusak` int(11) NOT NULL,
  `sssah` int(11) NOT NULL,
  `sstdksah` int(11) NOT NULL,
  `sstidakterpakai` int(11) NOT NULL,
  `ketua` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_desa_penyelenggara`
--

INSERT INTO `tbl_desa_penyelenggara` (`id`, `kdkab`, `kdkec`, `kddesa`, `thn_pemilihan`, `dpt_l`, `dpt_p`, `dpt_jml`, `suratsuara`, `ssrusak`, `sssah`, `sstdksah`, `sstidakterpakai`, `ketua`) VALUES
(1, '3210', '3210080', '3210080009', '2019', 1103, 1081, 2184, 2239, 0, 1906, 16, 317, 'Drs. SAPTARI, M.Pd'),
(2, '3210', '3210080', '3210080008', '2019', 1697, 1595, 3292, 3606, 0, 2815, 28, 763, 'DEDING E. KUSNADI'),
(3, '3210', '3210080', '3210080010', '2019', 1648, 1707, 3355, 3493, 0, 2743, 25, 725, 'AGUS MULYANTO'),
(4, '3210', '3210080', '3210080002', '2019', 1182, 1205, 2387, 2675, 0, 1935, 22, 718, 'YOYON MASYANTO'),
(6, '3210', '3210060', '3210060002', '2019', 1142, 1180, 2322, 2670, 0, 2066, 15, 589, 'H. USRI GANDI WIJAYA'),
(7, '3210', '3210060', '3210060017', '2019', 517, 506, 1023, 1123, 0, 883, 8, 232, 'H. EME SUTARMA'),
(8, '3210', '3210060', '3210060001', '2019', 1519, 1576, 3095, 3451, 0, 2249, 67, 1135, 'H. RIMALA, SH'),
(10, '3210', '3210060', '3210060009', '2019', 2223, 2135, 4358, 4885, 0, 3372, 73, 1440, 'DADANG SUDRAJAT, S.Pd.'),
(11, '3210', '3210060', '3210060014', '2019', 666, 649, 1315, 1596, 0, 980, 116, 500, 'Drs. H. ARIP RAHMAN, M.Pd'),
(12, '3210', '3210060', '3210060015', '2019', 1475, 1516, 2991, 3453, 0, 2372, 33, 1048, 'Drs. ANANG'),
(14, '3210', '3210040', '3210040002', '2019', 711, 691, 1402, 1432, 0, 980, 10, 442, 'KAOKAB. S.Pd.I'),
(16, '3210', '3210040', '3210040004', '2019', 1358, 1381, 2739, 2808, 0, 2011, 24, 773, 'OPIK TAOPOK. S.Pd., MM'),
(17, '3210', '3210040', '3210040009', '2019', 2138, 2205, 4343, 4437, 0, 3129, 160, 1148, 'H. DIDING SAEPUDIN. S.Sos'),
(18, '3210', '3210040', '3210040014', '2019', 859, 838, 1697, 1733, 0, 1301, 29, 403, 'AANG GUNAWAN'),
(19, '3210', '3210040', '3210040008', '2019', 1397, 1396, 2793, 2863, 0, 2249, 29, 585, 'ODANG SUHIAR'),
(24, '3210', '3210110', '3210110010', '2019', 1859, 1804, 3663, 3858, 0, 3257, 57, 544, 'SUDARYA'),
(30, '3210', '3210040', '3210040017', '2019', 638, 620, 1258, 1290, 0, 1129, 13, 148, 'UJANG ADE SUKMANA'),
(31, '3210', '3210210', '3210210004', '2019', 521, 512, 1033, 1084, 0, 911, 6, 167, 'ABDUL ROSYAD'),
(32, '3210', '3210021', '3210021004', '2019', 1912, 1889, 3801, 3935, 0, 2988, 30, 917, 'Drs. TATANG'),
(33, '3210', '3210021', '3210021003', '2019', 2224, 2206, 4430, 4499, 0, 3588, 18, 893, 'MEMET SALAMET, S.Pd'),
(34, '3210', '3210210', '3210210001', '2019', 1860, 1869, 3729, 3915, 0, 2823, 29, 1063, 'RUDI HARTONO'),
(35, '3210', '3210070', '3210070003', '2019', 1617, 1676, 3293, 3446, 0, 2361, 337, 748, 'DIDI KUSNADI'),
(36, '3210', '3210210', '3210210015', '2019', 753, 772, 1525, 1601, 0, 1162, 97, 342, 'SUMARNA'),
(38, '3210', '3210210', '3210210002', '2019', 2150, 2116, 4266, 4479, 0, 3391, 29, 1059, 'M. SHODIK ANSORI'),
(40, '3210', '3210210', '3210210012', '2019', 1311, 1334, 2645, 2777, 0, 2250, 22, 505, 'ASIMAN, S.Pd'),
(41, '3210', '3210210', '3210210008', '2019', 843, 817, 1660, 1743, 0, 1490, 14, 239, 'AGUS SETIAWAN'),
(42, '3210', '3210210', '3210210010', '2019', 1498, 1553, 3051, 3203, 0, 2380, 24, 799, 'A D I H'),
(43, '3210', '3210210', '3210210014', '2019', 805, 765, 1570, 1648, 0, 1298, 10, 340, 'AVIV OKTORA HUTABRI, S.Pd'),
(44, '3210', '3210200', '3210200018', '2019', 770, 829, 1599, 1778, 0, 1175, 57, 546, 'DANU MIHARJA'),
(45, '3210', '3210200', '3210200002', '2019', 1448, 1517, 2965, 3156, 0, 2442, 12, 702, 'H. TOTO SUPARTA, S.Pd'),
(46, '3210', '3210200', '3210200008', '2019', 1157, 1282, 2439, 2734, 0, 2005, 14, 715, 'MOH. SHOIM'),
(47, '3210', '3210200', '3210200004', '2019', 1906, 1969, 3875, 4099, 0, 3353, 43, 703, 'IDING SUKENDAR, S.Pd'),
(48, '3210', '3210151', '3210151006', '2019', 2678, 2658, 5336, 5602, 0, 4336, 59, 1207, 'DEDI SUPRIADI'),
(49, '3210', '3210151', '3210151004', '2019', 1925, 1985, 3910, 4105, 0, 3124, 24, 957, 'SUTIRA'),
(50, '3210', '3210151', '3210151010', '2019', 1047, 1132, 2179, 2287, 0, 1806, 20, 461, 'IMAM BAGUS PRAYITNO, ST'),
(51, '3210', '3210151', '3210151002', '2019', 1638, 1738, 3376, 3544, 0, 2960, 22, 562, 'BADRUZAMAN'),
(52, '3210', '3210010', '3210010007', '2019', 1664, 1682, 3346, 3492, 0, 2286, 346, 860, 'ENDANG LUKMAN'),
(53, '3210', '3210150', '3210150014', '2019', 1900, 1951, 3851, 4025, 0, 3422, 22, 581, 'Drs YAT WAHDIAT R'),
(55, '3210', '3210010', '3210010008', '2019', 1360, 1351, 2711, 2817, 0, 1923, 29, 865, 'AAN SUGANDI, S.Pd'),
(56, '3210', '3210010', '3210010017', '2019', 988, 1011, 1999, 2088, 0, 1647, 26, 415, 'AHMAD SUMINTA'),
(57, '3210', '3210010', '3210010019', '2019', 691, 667, 1358, 1439, 0, 1015, 19, 405, 'SURYADI'),
(58, '3210', '3210010', '3210010015', '2019', 1520, 1477, 2997, 3156, 0, 2335, 30, 791, 'OTONG'),
(59, '3210', '3210050', '3210050004', '2019', 1262, 1257, 2519, 2691, 0, 2007, 58, 626, 'ROSAD '),
(60, '3210', '3210050', '3210050012', '2019', 739, 758, 1497, 1567, 0, 1277, 10, 280, 'JEJE JUBANA, S.Pd'),
(61, '3210', '3210050', '3210050008', '2019', 961, 982, 1943, 2054, 0, 1798, 30, 226, 'IYAN NUGRAHA'),
(62, '3210', '3210050', '3210050003', '2019', 827, 858, 1685, 1768, 0, 1522, 12, 234, 'MASAD NATADIPRAJA, S.Ip'),
(63, '3210', '3210180', '3210180005', '2019', 1169, 1260, 2429, 2533, 0, 1989, 115, 429, 'H. JAENUDIN, S.Pd'),
(64, '3210', '3210180', '3210180011', '2019', 781, 860, 1641, 1705, 0, 1370, 173, 162, 'OBAD SOLEHUDIN, S.Ag'),
(65, '3210', '3210180', '3210180013', '2019', 821, 842, 1663, 1697, 0, 1559, 14, 124, 'RUSTAMA'),
(66, '3210', '3210180', '3210180006', '2019', 1944, 2080, 4024, 4148, 0, 3608, 30, 510, 'H. ONDI SUKONDI'),
(67, '3210', '3210180', '3210180007', '2019', 1579, 1703, 3282, 3428, 0, 2907, 13, 508, 'NONO SENO KURNIAN, SH'),
(68, '3210', '3210180', '3210180010', '2019', 1458, 1606, 3064, 3259, 0, 2101, 274, 884, 'EDI, S.Pd'),
(69, '3210', '3210180', '3210180002', '2019', 1201, 1228, 2429, 2511, 0, 2146, 10, 355, 'O. KUSNADI'),
(70, '3210', '3210180', '3210180001', '2019', 2357, 2357, 4714, 4715, 0, 3937, 44, 734, 'SACA'),
(71, '3210', '3210180', '3210180014', '2019', 531, 553, 1084, 1407, 0, 899, 2, 506, 'SUDARMAN'),
(72, '3210', '3210050', '3210050007', '2019', 1236, 1271, 2507, 2628, 0, 2261, 19, 348, 'MAMAN RAHMANA'),
(73, '3210', '3210021', '3210021011', '2019', 619, 603, 1222, 1283, 0, 788, 33, 462, 'Drs. MUGNI HERYANA'),
(74, '3210', '3210010', '3210010014', '2019', 1397, 1278, 2675, 2755, 0, 2118, 33, 604, 'YUSUP SUPENDI'),
(75, '3210', '3210010', '3210010004', '2019', 550, 547, 1097, 1128, 0, 872, 5, 251, 'M. AGUS SALIM'),
(77, '3210', '3210031', '3210031001', '2019', 1181, 1213, 2394, 2468, 0, 1871, 8, 589, 'SUKRA'),
(78, '3210', '3210031', '3210031003', '2019', 1104, 1082, 2186, 2261, 0, 1725, 14, 522, 'HENDRA, S.Pd.'),
(79, '3210', '3210031', '3210031004', '2019', 2096, 2116, 4212, 4383, 0, 3247, 29, 1107, 'AGUS SAEPUL MALIK, S.Sos,. S.Pd.'),
(80, '3210', '3210031', '3210031002', '2019', 1172, 1182, 2354, 2507, 0, 1901, 33, 573, 'ADE SHOBARUDIN'),
(81, '3210', '3210031', '3210031008', '2019', 818, 867, 1685, 1872, 0, 1347, 12, 513, 'MISBAH, S.Ag.,M.Pd.'),
(82, '3210', '3210031', '3210031010', '2019', 1331, 1273, 2604, 2703, 0, 2007, 13, 683, 'SUPENDI, S.Pd.'),
(83, '3210', '3210031', '3210031011', '2019', 918, 894, 1812, 1905, 0, 1470, 11, 424, 'JAENAL ARIPIN, S.Pd.'),
(84, '3210', '3210140', '3210140007', '2019', 1531, 1555, 3086, 3456, 0, 2448, 57, 951, 'Drs. DEDI SUPRIYADI'),
(85, '3210', '3210140', '3210140005', '2019', 1851, 1835, 3686, 4051, 0, 3105, 21, 925, 'RAGUNG,  S. Pd. '),
(86, '3210', '3210140', '3210140016', '2019', 1589, 1656, 3245, 3587, 0, 2738, 35, 814, 'WAWAN TARWANTO'),
(87, '3210', '3210140', '3210140010', '2019', 1363, 1374, 2737, 3005, 0, 2125, 57, 823, 'H. MASAGUS DUNGCIK,  S. Pd., M. Si. '),
(88, '3210', '3210140', '3210140012', '2019', 1776, 1782, 3558, 3853, 0, 3141, 36, 676, 'LILI SHOBARI,  S. Pd.'),
(89, '3210', '3210140', '3210140008', '2019', 3446, 3427, 6873, 7487, 0, 5283, 160, 2044, 'SUBANDI'),
(90, '3210', '3210140', '3210140006', '2019', 1812, 1810, 3622, 4137, 0, 2547, 554, 1036, 'Drs. H. DADAN FAUZAN'),
(91, '3210', '3210050', '3210050006', '2019', 1311, 1294, 2605, 2740, 0, 1975, 142, 623, 'ABDUL MISKAD'),
(92, '3210', '3210070', '3210070014', '2019', 1382, 1435, 2817, 2983, 0, 2487, 28, 468, 'ABDUL AJID'),
(93, '3210', '3210050', '3210050014', '2019', 1260, 1256, 2516, 2739, 0, 2083, 19, 637, 'DEDE BUDIARTO. S.Pd'),
(94, '3210', '3210041', '3210041001', '2019', 882, 890, 1772, 1770, 0, 1177, 76, 517, 'M. NASIR'),
(95, '3210', '3210041', '3210041002', '2019', 560, 550, 1110, 1110, 0, 996, 4, 110, 'H. M. TIYO, S.Ag'),
(96, '3210', '3210041', '3210041006', '2019', 993, 996, 1989, 1995, 0, 1809, 33, 153, 'KOSI KOSASIH, S.Pd'),
(97, '3210', '3210041', '3210041005', '2019', 1119, 1162, 2281, 2279, 0, 1616, 76, 587, 'NANDANG SONJAYA'),
(98, '3210', '3210030', '3210030018', '2019', 1598, 1620, 3218, 3345, 0, 2272, 186, 887, 'PRIATNA'),
(99, '3210', '3210140', '3210140001', '2019', 1488, 1513, 3001, 3292, 0, 2349, 25, 918, 'H. SOEBANA, BBA'),
(100, '3210', '3210010', '3210010003', '2019', 800, 766, 1566, 1628, 0, 1120, 21, 487, 'AHMAD SOPYAN'),
(101, '3210', '3210030', '3210030025', '2019', 1924, 1956, 3880, 4282, 0, 2904, 21, 1357, 'WAWAN MULYAWAN, S.Pd.i'),
(102, '3210', '3210030', '3210030015', '2019', 1989, 1955, 3944, 4229, 0, 3162, 33, 1034, 'YUDI SOMANTRI, S.Pd'),
(103, '3210', '3210030', '3210030026', '2019', 530, 566, 1096, 1150, 0, 934, 10, 206, 'SUDARTONO, S.Pd'),
(104, '3210', '3210030', '3210030014', '2019', 808, 845, 1653, 1725, 0, 1460, 7, 258, 'SUPRIATMAN, S.Pd, M.Si'),
(105, '3210', '3210030', '3210030023', '2019', 542, 539, 1081, 1136, 0, 716, 134, 231, 'DADI SUPRIYADI'),
(106, '3210', '3210030', '3210030022', '2019', 2001, 2006, 4007, 4189, 0, 3135, 19, 1035, 'DEDE SUTARMAN, S.Pd, M.Pd'),
(107, '3210', '3210030', '3210030024', '2019', 1395, 1375, 2770, 3021, 0, 2284, 23, 714, 'MAMAT, S.Pd'),
(108, '3210', '3210091', '3210091001', '2019', 414, 451, 865, 888, 0, 710, 11, 167, 'MAMAN HADIMAN'),
(109, '3210', '3210091', '3210091004', '2019', 988, 987, 1975, 2022, 0, 1637, 15, 370, 'H.  HUMED,  S. Ag. '),
(110, '3210', '3210050', '3210050013', '2019', 508, 531, 1039, 1102, 0, 792, 5, 305, 'ABDUL YUSUP, S.Ag'),
(111, '3210', '3210040', '3210040012', '2019', 1296, 1308, 2604, 2669, 0, 2044, 28, 597, 'M. UCUP SUPRIYADIN. S.Pd'),
(112, '3210', '3210010', '3210010010', '2019', 1266, 1175, 2441, 2582, 0, 1793, 13, 776, 'H. SAHDI'),
(113, '3210', '3210130', '3210130009', '2019', 2978, 3066, 6044, 6044, 0, 4151, 72, 1821, 'RUSMANA.SH'),
(118, '3210', '3210130', '3210130005', '2019', 1258, 1261, 2519, 2519, 0, 1734, 229, 556, 'HENDRI SUKENDRI .S.Pd'),
(119, '3210', '3210130', '3210130013', '2019', 1095, 1135, 2230, 2694, 0, 1824, 33, 837, 'DRS. SARBINI'),
(120, '3210', '3210100', '3210100010', '2019', 1664, 1614, 3278, 3278, 0, 2811, 20, 447, 'Muchamad Husni Thamrin'),
(121, '3210', '3210100', '3210100001', '2019', 1126, 1124, 2250, 2250, 0, 1935, 23, 292, 'Didi Supriadi'),
(122, '3210', '3210100', '3210100011', '2019', 1424, 1402, 2826, 2826, 0, 2221, 16, 589, 'Nenca, S,Pd., M.Pd'),
(123, '3210', '3210100', '3210100007', '2019', 1770, 1723, 3493, 3493, 0, 2601, 144, 748, 'Asep Saepullah'),
(124, '3210', '3210100', '3210100006', '2019', 715, 713, 1428, 1428, 0, 1161, 31, 236, 'Juju Juhana'),
(125, '3210', '3210010', '3210010011', '2019', 1911, 1766, 3677, 3846, 0, 2748, 21, 1077, 'OO MARNO SUMARNA'),
(126, '3210', '3210150', '3210150018', '2019', 2508, 2596, 5104, 5568, 0, 4496, 33, 1039, 'EMOD MUHAMAD'),
(127, '3210', '3210150', '3210150012', '2019', 1888, 1899, 3787, 3970, 0, 2487, 382, 1101, 'ASEP II TAPTAJANI'),
(128, '3210', '3210170', '3210170004', '2019', 4245, 4235, 8480, 9104, 0, 5997, 62, 3045, 'MULYA NUGRAHA'),
(129, '3210', '3210160', '3210160003', '2019', 1298, 1298, 2596, 2857, 0, 1269, 427, 1161, 'MUAZ,S.PD,M.Si'),
(130, '3210', '3210160', '3210160007', '2019', 1920, 1875, 3795, 4175, 0, 3090, 21, 1064, 'ACENG QUSAERI'),
(131, '3210', '3210120', '3210120007', '2019', 1563, 1575, 3138, 3290, 0, 2543, 31, 716, 'HENDRA SUHENDRA, S.Pd.'),
(132, '3210', '3210120', '3210120005', '2019', 2158, 2023, 4181, 4400, 0, 2887, 67, 1446, 'GANDA DJUMHARI HS,  S.Pd.'),
(133, '3210', '3210120', '3210120012', '2019', 2025, 2147, 4172, 4370, 0, 3438, 49, 883, 'Ir. H. IMAN SUHERMAN'),
(134, '3210', '3210090', '3210090017', '2019', 1664, 1694, 3358, 3678, 0, 2576, 27, 1075, 'SANJA, SP'),
(135, '3210', '3210090', '3210090011', '2019', 1436, 1397, 2833, 3059, 0, 2167, 30, 862, 'H. JUADI, S.Pd'),
(136, '3210', '3210090', '3210090010', '2019', 1183, 1173, 2356, 2624, 0, 1939, 13, 0, 'YAYAT HIDAYAT'),
(137, '3210', '3210170', '3210170005', '2019', 804, 751, 1555, 1714, 0, 1037, 255, 422, 'ARA SUBARA'),
(138, '3210', '3210120', '3210120013', '2019', 2334, 2202, 4536, 4760, 0, 3455, 44, 1261, 'ABDUL ROHMAT, S.Ag. MM.'),
(139, '3210', '3210120', '3210120010', '2019', 1856, 1832, 3688, 3850, 0, 2724, 23, 1103, 'OMAN ABDUROHMAN, S.Pd.'),
(140, '3210', '3210190', '3210190010', '2019', 406, 427, 833, 1220, 0, 766, 2, 452, 'CEMEN TIRTAJAYA'),
(141, '3210', '3210090', '3210090014', '2019', 869, 907, 1776, 1953, 0, 1293, 43, 617, 'AGUS SUDIRMAN'),
(142, '3210', '3210190', '3210190001', '2019', 1768, 1860, 3628, 4179, 0, 3162, 60, 957, 'SUHAYA, S.Pd.'),
(143, '3210', '3210090', '3210090018', '2019', 1776, 1786, 3562, 3932, 0, 2454, 28, 1450, 'REDI ROHAEDI, S.Pd'),
(144, '3210', '3210090', '3210090019', '2019', 1214, 1187, 2401, 2644, 0, 1930, 16, 698, 'ARIPIN'),
(145, '3210', '3210190', '3210190012', '2019', 906, 864, 1770, 2019, 0, 1523, 11, 485, 'FAJAR SANJAYA, S.Pdi'),
(146, '3210', '3210190', '3210190008', '2019', 1579, 1682, 3261, 3765, 0, 2864, 16, 885, 'Drs. H. TOHIR'),
(147, '3210', '3210190', '3210190006', '2019', 1416, 1490, 2906, 3204, 0, 2333, 29, 842, 'TOTO, S.Pd.'),
(148, '3210', '3210190', '3210190013', '2019', 1279, 1314, 2593, 2904, 0, 2286, 26, 592, 'MOCH. HUDAN'),
(149, '3210', '3210090', '3210090013', '2019', 1608, 1646, 3254, 3538, 0, 2217, 59, 1262, 'SUANDI'),
(150, '3210', '3210010', '3210010018', '2019', 1033, 999, 2032, 2129, 0, 1705, 5, 419, 'A. KARIM SURAHMAN'),
(151, '3210', '3210020', '3210020016', '2019', 1477, 1561, 3038, 3342, 0, 2131, 14, 1197, 'OMOD SOMAD, M.Pd'),
(152, '3210', '3210020', '3210020010', '2019', 1384, 1342, 2726, 3007, 0, 2062, 6, 939, 'TATANG MULYAWAN, M.Pd'),
(153, '3210', '3210020', '3210020021', '2019', 526, 539, 1065, 1119, 0, 889, 26, 204, 'H. SAMIYUDIN,S.Pd'),
(154, '3210', '3210190', '3210190007', '2019', 1107, 1136, 2243, 2768, 0, 1884, 17, 867, 'SURYA'),
(155, '3210', '3210190', '3210190003', '2019', 1530, 1572, 3102, 3770, 0, 2447, 103, 1220, 'H. IKIN SODIKIN, S.Pd.'),
(156, '3210', '3210190', '3210190002', '2019', 1106, 1113, 2219, 2624, 0, 2010, 16, 598, 'DIDI SUHANDI, S.Pd.'),
(157, '3210', '3210190', '3210190014', '2019', 1460, 1429, 2889, 3000, 0, 2592, 26, 382, 'BAMBANG.S'),
(158, '3210', '3210091', '3210091002', '2019', 1063, 1056, 2119, 2200, 0, 1204, 255, 741, 'MUHAMAD'),
(160, '3210', '3210130', '3210130002', '2019', 1686, 1787, 3473, 3617, 0, 2836, 17, 764, 'Drs. M.H. AMAN AZHARY'),
(161, '3210', '3210130', '3210130008', '2019', 1049, 1123, 2172, 2390, 0, 1823, 24, 543, 'DASAM.SPd'),
(162, '3210', '3210130', '3210130011', '2019', 830, 901, 1731, 1961, 0, 1395, 19, 547, 'ENDANG ISKANDAR,SPd.M.M.Pd'),
(165, '3210', '3210130', '3210130006', '2019', 1072, 1066, 2138, 2138, 0, 1663, 14, 461, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hasil_pilkades`
--

CREATE TABLE `tbl_hasil_pilkades` (
  `id` int(11) NOT NULL,
  `tahun` varchar(4) NOT NULL DEFAULT '0',
  `kdkab` varchar(4) NOT NULL DEFAULT '0',
  `kdkec` varchar(4) NOT NULL DEFAULT '0',
  `kddesa` varchar(4) NOT NULL DEFAULT '0',
  `id_calon` int(11) NOT NULL DEFAULT 0,
  `jmlsuara` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_opd`
--

CREATE TABLE `tbl_opd` (
  `id_opd` int(11) NOT NULL,
  `nama_instansi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tbl_opd`
--

INSERT INTO `tbl_opd` (`id_opd`, `nama_instansi`, `alamat`, `telp`) VALUES
(44, 'Kecamatan Majalengka', NULL, NULL),
(45, 'Kelurahan Majalengka Wetan', NULL, NULL),
(46, 'Kelurahan Majalengka Kulon', NULL, NULL),
(47, 'Kelurahan Babakan Jawa', NULL, NULL),
(48, 'Kelurahan Tonjong', NULL, NULL),
(49, 'Kelurahan Cicurug', NULL, NULL),
(50, 'Kelurahan Tarikolot', NULL, NULL),
(51, 'Kelurahan Cikasarung', NULL, NULL),
(52, 'Kelurahan Munjul', NULL, NULL),
(53, 'Kelurahan Cijati', NULL, NULL),
(54, 'Kelurahan Sindangkasih', NULL, NULL),
(55, 'Kecamatan Panyingkiran', NULL, NULL),
(56, 'Kecamatan Kadipaten', NULL, NULL),
(57, 'Kecamatan Cigasong', NULL, NULL),
(58, 'Kecamatan Jatiwangi', NULL, NULL),
(59, 'Kecamatan Dawuan', NULL, NULL),
(60, 'Kecamatan Palasah', NULL, NULL),
(61, 'Kecamatan Maja', NULL, NULL),
(62, 'Kecamatan Sukahaji', NULL, NULL),
(63, 'Kecamatan Argapura', NULL, NULL),
(64, 'Kecamatan Talaga', NULL, NULL),
(65, 'Kecamatan Cikijing', NULL, NULL),
(66, 'Kecamatan Banjaran', NULL, NULL),
(67, 'Kecamatan Cingambul', NULL, NULL),
(68, 'Kecamatan Bantarujeg', NULL, NULL),
(69, 'Kecamatan Lemahsugih', NULL, NULL),
(70, 'Kecamatan Leuwimunding', NULL, NULL),
(71, 'Kecamatan Rajagaluh', NULL, NULL),
(72, 'Kecamatan Sumberjaya', NULL, NULL),
(73, 'Kecamatan Sindangwangi', NULL, NULL),
(74, 'Kecamatan Jatitujuh', NULL, NULL),
(75, 'Kecamatan Kertajati', NULL, NULL),
(76, 'Kecamatan Ligung', NULL, NULL),
(77, 'Kecamatan Malausma', NULL, NULL),
(78, 'Kecamatan Kasokandel', NULL, NULL),
(79, 'Kecamatan Sindang', NULL, NULL),
(80, 'Sekretariat Daerah', NULL, NULL),
(81, 'Bagian Tapem Sekretariat Daerah', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pekerjaan`
--

CREATE TABLE `tbl_pekerjaan` (
  `id_pekerjaan` int(11) NOT NULL,
  `nama_pekerjaan` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_pekerjaan`
--

INSERT INTO `tbl_pekerjaan` (`id_pekerjaan`, `nama_pekerjaan`) VALUES
(1, 'Belum/Tidak Bekerja'),
(2, 'Mengurus Rumah Tangga'),
(3, 'Pelajar/Mahasiswa'),
(4, 'Pensiunan'),
(5, 'Pegawai Negeri Sipil\r\n'),
(6, 'Tentara Nasional Indonesia'),
(7, 'Kepolisian Ri\r\n'),
(8, 'Perdagangan\r\n'),
(9, 'Petani/Pekebun\r\n'),
(10, 'Peternak\r\n'),
(11, 'Nelayan/Perikanan\r\n'),
(12, 'Industri\r\n'),
(13, 'Konstruksi\r\n'),
(14, 'Transportasi\r\n'),
(15, 'Karyawan Swasta'),
(16, 'Karyawan Bumn'),
(17, 'Karyawan Bumd'),
(18, 'Karyawan Honorer'),
(19, 'Buruh Harian Lepas'),
(20, 'Buruh Tani/Perkebunan'),
(21, 'Buruh Nelayan/Perikanan'),
(22, 'Buruh Peternakan'),
(23, 'Pembantu Rumah Tangga'),
(24, 'Tukang Cukur'),
(25, 'Tukang Listrik'),
(26, 'Tukang Batu'),
(27, 'Tukang Kayu'),
(28, 'Tukang Sol Sepatu'),
(29, 'Tukang Las/Pandai Besi'),
(30, 'Tukang Jahit'),
(31, 'Tukang Gigi'),
(32, 'Penata Rias'),
(33, 'Penata Busana'),
(34, 'Penata Rambut'),
(35, 'Mekanik'),
(36, 'Seniman'),
(37, 'Tabib'),
(38, 'Paraji'),
(39, 'Perancang Busana'),
(40, 'Penterjemah'),
(41, 'Imam Mesjid'),
(42, 'Pendeta'),
(43, 'Pastor'),
(44, 'Wartawan'),
(45, 'Ustadz/Mubaligh'),
(46, 'Juru Masak'),
(47, 'Promotor Acara'),
(48, 'Anggota Dpr-Ri'),
(49, 'Anggota Dpd'),
(50, 'Anggota Bpk'),
(51, 'Presiden'),
(52, 'Wakil Presiden'),
(53, 'Anggota Mahkamah Konstitusi'),
(54, 'Anggota Kabinet/Kementerian'),
(55, 'Duta Besar'),
(56, 'Gubernur'),
(57, 'Wakil Gubernur'),
(58, 'Bupati'),
(59, 'Wakil Bupati'),
(60, 'Walikota'),
(61, 'Wakil Walikota'),
(62, 'Anggota Dprd Provinsi'),
(63, 'Anggota Dprd Kabupaten/Kota'),
(64, 'Dosen'),
(65, 'Guru'),
(66, 'Pilot'),
(67, 'Pengacara'),
(68, 'Notaris'),
(69, 'Arsitek'),
(70, 'Akuntan'),
(71, 'Konsultan'),
(72, 'Dokter'),
(73, 'Bidan'),
(74, 'Perawat'),
(75, 'Apoteker'),
(76, 'Psikiater/Psikolog'),
(77, 'Penyiar Televisi'),
(78, 'Penyiar Radio'),
(79, 'Pelaut'),
(80, 'Peneliti'),
(81, 'Sopir'),
(82, 'Pialang'),
(83, 'Paranormal'),
(84, 'Pedagang'),
(85, 'Perangkat Desa'),
(86, 'Kepala Desa'),
(87, 'Biarawati'),
(88, 'Wiraswasta');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pendidikan`
--

CREATE TABLE `tbl_pendidikan` (
  `id_pendidikan` int(11) NOT NULL,
  `nama_pendidikan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_pendidikan`
--

INSERT INTO `tbl_pendidikan` (`id_pendidikan`, `nama_pendidikan`) VALUES
(1, 'Tidak/Belum Sekolah'),
(2, ' Belum Tamat SD'),
(3, 'SD/Sederajat'),
(4, ' SLTP/Sederajat'),
(5, ' SLTA/Sederajat'),
(6, 'Diploma I/II'),
(7, 'Akademi/Diploma III/S. Muda'),
(8, ' Diploma IV/Strata I'),
(9, ' Strata II'),
(10, ' Strata III');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_report`
--

CREATE TABLE `tbl_report` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

CREATE TABLE `tbl_role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`id`, `name`, `description`) VALUES
(1, 'Administrator', 'Administrator adalah pengelola aplikasi dan merupakan level tertinggi'),
(2, 'Admin Kabupaten', '...'),
(3, 'Operator Kecamatan', '...');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sessions`
--

CREATE TABLE `tbl_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_sessions`
--

INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('f62e142a23e9a0a75561222f2b176b41200398bf', '192.168.1.1', 1577074657, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373037343635373b),
('55e91ef148e6668ae1d5a08097075b448c8c215f', '192.168.1.1', 1577097254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373039373235343b),
('13b03fe8a862133202bee8cf9bf25db102a4f8e9', '192.168.1.1', 1577196191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373139363139313b),
('51329afd448c6b65b9fc88657fb1795a01b43fb9', '192.168.1.1', 1577229863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373232393835383b7365676d656e747c613a313a7b693a303b733a373a2250726f66696c65223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('e2947a3ddac66ac689cb45c95afef09cfd35aca1', '192.168.1.1', 1577234582, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373233343538323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('c0fee6dadb7defea2a901453c2db73693200ff22', '192.168.1.1', 1577257218, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373235373231383b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('7ed55a825837ac748846a6d6d27890e67d87145a', '192.168.1.1', 1577277006, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373237363935383b69735f6c6f67696e7c623a313b69647c733a323a223333223b70617373776f72647c733a33323a223363396239343432316138303133303963643231353937363638393735666534223b69645f726f6c657c733a313a2233223b757365726e616d657c733a363a22323130373736223b66697273745f6e616d657c733a393a224b6563616d6174616e223b6c6173745f6e616d657c733a31303a2242616e746172756a6567223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031303a34363a3232223b6c6173745f6c6f67696e7c733a31393a22323031392d31312d32302031313a32363a3038223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303230223b6e616d615f6b65637c733a31303a2242616e746172756a6567223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223333223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('fc2f8af8105be194788988dbf2022d85205a66b5', '192.168.1.1', 1577330886, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373333303838363b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('ca52328daff683baa62d590bede1c2c1f70a38bb', '192.168.1.1', 1577330890, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373333303839303b),
('d96bf75e074e3425937d9108119ef8a1de40378e', '192.168.1.1', 1577440204, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373434303230343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('69d0606f919856b17afc09ff03651fa90fe1c733', '192.168.1.1', 1577464414, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373436343431343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('faeb8c8a8658d408dd452246ed889065f2bc1fe4', '192.168.1.1', 1577546119, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373534363131393b),
('4dda12fab2a7a4cc9b83c02265a470047fb992fc', '192.168.1.1', 1577624011, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373632343031313b),
('4c2927517fffe1f91005b57a8579b0fa09424186', '192.168.1.1', 1577759290, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373735393239303b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('f3480d328b8c25c446709bdad68417fce88cacb5', '192.168.1.1', 1577861254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373836313235343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('f44187e43aec8d3c87968ed5ab6b4522cfedd0f6', '192.168.1.1', 1577918074, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373931383037333b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('49f62a9917cb7a01cad05fa7f50e80386a6a2555', '192.168.1.1', 1577978535, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373937383439393b69735f6c6f67696e7c623a313b69647c733a323a223538223b70617373776f72647c733a33323a223431653235646661646566386363626361613262363466303764633737643766223b69645f726f6c657c733a313a2231223b757365726e616d657c733a363a2279616e79616e223b66697273745f6e616d657c733a363a2279616e79616e223b6c6173745f6e616d657c733a383a226d2e2061646e616e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323031392d31322d30392030383a33333a3435223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223538223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('2327e2003b79d34a0f1a997e2a6faf8eedd7cb86', '192.168.1.1', 1577978506, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373937383530363b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('9a4ba8cff7a10aa1c29f13d7c187d3eb7f0ecdc0', '192.168.1.1', 1577986068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537373938363036363b7365676d656e747c613a333a7b693a303b733a353a2272656b6170223b693a313b733a31303a2264657461696c64657361223b693a323b733a31303a2233323130313930303036223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('3c0a7f1468f3dae4c9a6afa2de9ba91464cf80df', '192.168.1.1', 1578010425, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383031303432353b),
('027b4d2b4524ba65ccb281f0ebaf15f0f2c6b0b8', '192.168.1.1', 1578014409, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383031343336363b69735f6c6f67696e7c623a313b69647c733a323a223337223b70617373776f72647c733a33323a223433666537616433653730613139353239333631613532356562643636356566223b69645f726f6c657c733a313a2233223b757365726e616d657c733a31353a2270696c6b616465735f64617775616e223b66697273745f6e616d657c733a393a224b6563616d6174616e223b6c6173745f6e616d657c733a363a2244617775616e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031303a35313a3039223b6c6173745f6c6f67696e7c733a31393a22323031392d31312d30312030383a32313a3236223b69645f6f70647c733a323a223539223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130313530223b6e616d615f6b65637c733a363a2244617775616e223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223337223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('fda17422e174349274a8c6b45c3ef0718089f5e7', '192.168.1.1', 1578042150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383034323135303b),
('72d136b432c408a6eb0a867e29a3d2827bf55654', '192.168.1.1', 1578042152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383034323135323b),
('596fd9cc79fe4ed008e8702b4a1ae760a264222a', '192.168.1.1', 1578062756, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383036323735363b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('c8f4d705f82e083e1e269dbe4aa80ff7b7bb69c1', '192.168.1.1', 1578122481, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383132323438313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('cbdad20bce803308d7972fec717179bf65cdb9b9', '192.168.1.1', 1578229099, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383232393037313b),
('67b5375e1f35e3a61b0ab22516c5eabbf72be659', '192.168.1.1', 1578358756, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383335383735363b),
('b8640ffcbf55826fb8afbd82dd2d90d6183f6eea', '192.168.1.1', 1578379197, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383337393137353b69735f6c6f67696e7c623a313b69647c733a323a223538223b70617373776f72647c733a33323a223431653235646661646566386363626361613262363466303764633737643766223b69645f726f6c657c733a313a2231223b757365726e616d657c733a363a2279616e79616e223b66697273745f6e616d657c733a363a2279616e79616e223b6c6173745f6e616d657c733a383a226d2e2061646e616e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323031392d31322d30392030383a33333a3435223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223538223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('a4ea2b7cfcd73b42b4c988e0e6e2aff1342bf50b', '192.168.1.1', 1578438842, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383433383834313b7365676d656e747c613a333a7b693a303b733a353a2272656b6170223b693a313b733a393a2264657461696c6b6563223b693a323b733a373a2233323130303431223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('d640d6b42bb3026cbb6cd2c028d87918ee6ee565', '192.168.1.1', 1578479023, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383437393032333b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('3f7fadb98340c92c5648812a4e7b2ab243a9d6a7', '192.168.1.1', 1578724366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383732343336363b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('d7c4d870c3564da2b57fd81cbfd363fbcabdbc41', '192.168.1.1', 1578801148, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383830313134383b),
('08dec7e1f551414abad0745b81e74333e0d99d4a', '192.168.1.1', 1578863753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383836333735333b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('6b289ed64a0bee12e3931e9f92157c97d1cc9f1e', '192.168.1.1', 1578863754, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383836333735343b),
('b4827076899a89504c57a2b3e15346f81c0fb4c9', '192.168.1.1', 1578885273, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537383838353138363b69735f6c6f67696e7c623a313b69647c733a323a223538223b70617373776f72647c733a33323a223431653235646661646566386363626361613262363466303764633737643766223b69645f726f6c657c733a313a2231223b757365726e616d657c733a363a2279616e79616e223b66697273745f6e616d657c733a363a2279616e79616e223b6c6173745f6e616d657c733a383a226d2e2061646e616e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323031392d31322d30392030383a33333a3435223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223538223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a353a2263616c6f6e223b693a313b733a393a22616a61785f6c697374223b7d),
('27f257de4426ce29a4615abbff26bf77a082b1dd', '192.168.1.1', 1579096527, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537393039363530373b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323031392d31322d32392031393a35333a3331223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('c773d081fc1522977a267512e955cfe7c784e4ab', '192.168.1.1', 1579441356, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537393434313335363b),
('ae0fa04822a9aec0c6d46f90b2fb40c206653ae7', '192.168.1.1', 1580275108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538303237353130383b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('4e4ee011cddd9d30a46e6e12b11418177b78b8c5', '192.168.1.1', 1580275109, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538303237353130393b),
('fbe780aa76c0869320b58652444c8ac49a4d1011', '192.168.1.1', 1580357644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538303335373634343b7365676d656e747c613a313a7b693a303b733a353a2263616c6f6e223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('3443eca50502a4792c8e69bf3f00415dfd8c09e4', '192.168.1.1', 1580654073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538303635343036383b6572726f725f6d73677c733a303a22223b5f5f63695f766172737c613a313a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b7d),
('def710333a3d675dfe79dc5e661f84f8d7404068', '192.168.1.1', 1580865190, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538303836353139303b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('3552ebcb802fcede6dd052646779ffd2cc99289e', '192.168.1.1', 1580865191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538303836353139313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('dd9ae2d4cfbf1d81a1a8e3ecbd23f2932ac070df', '192.168.1.1', 1581198328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313139383332383b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('3b6b98ac93ddd0100e82e2b4ee4f95606154d613', '192.168.1.1', 1581198328, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313139383332383b),
('0fed034bfd72139850793a6b747a7566f6dc189f', '192.168.1.1', 1581305199, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313330353139393b),
('709ed0f53cb160269a381da3bd9264ae3a38aef6', '192.168.1.1', 1581321169, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313332313136383b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('6d212104181e43581ff9dfe351282c53ee47c6a7', '192.168.1.1', 1581392658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313339323635383b69735f6c6f67696e7c623a313b69647c733a323a223538223b70617373776f72647c733a33323a223431653235646661646566386363626361613262363466303764633737643766223b69645f726f6c657c733a313a2231223b757365726e616d657c733a363a2279616e79616e223b66697273745f6e616d657c733a363a2279616e79616e223b6c6173745f6e616d657c733a383a226d2e2061646e616e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323031392d31322d30392030383a33333a3435223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223538223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a353a2263616c6f6e223b693a313b733a393a22616a61785f6c697374223b7d),
('edebea1f7e772b25b2b70f235e0ea880ceb563b9', '192.168.1.1', 1581392660, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313339323635383b69735f6c6f67696e7c623a313b69647c733a323a223538223b70617373776f72647c733a33323a223431653235646661646566386363626361613262363466303764633737643766223b69645f726f6c657c733a313a2231223b757365726e616d657c733a363a2279616e79616e223b66697273745f6e616d657c733a363a2279616e79616e223b6c6173745f6e616d657c733a383a226d2e2061646e616e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323031392d31322d30392030383a33333a3435223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223538223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('b06e3cb0e147b763d322d42adf8183986686e32b', '192.168.1.1', 1581497340, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313439373334303b),
('92f2b3b8aa36dccdceb44a038183afd991780d1c', '192.168.1.1', 1581567269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313536373236393b),
('6686641aac532c9aa69522fb61b47e6565075c58', '192.168.1.1', 1581575795, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313537353739353b7365676d656e747c613a313a7b693a303b733a343a22486f6d65223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('e174ac31d24b6afe25944c7f86c228424ae2af9b', '192.168.1.1', 1581646045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313634363034353b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('6ba35e781746e65569c72ae396e66381fb6b7d93', '192.168.1.1', 1581694334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313639343333343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('474651d2b224df368b41250a2bdf5d4906ea21d0', '192.168.1.1', 1581694338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313639343333383b),
('6b066e874cf7a17cb855cf730a281e21897e183c', '192.168.1.1', 1581781808, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313738313830383b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('402477d0084d711c56be3bc88519511674931f81', '192.168.1.1', 1581781812, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538313738313831323b),
('1d09b8f30d9526ab9b6d528c5bd56237761fc27f', '192.168.1.1', 1582071309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323037313032323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('6e959cd89628541146846f5016d3c109daefe292', '192.168.1.1', 1582874534, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323837343238343b69735f6c6f67696e7c623a313b69647c733a323a223538223b70617373776f72647c733a33323a223431653235646661646566386363626361613262363466303764633737643766223b69645f726f6c657c733a313a2231223b757365726e616d657c733a363a2279616e79616e223b66697273745f6e616d657c733a363a2279616e79616e223b6c6173745f6e616d657c733a383a226d2e2061646e616e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323031392d31322d30392030383a33333a3435223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223538223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('e3d436e2838374527d159f2e0cba24e28dd9dbd7', '192.168.1.1', 1582890229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323839303232373b7365676d656e747c613a333a7b693a303b733a353a2272656b6170223b693a313b733a31303a2264657461696c64657361223b693a323b733a31303a2233323130313530303134223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('22d5b46c7219c1b67e9fb48e69e67755fb67b29b', '192.168.1.1', 1582949952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323934393935323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('cfaa1d8d48f60a3677778bc0d6d234b53154d3cb', '192.168.1.1', 1582949956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538323934393935363b),
('1ae0565b9411dfcf29aeae2ef005b5fa2bd512a5', '192.168.1.1', 1583352486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333335323234353b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('c0ea40b78948b840ec8dff934f24a9a33c32c071', '192.168.1.1', 1583805370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333830353337303b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('2ba2484e2de9ea7101b333f67869d0189f43a6a6', '192.168.1.1', 1583844281, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538333834343238313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('0d67cb4caf749cabae53b1edc17494a6029c1b21', '192.168.1.1', 1584177861, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538343137373836313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('aa7e5c5caccaa3cbd65d56442aa6d101373c09c4', '192.168.1.1', 1584177884, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538343137373838343b),
('bca9c47e52dcfc76e817c200a7209721697c10fd', '192.168.1.1', 1584505374, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538343530353337343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('6951cb0bea0149d4fe6da9e82fa2a236ab2c7730', '192.168.1.1', 1584591656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538343539313635353b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('5800f43a05e46a8bc10302866c834c5a8d299a14', '192.168.1.1', 1584690430, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538343639303433303b),
('15727ffdd44302318c0bedbcb5758dff02ceb226', '192.168.1.1', 1584692289, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538343639323235303b69735f6c6f67696e7c623a313b69647c733a323a223633223b70617373776f72647c733a33323a223337626136353035346132653866393836363163636562306135333461363830223b69645f726f6c657c733a313a2232223b757365726e616d657c733a343a2262616e69223b66697273745f6e616d657c733a343a2262616e69223b6c6173745f6e616d657c733a373a22666164696c6168223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22303030302d30302d30302030303a30303a3030223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223633223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('3c7554d8cd4f0de0ba26fb8e76ffb9e19804c6f6', '192.168.1.1', 1584819556, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538343831393535363b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('d098bc277690b1445d1201c2f9afb835cb84bb01', '192.168.1.1', 1584858668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538343835383636383b),
('777e8ce4c4e42bc7f8aa55656c58317f4100f008', '192.168.1.1', 1585046605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353034363630353b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('bf0bc49890f1cf176de9fb13a012d174ee1f0bc0', '192.168.1.1', 1585197779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353139373737393b),
('7a85f5e2b26f9eb78c78fb2c7d0d8b5583f97e5e', '192.168.1.1', 1585349883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353334393838333b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('bb3f2c7fd6336de8a013370fcaee2873fab09191', '192.168.1.1', 1585349887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353334393838373b),
('40315386e141eac57477ab7ba3b1d310c047cdcb', '192.168.1.1', 1585668695, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353636383639353b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('170d03475eb53adeaed6f874dba83e78011a6487', '192.168.1.1', 1585810726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353831303438323b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('99fb0620c70708ccfeedc7ae6807bcf54dd38208', '192.168.1.1', 1585895805, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353839353733393b),
('4aa23887db0cf982268b861775cddf0fd33afe25', '192.168.1.1', 1585926052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353932363035323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('c7c2bda9db0583f9f36438bf0e0594c02a8ed3cd', '192.168.1.1', 1585972300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538353937323330303b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('aae1049a06dfd14c5f343cd43733e5b3d42bf472', '192.168.1.1', 1586085437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363038353433373b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('b8bbc2073a0ae7fee4080e30676d210c2d5f58b4', '192.168.1.1', 1586085438, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363038353433383b),
('00df1bcc61b7f597d3ab0997e4ce39278e5a1222', '192.168.1.1', 1586245089, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363234353037383b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('c63888579f5c835619fd0f808763891b0fb37ad9', '192.168.1.1', 1586253614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363235333631343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('73412bbc58f38e38080e2dc62bacc429613a28b1', '192.168.1.1', 1586253614, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363235333631343b),
('003ebda7bc778581b3eb68a4ac5c5f66504507f2', '192.168.1.1', 1586265062, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363236353036323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('2b8da3e40b1ecc5040e3a6690d59dce57f70cd26', '192.168.1.1', 1586304040, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363330343034303b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('4aadbc62728accceed92cc1c0ba3488f40c330ea', '192.168.1.1', 1586304041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363330343034313b),
('c5ddbee835169bad0436d0290c1d604434a22774', '192.168.1.1', 1586318174, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363331383137343b),
('a2815a118450dee4d20b2dd963911d2b8262b333', '192.168.1.1', 1586380717, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363338303731373b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('3a118f050c6cc1b961367fba4c1729562b9e56a2', '192.168.1.1', 1586380721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363338303732313b),
('06df47eb8c9326598f86b7102c33d187c77f2c36', '192.168.1.1', 1586391824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363339313832343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('08b93d1058e3e8adfc004f7b0eee101acb4a7808', '192.168.1.1', 1586397702, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363339373730323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('572f78bee375ebd5293d318274cb796e35e86f36', '192.168.1.1', 1586768269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363736383236393b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('9990dacef960bd1ba9b3a193ed489d501e1a637b', '192.168.1.1', 1586834442, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363833343239373b),
('d99e9293595bbe2be6b1f72bd70ad9391dd7f293', '192.168.1.1', 1586834397, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363833343334393b69735f6c6f67696e7c623a313b69647c733a323a223532223b70617373776f72647c733a33323a223335393137396435353861623364633061383237393966306266313735323030223b69645f726f6c657c733a313a2233223b757365726e616d657c733a32313a224f707270696c6b616465736b656373696e64616e67223b66697273745f6e616d657c733a393a224b6563616d6174616e223b6c6173745f6e616d657c733a373a2253696e64616e67223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a32333a22494d472d32303138303632342d5741303031332e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031303a35373a3237223b6c6173745f6c6f67696e7c733a31393a22303030302d30302d30302030303a30303a3030223b69645f6f70647c733a323a223739223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303931223b6e616d615f6b65637c733a373a2253696e64616e67223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223532223b7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('7240815ef46c7c55831823cc43e72e6ca2ca2573', '192.168.1.1', 1586919881, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538363931393838313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('066f263208193e70da06eb53a993aa71690712e8', '192.168.1.1', 1587265674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538373236353637343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('2d9b32e280c7bf4f4e7f33031990ab0aabdc59e5', '192.168.1.1', 1587376887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538373337363838373b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('bccfc801082d98c195daa094a2aee114344bd77f', '192.168.1.1', 1587376891, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538373337363839313b),
('d1294f0615e3333359a748a138693c7d5595300f', '192.168.1.1', 1587389329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538373338393332393b),
('f68103399ef6298f9fc3c33bc9cecee6e165367f', '192.168.1.1', 1587547832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538373534373833313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('805bbbcc799f151f0e69e8a5eef6c0d8da43e573', '192.168.1.1', 1587707885, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538373730373838353b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('57e24d92c66691d70b95ecf590d28504d3472c74', '192.168.1.1', 1587707889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538373730373838393b),
('135a65857e755b8d57ceac034eff2e5b6d9b153c', '192.168.1.1', 1588219955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538383231393839373b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('309d58abceef69ace1ac2030c34b61daf555bc49', '192.168.1.1', 1588733668, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538383733333636383b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('e76363472d13a294664e61215bec46060cb1efba', '192.168.1.1', 1588733672, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538383733333637323b),
('7a056a01012bd92b4ad4f58fc7a9e24ef6b161ef', '192.168.1.1', 1588751629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538383735313632393b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('cdbf468db6f156e12b8f70c23e0a37b175dfd83b', '192.168.1.1', 1588899721, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538383839393732313b),
('54880367df6e90f5affc527aac74419e82de846f', '192.168.1.1', 1588924922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538383932343932323b),
('c5f38d9e15a9b0d83e936be54b8a3e88806d450d', '192.168.1.1', 1589083735, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393038333733353b),
('21a2c48368c967cc7f4cb636238f4387bc431220', '192.168.1.1', 1589100423, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393130303432333b),
('ee91950bfc883037ca47d2c69fbcf46553686848', '192.168.1.1', 1589156476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393135363437363b),
('5395deee35493eb89da895680bf9bb00b0371b80', '192.168.1.1', 1589170436, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393137303433363b),
('d7017c7008b6e81a4516198e381164bfa964b452', '192.168.1.1', 1589180951, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393138303935313b),
('05bd9d539364e58e1c1edf17417463bb758a333d', '192.168.1.1', 1589268793, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393236383739333b),
('b56670b571700a007de747f70d78543464e96fef', '192.168.1.1', 1589331846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393333313834363b),
('6538f45111d58e13b7c4b7823ed95ba74f1d1939', '192.168.1.1', 1589331846, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393333313834363b),
('88a0cba3af2ec03589257d271af1ed8b4fedd9b1', '192.168.1.1', 1589354562, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393335343536323b),
('82d513d981ce3bbb52c7ac6f8b9051a3a81af90d', '192.168.1.1', 1589415863, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393431353836333b),
('6c8bae36f019d59824b18d04a738ddd46f500d2a', '192.168.1.1', 1589507380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393530373338303b),
('3670ecc7fd2b427512b3850780f6f44a9c8989ed', '192.168.1.1', 1589528678, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393532383637383b),
('3519253cb6a602bc197d6622ee6d33ffaa8ae753', '192.168.1.1', 1589548591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393534383539313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('e8fb6bad96005ace9b06c4af06aff2c5ba7494cc', '192.168.1.1', 1589617137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393631373036393b),
('b52d70f84c877ccbae7e564efba50e037b2e7b73', '192.168.1.1', 1589624604, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393632343630343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('f84685dc3887f85ca93e3b53a72c9336ad25a773', '192.168.1.1', 1589762131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393736323133313b),
('2621538673d9623867ff844dceecb78f1225261f', '192.168.1.1', 1589762131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393736323133313b),
('65971ecc7ea07a2e3c7ab1e7ea660e631eb702b7', '192.168.1.1', 1589785262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393738353236323b),
('eb737931e93065e6d729763bb8666b459b962ba1', '192.168.1.1', 1589806371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393830363337313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('3a975a1adb5c1287d5b1ed3bf258b9850e855f4e', '192.168.1.1', 1589850566, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393835303536363b),
('24f313632ce3a2e9dcd4ffd23a1c0c3c07698d7d', '192.168.1.1', 1589875127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393837353132373b),
('5312d9d858e8978cb5715baa510f1ad53fdf0788', '192.168.1.1', 1589947059, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393934373035393b),
('54fcaf9b0de4d87c30edbeee8e431038f44ac071', '192.168.1.1', 1589971123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393937313132333b),
('8f792d6a7bb8f0cf07c0344dc0c5ec6a7f4e2b28', '192.168.1.1', 1589990469, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393939303436393b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('88f57f4344442b92972d55a2e1b553d5ea12fb24', '192.168.1.1', 1589993249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313538393939333234393b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('21d65e166d596dd84a8637d618f39857ee29048c', '192.168.1.1', 1590010906, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303031303930363b),
('a99e08724462b723070355e5407d6b02b17964af', '192.168.1.1', 1590021229, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303032313232393b),
('a8b5d129a609e2ffa200407cca26b3762d0e6f33', '192.168.1.1', 1590041137, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303034313133373b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('d5beb2e2085fe7ab5cb7515e8c5565774141ddc7', '192.168.1.1', 1590041141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303034313134313b),
('826ff834616af04464bfa5a6e122d796adcfc848', '192.168.1.1', 1590138252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303133383235323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('f5a4da763e502e112398f6a057270541445196c4', '192.168.1.1', 1590340401, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303334303430313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('381558e653a4373e92f5000d1ca3fc78a83c583a', '192.168.1.1', 1590466427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303436363432373b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('fc179ea939a0768d93f9918ee4d798ac36567001', '192.168.1.1', 1590520163, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303532303136333b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('105b206657e96b5cb520d440739100f4b29c175b', '192.168.1.1', 1590815025, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303831353032353b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('12d2f7a4c70bc979b57d323366ec38b3f0d78c7f', '192.168.1.1', 1590817990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303831373939303b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('e581db4f84ba359f5b52091188a2c26245baa5dc', '192.168.1.1', 1590835418, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303833353431383b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('289d8674601b8a736a7deb49b002e58f8408d2bc', '192.168.1.1', 1590888551, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303838383535313b),
('5dad4feef24bb9e177299513fadfb07c32618dd5', '192.168.1.1', 1590952561, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539303935323534303b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('ab2d4d7ee84887279822877f425630fff267299a', '192.168.1.1', 1591010875, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313031303837353b),
('bbf78e340cc5f4579a217766071547771f95c35f', '192.168.1.1', 1591096815, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313039363831353b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('f98affaef28e73498a8ee1473b02e9b73db791a6', '192.168.1.1', 1591096819, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313039363831393b),
('0d5c9ea5933742712058d744eb300ac27575b6ab', '192.168.1.1', 1591151191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313135313139313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('2ed1925dbd1f3ee4707db9432764d587cd545f18', '192.168.1.1', 1591200480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313230303438303b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('1c8e2902528a113732cef6c4f70460913b231366', '192.168.1.1', 1591359098, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313335393039383b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('3d8bb09d957b9e7f36e3b7c1119958d900fbfd60', '192.168.1.1', 1591704312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313730343331323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('41a6dce6c74dfbc8d02d3b3fde2abb802347163f', '192.168.1.1', 1591855786, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313835353738363b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('6cadfbe51a301fd47aa376ab34ca7864d1e8a3ec', '192.168.1.1', 1591983002, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313938333030323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('1f1aa9b114b76260ba5656af609f0f9b0943af11', '192.168.1.1', 1591983003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313938333030333b),
('6bb6c49901ee79c2e79fda9d912c255d1d377f5a', '192.168.1.1', 1591994560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539313939343536303b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('1b4dc14251034238b45160c5f68844fdcc333a3d', '192.168.1.1', 1592014230, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323031343233303b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('1931e4b4f0ffaeb20eb884952f53c1ce136af6c2', '192.168.1.1', 1592475837, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323437353833373b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('cae2ac5daa6379ea1a0d22822fa09ce9832847f1', '192.168.1.1', 1592475841, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323437353834313b);
INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('d3913a63d772332c7d6b763e9360f85c52bd1ebc', '192.168.1.1', 1593928828, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333932383832383b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('07c5d97422b23ee4336023abf9bc72be3b14c22b', '192.168.1.1', 1593928832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539333932383833323b),
('b6a0369e1158038aac34fe4a1115a2e2bfba921c', '192.168.1.1', 1594266192, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343236363139313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('305317bdbd734d68a807a56fb4355efd246350f5', '192.168.1.1', 1594542664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343534323636343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('16478e4c9312cc924e5c8ea4409615f6fe8888f0', '192.168.1.1', 1594542664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343534323636343b),
('c31434cebf0318c18e59c5e5aa294c8082ab9c8e', '192.168.1.1', 1594694261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343639343236313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('41f3de235dc0869d2fd040e98d48736ebef11df2', '192.168.1.1', 1594694297, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343639343236313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('0a8fc491c624e0eade80b0367feeb48145302589', '192.168.1.1', 1594695486, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343639353438363b69735f6c6f67696e7c623a313b69647c733a313a2231223b70617373776f72647c733a33323a223163363263373236373965376630633965393364653062316263323433656439223b69645f726f6c657c733a313a2231223b757365726e616d657c733a31333a2241646d696e6973747261746f72223b66697273745f6e616d657c733a31333a2241646d696e6973747261746f72223b6c6173745f6e616d657c733a303a22223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31353a227468756d625f5f736572342e706e67223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323031392d30392d30392031313a30373a3539223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a313a2231223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a373a227461686170616e223b693a313b733a393a22616a61785f6c697374223b7d),
('9b60da5ba8f7ea423fc95d258b49e35430faf06f', '192.168.1.1', 1594696016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343639363031363b69735f6c6f67696e7c623a313b69647c733a313a2231223b70617373776f72647c733a33323a223163363263373236373965376630633965393364653062316263323433656439223b69645f726f6c657c733a313a2231223b757365726e616d657c733a31333a2241646d696e6973747261746f72223b66697273745f6e616d657c733a31333a2241646d696e6973747261746f72223b6c6173745f6e616d657c733a303a22223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31353a227468756d625f5f736572342e706e67223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323031392d30392d30392031313a30373a3539223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a313a2231223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('e3f0cf63cd2aa4b8a2a8ad703930fcdec6a780e9', '192.168.1.1', 1594696016, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343639363031363b),
('8ffbe9cfcd78eb7a5c1bc17b4e0a25f89db67264', '192.168.1.1', 1594707859, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343730373835393b),
('f6b4a989f8611cf827635be9c10194912846935d', '192.168.1.1', 1594715418, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343731353337333b69735f6c6f67696e7c623a313b69647c733a323a223630223b70617373776f72647c733a33323a223037363236303262396636633130623038383039376462393837646538393032223b69645f726f6c657c733a313a2232223b757365726e616d657c733a363a22647564756e67223b66697273745f6e616d657c733a31393a22466572792053697377616e612054616d70616e223b6c6173745f6e616d657c733a303a22223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323031392d31312d30332031383a30323a3236223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223630223b7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('5eb037713654ae1800b9d5f276ab2d978edf126a', '192.168.1.1', 1594968305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343936383330353b6572726f725f6d73677c733a37323a223c703e42616769616e20557365726e616d652077616a69622064696973692e3c2f703e0a3c703e42616769616e2050617373776f72642077616a69622064696973692e3c2f703e0a223b5f5f63695f766172737c613a313a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b7d),
('c9818aead8d6ca1455d2e514b27f497fd3d5f9f8', '192.168.1.1', 1594968305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343936383330353b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('419b550eaada2a379799793c3bd0f7140d0616fd', '192.168.1.1', 1594987350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539343938373335303b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('6116d0c36ace4f71e807d0792e49446469e2f79f', '192.168.1.1', 1595005533, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353030353533333b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('a4477859a7a72f6d2fb30ca9f3b01a3e3682e231', '192.168.1.1', 1595070404, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353037303430343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('aa99195a718143150f393211b6d6009688fe0b30', '192.168.1.1', 1595235993, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353233353939333b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('9feea8b2c1ba039201ed20b794ffc25fea75ac45', '192.168.1.1', 1595266905, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353236363930353b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('ed427bab47918461f5a764af3ff1d60ff9111561', '192.168.1.1', 1595343671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334333637313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('9j828i9spqd8fc9vpsasjohmkc58oao3', '192.168.1.1', 1595342412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334323431313b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('307418c0e20be3616b729822ba32be299c7293ae', '192.168.1.1', 1595344243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334343234333b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('75e772e2843f5f64345823d775bc5c2f298cc44a', '192.168.1.1', 1595344574, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334343537343b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('30948db54c809d060f82f34ff8fd835e3b8d9b1f', '192.168.1.1', 1595344329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334343332393b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('d06aca4571975b3224ec6d784b1febe6b8d05283', '192.168.1.1', 1595344333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334343333333b),
('10a794c7e782ff0977860efc038442ce360ed6dc', '192.168.1.1', 1595344916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334343931363b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2274657270696c6968223b693a313b733a383a22636574616b504446223b7d),
('2fc6e2fa6677e98fe37b0d9ed6f1093f45de77a6', '192.168.1.1', 1595345368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334353336383b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a373a226c61706f72616e223b693a313b733a383a22636574616b504446223b7d),
('999e300ec38642659f74cea00dc45168c54c3e3c', '192.168.1.1', 1595345749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334353734393b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2274657270696c6968223b693a313b733a363a226578706f7274223b7d),
('36e74428bbfd18131547429b76df0b406172d00d', '192.168.1.1', 1595346193, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334363139333b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2274657270696c6968223b693a313b733a383a22636574616b504446223b7d),
('1c8e4c616625de150ad4c6a8e1aba000e8825901', '192.168.1.1', 1595346201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353334363139333b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a353a2263616c6f6e223b693a313b733a363a226578706f7274223b7d),
('abc6dc3df61d3fc46a2fb0b8c22b857f2b931142', '192.168.1.1', 1595378358, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353337383335383b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('e459c46fa5e47beea6794a842231b3a0542f60c2', '192.168.1.1', 1595378368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353337383335383b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('f5725d77ff85f26e6c65c277fdc4f2442cd4ac59', '192.168.1.1', 1595387348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353338373334383b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('d9dbabc5f5074a37646f3783b0c9fe2776f1f160', '192.168.1.1', 1595387421, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353338373334383b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2274657270696c6968223b693a313b733a363a226578706f7274223b7d),
('db95a3ad7d294fc8f3924cf504b9a8fe039ae65e', '192.168.1.1', 1595399255, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353339393035363b69735f6c6f67696e7c623a313b69647c733a313a2231223b70617373776f72647c733a33323a223163363263373236373965376630633965393364653062316263323433656439223b69645f726f6c657c733a313a2231223b757365726e616d657c733a31333a2241646d696e6973747261746f72223b66697273745f6e616d657c733a31333a2241646d696e6973747261746f72223b6c6173745f6e616d657c733a303a22223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31353a227468756d625f5f736572342e706e67223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323032302d30372d31342031303a30363a3536223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303530223b6e616d615f6b65637c733a383a224172676170757261223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a313a2231223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('70694146eb3ceb44d7c26ddba8e0153d8ccb7a9f', '192.168.1.1', 1595405372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353430353337323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('dd9d439abe95ce5313e136324340bebddb25a1c6', '192.168.1.1', 1595435187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353433353138373b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('03ae5c14475834463dc05d86341e0b32432651c6', '192.168.1.1', 1595437726, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353433373732363b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('548c97b904b1b9dbd3fb6b13950b78914f379c60', '192.168.1.1', 1595459887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353435393838373b),
('fe3e719885f72a955a23710dcdf414a278d2d041', '192.168.1.1', 1595589104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353538393130343b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d),
('ifh9iq92h72rn58oum42sbrtg0if6s0v', '192.168.10.10', 1595601968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353630313930373b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('d28le2tsr2c4mtp7rh2a2qs47ce29lq4', '114.122.103.47', 1595666995, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353636363939353b69735f6c6f67696e7c623a313b69647c733a323a223537223b70617373776f72647c733a33323a226433373465656435313637326632663337383937333030376164306436303831223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31343a2270696c6b616465735f746170656d223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a22546170656d223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a31373a226c6f676f5f7369647564756e6b2e6a7067223b637265617465645f6f6e7c733a31393a22323031392d30352d32322031313a30313a3132223b6c6173745f6c6f67696e7c733a31393a22323032302d30322d31322031353a34393a3030223b69645f6f70647c733a323a223830223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223537223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('o6n9cv91u11johi5v36qal6mmlpshokc', '114.122.103.47', 1595667983, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353636373938333b69735f6c6f67696e7c623a313b69647c733a323a223634223b70617373776f72647c733a33323a223961313837313131343331643461313833323164326666306437656431353765223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31303a2264656d6f5f61646d696e223b66697273745f6e616d657c733a31383a2244656d6f2041646d696e6973747261746f72223b6c6173745f6e616d657c733a393a224b616275706174656e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323032302d30372d32352031353a35353a3537223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223634223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('pebom50tbm76et8lm6f5a5f5f8vo7b1n', '114.122.103.47', 1595668303, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353636383330333b69735f6c6f67696e7c623a313b69647c733a323a223634223b70617373776f72647c733a33323a223961313837313131343331643461313833323164326666306437656431353765223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31303a2264656d6f5f61646d696e223b66697273745f6e616d657c733a31383a2244656d6f2041646d696e6973747261746f72223b6c6173745f6e616d657c733a393a224b616275706174656e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323032302d30372d32352031353a35353a3537223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223634223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a353a2263616c6f6e223b693a313b733a393a22616a61785f6c697374223b7d),
('1rklga7d2b1l3cupp8c3r7297thadphd', '114.122.103.47', 1595668925, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353636383932353b69735f6c6f67696e7c623a313b69647c733a323a223634223b70617373776f72647c733a33323a223961313837313131343331643461313833323164326666306437656431353765223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31303a2264656d6f5f61646d696e223b66697273745f6e616d657c733a31383a2244656d6f2041646d696e6973747261746f72223b6c6173745f6e616d657c733a393a224b616275706174656e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323032302d30372d32352031363a31333a3431223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223634223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a353a2263616c6f6e223b693a313b733a393a22616a61785f6c697374223b7d),
('3jdmj6m870dgcqld7be9kegtv8jjkun6', '114.122.103.47', 1595669847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353636393834373b69735f6c6f67696e7c623a313b69647c733a323a223634223b70617373776f72647c733a33323a223961313837313131343331643461313833323164326666306437656431353765223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31303a2264656d6f5f61646d696e223b66697273745f6e616d657c733a31383a2244656d6f2041646d696e6973747261746f72223b6c6173745f6e616d657c733a393a224b616275706174656e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323032302d30372d32352031363a31333a3431223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223634223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('oltvduokffg3mj5nu3f35ie22fsuorrg', '114.122.103.47', 1595669832, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353636393833323b7365676d656e747c613a313a7b693a303b733a303a22223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('6mdrmjkmeg97o88m6tfoc0j179raomfd', '114.122.103.47', 1595670625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353637303632353b),
('fotddua6dcqdj2h04ch9gnb4uu4su71c', '114.122.103.47', 1595670700, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353637303632353b6572726f725f6d73677c733a3230343a223c64697620636c6173733d22616c65727420616c6572742d64616e67657220616c6572742d6469736d69737369626c65223e3c6120687265663d22232220636c6173733d22636c6f73652220646174612d6469736d6973733d22616c6572742220617269612d6c6162656c3d22636c6f7365223e2674696d65733b3c2f613e3c62207374796c653d22666f6e742d73697a653a2032307078223e47414c41543c2f623e3c62723e557365726e616d65202f2050617373776f726420416e64612053616c61682e3c2f6469763e223b5f5f63695f766172737c613a313a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b7d),
('gb1ujiemg2ecfuqog4srimmt6ofv7cte', '114.122.103.47', 1595672515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353637323531353b6572726f725f6d73677c733a3230343a223c64697620636c6173733d22616c65727420616c6572742d64616e67657220616c6572742d6469736d69737369626c65223e3c6120687265663d22232220636c6173733d22636c6f73652220646174612d6469736d6973733d22616c6572742220617269612d6c6162656c3d22636c6f7365223e2674696d65733b3c2f613e3c62207374796c653d22666f6e742d73697a653a2032307078223e47414c41543c2f623e3c62723e557365726e616d65202f2050617373776f726420416e64612053616c61682e3c2f6469763e223b5f5f63695f766172737c613a313a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b7d),
('5bj67qv99njs141jsaq6t0aimumqiqth', '114.122.103.47', 1595672583, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539353637323538333b),
('md1omo14ics4k2kf9fh657a3d4rios7u', '::1', 1597048262, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539373034383236323b7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('bp8rgffktjflh7u3rr130r4dgtc498m3', '::1', 1597049228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539373034393232383b7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226f6c64223b7d),
('d5i96cvv1k980aehlb98mf76gv849g26', '::1', 1597049311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539373034393232383b69735f6c6f67696e7c623a313b69647c733a323a223634223b70617373776f72647c733a33323a223235643535616432383361613430306166343634633736643731336330376164223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31303a2264656d6f5f61646d696e223b66697273745f6e616d657c733a31383a2244656d6f2041646d696e6973747261746f72223b6c6173745f6e616d657c733a393a224b616275706174656e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323032302d30372d32352031373a32333a3033223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223634223b5f5f63695f766172737c613a313a7b733a373a227365676d656e74223b733a333a226e6577223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('c8ltkfqko8ompi0mokm6khvi5fpmgmtv', '::1', 1700980257, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303938303235373b7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d5f5f63695f766172737c613a323a7b733a373a227365676d656e74223b733a333a226f6c64223b733a393a226572726f725f6d7367223b733a333a226f6c64223b7d6572726f725f6d73677c733a37313a223c62207374796c653d22666f6e742d73697a653a2032307078223e47414c41543c2f623e3c62723e557365726e616d65202f2050617373776f726420416e64612053616c61682e223b),
('4926p80p5oljdqsmids4q2q9giinsgru', '::1', 1700980781, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303938303738313b7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d5f5f63695f766172737c613a323a7b733a373a227365676d656e74223b733a333a226f6c64223b733a393a226572726f725f6d7367223b733a333a226f6c64223b7d6572726f725f6d73677c733a37323a223c703e42616769616e20557365726e616d652077616a69622064696973692e3c2f703e0a3c703e42616769616e2050617373776f72642077616a69622064696973692e3c2f703e0a223b),
('rmqdb1fca0f5d0us0nsacu0p51dm3arv', '::1', 1700981358, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303938313335383b7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d5f5f63695f766172737c613a333a7b733a373a227365676d656e74223b733a333a226e6577223b733a393a226572726f725f6d7367223b733a333a226f6c64223b733a333a226d7367223b733a333a226f6c64223b7d6572726f725f6d73677c733a37323a223c703e42616769616e20557365726e616d652077616a69622064696973692e3c2f703e0a3c703e42616769616e2050617373776f72642077616a69622064696973692e3c2f703e0a223b69735f6c6f67696e7c623a313b69647c733a323a223634223b70617373776f72647c733a33323a223235643535616432383361613430306166343634633736643731336330376164223b69645f726f6c657c733a313a2232223b757365726e616d657c733a31303a2264656d6f5f61646d696e223b66697273745f6e616d657c733a31383a2244656d6f2041646d696e6973747261746f72223b6c6173745f6e616d657c733a393a224b616275706174656e223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a303a22223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323032302d30372d32352031373a32333a3033223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223634223b6d73677c733a3336323a223c7020636c6173733d22626f782d6d7367223e0a090909092020202020203c64697620636c6173733d22696e666f2d626f7820616c6572742d73756363657373223e0a09090909092020202020203c64697620636c6173733d22696e666f2d626f782d69636f6e223e0a0909090909202020202020093c6920636c6173733d2266612066612d636865636b2d636972636c65223e3c2f693e0a09090909092020202020203c2f6469763e0a09090909092020202020203c64697620636c6173733d22696e666f2d626f782d636f6e74656e7422207374796c653d22666f6e742d73697a653a31347078223e0a090909092020202020202020093c62207374796c653d22666f6e742d73697a653a2032307078223e53656c616d617420646174616e672044656d6f2041646d696e6973747261746f72204b616275706174656e2e2e2e2e2e2e3c2f623e3c2f6469763e0a090909090920203c2f6469763e0a09090909202020203c2f703e223b),
('7tsr5ch44pkdbdrvio68oa7tsergr3e0', '::1', 1700981663, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303938313636333b7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d5f5f63695f766172737c613a333a7b733a373a227365676d656e74223b733a333a226e6577223b733a393a226572726f725f6d7367223b733a333a226f6c64223b733a333a226d7367223b733a333a226f6c64223b7d6572726f725f6d73677c733a37323a223c703e42616769616e20557365726e616d652077616a69622064696973692e3c2f703e0a3c703e42616769616e2050617373776f72642077616a69622064696973692e3c2f703e0a223b69735f6c6f67696e7c623a313b69647c733a323a223634223b70617373776f72647c733a33323a223235643535616432383361613430306166343634633736643731336330376164223b69645f726f6c657c733a313a2232223b757365726e616d657c733a343a22616c7361223b66697273745f6e616d657c733a363a22416c73616161223b6c6173745f6e616d657c733a333a22436161223b656d61696c7c733a303a22223b70686f6e657c733a303a22223b70686f746f7c733a32393a225061726b5f4a656f6e67776f6f5f6f665f54726561737572652e6a7067223b637265617465645f6f6e7c733a31393a22303030302d30302d30302030303a30303a3030223b6c6173745f6c6f67696e7c733a31393a22323032302d30372d32352031373a32333a3033223b69645f6f70647c733a313a2230223b69645f6b61627c733a343a2233323130223b69645f6b65637c733a373a2233323130303730223b6e616d615f6b65637c733a31303a224d616a616c656e676b61223b74686e5f646174617c733a343a2232303139223b7374617475737c733a383a224c6f67656420696e223b69646e79617c733a323a223634223b6d73677c733a3335333a223c7020636c6173733d22626f782d6d7367223e0a090909092020202020203c64697620636c6173733d22696e666f2d626f7820616c6572742d73756363657373223e0a09090909092020202020203c64697620636c6173733d22696e666f2d626f782d69636f6e223e0a0909090909202020202020093c6920636c6173733d2266612066612d636865636b2d636972636c65223e3c2f693e0a09090909092020202020203c2f6469763e0a09090909092020202020203c64697620636c6173733d22696e666f2d626f782d636f6e74656e7422207374796c653d22666f6e742d73697a653a31347078223e0a090909092020202020202020093c62207374796c653d22666f6e742d73697a653a2032307078223e424552484153494c3c2f623e3c62723e446174612050726f66696c6520426572686173696c206469756261683c2f6469763e0a090909090920203c2f6469763e0a09090909202020203c2f703e223b6e616d615f696e7374616e73697c4e3b74686e5f706b70747c4e3b),
('82hob1ajuk4uafv4vreva5ahtldbhm9u', '::1', 1700981776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303938313636333b7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d5f5f63695f766172737c613a323a7b733a373a227365676d656e74223b733a333a226f6c64223b733a393a226572726f725f6d7367223b733a333a226f6c64223b7d6572726f725f6d73677c733a37313a223c62207374796c653d22666f6e742d73697a653a2032307078223e47414c41543c2f623e3c62723e557365726e616d65202f2050617373776f726420416e64612053616c61682e223b),
('jr9608dgkko16pq486ru080ekcftvifs', '::1', 1700995796, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303939353739363b6572726f725f6d73677c733a37313a223c62207374796c653d22666f6e742d73697a653a2032307078223e47414c41543c2f623e3c62723e557365726e616d65202f2050617373776f726420416e64612053616c61682e223b5f5f63695f766172737c613a323a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b733a373a227365676d656e74223b733a333a226f6c64223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('kousu89eblcannco0utsogtk3k0uqfhq', '::1', 1700995797, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730303939353739363b6572726f725f6d73677c733a37313a223c62207374796c653d22666f6e742d73697a653a2032307078223e47414c41543c2f623e3c62723e557365726e616d65202f2050617373776f726420416e64612053616c61682e223b5f5f63695f766172737c613a323a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b733a373a227365676d656e74223b733a333a226f6c64223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('i0kqiump95vfbm6sb9e46loh1an27eij', '::1', 1701052600, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730313035323630303b6572726f725f6d73677c733a37313a223c62207374796c653d22666f6e742d73697a653a2032307078223e47414c41543c2f623e3c62723e557365726e616d65202f2050617373776f726420416e64612053616c61682e223b5f5f63695f766172737c613a323a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b733a373a227365676d656e74223b733a333a226f6c64223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('vincigv4ockiosikdhr78a6res3o6mkm', '::1', 1701052906, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730313035323930363b6572726f725f6d73677c733a37313a223c62207374796c653d22666f6e742d73697a653a2032307078223e47414c41543c2f623e3c62723e557365726e616d65202f2050617373776f726420416e64612053616c61682e223b5f5f63695f766172737c613a323a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b733a373a227365676d656e74223b733a333a226f6c64223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d),
('870srq34glgpi945d34mlp81r84s0urg', '::1', 1701053061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313730313035323930363b6572726f725f6d73677c733a37313a223c62207374796c653d22666f6e742d73697a653a2032307078223e47414c41543c2f623e3c62723e557365726e616d65202f2050617373776f726420416e64612053616c61682e223b5f5f63695f766172737c613a323a7b733a393a226572726f725f6d7367223b733a333a226f6c64223b733a373a227365676d656e74223b733a333a226f6c64223b7d7365676d656e747c613a323a7b693a303b733a383a2250656e6767756e61223b693a313b733a363a2274616d70696c223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id` int(11) NOT NULL,
  `tahap` varchar(150) NOT NULL,
  `stat` char(1) NOT NULL,
  `tgl_awal` datetime NOT NULL,
  `tgl_akhir` datetime NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id`, `tahap`, `stat`, `tgl_awal`, `tgl_akhir`, `ket`) VALUES
(1, 'Pengelolaan Data Pokok/DPT', '0', '2020-05-20 01:17:56', '2020-11-07 23:00:00', ''),
(2, 'Pengelolaan Data Calon Kepala Desa', '0', '2020-05-05 01:00:00', '2020-10-15 11:45:00', ''),
(3, 'Input Hasil Pemilihan', '0', '2019-11-02 01:00:00', '2019-11-07 23:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `activation_code` varchar(50) NOT NULL,
  `forgotten_password_code` varchar(50) NOT NULL,
  `forgotten_password_time` datetime NOT NULL,
  `remember_code` varchar(50) NOT NULL,
  `created_on` datetime NOT NULL,
  `last_login` datetime NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `id_opd` int(1) NOT NULL,
  `id_kab` varchar(4) NOT NULL,
  `id_kec` varchar(7) NOT NULL,
  `logged_in` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `id_role`, `username`, `password`, `first_name`, `last_name`, `email`, `phone`, `photo`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `id_opd`, `id_kab`, `id_kec`, `logged_in`) VALUES
(64, 2, 'alsa', '25d55ad283aa400af464c76d713c07ad', 'Alsaaa', 'Caa', '', '', 'Park_Jeongwoo_of_Treasure.jpg', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '2023-11-26 13:54:23', 'Y', 0, '3210', '3210070', 'N'),
(65, 3, 'demo_kec', '49a38e181b80b450181492c35e465d5c', 'Demo Operator', 'Kecamatan', '', '', '', '', '', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00', '2020-07-25 16:14:10', 'Y', 0, '3210', '3210050', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wdesa`
--

CREATE TABLE `tbl_wdesa` (
  `id_desa` varchar(10) NOT NULL,
  `kecamatan_id` varchar(7) DEFAULT NULL,
  `nama_desa` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_wdesa`
--

INSERT INTO `tbl_wdesa` (`id_desa`, `kecamatan_id`, `nama_desa`) VALUES
('3210010001', '3210010', 'Cipasung'),
('3210010002', '3210010', 'Borogojol'),
('3210010003', '3210010', 'Bangbayang'),
('3210010004', '3210010', 'Cibulan'),
('3210010005', '3210010', 'Lemahputih'),
('3210010006', '3210010', 'Sadawangi'),
('3210010007', '3210010', 'Margajaya'),
('3210010008', '3210010', 'Kalapadua'),
('3210010009', '3210010', 'Cigaleuh'),
('3210010010', '3210010', 'Mekarmulya'),
('3210010011', '3210010', 'Sinargalih'),
('3210010012', '3210010', 'Padarek'),
('3210010013', '3210010', 'Sukajadi'),
('3210010014', '3210010', 'Kepuh'),
('3210010015', '3210010', 'Mekarwangi'),
('3210010016', '3210010', 'Sukamaju'),
('3210010017', '3210010', 'Lemahsugih'),
('3210010018', '3210010', 'Dayeuhwangi'),
('3210010019', '3210010', 'Cisalak'),
('3210020009', '3210020', 'Sindanghurip'),
('3210020010', '3210020', 'Cipeundeuy'),
('3210020012', '3210020', 'Cimangguhilir'),
('3210020013', '3210020', 'Salawangi'),
('3210020014', '3210020', 'Silihwangi'),
('3210020015', '3210020', 'Wadowetan'),
('3210020016', '3210020', 'Bantarujeg'),
('3210020017', '3210020', 'Babakansari'),
('3210020018', '3210020', 'Gununglarang'),
('3210020019', '3210020', 'Cikidang'),
('3210020020', '3210020', 'Cinambo'),
('3210020021', '3210020', 'Haurgeulis'),
('3210020022', '3210020', 'Sukamenak'),
('3210021001', '3210021', 'Buninagara'),
('3210021002', '3210021', 'Werasari'),
('3210021003', '3210021', 'Malausma'),
('3210021004', '3210021', 'Banyusari'),
('3210021005', '3210021', 'Jagamulya'),
('3210021006', '3210021', 'Cimuncang'),
('3210021007', '3210021', 'Ciranca'),
('3210021008', '3210021', 'Lebakwangi'),
('3210021009', '3210021', 'Sukadana'),
('3210021010', '3210021', 'Girimukti'),
('3210021011', '3210021', 'Kramatjaya'),
('3210030014', '3210030', 'Cisoka'),
('3210030015', '3210030', 'Sindangpanji'),
('3210030016', '3210030', 'Cikijing'),
('3210030017', '3210030', 'Cidulang'),
('3210030018', '3210030', 'Sukamukti'),
('3210030019', '3210030', 'Kasturi'),
('3210030020', '3210030', 'Banjaransari'),
('3210030021', '3210030', 'Sindang'),
('3210030022', '3210030', 'Sukasari'),
('3210030023', '3210030', 'Sunalari'),
('3210030024', '3210030', 'Bagjasari'),
('3210030025', '3210030', 'Jagasari'),
('3210030026', '3210030', 'Cilangcang'),
('3210030027', '3210030', 'Kancana'),
('3210030028', '3210030', 'Cipulus'),
('3210031001', '3210031', 'Sedareja'),
('3210031002', '3210031', 'Cintaasih'),
('3210031003', '3210031', 'Cidadap'),
('3210031004', '3210031', 'Maniis'),
('3210031005', '3210031', 'Rawa'),
('3210031006', '3210031', 'Nagarakembang'),
('3210031007', '3210031', 'Wangkelang'),
('3210031008', '3210031', 'Cimanggugirang'),
('3210031009', '3210031', 'Ciranjeng'),
('3210031010', '3210031', 'Cingambul'),
('3210031011', '3210031', 'Muktisari'),
('3210031012', '3210031', 'Cikondang'),
('3210031013', '3210031', 'Kondangmekar'),
('3210040001', '3210040', 'Margamukti'),
('3210040002', '3210040', 'Cibeureum'),
('3210040003', '3210040', 'Cikeusal'),
('3210040004', '3210040', 'Jatipamor'),
('3210040005', '3210040', 'Cicanir'),
('3210040006', '3210040', 'Campaga'),
('3210040007', '3210040', 'Lampuyang'),
('3210040008', '3210040', 'Mekarraharja'),
('3210040009', '3210040', 'Talagakulon'),
('3210040010', '3210040', 'Talagawetan'),
('3210040011', '3210040', 'Salado'),
('3210040012', '3210040', 'Argasari'),
('3210040013', '3210040', 'Gunungmanik'),
('3210040014', '3210040', 'Ganeas'),
('3210040015', '3210040', 'Sukaperna'),
('3210040016', '3210040', 'Kertarahayu'),
('3210040017', '3210040', 'Mekarhurip'),
('3210041001', '3210041', 'Genteng'),
('3210041002', '3210041', 'Hegarmanah'),
('3210041003', '3210041', 'Sindangpala'),
('3210041004', '3210041', 'Darmalarang'),
('3210041005', '3210041', 'Suniabaru'),
('3210041006', '3210041', 'Sangiang'),
('3210041007', '3210041', 'Sunia'),
('3210041008', '3210041', 'Kareo'),
('3210041009', '3210041', 'Banjaran'),
('3210041010', '3210041', 'Kagok'),
('3210041011', '3210041', 'Cimeong'),
('3210041012', '3210041', 'Panyindangan'),
('3210041013', '3210041', 'Girimulya'),
('3210050001', '3210050', 'Sagara'),
('3210050002', '3210050', 'Cibunut'),
('3210050003', '3210050', 'Tejamulya'),
('3210050004', '3210050', 'Sukasari Kidul'),
('3210050005', '3210050', 'Sukasari Kaler'),
('3210050006', '3210050', 'Sadasari'),
('3210050007', '3210050', 'Sukadana'),
('3210050008', '3210050', 'Argamukti'),
('3210050009', '3210050', 'Argalingga'),
('3210050010', '3210050', 'Haurseah'),
('3210050011', '3210050', 'Gunungwangi'),
('3210050012', '3210050', 'Mekarwangi'),
('3210050013', '3210050', 'Heubeulisuk'),
('3210050014', '3210050', 'Cikaracak'),
('3210060001', '3210060', 'Cihaur'),
('3210060002', '3210060', 'Wanahayu'),
('3210060003', '3210060', 'Cengal'),
('3210060004', '3210060', 'Anggrawati'),
('3210060005', '3210060', 'Cipicung'),
('3210060006', '3210060', 'Malongpong'),
('3210060007', '3210060', 'Tegalsari'),
('3210060008', '3210060', 'Maja Selatan'),
('3210060009', '3210060', 'Maja Utara'),
('3210060010', '3210060', 'Pasanggrahan'),
('3210060011', '3210060', 'Cieurih'),
('3210060012', '3210060', 'Kertabasuki'),
('3210060013', '3210060', 'Sindangkerta'),
('3210060014', '3210060', 'Banjaran'),
('3210060015', '3210060', 'Paniis'),
('3210060016', '3210060', 'Cicalung'),
('3210060017', '3210060', 'Pageraji'),
('3210060018', '3210060', 'Nunuk Baru'),
('3210070001', '3210070', 'Babakanjawa'),
('3210070002', '3210070', 'Cibodas'),
('3210070003', '3210070', 'Kulur'),
('3210070004', '3210070', 'Kawunggirang'),
('3210070005', '3210070', 'Sindangkasih'),
('3210070006', '3210070', 'Cicurug'),
('3210070007', '3210070', 'Majalengka Wetan'),
('3210070008', '3210070', 'Tonjong'),
('3210070009', '3210070', 'Tarikolot'),
('3210070010', '3210070', 'Cikasarung'),
('3210070011', '3210070', 'Cijati'),
('3210070012', '3210070', 'Majalengka Kulon'),
('3210070013', '3210070', 'Munjul'),
('3210070014', '3210070', 'Sidamukti'),
('3210080001', '3210080', 'Kawunghilir'),
('3210080002', '3210080', 'Tajur'),
('3210080003', '3210080', 'Cigasong'),
('3210080004', '3210080', 'Simpeureum'),
('3210080005', '3210080', 'Tenjolayar'),
('3210080006', '3210080', 'Kutamanggu'),
('3210080007', '3210080', 'Cicenang'),
('3210080008', '3210080', 'Baribis'),
('3210080009', '3210080', 'Batujaya'),
('3210080010', '3210080', 'Karayunan'),
('3210090001', '3210090', 'Candrajaya'),
('3210090002', '3210090', 'Ciomas'),
('3210090010', '3210090', 'Padahanten'),
('3210090011', '3210090', 'Sukahaji'),
('3210090012', '3210090', 'Cikalong'),
('3210090013', '3210090', 'Babakanmanjeti'),
('3210090014', '3210090', 'Cikoneng'),
('3210090015', '3210090', 'Palabuan'),
('3210090016', '3210090', 'Cikeusik'),
('3210090017', '3210090', 'Salagedang'),
('3210090018', '3210090', 'Tanjungsari'),
('3210090019', '3210090', 'Jayi'),
('3210090020', '3210090', 'Nanggewer'),
('3210091001', '3210091', 'Pasirayu'),
('3210091002', '3210091', 'Garawastu'),
('3210091003', '3210091', 'Sangkanhurip'),
('3210091004', '3210091', 'Indrakila'),
('3210091005', '3210091', 'Sindang'),
('3210091006', '3210091', 'Gunungkuning'),
('3210091007', '3210091', 'Bayureja'),
('3210100001', '3210100', 'Pajajar'),
('3210100002', '3210100', 'Teja'),
('3210100003', '3210100', 'Payung'),
('3210100004', '3210100', 'Sindangpano'),
('3210100005', '3210100', 'Babakankareo'),
('3210100006', '3210100', 'Sadomas'),
('3210100007', '3210100', 'Kumbung'),
('3210100008', '3210100', 'Rajagaluh Kidul'),
('3210100009', '3210100', 'Singawada'),
('3210100010', '3210100', 'Rajagaluh'),
('3210100011', '3210100', 'Rajagaluh Lor'),
('3210100012', '3210100', 'Cipinang'),
('3210100013', '3210100', 'Cisetu'),
('3210110001', '3210110', 'Bantaragung'),
('3210110002', '3210110', 'Padaherang'),
('3210110003', '3210110', 'Lengkongwetan'),
('3210110004', '3210110', 'Lengkongkulon'),
('3210110005', '3210110', 'Jerukleueut'),
('3210110006', '3210110', 'Sindangwangi'),
('3210110007', '3210110', 'Buahkapas'),
('3210110008', '3210110', 'Ujungberung'),
('3210110009', '3210110', 'Leuwilaja'),
('3210110010', '3210110', 'Balagedog'),
('3210120001', '3210120', 'Parakan'),
('3210120002', '3210120', 'Lame'),
('3210120003', '3210120', 'Mindi'),
('3210120004', '3210120', 'Rajawangi'),
('3210120005', '3210120', 'Leuwikujang'),
('3210120006', '3210120', 'Nanggerang'),
('3210120007', '3210120', 'Patuanan'),
('3210120008', '3210120', 'Tanjungsari'),
('3210120009', '3210120', 'Karangasem'),
('3210120010', '3210120', 'Heuleut'),
('3210120011', '3210120', 'Ciparay'),
('3210120012', '3210120', 'Leuwimunding'),
('3210120013', '3210120', 'Mirat'),
('3210120014', '3210120', 'Parungjaya'),
('3210130001', '3210130', 'Weragati'),
('3210130002', '3210130', 'Trajaya'),
('3210130003', '3210130', 'Tarikolot'),
('3210130004', '3210130', 'Sindanghaji'),
('3210130005', '3210130', 'Enggalwangi'),
('3210130006', '3210130', 'Buniwangi'),
('3210130007', '3210130', 'Palasah'),
('3210130008', '3210130', 'Pasir'),
('3210130009', '3210130', 'Waringin'),
('3210130010', '3210130', 'Karamat'),
('3210130011', '3210130', 'Sindangwasa'),
('3210130012', '3210130', 'Cisambeng'),
('3210130013', '3210130', 'Majasuka'),
('3210140001', '3210140', 'Pinangraja'),
('3210140002', '3210140', 'Sukaraja Kulon'),
('3210140003', '3210140', 'Sukaraja Wetan'),
('3210140004', '3210140', 'Cibentar'),
('3210140005', '3210140', 'Leuwenggede'),
('3210140006', '3210140', 'Andir'),
('3210140007', '3210140', 'Cicadas'),
('3210140008', '3210140', 'Burujulwetan'),
('3210140009', '3210140', 'Burujulkulon'),
('3210140010', '3210140', 'Mekarsari'),
('3210140011', '3210140', 'Jatiwangi'),
('3210140012', '3210140', 'Surawangi'),
('3210140013', '3210140', 'Jatisura'),
('3210140014', '3210140', 'Sutawangi'),
('3210140015', '3210140', 'Ciborelang'),
('3210140016', '3210140', 'Loji'),
('3210150011', '3210150', 'Bojongcideres'),
('3210150012', '3210150', 'Dawuan'),
('3210150013', '3210150', 'Genteng'),
('3210150014', '3210150', 'Gandu'),
('3210150015', '3210150', 'Sinarjati'),
('3210150016', '3210150', 'Baturuyuk'),
('3210150017', '3210150', 'Mandapa'),
('3210150018', '3210150', 'Balida'),
('3210150019', '3210150', 'Pasirmalati'),
('3210150020', '3210150', 'Karanganyar'),
('3210150021', '3210150', 'Salawana'),
('3210151001', '3210151', 'Jatisawit'),
('3210151002', '3210151', 'Leuwikidang'),
('3210151003', '3210151', 'Girimukti'),
('3210151004', '3210151', 'Jatimulya'),
('3210151005', '3210151', 'Wanajaya'),
('3210151006', '3210151', 'Ranjiwetan'),
('3210151007', '3210151', 'Ranjikulon'),
('3210151008', '3210151', 'Gunungsari'),
('3210151009', '3210151', 'Kasokandel'),
('3210151010', '3210151', 'Gandasari'),
('3210160001', '3210160', 'Cijurey'),
('3210160002', '3210160', 'Pasirmuncang'),
('3210160003', '3210160', 'Jatipamor'),
('3210160004', '3210160', 'Bantrangsana'),
('3210160005', '3210160', 'Jatiserang'),
('3210160006', '3210160', 'Bonang'),
('3210160007', '3210160', 'Leuwiseeng'),
('3210160008', '3210160', 'Karyamukti'),
('3210160009', '3210160', 'Panyingkiran'),
('3210170001', '3210170', 'Liangjulang'),
('3210170002', '3210170', 'Heuleut'),
('3210170003', '3210170', 'Cipaku'),
('3210170004', '3210170', 'Kadipaten'),
('3210170005', '3210170', 'Babakananyar'),
('3210170006', '3210170', 'Karangsambung'),
('3210170007', '3210170', 'Pagandon'),
('3210180001', '3210180', 'Mekarjaya'),
('3210180002', '3210180', 'Palasah'),
('3210180003', '3210180', 'Pakubeureum'),
('3210180004', '3210180', 'Sukawana'),
('3210180005', '3210180', 'Kertawinangun'),
('3210180006', '3210180', 'Babakan'),
('3210180007', '3210180', 'Kertajati'),
('3210180008', '3210180', 'Kertasari'),
('3210180009', '3210180', 'Mekarmulya'),
('3210180010', '3210180', 'Sukamulya'),
('3210180011', '3210180', 'Bantarjati'),
('3210180012', '3210180', 'Pasiripis'),
('3210180013', '3210180', 'Sukakerta'),
('3210180014', '3210180', 'Sahbandar'),
('3210190001', '3210190', 'Biyawak'),
('3210190002', '3210190', 'Pasindangan'),
('3210190003', '3210190', 'Panongan'),
('3210190004', '3210190', 'Panyingkiran'),
('3210190005', '3210190', 'Randegan Kulon'),
('3210190006', '3210190', 'Randegan Wetan'),
('3210190007', '3210190', 'Putridalem'),
('3210190008', '3210190', 'Jatitengah'),
('3210190009', '3210190', 'Jatitujuh'),
('3210190010', '3210190', 'Babajurang'),
('3210190011', '3210190', 'Pilangsari'),
('3210190012', '3210190', 'Jatiraga'),
('3210190013', '3210190', 'Sumber Kulon'),
('3210190014', '3210190', 'Sumber Wetan'),
('3210190015', '3210190', 'Pangkalanpari'),
('3210200001', '3210200', 'Cibogor'),
('3210200002', '3210200', 'Kertasari'),
('3210200003', '3210200', 'Gandawesi'),
('3210200004', '3210200', 'Beusi'),
('3210200005', '3210200', 'Tegalaren'),
('3210200006', '3210200', 'Buntu'),
('3210200007', '3210200', 'Beber'),
('3210200008', '3210200', 'Wanasalam'),
('3210200009', '3210200', 'Ligung Lor'),
('3210200010', '3210200', 'Ligung'),
('3210200011', '3210200', 'Majasari'),
('3210200012', '3210200', 'Sukawera'),
('3210200013', '3210200', 'Bantarwaru'),
('3210200014', '3210200', 'Ampel'),
('3210200015', '3210200', 'Leuweunghapit'),
('3210200016', '3210200', 'Kodasari'),
('3210200017', '3210200', 'Kedungkancana'),
('3210200018', '3210200', 'Leuwiliang Baru'),
('3210200019', '3210200', 'Kedungsari'),
('3210210001', '3210210', 'Sumberjaya'),
('3210210002', '3210210', 'Garawangi'),
('3210210003', '3210210', 'Banjaran'),
('3210210004', '3210210', 'Sepat'),
('3210210005', '3210210', 'Paningkiran'),
('3210210006', '3210210', 'Parapatan'),
('3210210007', '3210210', 'Panjalin Kidul'),
('3210210008', '3210210', 'Rancaputat'),
('3210210009', '3210210', 'Bongas Wetan'),
('3210210010', '3210210', 'Bongas Kulon'),
('3210210011', '3210210', 'Panjalin Lor'),
('3210210012', '3210210', 'Cidenok'),
('3210210013', '3210210', 'Lojikobong'),
('3210210014', '3210210', 'Gelokmulya'),
('3210210015', '3210210', 'Pancaksuji');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wkabupaten`
--

CREATE TABLE `tbl_wkabupaten` (
  `id_kab` varchar(4) NOT NULL,
  `provinsi_id` varchar(2) NOT NULL DEFAULT '',
  `nama_kab` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wkecamatan`
--

CREATE TABLE `tbl_wkecamatan` (
  `id_kec` varchar(7) NOT NULL,
  `kabupaten_id` varchar(4) NOT NULL DEFAULT '',
  `nama_kec` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tbl_wkecamatan`
--

INSERT INTO `tbl_wkecamatan` (`id_kec`, `kabupaten_id`, `nama_kec`) VALUES
('3210010', '3210', 'Lemahsugih'),
('3210020', '3210', 'Bantarujeg'),
('3210021', '3210', 'Malausma'),
('3210030', '3210', 'Cikijing'),
('3210031', '3210', 'Cingambul'),
('3210040', '3210', 'Talaga'),
('3210041', '3210', 'Banjaran'),
('3210050', '3210', 'Argapura'),
('3210060', '3210', 'Maja'),
('3210070', '3210', 'Majalengka'),
('3210080', '3210', 'Cigasong'),
('3210090', '3210', 'Sukahaji'),
('3210091', '3210', 'Sindang'),
('3210100', '3210', 'Rajagaluh'),
('3210110', '3210', 'Sindangwangi'),
('3210120', '3210', 'Leuwimunding'),
('3210130', '3210', 'Palasah'),
('3210140', '3210', 'Jatiwangi'),
('3210150', '3210', 'Dawuan'),
('3210151', '3210', 'Kasokandel'),
('3210160', '3210', 'Panyingkiran'),
('3210170', '3210', 'Kadipaten'),
('3210180', '3210', 'Kertajati'),
('3210190', '3210', 'Jatitujuh'),
('3210200', '3210', 'Ligung'),
('3210210', '3210', 'Sumberjaya');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_wprovinsi`
--

CREATE TABLE `tbl_wprovinsi` (
  `id_prop` varchar(2) NOT NULL,
  `nama_prop` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Structure for view `tbl_calon_extended`
--
DROP TABLE IF EXISTS `tbl_calon_extended`;

CREATE ALGORITHM=UNDEFINED DEFINER=`pilkades`@`%` SQL SECURITY DEFINER VIEW `tbl_calon_extended`  AS SELECT `tbl_calon`.`id` AS `id`, `tbl_calon`.`thn_pemilihan` AS `thn_pemilihan`, `tbl_calon`.`kdkab` AS `kdkab`, `tbl_calon`.`kdkec` AS `kdkec`, `tbl_calon`.`kddesa` AS `kddesa`, `tbl_calon`.`nourut` AS `nourut`, `tbl_calon`.`nama` AS `nama`, `tbl_calon`.`nik` AS `nik`, `tbl_calon`.`tmp_lahir` AS `tmp_lahir`, `tbl_calon`.`tgl_lahir` AS `tgl_lahir`, `tbl_calon`.`kelamin` AS `kelamin`, `tbl_calon`.`agama` AS `agama`, `tbl_calon`.`alamat1` AS `alamat1`, `tbl_calon`.`alamat2` AS `alamat2`, `tbl_calon`.`id_pendidikan` AS `id_pendidikan`, `tbl_calon`.`pendidikan` AS `pendidikan`, `tbl_calon`.`id_pekerjaan` AS `id_pekerjaan`, `tbl_calon`.`organisasi` AS `organisasi`, `tbl_calon`.`keterangan` AS `keterangan`, `tbl_calon`.`photo` AS `photo`, `tbl_calon`.`s_hasil` AS `s_hasil`, CASE WHEN `tbl_calon`.`nourut` = '1' THEN `tbl_calon`.`s_hasil` END AS `CALON1`, CASE WHEN `tbl_calon`.`nourut` = '2' THEN `tbl_calon`.`s_hasil` END AS `CALON2`, CASE WHEN `tbl_calon`.`nourut` = '3' THEN `tbl_calon`.`s_hasil` END AS `CALON3`, CASE WHEN `tbl_calon`.`nourut` = '4' THEN `tbl_calon`.`s_hasil` END AS `CALON4`, CASE WHEN `tbl_calon`.`nourut` = '5' THEN `tbl_calon`.`s_hasil` END AS `CALON5` FROM `tbl_calon` ;

-- --------------------------------------------------------

--
-- Structure for view `tbl_calon_terpilih`
--
DROP TABLE IF EXISTS `tbl_calon_terpilih`;

CREATE ALGORITHM=UNDEFINED DEFINER=`pilkades`@`%` SQL SECURITY DEFINER VIEW `tbl_calon_terpilih`  AS SELECT `a`.`thn_pemilihan` AS `thn_pemilihan`, `a`.`kdkec` AS `kdkec`, `d`.`nama_kec` AS `nama_kec`, `a`.`kddesa` AS `kddesa`, `b`.`nama_desa` AS `nama_desa`, `a`.`nourut` AS `nourut`, `a`.`nama` AS `nama`, `a`.`s_hasil` AS `perolehan` FROM ((`tbl_calon` `a` left join `tbl_wdesa` `b` on(`b`.`id_desa` = `a`.`kddesa`)) left join `tbl_wkecamatan` `d` on(`d`.`id_kec` = `a`.`kdkec`)) WHERE `a`.`s_hasil` = (select max(`c`.`s_hasil`) from `tbl_calon` `c` where `c`.`kddesa` = `a`.`kddesa`) GROUP BY `a`.`kddesa` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelamin`
--
ALTER TABLE `kelamin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_calon`
--
ALTER TABLE `tbl_calon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- Database: `db_vote`
--
CREATE DATABASE IF NOT EXISTS `db_vote` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_vote`;

-- --------------------------------------------------------

--
-- Table structure for table `kandidat`
--

CREATE TABLE `kandidat` (
  `id_kandidat` int(11) NOT NULL,
  `nama_kandidat` varchar(120) DEFAULT NULL,
  `nomor_kandidat` varchar(10) DEFAULT NULL,
  `foto_kandidat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemilih`
--

CREATE TABLE `pemilih` (
  `id_pemilih` int(11) NOT NULL,
  `nama_pemilih` varchar(120) DEFAULT NULL,
  `jenkel_pemilih` varchar(30) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `status_pemilih` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pilih`
--

CREATE TABLE `pilih` (
  `id_pilih` int(11) NOT NULL,
  `id_kandidat` int(11) DEFAULT NULL,
  `id_pemilih` int(11) DEFAULT NULL,
  `id_rekam` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(120) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kandidat`
--
ALTER TABLE `kandidat`
  ADD PRIMARY KEY (`id_kandidat`);

--
-- Indexes for table `pemilih`
--
ALTER TABLE `pemilih`
  ADD PRIMARY KEY (`id_pemilih`);

--
-- Indexes for table `pilih`
--
ALTER TABLE `pilih`
  ADD PRIMARY KEY (`id_pilih`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kandidat`
--
ALTER TABLE `kandidat`
  MODIFY `id_kandidat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemilih`
--
ALTER TABLE `pemilih`
  MODIFY `id_pemilih` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pilih`
--
ALTER TABLE `pilih`
  MODIFY `id_pilih` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `db_website_ci`
--
CREATE DATABASE IF NOT EXISTS `db_website_ci` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_website_ci`;

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `artikel_id` int(11) NOT NULL,
  `artikel_tanggal` datetime NOT NULL,
  `artikel_judul` varchar(255) NOT NULL,
  `artikel_slug` varchar(255) NOT NULL,
  `artikel_konten` longtext NOT NULL,
  `artikel_sampul` varchar(255) NOT NULL,
  `artikel_author` int(11) NOT NULL,
  `artikel_kategori` int(11) NOT NULL,
  `artikel_status` enum('publish','draft') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`artikel_id`, `artikel_tanggal`, `artikel_judul`, `artikel_slug`, `artikel_konten`, `artikel_sampul`, `artikel_author`, `artikel_kategori`, `artikel_status`) VALUES
(6, '2019-02-03 20:45:40', 'Apa Tren Terbaru Web Design Tahun 2019 ?', 'apa-tren-terbaru-web-design-tahun-2019', '<h2>Tren Web Design Tahun 2019</h2>\r\n\r\n<p>Testing update There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text.</p>\r\n\r\n<h2>Testing</h2>\r\n\r\n<p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated&nbsp; All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n', 'pexels-photo-270348.jpg', 1, 8, 'publish'),
(7, '2019-02-24 16:05:20', 'Tes Buat Artikel Baru Untuk Website CI', 'tes-buat-artikel-baru-untuk-website-ci', '<p>voluptate velit esse cillum dolore eu fugiat nulla pariaturvoluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>\r\n\r\n<h2>Nulla pariaturvoluptate velit esse cillum dolore</h2>\r\n\r\n<p>voluptate velit esse cillum dolore eu fugiat nulla pariaturvoluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n\r\n<p>voluptate velit esse cillum dolore eu fugiat nulla pariaturvoluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n\r\n<p>voluptate velit esse cillum dolore eu fugiat nulla pariaturvoluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur voluptate velit esse cillum dolore eu fugiat nulla pariatur</p>\r\n', 'pexels-photo-1181298.jpg', 4, 8, 'publish'),
(8, '2019-02-24 16:07:34', 'Voluptate Velit Esse Cillum Dolore Fugiat Nulla Pariatur', 'voluptate-velit-esse-cillum-dolore-fugiat-nulla-pariatur', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h2>voluptate velit esse cillum dolore eu fugiat nulla pariatur</h2>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<h3>voluptate velit esse cillum dolore eu fugiat nulla pariatur</h3>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'pexels-photo-1917575.jpg', 4, 10, 'publish'),
(9, '2019-02-26 12:49:06', 'Belajar Membuat Website', 'belajar-membuat-website', '<p>All the All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n\r\n<p>The Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n', 'startup-photos.jpg', 1, 6, 'publish'),
(10, '2019-02-26 12:51:36', 'Algoritma Pemrograman Terbaru', 'algoritma-pemrograman-terbaru', '<p>&nbsp;to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero.</p>\r\n\r\n<p>Written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32. Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n', 'pexels-photo-160107.jpg', 1, 14, 'publish');

-- --------------------------------------------------------

--
-- Table structure for table `halaman`
--

CREATE TABLE `halaman` (
  `halaman_id` int(11) NOT NULL,
  `halaman_judul` varchar(255) NOT NULL,
  `halaman_slug` varchar(255) NOT NULL,
  `halaman_konten` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `halaman`
--

INSERT INTO `halaman` (`halaman_id`, `halaman_judul`, `halaman_slug`, `halaman_konten`) VALUES
(3, 'Kontak Kami', 'kontak-kami', '<p>Berikut ini adalah kontak kami yang bisa anda hubungi :</p>\r\n\r\n<p><strong>WhatsApp</strong> : 0812-3456-7890</p>\r\n\r\n<p><strong>Email</strong> : me@dikialfarabi.com</p>\r\n\r\n<p><strong>Webiste</strong> : https://www.malasngoding.com</p>\r\n'),
(4, 'Tentang', 'tentang', '<h2>Siapa Kami ?</h2>\r\n\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h2>Jasa Yang Ditawarkan</h2>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<h2>Where does it come from?</h2>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n'),
(5, 'Layanan', 'layanan', '<p>Berikut adalah layanan kami,</p>\r\n\r\n<ol>\r\n	<li>Jasa Pembuatan Aplikasi<br />\r\n	It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br />\r\n	&nbsp;</li>\r\n	<li>Jasa Pembuatan Website<br />\r\n	It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br />\r\n	&nbsp;</li>\r\n	<li>Jasa Content Writer<br />\r\n	It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br />\r\n	&nbsp;</li>\r\n	<li>Jasa Translate Bahasa Inggris - Indonesia<br />\r\n	It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br />\r\n	&nbsp;</li>\r\n</ol>\r\n\r\n<p>Terima Kasih</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(255) NOT NULL,
  `kategori_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`, `kategori_slug`) VALUES
(6, 'Web Programming', 'web-programming'),
(8, 'Web Design', 'web-design'),
(9, 'Travel', 'travel'),
(10, 'Olahraga', 'olahraga'),
(11, 'Informasi Publik', 'informasi-publik'),
(12, 'Masakan', 'masakan'),
(13, 'Berita', 'berita'),
(14, 'Teknologi', 'teknologi'),
(15, 'Kegiatan', 'kegiatan');

-- --------------------------------------------------------

--
-- Table structure for table `pengaturan`
--

CREATE TABLE `pengaturan` (
  `nama` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  `link_facebook` varchar(255) NOT NULL,
  `link_twitter` varchar(255) NOT NULL,
  `link_instagram` varchar(255) NOT NULL,
  `link_github` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pengaturan`
--

INSERT INTO `pengaturan` (`nama`, `deskripsi`, `logo`, `link_facebook`, `link_twitter`, `link_instagram`, `link_github`) VALUES
('Malas Ngoding', 'Situs Belajar Pemrograman terlengkap', 'logoku.png', 'https://www.facebook.com/malasngodingpage/', 'https://twitter.com/malasngoding', 'https://www.instagram.com/malasngoding/', 'https://github.com/malasngoding');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `pengguna_id` int(11) NOT NULL,
  `pengguna_nama` varchar(50) NOT NULL,
  `pengguna_email` varchar(255) NOT NULL,
  `pengguna_username` varchar(50) NOT NULL,
  `pengguna_password` varchar(255) NOT NULL,
  `pengguna_level` enum('admin','penulis') NOT NULL,
  `pengguna_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`pengguna_id`, `pengguna_nama`, `pengguna_email`, `pengguna_username`, `pengguna_password`, `pengguna_level`, `pengguna_status`) VALUES
(1, 'Diki Alfarabi', 'diki@malasngoding.com', 'admin', '7488e331b8b64e5794da3fa4eb10ad5d', 'admin', 1),
(2, 'Wak Johny', 'johny@malasngoding.com', 'johny', 'd0b4449cf30599ceb527201ec5a86ef7', 'penulis', 1),
(4, 'Fatimah', 'fatimah@malasngoding.com', 'fatimah', '65695b363e7c8b3c0e838b230dea78b3', 'penulis', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`artikel_id`);

--
-- Indexes for table `halaman`
--
ALTER TABLE `halaman`
  ADD PRIMARY KEY (`halaman_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`pengguna_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `artikel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `halaman`
--
ALTER TABLE `halaman`
  MODIFY `halaman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `pengguna_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `futsal`
--
CREATE DATABASE IF NOT EXISTS `futsal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `futsal`;

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id_album` int(11) NOT NULL,
  `nama_album` char(50) NOT NULL,
  `slug_album` char(50) NOT NULL,
  `foto` text NOT NULL,
  `created_by` char(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(20) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id_album`, `nama_album`, `slug_album`, `foto`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 'Januari-Juni 2021', 'januari-juni-2021', 'januari-juni-202120231202193754.png', 'kelompok 3', '2018-04-11 06:14:08', 'superadmin', '2023-12-02 19:37:54'),
(2, 'Juli-Desember 2021', 'juli-desember-2021', 'juli-desember-202120231202193827.png', 'kelompok 3', '2018-04-11 06:20:52', 'superadmin', '2023-12-02 19:38:27'),
(3, 'Januari-Juni 2022', 'januari-juni-2022', 'januari-juni-202220231202193708.png', 'kelompok 3', '2018-04-11 06:23:01', 'superadmin', '2023-12-02 19:37:08'),
(4, 'Juli-Desember 2022', 'juli-desember-2022', 'juli-desember-202220231202193622.png', 'kelompok 3', '2018-04-11 06:23:11', 'superadmin', '2023-12-02 19:36:22'),
(5, 'Januari-Juni 2023', 'januari-juni-2023', 'januari-juni-202320231202193352.jpg', 'kelompok 3', '2018-04-14 19:16:46', 'superadmin', '2023-12-02 19:33:52'),
(6, 'Juli-Desember 2023', 'juli-desember-2023', 'juli-desember-202320231202193321.jpg', 'kelompok 3', '2018-04-14 19:17:05', 'superadmin', '2023-12-02 19:33:21');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id_bank` int(11) NOT NULL,
  `nama_bank` varchar(100) NOT NULL,
  `atas_nama` varchar(100) NOT NULL,
  `norek` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id_bank`, `nama_bank`, `atas_nama`, `norek`, `logo`) VALUES
(1, 'BNI', 'Microtron', '12345678', 'bni.png'),
(2, 'BRI', 'Microtron', '87873412323', 'bri.png'),
(3, 'Mandiri', 'Microtron', '778734098', 'mandiri.png'),
(4, 'BCA', 'Microtron', '998980342487', 'bca.png');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id_company` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `company_desc` text NOT NULL,
  `company_address` text NOT NULL,
  `company_maps` text NOT NULL,
  `company_phone` char(30) NOT NULL,
  `company_phone2` char(30) NOT NULL,
  `company_fax` char(30) NOT NULL,
  `company_email` char(30) NOT NULL,
  `foto` text NOT NULL,
  `foto_type` char(10) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `modified` datetime DEFAULT NULL,
  `created_by` char(50) NOT NULL,
  `modified_by` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id_company`, `company_name`, `company_desc`, `company_address`, `company_maps`, `company_phone`, `company_phone2`, `company_fax`, `company_email`, `foto`, `foto_type`, `created`, `modified`, `created_by`, `modified_by`) VALUES
(1, 'GoalRush Arena', 'Selamat datang di GoalRush Arena - Destinasi Terbaik untuk Sewa Lapangan Futsal! Kami adalah tempat yang sempurna bagi para pecinta sepak bola untuk merayakan kecintaan mereka pada olahraga favorit. Dengan fasilitas lapangan futsal terbaik dan pelayanan yang ramah, kami berkomitmen untuk memberikan pengalaman bermain yang tak terlupakan bagi setiap tim dan individu.', 'Jl. Maju Mundur Kec. Camat Kel. Lurahan, Kab. Bupaten, Dunia Lain', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d16327777.649419477!2d108.84621849858628!3d-2.415291213289622!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2c4c07d7496404b7%3A0xe37b4de71badf485!2sIndonesia!5e0!3m2!1sen!2sid!4v1506312173230\" width=\"100%\" height=\"200\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '085873452165', '0212134758', '12414', 'goalrusharena2021@gmail.com', 'goalrush-arena20231202181725', '.png', '2017-11-09 06:45:34', NULL, 'kelompok 3', 'kelompok 3');

-- --------------------------------------------------------

--
-- Table structure for table `diskon`
--

CREATE TABLE `diskon` (
  `id` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `diskon`
--

INSERT INTO `diskon` (`id`, `harga`) VALUES
(1, 55000);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id_event` int(11) NOT NULL,
  `nama_event` varchar(100) NOT NULL,
  `slug_event` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `kategori` int(11) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `foto_type` char(10) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` char(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `modified_by` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id_event`, `nama_event`, `slug_event`, `deskripsi`, `kategori`, `foto`, `foto_type`, `created_at`, `created_by`, `modified_at`, `modified_by`) VALUES
(1, 'Futsal Rutin', 'futsal-rutin', '<p>shgfghuiwsdx etwyuidxkmew cvbdsc9whdhewmdw</p>', 1, 'futsal-rutin20231202155501', '.png', '2023-12-02 15:37:14', 'kelompok 3', '2023-12-02 15:55:01', 'superadmin'),
(10, 'futsal', 'futsal', '', 1, 'futsal20231202195825', '.png', '2023-12-02 19:58:25', 'superadmin', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `foto`
--

CREATE TABLE `foto` (
  `id_foto` int(11) NOT NULL,
  `album_id` int(11) NOT NULL,
  `nama_foto` char(100) NOT NULL,
  `slug_foto` char(100) NOT NULL,
  `foto` text NOT NULL,
  `created_by` char(20) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(20) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `foto`
--

INSERT INTO `foto` (`id_foto`, `album_id`, `nama_foto`, `slug_foto`, `foto`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 1, '15 Januari', '15-januari', '15-januari20231202164107.png', 'kelompok 3', '2018-04-11 07:41:29', 'superadmin', '2023-12-02 16:41:07'),
(2, 1, '28 Januari', '28-januari', '28-januari20231202164801.png', 'kelompok 3', '2018-04-11 07:45:03', 'superadmin', '2023-12-02 16:48:01'),
(3, 1, '6 Maret', '6-maret', '6-maret20231202164135.png', 'kelompok 3', '2018-04-11 07:47:12', 'superadmin', '2023-12-02 16:41:35'),
(4, 1, '28 Mei', '28-mei', '28-mei20231202164214.png', 'kelompok 3', '2018-04-14 15:13:17', 'superadmin', '2023-12-02 16:42:14'),
(5, 1, '3 Juni', '3-juni', '3-juni20231202164228.png', 'kelompok 3', '2018-04-14 15:14:29', 'superadmin', '2023-12-02 16:42:29'),
(6, 2, '18 Agustus', '18-agustus', '18-agustus20231202164249.png', 'kelompok 3', '2018-04-14 15:15:15', 'superadmin', '2023-12-02 16:42:49'),
(7, 2, '25 Oktober', '25-oktober', '25-oktober20231202164306.png', 'kelompok 3', '2018-04-14 15:15:45', 'superadmin', '2023-12-02 16:43:06'),
(8, 2, '21 November', '21-november', '21-november20231202164321.png', 'kelompok 3', '2018-04-14 15:16:05', 'superadmin', '2023-12-02 16:43:21'),
(9, 2, '4 Desember', '4 Desember', '4des2.png', 'kelompok 3', '2018-04-14 15:16:13', 'kelompok 3', '2023-12-02 16:46:24'),
(10, 3, '21 Januari', '21-januari', '21-januari20231202164412.png', 'superadmin', '2023-12-02 16:11:42', 'superadmin', '2023-12-02 16:44:12'),
(11, 3, '10 Juni', '10-juni', '10-juni20231202164430.png', 'superadmin', '2023-12-02 16:12:16', 'superadmin', '2023-12-02 16:44:30'),
(12, 3, '13 Maret', '13-maret', '13-maret20231202164444.png', 'superadmin', '2023-12-02 16:12:39', 'superadmin', '2023-12-02 16:44:44'),
(13, 3, '19 Mei', '19-mei', '19-mei20231202164459.png', 'superadmin', '2023-12-02 16:13:50', 'superadmin', '2023-12-02 16:44:59'),
(14, 3, '27 April', '27-april', '27-april20231202164521.png', 'superadmin', '2023-12-02 16:14:16', 'superadmin', '2023-12-02 16:45:21'),
(15, 3, '8 Februari', '8-februari', '8-februari20231202184133.png', 'superadmin', '2023-12-02 18:41:33', '', NULL),
(16, 1, '10 April', '10-april', '10-april20231202184314.png', 'superadmin', '2023-12-02 18:43:14', '', NULL),
(17, 2, '2 Juli', '2-juli', '2-juli20231202191406.png', 'superadmin', '2023-12-02 19:14:06', '', NULL),
(18, 2, '16 September', '16-september', '16-september20231202191435.png', 'superadmin', '2023-12-02 19:14:35', '', NULL),
(19, 4, '2 Desember', '2-desember', '2-desember20231202191819.png', 'superadmin', '2023-12-02 19:18:19', '', NULL),
(20, 4, '4 Agustus', '4-agustus', '4-agustus20231202191841.png', 'superadmin', '2023-12-02 19:18:41', '', NULL),
(21, 4, '10 November', '10-november', '10-november20231202192008.png', 'superadmin', '2023-12-02 19:19:04', 'superadmin', '2023-12-02 19:20:08'),
(22, 4, '17 September', '17-september', '17-september20231202192034.png', 'superadmin', '2023-12-02 19:20:34', '', NULL),
(23, 4, '22 Oktober', '22-oktober', '22okt22.png', 'kelompok 3', '2023-12-02 19:21:06', '', '2023-12-02 19:23:02'),
(24, 5, '2 Juni', '2-juni', '2-juni20231202194647.png', 'superadmin', '2023-12-02 19:26:58', 'superadmin', '2023-12-02 19:46:47'),
(25, 5, '7 April', '7-april', '7-april20231202194605.png', 'superadmin', '2023-12-02 19:27:14', 'superadmin', '2023-12-02 19:46:05'),
(26, 5, '10 Februari', '10-februari', '10-februari20231202194525.png', 'superadmin', '2023-12-02 19:27:33', 'superadmin', '2023-12-02 19:45:25'),
(27, 5, '13 Mei', '13-mei', '13-mei20231202193506.jpg', 'superadmin', '2023-12-02 19:27:50', 'superadmin', '2023-12-02 19:35:06'),
(28, 5, '21 Januari', '21-januari', '21-januari20231202194737.png', 'superadmin', '2023-12-02 19:28:11', 'superadmin', '2023-12-02 19:47:37'),
(29, 4, '25 Juli', '25-juli', '25-juli20231202194204.png', 'superadmin', '2023-12-02 19:41:03', 'superadmin', '2023-12-02 19:42:04'),
(30, 5, '9 Maret', '9-maret', '9-maret20231202194820.png', 'superadmin', '2023-12-02 19:48:20', '', NULL),
(31, 6, '1 Juli', '1-juli', '1-juli20231202195350.png', 'superadmin', '2023-12-02 19:53:50', '', NULL),
(32, 6, '5 Desember', '5-desember', '5-desember20231202195405.png', 'superadmin', '2023-12-02 19:54:05', '', NULL),
(33, 6, '7 Oktober', '7-oktober', '7-oktober20231202195420.png', 'superadmin', '2023-12-02 19:54:20', '', NULL),
(34, 6, '12 November', '12-november', '12-november20231202195436.png', 'superadmin', '2023-12-02 19:54:36', '', NULL),
(35, 6, '15 September', '15-september', '15-september20231202195509.png', 'superadmin', '2023-12-02 19:55:09', '', NULL),
(36, 6, '29 Agustus', '29-agustus', '29-agustus20231202195525.png', 'superadmin', '2023-12-02 19:55:25', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jam`
--

CREATE TABLE `jam` (
  `id` int(11) NOT NULL,
  `jam` varchar(50) NOT NULL,
  `is_available` tinytext DEFAULT '1',
  `tdk_tersedia` enum('tersedia','tidak tersedia') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jam`
--

INSERT INTO `jam` (`id`, `jam`, `is_available`, `tdk_tersedia`) VALUES
(1, '06:00:00', '1', 'tersedia'),
(2, '07:00:00', '1', 'tersedia'),
(3, '08:00:00', '0\r\n', 'tidak tersedia'),
(4, '09:00:00', '1\r\n', 'tersedia'),
(5, '10:00:00', '0', 'tidak tersedia'),
(6, '11:00:00', '1', 'tersedia'),
(7, '12:00:00', '1', 'tersedia'),
(8, '13:00:00', '1', 'tersedia'),
(9, '14:00:00', '1', 'tersedia'),
(10, '15:00:00', '1', 'tersedia'),
(11, '16:00:00', '1', 'tersedia'),
(12, '17:00:00', '1', 'tersedia'),
(13, '18:00:00', '1', 'tersedia'),
(14, '19:00:00', '1', 'tersedia'),
(15, '20:00:00', '1', 'tersedia'),
(16, '21:00:00', '1', 'tersedia'),
(17, '22:00:00', '1', 'tersedia'),
(18, '23:00:00', '1', 'tersedia'),
(19, '24:00:00', '1', 'tersedia'),
(20, '10:00:00', '0', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL,
  `slug_kat` varchar(20) NOT NULL,
  `created_by` char(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `slug_kat`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 'Turnamen', 'turnamen', 'kelompok 3', '2018-07-23 08:38:39', 'kelompok 3', '2023-12-02 11:00:46'),
(2, 'Kerja Sama', 'kerja-sama', 'kelompok 3', '2018-07-23 08:38:39', 'kelompok 3', '2023-12-02 11:01:05');

-- --------------------------------------------------------

--
-- Table structure for table `kontak`
--

CREATE TABLE `kontak` (
  `id_kontak` int(11) NOT NULL,
  `nama_kontak` char(50) NOT NULL,
  `nohp` char(50) NOT NULL,
  `created_by` char(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` char(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kontak`
--

INSERT INTO `kontak` (`id_kontak`, `nama_kontak`, `nohp`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 'Alsa', '6285887123360', 'kelompok 3', '2018-07-23 11:16:57', 'kelompok 3', '2023-12-02 11:04:47'),
(2, 'aulia', '6281310376095', 'kelompok 3', '2018-07-23 11:16:57', 'kelompok 3', '2023-12-02 11:04:47'),
(3, 'arifin', '6281380520436', 'kelompok 3', '2018-07-23 11:20:44', 'kelompok 3', '2023-12-02 11:04:47'),
(4, 'rayni', '081315440177', 'kelompok 3', '2023-12-28 10:05:45', 'kelompok 3', '2023-12-28 11:05:45'),
(5, 'hanif', '085694252593', 'kelompok 3', '2023-12-02 11:08:31', 'kelompok 3', '2023-12-02 18:26:15');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id_kota` int(11) NOT NULL,
  `provinsi_id` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `provinsi_id`, `nama_kota`) VALUES
(1, 21, 'Aceh Barat'),
(2, 21, 'Aceh Barat Daya'),
(3, 21, 'Aceh Besar'),
(4, 21, 'Aceh Jaya'),
(5, 21, 'Aceh Selatan'),
(6, 21, 'Aceh Singkil'),
(7, 21, 'Aceh Tamiang'),
(8, 21, 'Aceh Tengah'),
(9, 21, 'Aceh Tenggara'),
(10, 21, 'Aceh Timur'),
(11, 21, 'Aceh Utara'),
(12, 32, 'Agam'),
(13, 23, 'Alor'),
(14, 19, 'Ambon'),
(15, 34, 'Asahan'),
(16, 24, 'Asmat'),
(17, 1, 'Badung'),
(18, 13, 'Balangan'),
(19, 15, 'Balikpapan'),
(20, 21, 'Banda Aceh'),
(21, 18, 'Bandar Lampung'),
(22, 9, 'Bandung'),
(23, 9, 'Bandung'),
(24, 9, 'Bandung Barat'),
(25, 29, 'Banggai'),
(26, 29, 'Banggai Kepulauan'),
(27, 2, 'Bangka'),
(28, 2, 'Bangka Barat'),
(29, 2, 'Bangka Selatan'),
(30, 2, 'Bangka Tengah'),
(31, 11, 'Bangkalan'),
(32, 1, 'Bangli'),
(33, 13, 'Banjar'),
(34, 9, 'Banjar'),
(35, 13, 'Banjarbaru'),
(36, 13, 'Banjarmasin'),
(37, 10, 'Banjarnegara'),
(38, 28, 'Bantaeng'),
(39, 5, 'Bantul'),
(40, 33, 'Banyuasin'),
(41, 10, 'Banyumas'),
(42, 11, 'Banyuwangi'),
(43, 13, 'Barito Kuala'),
(44, 14, 'Barito Selatan'),
(45, 14, 'Barito Timur'),
(46, 14, 'Barito Utara'),
(47, 28, 'Barru'),
(48, 17, 'Batam'),
(49, 10, 'Batang'),
(50, 8, 'Batang Hari'),
(51, 11, 'Batu'),
(52, 34, 'Batu Bara'),
(53, 30, 'Bau-Bau'),
(54, 9, 'Bekasi'),
(55, 9, 'Bekasi'),
(56, 2, 'Belitung'),
(57, 2, 'Belitung Timur'),
(58, 23, 'Belu'),
(59, 21, 'Bener Meriah'),
(60, 26, 'Bengkalis'),
(61, 12, 'Bengkayang'),
(62, 4, 'Bengkulu'),
(63, 4, 'Bengkulu Selatan'),
(64, 4, 'Bengkulu Tengah'),
(65, 4, 'Bengkulu Utara'),
(66, 15, 'Berau'),
(67, 24, 'Biak Numfor'),
(68, 22, 'Bima'),
(69, 22, 'Bima'),
(70, 34, 'Binjai'),
(71, 17, 'Bintan'),
(72, 21, 'Bireuen'),
(73, 31, 'Bitung'),
(74, 11, 'Blitar'),
(75, 11, 'Blitar'),
(76, 10, 'Blora'),
(77, 7, 'Boalemo'),
(78, 9, 'Bogor'),
(79, 9, 'Bogor'),
(80, 11, 'Bojonegoro'),
(81, 31, 'Bolaang Mongondow (Bolmong)'),
(82, 31, 'Bolaang Mongondow Selatan'),
(83, 31, 'Bolaang Mongondow Timur'),
(84, 31, 'Bolaang Mongondow Utara'),
(85, 30, 'Bombana'),
(86, 11, 'Bondowoso'),
(87, 28, 'Bone'),
(88, 7, 'Bone Bolango'),
(89, 15, 'Bontang'),
(90, 24, 'Boven Digoel'),
(91, 10, 'Boyolali'),
(92, 10, 'Brebes'),
(93, 32, 'Bukittinggi'),
(94, 1, 'Buleleng'),
(95, 28, 'Bulukumba'),
(96, 16, 'Bulungan (Bulongan)'),
(97, 8, 'Bungo'),
(98, 29, 'Buol'),
(99, 19, 'Buru'),
(100, 19, 'Buru Selatan'),
(101, 30, 'Buton'),
(102, 30, 'Buton Utara'),
(103, 9, 'Ciamis'),
(104, 9, 'Cianjur'),
(105, 10, 'Cilacap'),
(106, 3, 'Cilegon'),
(107, 9, 'Cimahi'),
(108, 9, 'Cirebon'),
(109, 9, 'Cirebon'),
(110, 34, 'Dairi'),
(111, 24, 'Deiyai (Deliyai)'),
(112, 34, 'Deli Serdang'),
(113, 10, 'Demak'),
(114, 1, 'Denpasar'),
(115, 9, 'Depok'),
(116, 32, 'Dharmasraya'),
(117, 24, 'Dogiyai'),
(118, 22, 'Dompu'),
(119, 29, 'Donggala'),
(120, 26, 'Dumai'),
(121, 33, 'Empat Lawang'),
(122, 23, 'Ende'),
(123, 28, 'Enrekang'),
(124, 25, 'Fakfak'),
(125, 23, 'Flores Timur'),
(126, 9, 'Garut'),
(127, 21, 'Gayo Lues'),
(128, 1, 'Gianyar'),
(129, 7, 'Gorontalo'),
(130, 7, 'Gorontalo'),
(131, 7, 'Gorontalo Utara'),
(132, 28, 'Gowa'),
(133, 11, 'Gresik'),
(134, 10, 'Grobogan'),
(135, 5, 'Gunung Kidul'),
(136, 14, 'Gunung Mas'),
(137, 34, 'Gunungsitoli'),
(138, 20, 'Halmahera Barat'),
(139, 20, 'Halmahera Selatan'),
(140, 20, 'Halmahera Tengah'),
(141, 20, 'Halmahera Timur'),
(142, 20, 'Halmahera Utara'),
(143, 13, 'Hulu Sungai Selatan'),
(144, 13, 'Hulu Sungai Tengah'),
(145, 13, 'Hulu Sungai Utara'),
(146, 34, 'Humbang Hasundutan'),
(147, 26, 'Indragiri Hilir'),
(148, 26, 'Indragiri Hulu'),
(149, 9, 'Indramayu'),
(150, 24, 'Intan Jaya'),
(151, 6, 'Jakarta Barat'),
(152, 6, 'Jakarta Pusat'),
(153, 6, 'Jakarta Selatan'),
(154, 6, 'Jakarta Timur'),
(155, 6, 'Jakarta Utara'),
(156, 8, 'Jambi'),
(157, 24, 'Jayapura'),
(158, 24, 'Jayapura'),
(159, 24, 'Jayawijaya'),
(160, 11, 'Jember'),
(161, 1, 'Jembrana'),
(162, 28, 'Jeneponto'),
(163, 10, 'Jepara'),
(164, 11, 'Jombang'),
(165, 25, 'Kaimana'),
(166, 26, 'Kampar'),
(167, 14, 'Kapuas'),
(168, 12, 'Kapuas Hulu'),
(169, 10, 'Karanganyar'),
(170, 1, 'Karangasem'),
(171, 9, 'Karawang'),
(172, 17, 'Karimun'),
(173, 34, 'Karo'),
(174, 14, 'Katingan'),
(175, 4, 'Kaur'),
(176, 12, 'Kayong Utara'),
(177, 10, 'Kebumen'),
(178, 11, 'Kediri'),
(179, 11, 'Kediri'),
(180, 24, 'Keerom'),
(181, 10, 'Kendal'),
(182, 30, 'Kendari'),
(183, 4, 'Kepahiang'),
(184, 17, 'Kepulauan Anambas'),
(185, 19, 'Kepulauan Aru'),
(186, 32, 'Kepulauan Mentawai'),
(187, 26, 'Kepulauan Meranti'),
(188, 31, 'Kepulauan Sangihe'),
(189, 6, 'Kepulauan Seribu'),
(190, 31, 'Kepulauan Siau Tagulandang Biaro (Sitaro)'),
(191, 20, 'Kepulauan Sula'),
(192, 31, 'Kepulauan Talaud'),
(193, 24, 'Kepulauan Yapen (Yapen Waropen)'),
(194, 8, 'Kerinci'),
(195, 12, 'Ketapang'),
(196, 10, 'Klaten'),
(197, 1, 'Klungkung'),
(198, 30, 'Kolaka'),
(199, 30, 'Kolaka Utara'),
(200, 30, 'Konawe'),
(201, 30, 'Konawe Selatan'),
(202, 30, 'Konawe Utara'),
(203, 13, 'Kotabaru'),
(204, 31, 'Kotamobagu'),
(205, 14, 'Kotawaringin Barat'),
(206, 14, 'Kotawaringin Timur'),
(207, 26, 'Kuantan Singingi'),
(208, 12, 'Kubu Raya'),
(209, 10, 'Kudus'),
(210, 5, 'Kulon Progo'),
(211, 9, 'Kuningan'),
(212, 23, 'Kupang'),
(213, 23, 'Kupang'),
(214, 15, 'Kutai Barat'),
(215, 15, 'Kutai Kartanegara'),
(216, 15, 'Kutai Timur'),
(217, 34, 'Labuhan Batu'),
(218, 34, 'Labuhan Batu Selatan'),
(219, 34, 'Labuhan Batu Utara'),
(220, 33, 'Lahat'),
(221, 14, 'Lamandau'),
(222, 11, 'Lamongan'),
(223, 18, 'Lampung Barat'),
(224, 18, 'Lampung Selatan'),
(225, 18, 'Lampung Tengah'),
(226, 18, 'Lampung Timur'),
(227, 18, 'Lampung Utara'),
(228, 12, 'Landak'),
(229, 34, 'Langkat'),
(230, 21, 'Langsa'),
(231, 24, 'Lanny Jaya'),
(232, 3, 'Lebak'),
(233, 4, 'Lebong'),
(234, 23, 'Lembata'),
(235, 21, 'Lhokseumawe'),
(236, 32, 'Lima Puluh Koto/Kota'),
(237, 17, 'Lingga'),
(238, 22, 'Lombok Barat'),
(239, 22, 'Lombok Tengah'),
(240, 22, 'Lombok Timur'),
(241, 22, 'Lombok Utara'),
(242, 33, 'Lubuk Linggau'),
(243, 11, 'Lumajang'),
(244, 28, 'Luwu'),
(245, 28, 'Luwu Timur'),
(246, 28, 'Luwu Utara'),
(247, 11, 'Madiun'),
(248, 11, 'Madiun'),
(249, 10, 'Magelang'),
(250, 10, 'Magelang'),
(251, 11, 'Magetan'),
(252, 9, 'Majalengka'),
(253, 27, 'Majene'),
(254, 28, 'Makassar'),
(255, 11, 'Malang'),
(256, 11, 'Malang'),
(257, 16, 'Malinau'),
(258, 19, 'Maluku Barat Daya'),
(259, 19, 'Maluku Tengah'),
(260, 19, 'Maluku Tenggara'),
(261, 19, 'Maluku Tenggara Barat'),
(262, 27, 'Mamasa'),
(263, 24, 'Mamberamo Raya'),
(264, 24, 'Mamberamo Tengah'),
(265, 27, 'Mamuju'),
(266, 27, 'Mamuju Utara'),
(267, 31, 'Manado'),
(268, 34, 'Mandailing Natal'),
(269, 23, 'Manggarai'),
(270, 23, 'Manggarai Barat'),
(271, 23, 'Manggarai Timur'),
(272, 25, 'Manokwari'),
(273, 25, 'Manokwari Selatan'),
(274, 24, 'Mappi'),
(275, 28, 'Maros'),
(276, 22, 'Mataram'),
(277, 25, 'Maybrat'),
(278, 34, 'Medan'),
(279, 12, 'Melawi'),
(280, 8, 'Merangin'),
(281, 24, 'Merauke'),
(282, 18, 'Mesuji'),
(283, 18, 'Metro'),
(284, 24, 'Mimika'),
(285, 31, 'Minahasa'),
(286, 31, 'Minahasa Selatan'),
(287, 31, 'Minahasa Tenggara'),
(288, 31, 'Minahasa Utara'),
(289, 11, 'Mojokerto'),
(290, 11, 'Mojokerto'),
(291, 29, 'Morowali'),
(292, 33, 'Muara Enim'),
(293, 8, 'Muaro Jambi'),
(294, 4, 'Muko Muko'),
(295, 30, 'Muna'),
(296, 14, 'Murung Raya'),
(297, 33, 'Musi Banyuasin'),
(298, 33, 'Musi Rawas'),
(299, 24, 'Nabire'),
(300, 21, 'Nagan Raya'),
(301, 23, 'Nagekeo'),
(302, 17, 'Natuna'),
(303, 24, 'Nduga'),
(304, 23, 'Ngada'),
(305, 11, 'Nganjuk'),
(306, 11, 'Ngawi'),
(307, 34, 'Nias'),
(308, 34, 'Nias Barat'),
(309, 34, 'Nias Selatan'),
(310, 34, 'Nias Utara'),
(311, 16, 'Nunukan'),
(312, 33, 'Ogan Ilir'),
(313, 33, 'Ogan Komering Ilir'),
(314, 33, 'Ogan Komering Ulu'),
(315, 33, 'Ogan Komering Ulu Selatan'),
(316, 33, 'Ogan Komering Ulu Timur'),
(317, 11, 'Pacitan'),
(318, 32, 'Padang'),
(319, 34, 'Padang Lawas'),
(320, 34, 'Padang Lawas Utara'),
(321, 32, 'Padang Panjang'),
(322, 32, 'Padang Pariaman'),
(323, 34, 'Padang Sidempuan'),
(324, 33, 'Pagar Alam'),
(325, 34, 'Pakpak Bharat'),
(326, 14, 'Palangka Raya'),
(327, 33, 'Palembang'),
(328, 28, 'Palopo'),
(329, 29, 'Palu'),
(330, 11, 'Pamekasan'),
(331, 3, 'Pandeglang'),
(332, 9, 'Pangandaran'),
(333, 28, 'Pangkajene Kepulauan'),
(334, 2, 'Pangkal Pinang'),
(335, 24, 'Paniai'),
(336, 28, 'Parepare'),
(337, 32, 'Pariaman'),
(338, 29, 'Parigi Moutong'),
(339, 32, 'Pasaman'),
(340, 32, 'Pasaman Barat'),
(341, 15, 'Paser'),
(342, 11, 'Pasuruan'),
(343, 11, 'Pasuruan'),
(344, 10, 'Pati'),
(345, 32, 'Payakumbuh'),
(346, 25, 'Pegunungan Arfak'),
(347, 24, 'Pegunungan Bintang'),
(348, 10, 'Pekalongan'),
(349, 10, 'Pekalongan'),
(350, 26, 'Pekanbaru'),
(351, 26, 'Pelalawan'),
(352, 10, 'Pemalang'),
(353, 34, 'Pematang Siantar'),
(354, 15, 'Penajam Paser Utara'),
(355, 18, 'Pesawaran'),
(356, 18, 'Pesisir Barat'),
(357, 32, 'Pesisir Selatan'),
(358, 21, 'Pidie'),
(359, 21, 'Pidie Jaya'),
(360, 28, 'Pinrang'),
(361, 7, 'Pohuwato'),
(362, 27, 'Polewali Mandar'),
(363, 11, 'Ponorogo'),
(364, 12, 'Pontianak'),
(365, 12, 'Pontianak'),
(366, 29, 'Poso'),
(367, 33, 'Prabumulih'),
(368, 18, 'Pringsewu'),
(369, 11, 'Probolinggo'),
(370, 11, 'Probolinggo'),
(371, 14, 'Pulang Pisau'),
(372, 20, 'Pulau Morotai'),
(373, 24, 'Puncak'),
(374, 24, 'Puncak Jaya'),
(375, 10, 'Purbalingga'),
(376, 9, 'Purwakarta'),
(377, 10, 'Purworejo'),
(378, 25, 'Raja Ampat'),
(379, 4, 'Rejang Lebong'),
(380, 10, 'Rembang'),
(381, 26, 'Rokan Hilir'),
(382, 26, 'Rokan Hulu'),
(383, 23, 'Rote Ndao'),
(384, 21, 'Sabang'),
(385, 23, 'Sabu Raijua'),
(386, 10, 'Salatiga'),
(387, 15, 'Samarinda'),
(388, 12, 'Sambas'),
(389, 34, 'Samosir'),
(390, 11, 'Sampang'),
(391, 12, 'Sanggau'),
(392, 24, 'Sarmi'),
(393, 8, 'Sarolangun'),
(394, 32, 'Sawah Lunto'),
(395, 12, 'Sekadau'),
(396, 28, 'Selayar (Kepulauan Selayar)'),
(397, 4, 'Seluma'),
(398, 10, 'Semarang'),
(399, 10, 'Semarang'),
(400, 19, 'Seram Bagian Barat'),
(401, 19, 'Seram Bagian Timur'),
(402, 3, 'Serang'),
(403, 3, 'Serang'),
(404, 34, 'Serdang Bedagai'),
(405, 14, 'Seruyan'),
(406, 26, 'Siak'),
(407, 34, 'Sibolga'),
(408, 28, 'Sidenreng Rappang/Rapang'),
(409, 11, 'Sidoarjo'),
(410, 29, 'Sigi'),
(411, 32, 'Sijunjung (Sawah Lunto Sijunjung)'),
(412, 23, 'Sikka'),
(413, 34, 'Simalungun'),
(414, 21, 'Simeulue'),
(415, 12, 'Singkawang'),
(416, 28, 'Sinjai'),
(417, 12, 'Sintang'),
(418, 11, 'Situbondo'),
(419, 5, 'Sleman'),
(420, 32, 'Solok'),
(421, 32, 'Solok'),
(422, 32, 'Solok Selatan'),
(423, 28, 'Soppeng'),
(424, 25, 'Sorong'),
(425, 25, 'Sorong'),
(426, 25, 'Sorong Selatan'),
(427, 10, 'Sragen'),
(428, 9, 'Subang'),
(429, 21, 'Subulussalam'),
(430, 9, 'Sukabumi'),
(431, 9, 'Sukabumi'),
(432, 14, 'Sukamara'),
(433, 10, 'Sukoharjo'),
(434, 23, 'Sumba Barat'),
(435, 23, 'Sumba Barat Daya'),
(436, 23, 'Sumba Tengah'),
(437, 23, 'Sumba Timur'),
(438, 22, 'Sumbawa'),
(439, 22, 'Sumbawa Barat'),
(440, 9, 'Sumedang'),
(441, 11, 'Sumenep'),
(442, 8, 'Sungaipenuh'),
(443, 24, 'Supiori'),
(444, 11, 'Surabaya'),
(445, 10, 'Surakarta (Solo)'),
(446, 13, 'Tabalong'),
(447, 1, 'Tabanan'),
(448, 28, 'Takalar'),
(449, 25, 'Tambrauw'),
(450, 16, 'Tana Tidung'),
(451, 28, 'Tana Toraja'),
(452, 13, 'Tanah Bumbu'),
(453, 32, 'Tanah Datar'),
(454, 13, 'Tanah Laut'),
(455, 3, 'Tangerang'),
(456, 3, 'Tangerang'),
(457, 3, 'Tangerang Selatan'),
(458, 18, 'Tanggamus'),
(459, 34, 'Tanjung Balai'),
(460, 8, 'Tanjung Jabung Barat'),
(461, 8, 'Tanjung Jabung Timur'),
(462, 17, 'Tanjung Pinang'),
(463, 34, 'Tapanuli Selatan'),
(464, 34, 'Tapanuli Tengah'),
(465, 34, 'Tapanuli Utara'),
(466, 13, 'Tapin'),
(467, 16, 'Tarakan'),
(468, 9, 'Tasikmalaya'),
(469, 9, 'Tasikmalaya'),
(470, 34, 'Tebing Tinggi'),
(471, 8, 'Tebo'),
(472, 10, 'Tegal'),
(473, 10, 'Tegal'),
(474, 25, 'Teluk Bintuni'),
(475, 25, 'Teluk Wondama'),
(476, 10, 'Temanggung'),
(477, 20, 'Ternate'),
(478, 20, 'Tidore Kepulauan'),
(479, 23, 'Timor Tengah Selatan'),
(480, 23, 'Timor Tengah Utara'),
(481, 34, 'Toba Samosir'),
(482, 29, 'Tojo Una-Una'),
(483, 29, 'Toli-Toli'),
(484, 24, 'Tolikara'),
(485, 31, 'Tomohon'),
(486, 28, 'Toraja Utara'),
(487, 11, 'Trenggalek'),
(488, 19, 'Tual'),
(489, 11, 'Tuban'),
(490, 18, 'Tulang Bawang'),
(491, 18, 'Tulang Bawang Barat'),
(492, 11, 'Tulungagung'),
(493, 28, 'Wajo'),
(494, 30, 'Wakatobi'),
(495, 24, 'Waropen'),
(496, 18, 'Way Kanan'),
(497, 10, 'Wonogiri'),
(498, 10, 'Wonosobo'),
(499, 24, 'Yahukimo'),
(500, 24, 'Yalimo'),
(501, 5, 'Yogyakarta');

-- --------------------------------------------------------

--
-- Table structure for table `lapangan`
--

CREATE TABLE `lapangan` (
  `id_lapangan` int(11) NOT NULL,
  `nama_lapangan` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `foto` text NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `lapangan`
--

INSERT INTO `lapangan` (`id_lapangan`, `nama_lapangan`, `harga`, `foto`, `created_by`, `created_at`, `modified_by`, `modified_at`) VALUES
(1, 'Lapangan A', 100000, 'lapangan-a20231202151419.png', 'kelompok 3', '2018-06-10 15:37:43', 'superadmin', '2023-12-02 15:14:19'),
(2, 'Lapangan B', 150000, 'lapangan-b20231202151802.png', 'kelompok 3', '2018-06-10 16:02:44', 'superadmin', '2023-12-02 15:18:02'),
(3, 'Lapangan C', 80000, 'lapangan-c20231202151813.png', 'kelompok 3', '2018-06-10 16:16:17', 'superadmin', '2023-12-02 15:18:13'),
(4, 'Lapangan D', 100000, 'lapangan-d20231202151823.png', 'kelompok 3', '2018-06-10 16:25:05', 'superadmin', '2023-12-02 15:18:23'),
(5, 'Lapangan E', 200000, 'lapangan-e20231202151836.png', 'kelompok 3', '2018-06-10 16:38:10', 'superadmin', '2023-12-02 15:18:36'),
(6, 'Lapangan F', 150000, 'lapangan-f20231202151853.png', 'kelompok 3', '2018-06-10 16:54:28', 'superadmin', '2023-12-02 15:18:53');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id_page` int(11) NOT NULL,
  `judul_page` varchar(50) NOT NULL,
  `judul_seo` varchar(50) NOT NULL,
  `isi_page` text NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id_page`, `judul_page`, `judul_seo`, `isi_page`, `gambar`) VALUES
(1, 'Home', 'home', '', ''),
(2, 'Download', 'download', 'download', ''),
(3, 'Kontak', 'kontak', '<p style=\"text-align: center;\">&nbsp;<img src=\"http://localhost/tol/assets/images/upload/whatsapp.png\" /><br /><strong>SMS/ Call/ Whatsapp</strong></p>\r\n<p style=\"text-align: center;\">0853-6873-3631</p>\r\n<p style=\"text-align: center;\">0822-8155-1666</p>', ''),
(4, 'Profil', 'profil', '<p style=\"text-align: justify;\">Kami merupakan toko yang menyediakan berbagai macam parfum, obat-obatan herbal, baju koko, dan aksesoris muslim lainnya. Toko kami beralamat di Jl. Dr. M. Isa No.1109, Kuto Batu, Ilir Tim. II, Kota Palembang, Sumatera Selatan 30114.</p>\r\n<p style=\"text-align: justify;\">Berikut adalah foto toko kami:</p>', ''),
(5, 'Order', 'order', '<p>Anda dapat menghubungi&nbsp;kami melalui tombol order via whatsapp di masing-masing produk atau melalui customer service/ kontak yang telah disediakan di sisi kanan website ini</p>', '');

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id_provinsi` int(11) NOT NULL,
  `nama_provinsi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_provinsi`, `nama_provinsi`) VALUES
(1, 'Bali'),
(2, 'Bangka Belitung'),
(3, 'Banten'),
(4, 'Bengkulu'),
(5, 'DI Yogyakarta'),
(6, 'DKI Jakarta'),
(7, 'Gorontalo'),
(8, 'Jambi'),
(9, 'Jawa Barat'),
(10, 'Jawa Tengah'),
(11, 'Jawa Timur'),
(12, 'Kalimantan Barat'),
(13, 'Kalimantan Selatan'),
(14, 'Kalimantan Tengah'),
(15, 'Kalimantan Timur'),
(16, 'Kalimantan Utara'),
(17, 'Kepulauan Riau'),
(18, 'Lampung'),
(19, 'Maluku'),
(20, 'Maluku Utara'),
(21, 'Nanggroe Aceh Darussalam (NAD)'),
(22, 'Nusa Tenggara Barat (NTB)'),
(23, 'Nusa Tenggara Timur (NTT)'),
(24, 'Papua'),
(25, 'Papua Barat'),
(26, 'Riau'),
(27, 'Sulawesi Barat'),
(28, 'Sulawesi Selatan'),
(29, 'Sulawesi Tengah'),
(30, 'Sulawesi Tenggara'),
(31, 'Sulawesi Utara'),
(32, 'Sumatera Barat'),
(33, 'Sumatera Selatan'),
(34, 'Sumatera Utara');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `id_slider` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `nama_slider` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `foto` text NOT NULL,
  `foto_type` char(10) NOT NULL,
  `foto_size` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_by` char(50) NOT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `modified_by` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`id_slider`, `no_urut`, `nama_slider`, `link`, `foto`, `foto_type`, `foto_size`, `created_at`, `created_by`, `modified_at`, `modified_by`) VALUES
(1, 1, 'Slider 1', 'http://www.yahoo.com ', '120180610164516', '.jpg', 203, '2017-11-25 08:05:03', 'kelompok 3', '2023-12-02 11:33:48', 'kelompok 3'),
(2, 2, 'Slider 2', 'http://www.google.com ', '220180610164521', '.jpg', 833, '2017-11-25 08:05:03', 'kelompok 3', '2023-12-02 11:33:48', 'kelompok 3'),
(3, 3, 'XXZ', 'http://www.facebook.com', '320180610164527', '.jpg', 167, '2017-11-25 08:05:03', 'kelompok 3', '2023-12-02 11:33:48', 'kelompok 3');

-- --------------------------------------------------------

--
-- Table structure for table `subscriber`
--

CREATE TABLE `subscriber` (
  `id_subscriber` int(11) NOT NULL,
  `email` char(20) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_trans` int(11) NOT NULL,
  `id_invoice` char(15) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `diskon` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `deadline` datetime NOT NULL,
  `catatan` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `created_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_trans`, `id_invoice`, `user_id`, `subtotal`, `diskon`, `grand_total`, `deadline`, `catatan`, `status`, `created_date`, `created_time`) VALUES
(9, 'J-231202-0001', 5, 450000, 0, 450000, '2023-12-02 12:35:30', '', 2, '2023-12-02', '10:39:43'),
(10, 'J-231202-0002', 5, 150000, 0, 150000, '2023-12-02 12:40:29', '', 2, '2023-12-02', '11:40:22'),
(11, 'J-231202-0003', 5, 0, 0, 0, '0000-00-00 00:00:00', '', 0, '2023-12-02', '11:42:16'),
(12, 'J-231202-0004', 1, 200000, 0, 200000, '2023-12-02 21:01:30', '', 2, '2023-12-02', '08:01:11'),
(13, 'J-231203-0005', 6, 500000, 0, 500000, '2023-12-03 13:33:14', '', 1, '2023-12-03', '12:32:16'),
(14, 'J-231203-0006', 6, 500000, 0, 500000, '2023-12-03 13:59:34', '', 2, '2023-12-03', '12:59:15'),
(15, 'J-231203-0007', 1, 100000, 0, 100000, '2023-12-03 15:36:35', '', 1, '2023-12-03', '02:33:16'),
(16, 'J-231203-0008', 1, 100000, 0, 100000, '2023-12-03 15:46:31', '', 2, '2023-12-03', '02:40:42'),
(17, 'J-231203-0009', 6, 100000, 0, 100000, '2023-12-03 16:27:28', '', 2, '2023-12-03', '03:20:34'),
(18, 'J-231204-0010', 6, 100000, 0, 100000, '2023-12-04 18:44:22', '', 1, '2023-12-04', '05:44:10'),
(19, 'J-231204-0011', 6, 100000, 0, 100000, '2023-12-04 18:45:15', '', 1, '2023-12-04', '05:45:06'),
(20, 'J-231206-0012', 6, 700000, 0, 700000, '2023-12-06 10:17:31', '', 1, '2023-12-06', '09:11:24');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id_transdet` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL,
  `lapangan_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_mulai` time DEFAULT NULL,
  `durasi` int(11) NOT NULL,
  `jam_selesai` time DEFAULT NULL,
  `harga_jual` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id_transdet`, `trans_id`, `lapangan_id`, `tanggal`, `jam_mulai`, `durasi`, `jam_selesai`, `harga_jual`, `total`, `created_at`) VALUES
(12, 9, 2, '2023-12-21', '17:00:00', 3, '20:00:00', 150000, 450000, '2023-12-02 10:39:43'),
(13, 10, 2, '2023-12-28', '19:00:00', 1, '20:00:00', 150000, 150000, '2023-12-02 11:40:22'),
(14, 11, 1, '0000-00-00', NULL, 0, NULL, 100000, 100000, '2023-12-02 11:42:16'),
(15, 12, 4, '2023-12-14', '18:00:00', 2, '20:00:00', 100000, 200000, '2023-12-02 20:01:11'),
(16, 13, 1, '2023-12-13', '15:00:00', 5, '20:00:00', 100000, 500000, '2023-12-03 12:32:16'),
(17, 14, 1, '2023-12-05', '11:00:00', 5, '16:00:00', 100000, 500000, '2023-12-03 12:59:15'),
(18, 15, 4, '2023-12-19', '07:00:00', 1, '08:00:00', 100000, 100000, '2023-12-03 14:33:16'),
(19, 16, 1, '2023-12-20', '12:00:00', 1, '13:00:00', 100000, 100000, '2023-12-03 14:40:42'),
(20, 17, 1, '2023-12-22', '12:00:00', 1, '13:00:00', 100000, 100000, '2023-12-03 15:20:34'),
(21, 18, 4, '2023-12-28', '11:00:00', 1, '12:00:00', 100000, 100000, '2023-12-04 17:44:10'),
(22, 19, 1, '2023-12-27', '19:00:00', 1, '20:00:00', 100000, 100000, '2023-12-04 17:45:06'),
(23, 20, 1, '2023-12-20', '16:00:00', 7, '23:00:00', 100000, 700000, '2023-12-06 09:11:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `provinsi` int(11) DEFAULT NULL,
  `kota` int(11) DEFAULT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `usertype` int(11) NOT NULL,
  `active` tinyint(3) UNSIGNED DEFAULT NULL,
  `photo` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `photo_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activation_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `forgotten_password_time` int(10) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `last_login` int(11) DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `email`, `phone`, `provinsi`, `kota`, `address`, `usertype`, `active`, `photo`, `photo_type`, `ip_address`, `salt`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `last_login`, `created_on`, `modified`) VALUES
(1, 'SuperAdmin', 'superadmin', '$2y$08$TWMdtdacqPE5yEz9n1LwFuhEVmiDTTsupl12M45tCQihzF1tu2N/6', 'superadmin@gmail.com', '081228289766', 6, 151, 'asdasdasdsa', 1, 1, 'mazmi20180205001726', '.jpg', '::1', NULL, 'c6ad242e6fd3de875568c7de5ba23af4a24137ef', 'tHafW45duPzrU3oWR0AVuO48b26088a3cd65edc4', 1621246176, NULL, 1701593655, 2147483647, '2023-12-03 15:54:15'),
(2, 'Admin', 'administrator', '$2y$08$rnCngWyQhFLdVJijctNDKuwJZ8o9VfcSsZ9IM9XN71ugxIpQFeCWe', 'administrator@gmail.com', '08124124', NULL, NULL, 'kaldjlas', 2, 1, 'admin20180424102408', '.jpeg', '::1', NULL, NULL, NULL, NULL, NULL, 1621252084, 1524551716, '2021-05-17 18:48:04'),
(5, 'Aulia', 'auliaz03', '$2y$08$lksbJ7ssDf68ea3e2a4E9ufs9/VH1f5GIiCVTEEF.p1Io1QCD6hN.', 'aulia.maulida1612@gmail.com', '081310376095', 11, 31, 'bks', 4, 1, NULL, NULL, '::1', NULL, NULL, NULL, NULL, 'U/qazkW/e2Ms3YyQPd7cDu', 1701488367, 1701487556, '2023-12-02 10:39:28'),
(6, 'SHIFA AULIA', 'Shifaaa', '$2y$08$ajLpEKSN1no/eVPmN5PwOeiYgIr/ITUFMjyhL0y/j9TdW4nLrQkqG', 'syifaaa548@gmail.com', '85887123360', 9, 54, 'bekasi', 4, 1, NULL, NULL, '::1', NULL, NULL, NULL, NULL, '2qSHRi./PYTZf7tOgepE3.', 1701828541, 1701581353, '2023-12-06 09:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `users_group`
--

CREATE TABLE `users_group` (
  `id_group` int(11) NOT NULL,
  `name_group` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users_group`
--

INSERT INTO `users_group` (`id_group`, `name_group`) VALUES
(1, 'SuperAdmin'),
(2, 'Administrator'),
(3, 'Member Premium'),
(4, 'Member Biasa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id_bank`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id_company`);

--
-- Indexes for table `diskon`
--
ALTER TABLE `diskon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id_foto`),
  ADD KEY `foto_FK` (`album_id`);

--
-- Indexes for table `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id_kontak`);

--
-- Indexes for table `lapangan`
--
ALTER TABLE `lapangan`
  ADD PRIMARY KEY (`id_lapangan`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id_page`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id_slider`);

--
-- Indexes for table `subscriber`
--
ALTER TABLE `subscriber`
  ADD PRIMARY KEY (`id_subscriber`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_trans`),
  ADD KEY `transaksi_FK` (`user_id`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id_transdet`),
  ADD KEY `transaksi_detail_FK` (`lapangan_id`),
  ADD KEY `transaksi_detail_FK_1` (`trans_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_group`
--
ALTER TABLE `users_group`
  ADD PRIMARY KEY (`id_group`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id_bank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id_company` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `foto`
--
ALTER TABLE `foto`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `jam`
--
ALTER TABLE `jam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id_kontak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lapangan`
--
ALTER TABLE `lapangan`
  MODIFY `id_lapangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id_page` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `id_slider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subscriber`
--
ALTER TABLE `subscriber`
  MODIFY `id_subscriber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_trans` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id_transdet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users_group`
--
ALTER TABLE `users_group`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `foto`
--
ALTER TABLE `foto`
  ADD CONSTRAINT `foto_FK` FOREIGN KEY (`album_id`) REFERENCES `album` (`id_album`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_FK` FOREIGN KEY (`lapangan_id`) REFERENCES `lapangan` (`id_lapangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_detail_FK_1` FOREIGN KEY (`trans_id`) REFERENCES `transaksi` (`id_trans`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `kampus`
--
CREATE DATABASE IF NOT EXISTS `kampus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kampus`;

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kd_mk` char(5) DEFAULT NULL,
  `nama_mk` char(25) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kd_mk`, `nama_mk`, `sks`) VALUES
('KK021', 'Sistem Basis Data', 2),
('KD123', 'Sistem Informasi Manajeme', 3),
('KU122', 'Pancasila', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mhs`
--

CREATE TABLE `mhs` (
  `nim` char(8) NOT NULL,
  `nama` char(25) DEFAULT NULL,
  `alamat` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mhs`
--

INSERT INTO `mhs` (`nim`, `nama`, `alamat`) VALUES
('10296001', 'Fintri', 'Depok'),
('10296126', 'Astuti', 'Jakarta'),
('10296832', 'Nurhayati', 'Jakarta'),
('21196353', 'Quraish', 'Bogor'),
('21198002', 'Julizar', 'Jakarta'),
('31296500', 'Budi', 'Depok'),
('41296525', 'Prananingrum', 'Bogor'),
('50096487', 'Pipit', 'Bekasi');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `nim` char(10) NOT NULL,
  `kd_mk` char(8) DEFAULT NULL,
  `mid` varchar(3) DEFAULT NULL,
  `final` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`nim`, `kd_mk`, `mid`, `final`) VALUES
('10296126', 'KD123', '70', '90'),
('10296832', 'KK021', '60', '75'),
('21196353', 'KU122', '75', '75'),
('31296500', 'KK021', '55', '40'),
('41296525', 'KU122', '90', '80'),
('50095487', 'KD132', '80', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mhs`
--
ALTER TABLE `mhs`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`nim`);
--
-- Database: `laundry`
--
CREATE DATABASE IF NOT EXISTS `laundry` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `laundry`;

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `id_order` varchar(10) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `berat` varchar(10) DEFAULT NULL,
  `sub_harga` varchar(10) DEFAULT NULL,
  `total_harga` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama_member` varchar(100) DEFAULT NULL,
  `gender_member` varchar(20) DEFAULT NULL,
  `alamat_member` varchar(100) DEFAULT NULL,
  `tlp_member` varchar(15) DEFAULT NULL,
  `tgl_member` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `harga_produk` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id_order` varchar(10) NOT NULL,
  `id_member` int(11) DEFAULT NULL,
  `total_order` varchar(10) DEFAULT NULL,
  `tgl_order` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL,
  `status_order` enum('PROSES','SELESAI') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `perpustakaan`
--
CREATE DATABASE IF NOT EXISTS `perpustakaan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `perpustakaan`;

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` varchar(10) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `jenis_kelamin`, `alamat`, `no_telp`) VALUES
('AG002', 'Abdul Manaf', 'Laki-laki', 'Jl. Dua gang 5', '0812121325'),
('AG003', 'Yuni', 'Perempuan', 'Jl. Tiga', '0823432xxx'),
('AG004', 'Markum', 'Laki-laki', 'Jl. Tiga Pati', '095653400');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(10) NOT NULL,
  `id_pengarang` int(11) NOT NULL,
  `id_penerbit` int(11) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `tahun_terbit` int(10) NOT NULL,
  `jumlah` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_pengarang`, `id_penerbit`, `judul_buku`, `tahun_terbit`, `jumlah`) VALUES
('BK004', 3, 3, 'Algoritma Pemrograman', 2017, 10),
('BK005', 2, 2, 'Database', 2004, 8),
('BK006', 5, 8, 'Membangun Web dengan PHP dan MySQL', 2015, 20),
('BK007', 6, 9, 'Dasar Pemrograman Web PHP - MySQL dengan Dream Wea', 2013, 20),
('BK008', 7, 8, 'Rekayasa Perangkat Lunak', 2016, 20),
('BK009', 8, 8, 'Pemrograman Basis Data di Matlab', 2016, 25),
('BK010', 9, 7, 'Sukses Mengelola Layanan Teknologi Informasi', 2017, 10),
('BK011', 10, 6, 'Sistem Informasi Akademik Kampus Berbasis Web deng', 2011, 5),
('BK012', 11, 5, 'Algoritma dan Pemrograman Menggunakan Java', 2012, 8),
('BK013', 12, 4, 'Pengantar Sistem Informasi', 2005, 4);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pm` varchar(10) NOT NULL,
  `id_anggota` varchar(10) NOT NULL,
  `id_buku` varchar(10) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pm`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`) VALUES
('PM001', 'AG002', 'BK005', '2021-07-10', '2021-07-17'),
('PM002', 'AG003', 'BK005', '2021-07-15', '2021-07-22'),
('PM003', 'AG004', 'BK008', '2021-07-18', '2021-07-25'),
('PM004', 'AG004', 'BK013', '2021-07-18', '2021-07-25');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama_penerbit`) VALUES
(2, 'Penerbt 1'),
(3, 'Penerbit 2'),
(4, 'Salemba Empat'),
(5, 'Andi'),
(6, 'Lokomedia'),
(7, 'AISINDO'),
(8, 'Informatika'),
(9, 'Gava Media');

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `id_pengarang` int(11) NOT NULL,
  `nama_pengarang` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`id_pengarang`, `nama_pengarang`) VALUES
(2, 'Andre DD'),
(3, 'Candra Dewa'),
(4, 'Ariani'),
(5, 'R H Sianipar'),
(6, 'Bunafit Nugroho'),
(7, 'Rosa A S'),
(8, 'Rahmadya Trias Handayanto'),
(9, 'Tony Dwi Susanto'),
(10, 'Roki Aditama'),
(11, 'Abdul Kadir'),
(12, 'James A O\'Brian');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_anggota` varchar(10) NOT NULL,
  `id_buku` varchar(10) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_pengembalian` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id_pengembalian`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `tgl_pengembalian`) VALUES
(1, 'AG002', 'BK004', '2021-07-01', '2021-07-08', '2021-07-12'),
(2, 'AG003', 'BK005', '2021-07-02', '2021-07-09', '2021-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `level`) VALUES
(1, 'Admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator'),
(2, 'Arif', 'arif', '827ccb0eea8a706c4c34a16891f84e7b', 'Petugas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pm`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`id_pengarang`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id_penerbit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pengarang`
--
ALTER TABLE `pengarang`
  MODIFY `id_pengarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

--
-- Dumping data for table `pma__central_columns`
--

INSERT INTO `pma__central_columns` (`db_name`, `col_name`, `col_type`, `col_length`, `col_collation`, `col_isNull`, `col_extra`, `col_default`) VALUES
('db_latihan_sepatu', 'Id_pembeli', 'int', '5', '', 0, 'auto_increment,', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"angular_direct\":\"direct\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Dumping data for table `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('db_latihan_sepatu', 1, 'tugas'),
('db_latihan_sepatu', 2, 'tugas sepatu'),
('db_latihan_sepatu', 3, 'tugas aplikasi'),
('db_latihan_sepatu', 4, 'tugas9'),
('db_latihan_sepatu', 5, 'aplikasi');

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"db_latihan_sepatu\",\"table\":\"detail_penjualan\"},{\"db\":\"db_latihan_sepatu\",\"table\":\"penjualan\"},{\"db\":\"db_latihan_sepatu\",\"table\":\"pembeli\"},{\"db\":\"db_latihan_sepatu\",\"table\":\"sepatu\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Dumping data for table `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('db_latihan_sepatu', 'detail_penjualan', 2, 35, 206),
('db_latihan_sepatu', 'detail_penjualan', 3, 120, 209),
('db_latihan_sepatu', 'detail_penjualan', 4, 464, 368),
('db_latihan_sepatu', 'detail_penjualan', 5, 638, 259),
('db_latihan_sepatu', 'pembeli', 2, 513, 475),
('db_latihan_sepatu', 'pembeli', 3, 526, 59),
('db_latihan_sepatu', 'pembeli', 4, 241, 276),
('db_latihan_sepatu', 'pembeli', 5, 332, 106),
('db_latihan_sepatu', 'penjualan', 2, 79, 139),
('db_latihan_sepatu', 'penjualan', 3, 525, 210),
('db_latihan_sepatu', 'penjualan', 4, 150, 402),
('db_latihan_sepatu', 'penjualan', 5, 650, 115),
('db_latihan_sepatu', 'sepatu', 2, 70, 117),
('db_latihan_sepatu', 'sepatu', 3, 180, 64),
('db_latihan_sepatu', 'sepatu', 4, 372, 106),
('db_latihan_sepatu', 'sepatu', 5, 346, 275);

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('db_latihan_sepatu', 'detail_penjualan', 'No_fak');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-07-02 14:24:38', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"id\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `projek_perpus`
--
CREATE DATABASE IF NOT EXISTS `projek_perpus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projek_perpus`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_biaya_denda`
--

CREATE TABLE `tbl_biaya_denda` (
  `id_biaya_denda` int(11) NOT NULL,
  `harga_denda` varchar(255) NOT NULL,
  `stat` varchar(255) NOT NULL,
  `tgl_tetap` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_biaya_denda`
--

INSERT INTO `tbl_biaya_denda` (`id_biaya_denda`, `harga_denda`, `stat`, `tgl_tetap`) VALUES
(1, '4000', 'Aktif', '2019-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_buku`
--

CREATE TABLE `tbl_buku` (
  `id_buku` int(11) NOT NULL,
  `buku_id` varchar(255) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_rak` int(11) NOT NULL,
  `sampul` varchar(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `lampiran` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `pengarang` varchar(255) DEFAULT NULL,
  `thn_buku` varchar(255) DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `jml` int(11) DEFAULT NULL,
  `tgl_masuk` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_buku`
--

INSERT INTO `tbl_buku` (`id_buku`, `buku_id`, `id_kategori`, `id_rak`, `sampul`, `isbn`, `lampiran`, `title`, `penerbit`, `pengarang`, `thn_buku`, `isi`, `jml`, `tgl_masuk`) VALUES
(8, 'BK008', 2, 1, '0', '132-123-234-231', '0', 'CARA MUDAH BELAJAR PEMROGRAMAN C++', 'INFORMATIKA BANDUNG', 'BUDI RAHARJO ', '2012', '<table class=\"table table-bordered\" style=\"background-color: rgb(255, 255, 255); width: 653px; color: rgb(51, 51, 51);\"><tbody><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(244, 244, 244);\">Tipe Buku</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(244, 244, 244);\">Kertas</td></tr><tr><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(244, 244, 244);\">Bahasa</td><td style=\"padding: 8px; line-height: 1.42857; border-color: rgb(244, 244, 244);\">Indonesia</td></tr></tbody></table>', 23, '2019-11-23 11:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_denda`
--

CREATE TABLE `tbl_denda` (
  `id_denda` int(11) NOT NULL,
  `pinjam_id` varchar(255) NOT NULL,
  `denda` varchar(255) NOT NULL,
  `lama_waktu` int(11) NOT NULL,
  `tgl_denda` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_denda`
--

INSERT INTO `tbl_denda` (`id_denda`, `pinjam_id`, `denda`, `lama_waktu`, `tgl_denda`) VALUES
(3, 'PJ001', '0', 0, '2020-05-20'),
(5, 'PJ009', '0', 0, '2020-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(2, 'Pemrograman');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `id_login` int(11) NOT NULL,
  `anggota_id` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `level` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tempat_lahir` varchar(255) NOT NULL,
  `tgl_lahir` varchar(255) NOT NULL,
  `jenkel` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `email` varchar(255) NOT NULL,
  `tgl_bergabung` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`id_login`, `anggota_id`, `user`, `pass`, `level`, `nama`, `tempat_lahir`, `tgl_lahir`, `jenkel`, `alamat`, `telepon`, `email`, `tgl_bergabung`, `foto`) VALUES
(1, 'AG001', 'anang', '202cb962ac59075b964b07152d234b70', 'Petugas', 'Anang', 'Bekasi', '1999-04-05', 'Laki-Laki', 'Ujung Harapan', '089618173609', 'fauzan1892@codekop.com', '2019-11-20', 'user_1567327491.png'),
(2, 'AG002', 'fauzan', '202cb962ac59075b964b07152d234b70', 'Anggota', 'Fauzan', 'Bekasi', '1998-11-18', 'Laki-Laki', 'Bekasi Barat', '08123123185', 'fauzanfalah21@gmail.com', '2019-11-21', 'user_1589911243.png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pinjam`
--

CREATE TABLE `tbl_pinjam` (
  `id_pinjam` int(11) NOT NULL,
  `pinjam_id` varchar(255) NOT NULL,
  `anggota_id` varchar(255) NOT NULL,
  `buku_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `tgl_pinjam` varchar(255) NOT NULL,
  `lama_pinjam` int(11) NOT NULL,
  `tgl_balik` varchar(255) NOT NULL,
  `tgl_kembali` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pinjam`
--

INSERT INTO `tbl_pinjam` (`id_pinjam`, `pinjam_id`, `anggota_id`, `buku_id`, `status`, `tgl_pinjam`, `lama_pinjam`, `tgl_balik`, `tgl_kembali`) VALUES
(8, 'PJ001', 'AG002', 'BK008', 'Di Kembalikan', '2020-05-19', 1, '2020-05-20', '2020-05-20'),
(10, 'PJ009', 'AG002', 'BK008', 'Di Kembalikan', '2020-05-20', 1, '2020-05-21', '2020-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rak`
--

CREATE TABLE `tbl_rak` (
  `id_rak` int(11) NOT NULL,
  `nama_rak` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_rak`
--

INSERT INTO `tbl_rak` (`id_rak`, `nama_rak`) VALUES
(1, 'Rak Buku 1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_biaya_denda`
--
ALTER TABLE `tbl_biaya_denda`
  ADD PRIMARY KEY (`id_biaya_denda`);

--
-- Indexes for table `tbl_buku`
--
ALTER TABLE `tbl_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `tbl_denda`
--
ALTER TABLE `tbl_denda`
  ADD PRIMARY KEY (`id_denda`);

--
-- Indexes for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- Indexes for table `tbl_rak`
--
ALTER TABLE `tbl_rak`
  ADD PRIMARY KEY (`id_rak`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_biaya_denda`
--
ALTER TABLE `tbl_biaya_denda`
  MODIFY `id_biaya_denda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_buku`
--
ALTER TABLE `tbl_buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_denda`
--
ALTER TABLE `tbl_denda`
  MODIFY `id_denda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_pinjam`
--
ALTER TABLE `tbl_pinjam`
  MODIFY `id_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_rak`
--
ALTER TABLE `tbl_rak`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `quiz_19220304`
--
CREATE DATABASE IF NOT EXISTS `quiz_19220304` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `quiz_19220304`;

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `Kd_Kamar` char(5) NOT NULL,
  `Jenis` enum('standard','deluxe') DEFAULT NULL,
  `harga` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`Kd_Kamar`, `Jenis`, `harga`) VALUES
('DL002', 'deluxe', 500000),
('ST001', 'standard', 200000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `NIK` char(14) NOT NULL,
  `Nama` varchar(25) DEFAULT NULL,
  `Alamat` varchar(50) DEFAULT NULL,
  `no_telp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`NIK`, `Nama`, `Alamat`, `no_telp`) VALUES
('32752001890017', 'Adnan Syafiq', 'Bekasi', '085645457766'),
('32754102870018', 'Ryana', 'Bekasi', '081289347801');

-- --------------------------------------------------------

--
-- Table structure for table `sewa`
--

CREATE TABLE `sewa` (
  `No_Sewa` int(3) NOT NULL,
  `Tanggal` date NOT NULL,
  `Tgl_Checkin` date NOT NULL,
  `Tgl_Checkout` date NOT NULL,
  `NIK` char(15) DEFAULT NULL,
  `Kd_Kamar` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sewa`
--

INSERT INTO `sewa` (`No_Sewa`, `Tanggal`, `Tgl_Checkin`, `Tgl_Checkout`, `NIK`, `Kd_Kamar`) VALUES
(1, '2023-04-07', '2023-04-27', '2023-04-29', '32752001890017', 'ST001'),
(2, '2023-04-15', '2023-04-17', '2023-04-20', '32754102870018', 'DL002'),
(3, '2023-04-22', '2023-04-23', '2023-04-25', '32754102870018', 'DL002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`Kd_Kamar`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`No_Sewa`);
--
-- Database: `quiz_nim`
--
CREATE DATABASE IF NOT EXISTS `quiz_nim` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `quiz_nim`;
--
-- Database: `sekolah`
--
CREATE DATABASE IF NOT EXISTS `sekolah` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sekolah`;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `NIP` int(4) NOT NULL,
  `Nama_Guru` char(30) DEFAULT NULL,
  `Mata_Pelajaran` char(20) DEFAULT NULL,
  `Jenis_Kelamin` char(1) DEFAULT NULL,
  `Alamat` varchar(30) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Password` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`NIP`, `Nama_Guru`, `Mata_Pelajaran`, `Jenis_Kelamin`, `Alamat`, `Email`, `Password`) VALUES
(1001, 'Aulia Maulida', 'Matematika', 'P', 'Bekasi', 'auliamaulida@gmail.com', 'AM1001'),
(1002, 'Fadly Pratama', 'Bahasa Indonesia', 'L', 'Jakarta', 'fadlypratama@gmail.com', 'FP1002'),
(1003, 'Jelita Sarti Tanida', 'Bahasa Inggris', 'P', 'Cilengsi', 'jelitasartitanida@gmail.com', 'JS1003');

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `ID_Pelajaran` int(4) NOT NULL,
  `Mata_Pelajaran` char(20) DEFAULT NULL,
  `NIP` int(4) DEFAULT NULL,
  `Nama_Guru` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mapel`
--

INSERT INTO `mapel` (`ID_Pelajaran`, `Mata_Pelajaran`, `NIP`, `Nama_Guru`) VALUES
(1111, 'Matematika', 1001, 'Aulia Maulida'),
(2222, 'Bahasa Indonesia', 1002, 'Fadly Pratama'),
(3333, 'Bahasa Inggris', 1003, 'Jelita Sarti Tanida');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `NIS` int(4) DEFAULT NULL,
  `ID_Pelajaran` int(4) DEFAULT NULL,
  `Mata_Pelajaran` char(20) DEFAULT NULL,
  `Nilai` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`NIS`, `ID_Pelajaran`, `Mata_Pelajaran`, `Nilai`) VALUES
(191121, 1111, 'Matematika', 90),
(191121, 2222, 'Bahasa Indonesia', 85),
(191121, 3333, 'Bahasa Inggris', 90),
(192212, 1111, 'Matematika', 90),
(192212, 2222, 'Bahasa Indonesia', 80),
(192212, 3333, 'Bahasa Inggris', 85),
(193321, 1111, 'Matematika', 70),
(193321, 2222, 'Bahasa Indonesia', 90),
(193321, 3333, 'Bahasa Inggris', 80),
(194412, 1111, 'Matematika', 80),
(194412, 2222, 'Bahasa Indonesia', 75),
(194412, 3333, 'Bahasa Inggris', 90);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `NIS` int(4) NOT NULL,
  `Nama_Siswa` char(30) DEFAULT NULL,
  `Kelas` varchar(5) DEFAULT NULL,
  `Jenis_Kelamin` char(1) DEFAULT NULL,
  `Alamat` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`NIS`, `Nama_Siswa`, `Kelas`, `Jenis_Kelamin`, `Alamat`) VALUES
(191121, 'Shifa Aulia Syafitri', '2A', 'P', 'Cikarang'),
(192212, 'Zahrisa Alifia Syahra', '2A', 'P', 'Cibitung'),
(193321, 'Haikal Ahmad Robani', '2B', 'L', 'Tambun'),
(194412, 'Bagas Zidan Setioko', '2C', 'L', 'Bogor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`NIP`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`ID_Pelajaran`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`NIS`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `NIP` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1004;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `ID_Pelajaran` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3334;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `NIS` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194413;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `uas_19220304`
--
CREATE DATABASE IF NOT EXISTS `uas_19220304` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uas_19220304`;

-- --------------------------------------------------------

--
-- Table structure for table `kereta`
--

CREATE TABLE `kereta` (
  `Id_kereta` char(5) NOT NULL,
  `nm_kereta` varchar(20) DEFAULT NULL,
  `Tujuan` varchar(30) DEFAULT NULL,
  `Harga` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kereta`
--

INSERT INTO `kereta` (`Id_kereta`, `nm_kereta`, `Tujuan`, `Harga`) VALUES
('AL001', 'Argo Lawu', 'Solo - Gambir', 370000),
('AP004', 'Argo Parahyangan', 'Jakarta - Bandung', 250000),
('SW002', 'Sawunggalih', 'Pasar Senen - Kutoarjo', 255000),
('TK003', 'Taksaka', 'Jakarta - Yogyakarta', 550000);

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE `pembeli` (
  `NIK` char(14) NOT NULL,
  `Nama` varchar(25) DEFAULT NULL,
  `Alamat` varchar(50) DEFAULT NULL,
  `Telp` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`NIK`, `Nama`, `Alamat`, `Telp`) VALUES
('32752001890017', 'Adnan Syafiq', 'Bekasi', '085601010303'),
('32754102870018', 'Bianca', 'Jakarta', '081201010202');

-- --------------------------------------------------------

--
-- Table structure for table `trans`
--

CREATE TABLE `trans` (
  `Id_trans` int(3) NOT NULL,
  `Tanggal` date DEFAULT NULL,
  `Id_kereta` char(5) DEFAULT NULL,
  `Jml_beli` int(3) DEFAULT NULL,
  `NIK` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trans`
--

INSERT INTO `trans` (`Id_trans`, `Tanggal`, `Id_kereta`, `Jml_beli`, `NIK`) VALUES
(1, '2023-04-16', 'TK003', 2, '32752001890017'),
(2, '2023-05-25', 'AL001', 3, '32754102870018'),
(3, '2023-06-07', 'SW002', 3, '32754102870018');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kereta`
--
ALTER TABLE `kereta`
  ADD PRIMARY KEY (`Id_kereta`);

--
-- Indexes for table `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `trans`
--
ALTER TABLE `trans`
  ADD PRIMARY KEY (`Id_trans`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `trans`
--
ALTER TABLE `trans`
  MODIFY `Id_trans` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `websekolah`
--
CREATE DATABASE IF NOT EXISTS `websekolah` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `websekolah`;

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `judul_berita` varchar(120) DEFAULT NULL,
  `tgl_berita` datetime DEFAULT NULL,
  `des_berita` text DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ekstra`
--

CREATE TABLE `ekstra` (
  `id_ekstra` int(11) NOT NULL,
  `nama_ekstra` varchar(120) DEFAULT NULL,
  `foto_ekstra` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `nama_fasilitas` varchar(120) DEFAULT NULL,
  `foto_fasilitas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `foto_kegiatan`
--

CREATE TABLE `foto_kegiatan` (
  `id_foto` int(11) NOT NULL,
  `id_kegiatan` int(11) DEFAULT NULL,
  `file_kegiatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `galeri`
--

CREATE TABLE `galeri` (
  `id_galeri` int(11) NOT NULL,
  `nama_galeri` varchar(120) DEFAULT NULL,
  `file_galeri` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(120) DEFAULT NULL,
  `kelamin_guru` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `pendidikan` varchar(120) DEFAULT NULL,
  `jabatan` varchar(120) DEFAULT NULL,
  `pelajaran` varchar(120) DEFAULT NULL,
  `foto_guru` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kegiatan`
--

CREATE TABLE `kegiatan` (
  `id_kegiatan` int(11) NOT NULL,
  `nama_kegiatan` varchar(120) DEFAULT NULL,
  `tgl_kegiatan` date DEFAULT NULL,
  `des_kegiatan` text DEFAULT NULL,
  `tgl_post` datetime DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pengurus`
--

CREATE TABLE `pengurus` (
  `id_pengurus` int(11) NOT NULL,
  `nama_pengurus` varchar(120) DEFAULT NULL,
  `jenkel_pengurus` varchar(30) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `foto_pengurus` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(120) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `akses` enum('ADMIN','PIMPINAN') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saran`
--

CREATE TABLE `saran` (
  `id_saran` int(11) NOT NULL,
  `nama_saran` varchar(120) DEFAULT NULL,
  `email_saran` varchar(100) DEFAULT NULL,
  `tlp_saran` varchar(12) DEFAULT NULL,
  `pesan_saran` text DEFAULT NULL,
  `tgl_saran` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`);

--
-- Indexes for table `ekstra`
--
ALTER TABLE `ekstra`
  ADD PRIMARY KEY (`id_ekstra`);

--
-- Indexes for table `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indexes for table `foto_kegiatan`
--
ALTER TABLE `foto_kegiatan`
  ADD PRIMARY KEY (`id_foto`);

--
-- Indexes for table `galeri`
--
ALTER TABLE `galeri`
  ADD PRIMARY KEY (`id_galeri`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `kegiatan`
--
ALTER TABLE `kegiatan`
  ADD PRIMARY KEY (`id_kegiatan`);

--
-- Indexes for table `pengurus`
--
ALTER TABLE `pengurus`
  ADD PRIMARY KEY (`id_pengurus`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `saran`
--
ALTER TABLE `saran`
  ADD PRIMARY KEY (`id_saran`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ekstra`
--
ALTER TABLE `ekstra`
  MODIFY `id_ekstra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fasilitas`
--
ALTER TABLE `fasilitas`
  MODIFY `id_fasilitas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `foto_kegiatan`
--
ALTER TABLE `foto_kegiatan`
  MODIFY `id_foto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `galeri`
--
ALTER TABLE `galeri`
  MODIFY `id_galeri` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kegiatan`
--
ALTER TABLE `kegiatan`
  MODIFY `id_kegiatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengurus`
--
ALTER TABLE `pengurus`
  MODIFY `id_pengurus` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saran`
--
ALTER TABLE `saran`
  MODIFY `id_saran` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
