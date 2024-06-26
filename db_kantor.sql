-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Jun 2024 pada 21.38
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kantor`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`id`, `nama`) VALUES
(1, 'IT'),
(2, 'Marketing'),
(3, 'Riset');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `departemen_gaji`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `departemen_gaji` (
`nama` varchar(50)
,`total_gaji` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gaji`
--

CREATE TABLE `gaji` (
  `id` int(11) NOT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  `gaji` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `gaji`
--

INSERT INTO `gaji` (`id`, `id_karyawan`, `gaji`) VALUES
(1, 1, 80000.00),
(2, 2, 120000.00),
(3, 3, 90000.00),
(4, 4, 110000.00),
(5, 5, 70000.00);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `gaji_aggregate`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `gaji_aggregate` (
`avg_gaji` decimal(14,6)
,`total_gaji` decimal(32,2)
,`max_gaji` decimal(10,2)
,`min_gaji` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `id_departemen` int(11) DEFAULT NULL,
  `jabatan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id`, `nama`, `id_departemen`, `jabatan`) VALUES
(1, 'John Doe', 1, 'Software Engineer'),
(2, 'Jane Smith', 2, 'Marketing Manager'),
(3, 'Bob Johnson', 1, 'DevOps Engineer'),
(4, 'Alice Brown', 3, 'Data Scientist'),
(5, 'Mike Davis', 2, 'Sales Representative');

--
-- Trigger `karyawan`
--
DELIMITER $$
CREATE TRIGGER `update_gaji` AFTER UPDATE ON `karyawan` FOR EACH ROW BEGIN
  UPDATE gaji
  SET gaji = gaji * 1.1
  WHERE id_karyawan = NEW.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur untuk view `departemen_gaji`
--
DROP TABLE IF EXISTS `departemen_gaji`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `departemen_gaji`  AS SELECT `d`.`nama` AS `nama`, sum(`g`.`gaji`) AS `total_gaji` FROM ((`departemen` `d` join `karyawan` `k` on(`d`.`id` = `k`.`id_departemen`)) join `gaji` `g` on(`k`.`id` = `g`.`id_karyawan`)) GROUP BY `d`.`nama` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `gaji_aggregate`
--
DROP TABLE IF EXISTS `gaji_aggregate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gaji_aggregate`  AS SELECT avg(`gaji`.`gaji`) AS `avg_gaji`, sum(`gaji`.`gaji`) AS `total_gaji`, max(`gaji`.`gaji`) AS `max_gaji`, min(`gaji`.`gaji`) AS `min_gaji` FROM `gaji` ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `gaji`
--
ALTER TABLE `gaji`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
