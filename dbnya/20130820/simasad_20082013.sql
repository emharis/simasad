-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for simasad
DROP DATABASE IF EXISTS `simasad`;
CREATE DATABASE IF NOT EXISTS `simasad` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `simasad`;


-- Dumping structure for table simasad.activator
DROP TABLE IF EXISTS `activator`;
CREATE TABLE IF NOT EXISTS `activator` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `lunas` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.activator: ~1 rows (approximately)
DELETE FROM `activator`;
/*!40000 ALTER TABLE `activator` DISABLE KEYS */;
INSERT INTO `activator` (`id`, `created_at`, `updated_at`, `tanggal`, `lunas`) VALUES
	(3, '2013-06-16 09:59:52', '2013-08-02 12:51:34', '2013-09-01', 'N');
/*!40000 ALTER TABLE `activator` ENABLE KEYS */;


-- Dumping structure for table simasad.appsetting
DROP TABLE IF EXISTS `appsetting`;
CREATE TABLE IF NOT EXISTS `appsetting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `biaya_id` int(11) NOT NULL COMMENT 'biaya id yang di guanakan di One click biaya',
  `mysqldumppath` varchar(150) DEFAULT NULL,
  `cetaknota` enum('Y','N') DEFAULT NULL,
  `printeraddr` varchar(50) DEFAULT NULL,
  `lunas` enum('Y','N') DEFAULT 'N',
  `linekertas` int(11) DEFAULT NULL,
  `spaceprinter` int(11) DEFAULT NULL,
  `charcount` int(11) DEFAULT NULL,
  `sn_key` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_appsetting_biaya` (`biaya_id`),
  CONSTRAINT `FK_appsetting_biaya` FOREIGN KEY (`biaya_id`) REFERENCES `jenisbiaya` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.appsetting: ~1 rows (approximately)
DELETE FROM `appsetting`;
/*!40000 ALTER TABLE `appsetting` DISABLE KEYS */;
INSERT INTO `appsetting` (`id`, `created_at`, `updated_at`, `biaya_id`, `mysqldumppath`, `cetaknota`, `printeraddr`, `lunas`, `linekertas`, `spaceprinter`, `charcount`, `sn_key`) VALUES
	(1, '2013-05-31 10:03:45', '2013-08-03 16:50:05', 1, 'C:\\xampp\\mysql\\bin\\', 'N', '//192.168.0.2/epson_lx_800', 'N', 30, 14, 56, 'TkQtZ3QtTlUtSXQtTXota3QtTVUtTXQtUkQtVXQtT0UtRT0=');
/*!40000 ALTER TABLE `appsetting` ENABLE KEYS */;


-- Dumping structure for table simasad.bulan
DROP TABLE IF EXISTS `bulan`;
CREATE TABLE IF NOT EXISTS `bulan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `angka` int(11) DEFAULT NULL,
  `posisi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.bulan: ~12 rows (approximately)
DELETE FROM `bulan`;
/*!40000 ALTER TABLE `bulan` DISABLE KEYS */;
INSERT INTO `bulan` (`id`, `created_at`, `updated_at`, `nama`, `angka`, `posisi`) VALUES
	(1, '2013-05-09 17:09:28', '2013-05-11 02:42:00', 'januari', 1, 7),
	(2, '2013-05-09 17:09:38', '2013-05-11 02:42:01', 'februari', 2, 8),
	(3, '2013-05-09 17:09:53', '2013-05-11 02:42:03', 'maret', 3, 9),
	(4, '2013-05-09 17:10:00', '2013-05-11 02:42:05', 'april', 4, 10),
	(5, '2013-05-09 17:10:06', '2013-05-11 02:42:07', 'mei', 5, 11),
	(6, '2013-05-09 17:10:11', '2013-05-11 02:42:07', 'juni', 6, 12),
	(7, '2013-05-09 17:10:16', '2013-07-05 12:54:19', 'juli', 7, 1),
	(8, '2013-05-09 17:10:21', '2013-07-05 12:54:19', 'agustus', 8, 2),
	(9, '2013-05-09 17:10:28', '2013-05-11 02:41:54', 'september', 9, 3),
	(10, '2013-05-09 17:10:33', '2013-05-11 02:41:55', 'oktober', 10, 4),
	(11, '2013-05-09 17:10:40', '2013-05-11 02:41:57', 'november', 11, 5),
	(12, '2013-05-09 17:10:47', '2013-05-11 02:41:58', 'desember', 12, 6);
/*!40000 ALTER TABLE `bulan` ENABLE KEYS */;


-- Dumping structure for table simasad.detiltransmasuk
DROP TABLE IF EXISTS `detiltransmasuk`;
CREATE TABLE IF NOT EXISTS `detiltransmasuk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `transmasuk_id` int(10) DEFAULT NULL,
  `jenisbiaya_id` int(10) DEFAULT NULL,
  `bulan_id` int(10) DEFAULT NULL,
  `harus_bayar` decimal(10,0) DEFAULT NULL,
  `jumlah` decimal(10,0) DEFAULT NULL,
  `potongan` decimal(10,0) DEFAULT NULL,
  `ket` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_detiltransmasuk_transmasuk` (`transmasuk_id`),
  KEY `FK_detiltransmasuk_jenisbiaya` (`jenisbiaya_id`),
  KEY `FK_detiltransmasuk_bulan` (`bulan_id`),
  CONSTRAINT `FK_detiltransmasuk_bulan` FOREIGN KEY (`bulan_id`) REFERENCES `bulan` (`id`),
  CONSTRAINT `FK_detiltransmasuk_jenisbiaya` FOREIGN KEY (`jenisbiaya_id`) REFERENCES `jenisbiaya` (`id`),
  CONSTRAINT `FK_detiltransmasuk_transmasuk` FOREIGN KEY (`transmasuk_id`) REFERENCES `transmasuk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.detiltransmasuk: ~71 rows (approximately)
DELETE FROM `detiltransmasuk`;
/*!40000 ALTER TABLE `detiltransmasuk` DISABLE KEYS */;
INSERT INTO `detiltransmasuk` (`id`, `created_at`, `updated_at`, `transmasuk_id`, `jenisbiaya_id`, `bulan_id`, `harus_bayar`, `jumlah`, `potongan`, `ket`) VALUES
	(1, '2013-07-18 15:46:27', '2013-07-18 15:46:27', 9, 1, 7, 140000, 140000, 0, NULL),
	(2, '2013-07-18 15:46:36', '2013-07-18 15:46:36', 10, 1, 7, 140000, 140000, 0, NULL),
	(3, '2013-07-18 15:46:43', '2013-07-18 15:46:43', 11, 1, 7, 140000, 140000, 0, NULL),
	(4, '2013-07-18 15:46:51', '2013-07-18 15:46:51', 12, 1, 7, 140000, 140000, 0, NULL),
	(5, '2013-07-18 15:47:03', '2013-07-18 15:47:03', 13, 1, 7, 140000, 140000, 0, NULL),
	(6, '2013-07-18 15:47:10', '2013-07-18 15:47:10', 14, 1, 7, 140000, 140000, 0, NULL),
	(7, '2013-07-18 15:47:18', '2013-07-18 15:47:18', 15, 1, 7, 140000, 140000, 0, NULL),
	(8, '2013-07-18 15:47:27', '2013-07-18 15:47:27', 16, 1, 7, 140000, 140000, 0, NULL),
	(9, '2013-07-18 15:47:34', '2013-07-18 15:47:34', 17, 1, 7, 140000, 140000, 0, NULL),
	(10, '2013-07-18 15:47:43', '2013-07-18 15:47:43', 18, 1, 7, 140000, 140000, 0, NULL),
	(12, '2013-07-18 15:48:41', '2013-07-18 15:48:41', 20, 1, 7, 140000, 140000, 0, NULL),
	(13, '2013-07-18 15:48:59', '2013-07-18 15:48:59', 21, 1, 7, 140000, 140000, 0, NULL),
	(14, '2013-07-18 15:49:09', '2013-07-18 15:49:09', 22, 1, 7, 140000, 140000, 0, NULL),
	(15, '2013-07-18 15:49:17', '2013-07-18 15:49:17', 23, 1, 7, 230000, 230000, 0, NULL),
	(16, '2013-07-18 15:49:25', '2013-07-18 15:49:25', 24, 1, 7, 230000, 230000, 0, NULL),
	(17, '2013-07-18 15:49:35', '2013-07-18 15:49:35', 25, 1, 7, 230000, 230000, 0, NULL),
	(18, '2013-07-18 15:49:44', '2013-07-18 15:49:44', 26, 1, 7, 230000, 230000, 0, NULL),
	(19, '2013-07-18 15:49:52', '2013-07-18 15:49:52', 27, 1, 7, 230000, 230000, 0, NULL),
	(20, '2013-07-18 15:49:59', '2013-07-18 15:49:59', 28, 1, 7, 230000, 230000, 0, NULL),
	(21, '2013-07-18 15:50:14', '2013-07-18 15:50:14', 29, 1, 7, 230000, 230000, 0, NULL),
	(22, '2013-07-18 15:50:32', '2013-07-18 15:50:32', 30, 1, 7, 230000, 230000, 0, NULL),
	(23, '2013-07-18 15:50:45', '2013-07-18 15:50:45', 31, 1, 7, 230000, 230000, 0, NULL),
	(24, '2013-07-18 15:50:54', '2013-07-18 15:50:54', 32, 1, 7, 230000, 230000, 0, NULL),
	(25, '2013-07-18 15:51:03', '2013-07-18 15:51:03', 33, 1, 7, 230000, 230000, 0, NULL),
	(26, '2013-07-18 15:51:12', '2013-07-18 15:51:12', 34, 1, 7, 230000, 230000, 0, NULL),
	(27, '2013-07-18 15:51:20', '2013-07-18 15:51:20', 35, 1, 7, 230000, 230000, 0, NULL),
	(28, '2013-07-18 15:51:28', '2013-07-18 15:51:28', 36, 1, 7, 230000, 230000, 0, NULL),
	(29, '2013-07-18 15:51:36', '2013-07-18 15:51:36', 37, 1, 7, 230000, 230000, 0, NULL),
	(30, '2013-07-18 15:51:44', '2013-07-18 15:51:44', 38, 1, 7, 230000, 230000, 0, NULL),
	(31, '2013-07-19 09:30:45', '2013-07-19 09:30:45', 39, 1, 7, 140000, 70000, 70000, 'Peringkat Kelas 1'),
	(32, '2013-07-19 09:31:10', '2013-07-19 09:31:10', 40, 1, 7, 140000, 70000, 70000, 'Peringkat Kelas ke 1'),
	(33, '2013-07-19 09:31:20', '2013-07-19 09:31:20', 41, 1, 8, 140000, 140000, 0, NULL),
	(34, '2013-07-19 09:31:30', '2013-07-19 09:31:30', 42, 1, 8, 140000, 140000, 0, NULL),
	(35, '2013-07-19 09:31:38', '2013-07-19 09:31:38', 43, 1, 8, 140000, 140000, 0, NULL),
	(36, '2013-07-19 09:31:47', '2013-07-19 09:31:47', 44, 1, 8, 140000, 140000, 0, NULL),
	(37, '2013-07-22 13:20:26', '2013-07-22 13:20:26', 45, 1, 9, 140000, 140000, 0, NULL),
	(38, '2013-07-22 13:20:26', '2013-07-22 13:20:26', 45, 1, 10, 140000, 140000, 0, NULL),
	(39, '2013-07-22 13:20:26', '2013-07-22 13:20:26', 45, 1, 11, 140000, 140000, 0, NULL),
	(40, '2013-07-22 13:23:32', '2013-07-22 13:23:32', 46, 1, 8, 140000, 140000, 0, NULL),
	(41, '2013-07-24 15:07:53', '2013-07-24 15:07:53', 47, 1, 7, 140000, 35000, 105000, 'Peringkat 1'),
	(42, '2013-07-24 15:07:53', '2013-07-24 15:07:53', 47, 1, 8, 140000, 35000, 105000, 'Peringkat 1'),
	(43, '2013-07-24 15:07:53', '2013-07-24 15:07:53', 47, 1, 9, 140000, 35000, 105000, 'Peringkat 1'),
	(44, '2013-07-25 10:14:54', '2013-07-25 10:14:54', 48, 1, 7, 140000, 140000, 0, NULL),
	(45, '2013-07-25 10:15:03', '2013-07-25 10:15:03', 49, 1, 7, 140000, 140000, 0, NULL),
	(46, '2013-07-25 10:15:14', '2013-07-25 10:15:14', 50, 1, 7, 140000, 140000, 0, NULL),
	(47, '2013-07-25 10:15:46', '2013-07-25 10:15:46', 51, 1, 7, 140000, 140000, 0, NULL),
	(48, '2013-07-26 13:35:39', '2013-07-26 13:35:39', 52, 7, NULL, NULL, 150000, NULL, NULL),
	(49, '2013-07-28 13:15:42', '2013-07-28 13:15:42', 53, 13, NULL, NULL, 16000, NULL, 'Bed'),
	(50, '2013-07-28 13:15:42', '2013-07-28 13:15:42', 53, 13, NULL, NULL, 10000, NULL, 'Topi'),
	(51, '2013-07-28 13:19:17', '2013-07-28 13:19:17', 54, 15, NULL, NULL, 2400000, NULL, 'Juli'),
	(52, '2013-07-28 13:19:37', '2013-07-28 13:19:37', 55, 20, NULL, NULL, 250000, NULL, 'Juli'),
	(53, '2013-07-28 13:19:37', '2013-07-28 13:19:37', 55, 21, NULL, NULL, 70000, NULL, 'Juli'),
	(54, '2013-08-03 05:41:38', '2013-08-03 05:41:38', 56, 1, 12, 140000, 140000, 0, NULL),
	(55, '2013-08-03 05:58:13', '2013-08-03 05:58:13', 57, 1, 7, 140000, 140000, 0, NULL),
	(56, '2013-08-03 06:37:35', '2013-08-03 06:37:35', 67, 1, 7, 140000, 140000, 0, NULL),
	(57, '2013-08-03 06:39:33', '2013-08-03 06:39:33', 68, 1, 7, 140000, 140000, 0, NULL),
	(58, '2013-08-03 06:40:36', '2013-08-03 06:40:36', 69, 1, 8, 140000, 140000, 0, NULL),
	(59, '2013-08-03 06:41:03', '2013-08-03 06:41:03', 70, 1, 8, 140000, 140000, 0, NULL),
	(60, '2013-08-03 06:42:41', '2013-08-03 06:42:41', 71, 1, 7, 140000, 140000, 0, NULL),
	(61, '2013-08-03 06:50:03', '2013-08-03 06:50:03', 72, 1, 7, 140000, 140000, 0, NULL),
	(62, '2013-08-03 06:53:52', '2013-08-03 06:53:52', 73, 1, 7, 140000, 140000, 0, NULL),
	(63, '2013-08-03 06:55:51', '2013-08-03 06:55:51', 74, 1, 7, 140000, 140000, 0, NULL),
	(64, '2013-08-03 06:56:07', '2013-08-03 06:56:07', 75, 1, 7, 140000, 140000, 0, NULL),
	(65, '2013-08-03 06:56:19', '2013-08-03 06:56:19', 76, 1, 8, 140000, 140000, 0, NULL),
	(66, '2013-08-03 06:56:38', '2013-08-03 06:56:38', 77, 1, 9, 140000, 140000, 0, NULL),
	(67, '2013-08-03 06:57:40', '2013-08-03 06:57:40', 78, 1, 7, 140000, 140000, 0, NULL),
	(68, '2013-08-03 06:59:02', '2013-08-03 06:59:02', 79, 1, 8, 140000, 140000, 0, NULL),
	(69, '2013-08-03 06:59:15', '2013-08-03 06:59:15', 80, 1, 8, 140000, 140000, 0, NULL),
	(70, '2013-08-03 07:21:14', '2013-08-03 07:21:14', 81, 1, 7, 140000, 140000, 0, NULL),
	(71, '2013-08-03 07:21:41', '2013-08-03 07:21:41', 82, 1, 8, 140000, 140000, 0, NULL),
	(72, '2013-08-03 16:50:05', '2013-08-03 16:50:05', 83, 1, 9, 140000, 140000, 0, NULL);
/*!40000 ALTER TABLE `detiltransmasuk` ENABLE KEYS */;


-- Dumping structure for table simasad.jenisbiaya
DROP TABLE IF EXISTS `jenisbiaya`;
CREATE TABLE IF NOT EXISTS `jenisbiaya` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nama` varchar(60) DEFAULT NULL,
  `perjenjang` enum('Y','N') DEFAULT 'N',
  `tipe` enum('ITB','ITC','BBBI','BTBI','IB') DEFAULT NULL COMMENT 'ITB : Iuran Tetap Bulanan, ITC:Iuran Tetap Cicilan, BBBI : Biaya bebas bukan iuran, BTBI: Biaya Tetap Bukan Iuran',
  `arus` enum('M','K') DEFAULT 'M',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.jenisbiaya: ~21 rows (approximately)
DELETE FROM `jenisbiaya`;
/*!40000 ALTER TABLE `jenisbiaya` DISABLE KEYS */;
INSERT INTO `jenisbiaya` (`id`, `created_at`, `updated_at`, `nama`, `perjenjang`, `tipe`, `arus`) VALUES
	(1, '2013-05-20 21:39:03', '2013-05-20 21:39:03', 'SPP', 'Y', 'ITB', 'M'),
	(2, '2013-07-08 11:09:14', '2013-07-08 11:09:14', 'Buku', 'Y', 'ITC', 'M'),
	(3, '2013-07-08 11:09:45', '2013-07-08 11:09:45', 'Partisipasi', 'Y', 'ITC', 'M'),
	(4, '2013-07-08 11:10:50', '2013-07-25 13:30:48', 'Catering', 'Y', 'ITC', 'M'),
	(5, '2013-07-08 11:12:22', '2013-07-25 13:32:20', 'Try Out', 'Y', 'ITB', 'M'),
	(6, '2013-07-08 11:13:31', '2013-07-09 09:56:04', 'Seragam', 'Y', 'ITC', 'M'),
	(7, '2013-07-08 11:14:30', '2013-07-08 11:14:30', 'Pendaftaran Murid Baru', 'N', 'BTBI', 'M'),
	(8, '2013-07-08 11:16:49', '2013-07-09 09:59:52', 'Buku MBQ', 'N', 'IB', 'M'),
	(9, '2013-07-08 11:17:11', '2013-07-09 10:00:03', 'PHBI dan PHBN', 'N', 'IB', 'M'),
	(10, '2013-07-08 11:17:33', '2013-07-09 10:02:35', 'Study Tour', 'Y', 'ITC', 'M'),
	(11, '2013-07-08 11:19:44', '2013-07-25 13:32:38', 'Biaya Qurban', 'Y', 'ITC', 'M'),
	(12, '2013-07-08 11:21:15', '2013-07-08 11:21:15', 'LKS', 'Y', 'ITC', 'M'),
	(13, '2013-07-08 11:21:45', '2013-07-09 10:04:44', 'Atribut', 'N', 'IB', 'M'),
	(14, '2013-07-08 11:23:21', '2013-07-22 12:40:11', 'Pondok Romadhon', 'Y', 'ITC', 'M'),
	(15, '2013-07-09 11:23:42', '2013-07-09 11:23:42', 'Bayar Catering', 'N', 'BBBI', 'K'),
	(20, '2013-07-09 11:25:23', '2013-07-09 11:25:23', 'Bayar Listrik', 'N', 'BBBI', 'K'),
	(21, '2013-07-09 11:25:45', '2013-07-09 11:25:45', 'Bayar Telp', 'N', 'BBBI', 'K'),
	(22, '2013-07-09 11:26:23', '2013-07-09 11:26:23', 'Bayar Guru extra', 'N', 'BBBI', 'K'),
	(23, '2013-07-09 11:27:19', '2013-07-09 11:27:19', 'Bayar Kebutuhan ATK', 'N', 'BBBI', 'K'),
	(24, '2013-07-09 11:27:56', '2013-07-09 11:27:56', 'Bayar Kebersihan', 'N', 'BBBI', 'K'),
	(25, '2013-07-09 11:28:42', '2013-07-09 11:28:42', 'Bayar Kebutuhan Kondisional', 'N', 'BBBI', 'K');
/*!40000 ALTER TABLE `jenisbiaya` ENABLE KEYS */;


-- Dumping structure for table simasad.ketentuanbiaya
DROP TABLE IF EXISTS `ketentuanbiaya`;
CREATE TABLE IF NOT EXISTS `ketentuanbiaya` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tahunajaran_id` int(10) DEFAULT NULL,
  `jenisbiaya_id` int(10) DEFAULT NULL,
  `jenjang` enum('1','2','3','4','5','6') DEFAULT NULL,
  `jumlah` int(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK__tahunajaran` (`tahunajaran_id`),
  KEY `FK__jenisbiaya` (`jenisbiaya_id`),
  CONSTRAINT `FK__jenisbiaya` FOREIGN KEY (`jenisbiaya_id`) REFERENCES `jenisbiaya` (`id`),
  CONSTRAINT `FK__tahunajaran` FOREIGN KEY (`tahunajaran_id`) REFERENCES `tahunajaran` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.ketentuanbiaya: ~19 rows (approximately)
DELETE FROM `ketentuanbiaya`;
/*!40000 ALTER TABLE `ketentuanbiaya` DISABLE KEYS */;
INSERT INTO `ketentuanbiaya` (`id`, `created_at`, `updated_at`, `tahunajaran_id`, `jenisbiaya_id`, `jenjang`, `jumlah`) VALUES
	(1, '2013-07-15 11:04:15', '2013-07-15 11:04:15', 2, 1, '1', 230000),
	(2, '2013-07-15 11:04:15', '2013-07-15 11:04:15', 2, 1, '2', 230000),
	(3, '2013-07-15 11:04:15', '2013-07-15 11:04:15', 2, 1, '3', 220000),
	(4, '2013-07-15 11:04:15', '2013-07-15 11:04:15', 2, 1, '4', 140000),
	(5, '2013-07-15 11:04:15', '2013-07-15 11:04:15', 2, 1, '5', 140000),
	(6, '2013-07-15 11:04:15', '2013-07-15 11:04:15', 2, 1, '6', 140000),
	(7, '2013-07-18 15:44:19', '2013-07-18 15:44:19', 2, 7, NULL, 150000),
	(8, '2013-07-22 12:55:57', '2013-07-22 12:55:57', 2, 14, '1', 15000),
	(9, '2013-07-22 12:55:57', '2013-07-22 12:55:57', 2, 14, '2', 15000),
	(10, '2013-07-22 12:55:57', '2013-07-22 12:55:57', 2, 14, '3', 15000),
	(11, '2013-07-22 12:55:57', '2013-07-22 12:55:57', 2, 14, '4', 15000),
	(12, '2013-07-22 12:55:57', '2013-07-22 12:55:57', 2, 14, '5', 15000),
	(13, '2013-07-22 12:55:57', '2013-07-22 12:55:57', 2, 14, '6', 15000),
	(14, '2013-07-25 13:31:22', '2013-07-25 13:31:22', 2, 4, '1', 15000),
	(15, '2013-07-25 13:31:22', '2013-07-25 13:31:22', 2, 4, '2', 15000),
	(16, '2013-07-25 13:31:22', '2013-07-25 13:31:22', 2, 4, '3', 15000),
	(17, '2013-07-25 13:31:22', '2013-07-25 13:31:22', 2, 4, '4', 15000),
	(18, '2013-07-25 13:31:22', '2013-07-25 13:31:22', 2, 4, '5', 15000),
	(19, '2013-07-25 13:31:22', '2013-07-25 13:31:22', 2, 4, '6', 15000);
/*!40000 ALTER TABLE `ketentuanbiaya` ENABLE KEYS */;


-- Dumping structure for table simasad.laravel_migrations
DROP TABLE IF EXISTS `laravel_migrations`;
CREATE TABLE IF NOT EXISTS `laravel_migrations` (
  `bundle` varchar(50) NOT NULL,
  `name` varchar(200) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`bundle`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.laravel_migrations: ~5 rows (approximately)
DELETE FROM `laravel_migrations`;
/*!40000 ALTER TABLE `laravel_migrations` DISABLE KEYS */;
INSERT INTO `laravel_migrations` (`bundle`, `name`, `batch`) VALUES
	('sentry', '2012_08_03_162320_install', 1),
	('sentry', '2012_08_15_001334_database_rules', 1),
	('sentry', '2012_10_08_000000_users_nullable', 1),
	('verify', '2012_06_17_211339_init', 2),
	('verify', '2013_02_24_094926_user_roles_one_to_many', 2);
/*!40000 ALTER TABLE `laravel_migrations` ENABLE KEYS */;


-- Dumping structure for table simasad.mutasi
DROP TABLE IF EXISTS `mutasi`;
CREATE TABLE IF NOT EXISTS `mutasi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `tahunajaran_id` int(10) DEFAULT NULL,
  `asal` enum('KU','KB') DEFAULT NULL COMMENT 'KU => Kas Utama, KB => Kas On Bank',
  `tujuan` enum('KU','KB') DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__tahunajaran_cob` (`tahunajaran_id`),
  CONSTRAINT `FK__tahunajaran_cob` FOREIGN KEY (`tahunajaran_id`) REFERENCES `tahunajaran` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.mutasi: ~4 rows (approximately)
DELETE FROM `mutasi`;
/*!40000 ALTER TABLE `mutasi` DISABLE KEYS */;
INSERT INTO `mutasi` (`id`, `created_at`, `updated_at`, `tanggal`, `tahunajaran_id`, `asal`, `tujuan`, `jumlah`) VALUES
	(14, '2013-07-30 12:33:43', '2013-07-30 12:33:43', '2013-07-30', 2, 'KU', 'KB', 3000000),
	(15, '2013-07-30 12:59:34', '2013-07-30 12:59:34', '2013-07-30', 2, 'KB', 'KU', 1500000),
	(16, '2013-07-30 13:01:14', '2013-07-30 13:01:14', '2013-07-30', 2, 'KU', 'KB', 500000),
	(17, '2013-07-31 08:00:03', '2013-07-31 08:00:03', '2013-06-04', 2, 'KU', 'KB', 280000);
/*!40000 ALTER TABLE `mutasi` ENABLE KEYS */;


-- Dumping structure for table simasad.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.permissions: ~19 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'manage_user', 'Mengelola Data User (tambah,edit,hapus)', '2013-06-11 17:59:12', '2013-06-11 17:59:12'),
	(2, 'manage_user_group', 'Mengelola Data User Group (tambah,edit,hapus)', '2013-06-11 17:59:12', '2013-06-11 17:59:12'),
	(3, 'manage_tahun_ajaran', 'Mengelola Data Tahun Ajaran (tambah,edit,hapus)', '2013-06-11 17:59:12', '2013-06-11 17:59:12'),
	(5, 'manage_rombel', 'Mengelola Data Rombongan Belajar (tambah,edit,hapus)', '2013-06-11 18:01:05', '2013-06-11 18:01:06'),
	(6, 'manage_biaya', 'Mengelola Data Biaya (tambah,edit,hapus, dan pengaturan biaya)', '2013-06-11 18:01:29', '2013-06-11 18:01:29'),
	(7, 'manage_siswa', 'Mengelola Data Siswa (tambah,edit,hapus)', '2013-06-11 18:04:33', '2013-06-11 18:04:33'),
	(8, 'manage_transaksi_penerimaan_iuran', 'Mengelola Transaksi Penerimaan Iuran Siswa', '2013-06-11 18:04:33', '2013-06-11 18:04:34'),
	(9, 'manage_transaksi_penerimaan', 'Mengelola Transaksi Penerimaan', '2013-06-11 18:04:57', '2013-06-11 18:04:57'),
	(10, 'manage_transaksi_pengeluaran', 'Mengelola Transaksi Pengeluaran', '2013-06-11 18:05:09', '2013-06-11 18:05:10'),
	(11, 'manage_histori_transaksi', 'Mengelola Data Histori Transaksi', '2013-06-11 18:05:27', '2013-06-11 18:05:27'),
	(12, 'manage_rekapitulasi_transaksi', 'Mengelola Data Rekapitulasi Transaksi', '2013-06-11 18:05:57', '2013-06-11 18:05:57'),
	(13, 'manage_rekapitulasi_iuran', 'Mengelola Data Rekapitulasi Iuran Per Tahun Ajaran', '2013-06-11 18:06:20', '2013-06-11 18:06:20'),
	(14, 'manage_system_setting', 'Mengelola Data System Setting', '2013-06-11 19:29:08', '2013-06-11 19:29:09'),
	(15, 'manage_rekapitulasi_tahunan', 'Mengelola Data Rekapitulasi Keuangan Tahunan', '2013-06-26 05:41:33', '2013-06-26 05:41:33'),
	(16, 'manage_rekapitulasi_bulanan', 'Mengelola Data Rekapitulasi Iuran Bulanan', '2013-07-18 06:31:23', '2013-07-18 06:31:24'),
	(17, 'manage_beasiswa', 'Mengelola Beasiswa & Bantuan Biaya Pendidikan', '2013-07-28 21:52:56', '2013-07-28 21:52:56'),
	(18, 'manage_target_pencapaian', 'Mengelola Nilai Target Pencapaian Pendapatan per Bulan', '2013-07-28 21:52:56', '2013-07-28 21:52:56'),
	(19, 'manage_kenaikan_siswa', 'Mengelola Proses Kenaikan Siswa', '2013-07-28 22:32:28', '2013-07-28 22:32:28'),
	(20, 'manage_mutasi_kas', 'Mengelola Proses Mutasi Kas ke Bank', '2013-07-30 09:11:00', '2013-07-30 09:11:00');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


-- Dumping structure for table simasad.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.permission_role: ~35 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(12, 1, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(13, 2, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(14, 3, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(16, 5, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(17, 6, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(18, 7, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(19, 8, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(20, 9, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(21, 10, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(22, 11, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(23, 12, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(24, 13, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(30, 3, 4, '2013-06-11 19:09:43', '2013-06-11 19:09:43'),
	(32, 5, 4, '2013-06-11 19:09:43', '2013-06-11 19:09:43'),
	(33, 6, 4, '2013-06-11 19:09:43', '2013-06-11 19:09:43'),
	(34, 7, 4, '2013-06-11 19:09:43', '2013-06-11 19:09:43'),
	(35, 8, 4, '2013-06-11 19:09:44', '2013-06-11 19:09:44'),
	(36, 9, 4, '2013-06-11 19:09:44', '2013-06-11 19:09:44'),
	(37, 10, 4, '2013-06-11 19:09:44', '2013-06-11 19:09:44'),
	(38, 11, 4, '2013-06-11 19:09:44', '2013-06-11 19:09:44'),
	(39, 12, 4, '2013-06-11 19:09:44', '2013-06-11 19:09:44'),
	(40, 13, 4, '2013-06-11 19:09:44', '2013-06-11 19:09:44'),
	(41, 8, 5, '2013-06-11 19:09:59', '2013-06-11 19:09:59'),
	(42, 9, 5, '2013-06-11 19:09:59', '2013-06-11 19:09:59'),
	(44, 14, 1, '2013-06-26 05:41:57', '2013-06-26 05:41:57'),
	(46, 15, 4, '2013-06-26 05:42:07', '2013-06-26 05:42:07'),
	(48, 15, 1, '2013-07-18 06:30:53', '2013-07-18 06:30:53'),
	(49, 16, 1, '2013-07-18 06:31:39', '2013-07-18 06:31:39'),
	(50, 16, 4, '2013-07-18 06:32:13', '2013-07-18 06:32:13'),
	(51, 17, 1, '2013-07-26 13:40:05', '2013-07-26 13:40:05'),
	(52, 17, 4, '2013-07-26 13:40:34', '2013-07-26 13:40:34'),
	(53, 18, 4, '2013-07-28 22:03:28', '2013-07-28 22:03:28'),
	(54, 19, 4, '2013-07-28 22:39:07', '2013-07-28 22:39:07'),
	(55, 18, 1, '2013-07-28 22:39:12', '2013-07-28 22:39:12'),
	(56, 19, 1, '2013-07-28 22:39:12', '2013-07-28 22:39:12');
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;


-- Dumping structure for table simasad.potongan
DROP TABLE IF EXISTS `potongan`;
CREATE TABLE IF NOT EXISTS `potongan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `siswa_id` int(10) DEFAULT NULL,
  `tahunajaran_id` int(10) DEFAULT NULL,
  `bulan_id` int(10) DEFAULT NULL,
  `jenisbiaya_id` int(10) DEFAULT NULL,
  `disc` decimal(10,0) DEFAULT NULL,
  `nilai` decimal(10,0) DEFAULT NULL,
  `ket` varchar(100) DEFAULT NULL,
  `jenis` enum('BP','BS') DEFAULT NULL COMMENT 'BP = Bantuan Pendidikan, BS = Beasiswa',
  PRIMARY KEY (`id`),
  KEY `jenisbiaya_id` (`jenisbiaya_id`),
  KEY `FK_potongan_siswa` (`siswa_id`),
  KEY `FK_potongan_tahunajaran` (`tahunajaran_id`),
  CONSTRAINT `FK_potongan_jenisbiaya` FOREIGN KEY (`jenisbiaya_id`) REFERENCES `jenisbiaya` (`id`),
  CONSTRAINT `FK_potongan_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  CONSTRAINT `FK_potongan_tahunajaran` FOREIGN KEY (`tahunajaran_id`) REFERENCES `tahunajaran` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.potongan: ~13 rows (approximately)
DELETE FROM `potongan`;
/*!40000 ALTER TABLE `potongan` DISABLE KEYS */;
INSERT INTO `potongan` (`id`, `created_at`, `updated_at`, `siswa_id`, `tahunajaran_id`, `bulan_id`, `jenisbiaya_id`, `disc`, `nilai`, `ket`, `jenis`) VALUES
	(1, '2013-07-24 15:07:30', '2013-07-24 15:07:30', 81, 2, 7, 1, 75, 105000, 'Peringkat 1', 'BS'),
	(2, '2013-07-24 15:07:30', '2013-07-24 15:07:30', 81, 2, 8, 1, 75, 105000, 'Peringkat 1', 'BS'),
	(3, '2013-07-24 15:07:30', '2013-07-24 15:07:30', 81, 2, 9, 1, 75, 105000, 'Peringkat 1', 'BS'),
	(4, '2013-07-24 15:07:30', '2013-07-24 15:07:30', 81, 2, 10, 1, 75, 105000, 'Peringkat 1', 'BS'),
	(5, '2013-07-24 15:07:30', '2013-07-24 15:07:30', 81, 2, 11, 1, 75, 105000, 'Peringkat 1', 'BS'),
	(6, '2013-07-24 15:07:30', '2013-07-24 15:07:30', 81, 2, 12, 1, 36, 105000, 'Peringkat 1', 'BS'),
	(7, '2013-07-25 06:29:07', '2013-07-25 06:29:07', 183, 2, 8, 1, 50, 70000, '', 'BS'),
	(8, '2013-07-25 06:29:08', '2013-07-25 06:29:08', 183, 2, 9, 1, 50, 70000, '', 'BS'),
	(9, '2013-07-25 06:29:08', '2013-07-25 06:29:08', 183, 2, 10, 1, 50, 70000, '', 'BS'),
	(10, '2013-07-25 06:29:08', '2013-07-25 06:29:08', 183, 2, 11, 1, 50, 70000, '', 'BS'),
	(11, '2013-07-25 06:29:08', '2013-07-25 06:29:08', 183, 2, 12, 1, 50, 70000, '', 'BS'),
	(12, '2013-07-25 06:29:08', '2013-07-25 06:29:08', 183, 2, 1, 1, 50, 70000, '', 'BS'),
	(13, '2013-07-26 13:56:19', '2013-07-26 13:56:19', 297, 2, 7, 1, 78, 180000, '', 'BP');
/*!40000 ALTER TABLE `potongan` ENABLE KEYS */;


-- Dumping structure for table simasad.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.roles: ~3 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `description`, `level`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', NULL, 10, '2013-06-11 17:07:25', '2013-06-11 17:07:25'),
	(4, 'Bagian Keuangan', NULL, 5, '2013-06-11 19:09:43', '2013-06-11 19:09:43'),
	(5, 'Kasir', NULL, 2, '2013-06-11 19:09:59', '2013-06-11 19:09:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table simasad.role_user
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_user_id_index` (`user_id`),
  KEY `role_user_role_id_index` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.role_user: ~3 rows (approximately)
DELETE FROM `role_user`;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2013-06-12 08:44:17', '2013-06-12 08:44:17'),
	(2, 2, 1, '2013-06-12 08:47:50', '2013-06-12 08:47:50'),
	(9, 8, 1, '2013-08-02 12:40:49', '2013-08-02 12:40:49');
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;


-- Dumping structure for table simasad.rombel
DROP TABLE IF EXISTS `rombel`;
CREATE TABLE IF NOT EXISTS `rombel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jenjang` enum('1','2','3','4','5','6','0') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.rombel: ~14 rows (approximately)
DELETE FROM `rombel`;
/*!40000 ALTER TABLE `rombel` DISABLE KEYS */;
INSERT INTO `rombel` (`id`, `created_at`, `updated_at`, `nama`, `jenjang`) VALUES
	(1, '2013-07-05 10:43:10', '2013-07-05 10:43:10', 'I - Cut Nya`Din', '1'),
	(2, '2013-07-05 10:45:06', '2013-07-05 21:21:24', 'I - RA Kartini', '1'),
	(3, '2013-07-05 10:45:24', '2013-07-05 10:45:24', 'II - Wahid Hasyim', '2'),
	(4, '2013-07-05 10:45:36', '2013-07-05 10:45:36', 'II - Hasanuddin', '2'),
	(5, '2013-07-05 10:47:19', '2013-07-05 10:47:19', 'III - Imam Bonjol', '3'),
	(6, '2013-07-05 10:47:43', '2013-07-05 10:47:43', 'III - Abdul Wahab', '3'),
	(7, '2013-07-05 10:48:17', '2013-07-05 10:48:17', 'IV - Diponegoro', '4'),
	(8, '2013-07-05 10:48:48', '2013-07-05 10:48:48', 'IV - Teuku Umar', '4'),
	(9, '2013-07-05 10:49:11', '2013-07-28 08:18:11', 'V - K. H. Dewantara', '5'),
	(10, '2013-07-05 10:50:41', '2013-07-05 10:50:41', 'V - Ahmad Yani', '5'),
	(12, '2013-07-05 21:20:48', '2013-07-05 21:20:48', 'VI - Ir Sukarno', '6'),
	(13, '2013-07-05 21:20:58', '2013-07-28 08:18:19', 'VI - Moh. Hatta', '6'),
	(14, '2013-07-05 21:21:08', '2013-07-05 21:21:08', 'I - Dewi Sartika', '1'),
	(15, '2013-07-05 21:42:06', '2013-07-05 21:42:06', 'Lulus', '0');
/*!40000 ALTER TABLE `rombel` ENABLE KEYS */;


-- Dumping structure for table simasad.rombelsiswa
DROP TABLE IF EXISTS `rombelsiswa`;
CREATE TABLE IF NOT EXISTS `rombelsiswa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tahunajaran_id` int(10) DEFAULT NULL,
  `rombel_id` int(10) DEFAULT NULL,
  `siswa_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_rombelsiswa_tahunajaran` (`tahunajaran_id`),
  KEY `FK_rombelsiswa_rombel` (`rombel_id`),
  KEY `FK_rombelsiswa_siswa` (`siswa_id`),
  CONSTRAINT `FK_rombelsiswa_rombel` FOREIGN KEY (`rombel_id`) REFERENCES `rombel` (`id`),
  CONSTRAINT `FK_rombelsiswa_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  CONSTRAINT `FK_rombelsiswa_tahunajaran` FOREIGN KEY (`tahunajaran_id`) REFERENCES `tahunajaran` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=515 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.rombelsiswa: ~775 rows (approximately)
DELETE FROM `rombelsiswa`;
/*!40000 ALTER TABLE `rombelsiswa` DISABLE KEYS */;
INSERT INTO `rombelsiswa` (`id`, `created_at`, `updated_at`, `tahunajaran_id`, `rombel_id`, `siswa_id`) VALUES
	(1, '2013-07-05 10:56:21', '2013-07-05 10:56:21', 1, 1, 1),
	(2, '2013-07-05 10:56:29', '2013-07-05 10:56:29', 1, 3, 2),
	(3, '2013-07-05 10:57:04', '2013-07-05 10:57:04', 1, 3, 3),
	(4, '2013-07-05 10:57:17', '2013-07-05 10:57:17', 1, 1, 4),
	(5, '2013-07-05 10:57:55', '2013-07-05 10:57:55', 1, 1, 5),
	(6, '2013-07-05 10:58:25', '2013-07-05 10:58:25', 1, 1, 6),
	(7, '2013-07-05 10:58:52', '2013-07-05 10:58:52', 1, 1, 7),
	(8, '2013-07-05 10:59:20', '2013-07-05 10:59:20', 1, 1, 8),
	(10, '2013-07-05 11:00:24', '2013-07-05 11:00:24', 1, 1, 10),
	(11, '2013-07-05 11:00:52', '2013-07-05 11:00:52', 1, 1, 11),
	(12, '2013-07-05 11:01:32', '2013-07-05 11:01:32', 1, 1, 12),
	(13, '2013-07-05 11:03:26', '2013-07-05 11:03:26', 1, 1, 13),
	(14, '2013-07-05 11:03:35', '2013-07-05 11:03:35', 1, 3, 14),
	(15, '2013-07-05 11:03:57', '2013-07-05 11:03:57', 1, 1, 15),
	(16, '2013-07-05 11:04:26', '2013-07-05 11:04:26', 1, 3, 16),
	(17, '2013-07-05 11:04:48', '2013-07-05 11:04:48', 1, 3, 17),
	(19, '2013-07-05 11:05:02', '2013-07-05 11:05:02', 1, 3, 19),
	(20, '2013-07-05 11:05:14', '2013-07-05 11:05:14', 1, 3, 20),
	(21, '2013-07-05 11:05:28', '2013-07-05 11:05:28', 1, 3, 21),
	(22, '2013-07-05 11:05:40', '2013-07-05 11:05:40', 1, 3, 22),
	(24, '2013-07-05 11:05:55', '2013-07-05 11:05:55', 1, 3, 24),
	(25, '2013-07-05 11:06:06', '2013-07-05 11:06:06', 1, 3, 25),
	(26, '2013-07-05 11:06:18', '2013-07-05 11:06:18', 1, 3, 26),
	(28, '2013-07-05 11:06:30', '2013-07-05 11:06:30', 1, 3, 28),
	(29, '2013-07-05 11:06:42', '2013-07-05 11:06:42', 1, 3, 29),
	(31, '2013-07-05 11:06:55', '2013-07-05 11:06:55', 1, 3, 31),
	(32, '2013-07-05 11:07:10', '2013-07-05 11:07:10', 1, 3, 32),
	(33, '2013-07-05 11:07:38', '2013-07-05 11:07:38', 1, 3, 33),
	(35, '2013-07-05 11:07:54', '2013-07-05 11:07:54', 1, 3, 35),
	(36, '2013-07-05 11:08:12', '2013-07-05 11:08:12', 1, 3, 36),
	(37, '2013-07-05 11:08:24', '2013-07-05 11:08:24', 1, 3, 37),
	(39, '2013-07-05 11:08:54', '2013-07-05 11:08:54', 1, 4, 39),
	(40, '2013-07-05 11:09:06', '2013-07-05 11:09:06', 1, 4, 40),
	(41, '2013-07-05 11:09:16', '2013-07-05 11:09:16', 1, 4, 41),
	(43, '2013-07-05 11:09:26', '2013-07-05 11:09:26', 1, 4, 43),
	(44, '2013-07-05 11:09:36', '2013-07-05 11:09:36', 1, 4, 44),
	(49, '2013-07-05 11:13:49', '2013-07-05 11:13:49', 1, 4, 49),
	(50, '2013-07-05 11:14:00', '2013-07-05 11:14:00', 1, 4, 50),
	(51, '2013-07-05 11:14:10', '2013-07-05 11:14:10', 1, 4, 51),
	(52, '2013-07-05 11:14:13', '2013-07-05 11:14:13', 1, 1, 52),
	(53, '2013-07-05 11:14:19', '2013-07-05 11:14:19', 1, 4, 53),
	(54, '2013-07-05 11:14:32', '2013-07-05 11:14:32', 1, 4, 54),
	(55, '2013-07-05 11:14:53', '2013-07-05 11:14:53', 1, 4, 55),
	(56, '2013-07-05 11:14:59', '2013-07-05 11:14:59', 1, 1, 56),
	(57, '2013-07-05 11:15:03', '2013-07-05 11:15:03', 1, 4, 57),
	(58, '2013-07-05 11:15:12', '2013-07-05 11:15:12', 1, 4, 58),
	(59, '2013-07-05 11:15:23', '2013-07-05 11:15:23', 1, 4, 59),
	(60, '2013-07-05 11:15:34', '2013-07-05 11:15:34', 1, 4, 60),
	(61, '2013-07-05 11:15:40', '2013-07-05 11:15:40', 1, 1, 61),
	(62, '2013-07-05 11:15:44', '2013-07-05 11:15:44', 1, 4, 62),
	(63, '2013-07-05 11:15:57', '2013-07-05 11:15:57', 1, 4, 63),
	(64, '2013-07-05 11:16:08', '2013-07-05 11:16:08', 1, 4, 64),
	(65, '2013-07-05 11:16:16', '2013-07-05 11:16:16', 1, 1, 65),
	(66, '2013-07-05 11:16:18', '2013-07-05 11:16:18', 1, 4, 66),
	(67, '2013-07-05 11:16:26', '2013-07-05 11:16:26', 1, 4, 67),
	(68, '2013-07-05 11:16:44', '2013-07-05 11:16:44', 1, 4, 68),
	(69, '2013-07-05 11:17:18', '2013-07-05 11:17:18', 1, 5, 69),
	(70, '2013-07-05 11:17:18', '2013-07-05 11:17:18', 1, 1, 70),
	(71, '2013-07-05 11:17:27', '2013-07-05 11:17:27', 1, 5, 71),
	(72, '2013-07-05 11:18:44', '2013-07-05 11:18:44', 1, 1, 72),
	(73, '2013-07-05 11:19:02', '2013-07-05 11:19:02', 1, 5, 73),
	(74, '2013-07-05 11:19:12', '2013-07-05 11:19:12', 1, 5, 74),
	(75, '2013-07-05 11:19:14', '2013-07-05 11:19:14', 1, 1, 75),
	(76, '2013-07-05 11:19:21', '2013-07-05 11:19:21', 1, 5, 76),
	(77, '2013-07-05 11:19:31', '2013-07-05 11:19:31', 1, 5, 77),
	(78, '2013-07-05 11:19:41', '2013-07-05 11:19:41', 1, 5, 78),
	(79, '2013-07-05 11:19:47', '2013-07-05 11:19:47', 1, 1, 79),
	(80, '2013-07-05 11:19:49', '2013-07-05 11:19:49', 1, 5, 80),
	(81, '2013-07-05 11:20:00', '2013-07-05 11:20:00', 1, 5, 81),
	(82, '2013-07-05 11:20:10', '2013-07-05 11:20:10', 1, 5, 82),
	(83, '2013-07-05 11:20:19', '2013-07-05 11:20:19', 1, 1, 83),
	(84, '2013-07-05 11:20:23', '2013-07-05 11:20:23', 1, 5, 84),
	(85, '2013-07-05 11:20:32', '2013-07-05 11:20:32', 1, 5, 85),
	(86, '2013-07-05 11:20:41', '2013-07-05 11:20:41', 1, 5, 86),
	(87, '2013-07-05 11:20:50', '2013-07-05 11:20:50', 1, 5, 87),
	(88, '2013-07-05 11:21:02', '2013-07-05 11:21:02', 1, 5, 88),
	(89, '2013-07-05 11:21:12', '2013-07-05 11:21:12', 1, 5, 89),
	(90, '2013-07-05 11:21:15', '2013-07-05 11:21:15', 1, 2, 90),
	(91, '2013-07-05 11:21:21', '2013-07-05 11:21:21', 1, 5, 91),
	(92, '2013-07-05 11:21:34', '2013-07-05 11:21:34', 1, 5, 92),
	(93, '2013-07-05 11:21:42', '2013-07-05 11:21:42', 1, 5, 93),
	(94, '2013-07-05 11:21:53', '2013-07-05 11:21:53', 1, 5, 94),
	(95, '2013-07-05 11:21:58', '2013-07-05 11:21:58', 1, 2, 95),
	(96, '2013-07-05 11:22:06', '2013-07-05 11:22:06', 1, 5, 96),
	(97, '2013-07-05 11:22:17', '2013-07-05 11:22:17', 1, 5, 97),
	(98, '2013-07-05 11:22:29', '2013-07-05 11:22:29', 1, 5, 98),
	(99, '2013-07-05 11:22:35', '2013-07-05 11:22:35', 1, 2, 99),
	(100, '2013-07-05 11:22:47', '2013-07-05 11:22:47', 1, 5, 100),
	(101, '2013-07-05 11:23:00', '2013-07-05 11:23:00', 1, 5, 101),
	(102, '2013-07-05 11:23:10', '2013-07-05 11:23:10', 1, 2, 102),
	(103, '2013-07-05 11:23:14', '2013-07-05 11:23:14', 1, 5, 103),
	(104, '2013-07-05 11:23:28', '2013-07-05 11:23:28', 1, 6, 104),
	(105, '2013-07-05 11:23:48', '2013-07-05 11:23:48', 1, 6, 105),
	(106, '2013-07-05 11:24:02', '2013-07-05 11:24:02', 1, 6, 106),
	(107, '2013-07-05 11:24:04', '2013-07-05 11:24:04', 1, 2, 107),
	(108, '2013-07-05 11:24:15', '2013-07-05 11:24:15', 1, 6, 108),
	(109, '2013-07-05 11:24:25', '2013-07-05 11:24:25', 1, 6, 109),
	(110, '2013-07-05 11:24:33', '2013-07-05 11:24:33', 1, 2, 110),
	(111, '2013-07-05 11:24:35', '2013-07-05 11:24:35', 1, 6, 111),
	(112, '2013-07-05 11:24:44', '2013-07-05 11:24:44', 1, 6, 112),
	(113, '2013-07-05 11:25:00', '2013-07-05 11:25:00', 1, 6, 113),
	(114, '2013-07-05 11:25:03', '2013-07-05 11:25:03', 1, 2, 114),
	(115, '2013-07-05 11:25:13', '2013-07-05 11:25:13', 1, 6, 115),
	(116, '2013-07-05 11:25:22', '2013-07-05 11:25:22', 1, 6, 116),
	(117, '2013-07-05 11:25:42', '2013-07-05 11:25:42', 1, 2, 117),
	(118, '2013-07-05 11:25:54', '2013-07-05 11:25:54', 1, 6, 118),
	(119, '2013-07-05 11:26:06', '2013-07-05 11:26:06', 1, 6, 119),
	(120, '2013-07-05 11:26:15', '2013-07-05 11:26:15', 1, 6, 120),
	(121, '2013-07-05 11:26:20', '2013-07-05 11:26:20', 1, 2, 121),
	(122, '2013-07-05 11:26:26', '2013-07-05 11:26:26', 1, 6, 122),
	(123, '2013-07-05 11:26:42', '2013-07-05 11:26:42', 1, 6, 123),
	(124, '2013-07-05 11:26:53', '2013-07-05 11:26:53', 1, 6, 124),
	(125, '2013-07-05 11:27:03', '2013-07-05 11:27:03', 1, 2, 125),
	(126, '2013-07-05 11:27:07', '2013-07-05 11:27:07', 1, 6, 126),
	(128, '2013-07-05 11:28:21', '2013-07-05 11:28:21', 1, 6, 128),
	(129, '2013-07-05 11:28:31', '2013-07-05 11:28:31', 1, 6, 129),
	(130, '2013-07-05 11:28:43', '2013-07-05 11:28:43', 1, 6, 130),
	(131, '2013-07-05 11:28:54', '2013-07-05 11:28:54', 1, 6, 131),
	(132, '2013-07-05 11:29:05', '2013-07-05 11:29:05', 1, 6, 132),
	(133, '2013-07-05 11:29:16', '2013-07-05 11:29:16', 1, 6, 133),
	(134, '2013-07-05 11:29:35', '2013-07-05 11:29:35', 1, 6, 134),
	(135, '2013-07-05 11:29:45', '2013-07-05 11:29:45', 1, 6, 135),
	(136, '2013-07-05 11:29:57', '2013-07-05 11:29:57', 1, 6, 136),
	(137, '2013-07-05 11:30:08', '2013-07-05 11:30:08', 1, 6, 137),
	(138, '2013-07-05 12:03:05', '2013-07-05 12:03:05', 1, 2, 138),
	(139, '2013-07-05 12:03:46', '2013-07-05 12:03:46', 1, 2, 139),
	(140, '2013-07-05 12:04:20', '2013-07-05 12:04:20', 1, 2, 140),
	(141, '2013-07-05 12:05:01', '2013-07-05 12:05:01', 1, 2, 141),
	(142, '2013-07-05 12:05:45', '2013-07-05 12:05:45', 1, 2, 142),
	(143, '2013-07-05 12:06:13', '2013-07-05 12:06:13', 1, 2, 143),
	(144, '2013-07-05 12:07:05', '2013-07-05 12:07:05', 1, 2, 144),
	(145, '2013-07-05 12:07:48', '2013-07-05 12:07:48', 1, 2, 145),
	(146, '2013-07-05 12:08:24', '2013-07-05 12:08:24', 1, 2, 146),
	(147, '2013-07-05 12:08:57', '2013-07-05 12:08:57', 1, 2, 147),
	(148, '2013-07-05 12:11:41', '2013-07-05 12:11:41', 1, 7, 148),
	(149, '2013-07-05 12:12:22', '2013-07-05 12:12:22', 1, 7, 149),
	(150, '2013-07-05 12:15:49', '2013-07-05 12:15:49', 1, 7, 150),
	(151, '2013-07-05 12:16:30', '2013-07-05 12:16:30', 1, 7, 151),
	(152, '2013-07-05 12:17:05', '2013-07-05 12:17:05', 1, 7, 152),
	(153, '2013-07-05 12:17:46', '2013-07-05 12:17:46', 1, 7, 153),
	(154, '2013-07-05 12:18:19', '2013-07-05 12:18:19', 1, 7, 154),
	(155, '2013-07-05 12:19:01', '2013-07-05 12:19:01', 1, 7, 155),
	(156, '2013-07-05 12:19:33', '2013-07-05 12:19:33', 1, 7, 156),
	(157, '2013-07-05 12:20:09', '2013-07-05 12:20:09', 1, 7, 157),
	(158, '2013-07-05 12:20:59', '2013-07-05 12:20:59', 1, 7, 158),
	(159, '2013-07-05 12:21:29', '2013-07-05 12:21:29', 1, 7, 159),
	(160, '2013-07-05 12:22:16', '2013-07-05 12:22:16', 1, 7, 160),
	(161, '2013-07-05 12:22:48', '2013-07-05 12:22:48', 1, 7, 161),
	(162, '2013-07-05 12:23:36', '2013-07-05 12:23:36', 1, 7, 162),
	(163, '2013-07-05 12:24:16', '2013-07-05 12:24:16', 1, 7, 163),
	(164, '2013-07-05 12:25:01', '2013-07-05 12:25:01', 1, 7, 164),
	(165, '2013-07-05 12:25:32', '2013-07-05 12:25:32', 1, 7, 165),
	(166, '2013-07-05 12:26:29', '2013-07-05 12:26:29', 1, 7, 166),
	(167, '2013-07-05 12:27:07', '2013-07-05 12:27:07', 1, 7, 167),
	(168, '2013-07-05 12:27:34', '2013-07-05 12:27:34', 1, 7, 168),
	(169, '2013-07-05 12:28:06', '2013-07-05 12:28:06', 1, 8, 169),
	(170, '2013-07-05 12:28:37', '2013-07-05 12:28:37', 1, 8, 170),
	(171, '2013-07-05 12:29:31', '2013-07-05 12:29:31', 1, 8, 171),
	(172, '2013-07-05 12:30:05', '2013-07-05 12:30:05', 1, 8, 172),
	(173, '2013-07-05 12:30:34', '2013-07-05 12:30:34', 1, 8, 173),
	(174, '2013-07-05 12:31:01', '2013-07-05 12:31:01', 1, 8, 174),
	(175, '2013-07-05 12:31:55', '2013-07-05 12:31:55', 1, 8, 175),
	(176, '2013-07-05 12:39:12', '2013-07-05 12:39:12', 1, 8, 176),
	(177, '2013-07-05 12:39:39', '2013-07-05 12:39:39', 1, 8, 177),
	(178, '2013-07-05 12:40:08', '2013-07-05 12:40:08', 1, 8, 178),
	(179, '2013-07-05 12:40:43', '2013-07-05 12:40:43', 1, 8, 179),
	(180, '2013-07-05 12:41:26', '2013-07-05 12:41:26', 1, 8, 180),
	(181, '2013-07-05 12:41:52', '2013-07-05 12:41:52', 1, 8, 181),
	(182, '2013-07-05 12:42:18', '2013-07-05 12:42:18', 1, 8, 182),
	(183, '2013-07-05 12:42:52', '2013-07-05 12:42:52', 1, 8, 183),
	(184, '2013-07-05 12:43:23', '2013-07-05 12:43:23', 1, 8, 184),
	(185, '2013-07-05 12:43:51', '2013-07-05 12:43:51', 1, 8, 185),
	(186, '2013-07-05 12:44:18', '2013-07-05 12:44:18', 1, 8, 186),
	(187, '2013-07-05 12:44:42', '2013-07-05 12:44:42', 1, 8, 187),
	(188, '2013-07-05 12:45:12', '2013-07-05 12:45:12', 1, 8, 188),
	(189, '2013-07-05 12:46:01', '2013-07-05 12:46:01', 1, 9, 189),
	(190, '2013-07-05 12:46:49', '2013-07-05 12:46:49', 1, 10, 190),
	(191, '2013-07-05 12:46:52', '2013-07-05 12:46:52', 1, 9, 191),
	(192, '2013-07-05 12:47:05', '2013-07-05 12:47:05', 1, 10, 192),
	(193, '2013-07-05 12:47:16', '2013-07-05 12:47:16', 1, 10, 193),
	(194, '2013-07-05 12:47:20', '2013-07-05 12:47:20', 1, 9, 194),
	(195, '2013-07-05 12:47:27', '2013-07-05 12:47:27', 1, 10, 195),
	(196, '2013-07-05 12:47:36', '2013-07-05 12:47:36', 1, 10, 196),
	(197, '2013-07-05 12:47:46', '2013-07-05 12:47:46', 1, 9, 197),
	(198, '2013-07-05 12:47:47', '2013-07-05 12:47:47', 1, 10, 198),
	(199, '2013-07-05 12:48:01', '2013-07-05 12:48:01', 1, 10, 199),
	(200, '2013-07-05 12:48:16', '2013-07-05 12:48:16', 1, 10, 200),
	(201, '2013-07-05 12:48:28', '2013-07-05 12:48:28', 1, 10, 201),
	(202, '2013-07-05 12:48:30', '2013-07-05 12:48:30', 1, 9, 202),
	(203, '2013-07-05 12:48:39', '2013-07-05 12:48:39', 1, 10, 203),
	(204, '2013-07-05 12:48:49', '2013-07-05 12:48:49', 1, 10, 204),
	(205, '2013-07-05 12:48:58', '2013-07-05 12:48:58', 1, 9, 205),
	(206, '2013-07-05 12:49:00', '2013-07-05 12:49:00', 1, 10, 206),
	(207, '2013-07-05 12:49:12', '2013-07-05 12:49:12', 1, 10, 207),
	(208, '2013-07-05 12:49:24', '2013-07-05 12:49:24', 1, 10, 208),
	(209, '2013-07-05 12:49:40', '2013-07-05 12:49:40', 1, 9, 209),
	(210, '2013-07-05 12:50:18', '2013-07-05 12:50:18', 1, 9, 210),
	(211, '2013-07-05 12:50:45', '2013-07-05 12:50:45', 1, 10, 211),
	(212, '2013-07-05 12:50:55', '2013-07-05 12:50:55', 1, 9, 212),
	(213, '2013-07-05 12:50:57', '2013-07-05 12:50:57', 1, 10, 213),
	(214, '2013-07-05 12:51:06', '2013-07-05 12:51:06', 1, 10, 214),
	(215, '2013-07-05 12:51:18', '2013-07-05 12:51:18', 1, 9, 215),
	(216, '2013-07-05 12:51:34', '2013-07-05 12:51:34', 1, 10, 216),
	(217, '2013-07-05 12:51:43', '2013-07-05 12:51:43', 1, 10, 217),
	(218, '2013-07-05 12:51:47', '2013-07-05 12:51:47', 1, 9, 218),
	(219, '2013-07-05 12:51:55', '2013-07-05 12:51:55', 1, 10, 219),
	(220, '2013-07-05 12:52:07', '2013-07-05 12:52:07', 1, 10, 220),
	(221, '2013-07-05 12:52:11', '2013-07-05 12:52:11', 1, 9, 221),
	(222, '2013-07-05 12:52:41', '2013-07-05 12:52:41', 1, 9, 222),
	(223, '2013-07-05 12:53:08', '2013-07-05 12:53:08', 1, 9, 223),
	(224, '2013-07-05 12:53:33', '2013-07-05 12:53:33', 1, 9, 224),
	(225, '2013-07-05 12:54:14', '2013-07-05 12:54:14', 1, 9, 225),
	(226, '2013-07-05 12:54:37', '2013-07-05 12:54:37', 1, 9, 226),
	(227, '2013-07-05 12:55:59', '2013-07-05 12:55:59', 1, 9, 227),
	(228, '2013-07-05 12:56:23', '2013-07-05 12:56:23', 1, 9, 228),
	(229, '2013-07-05 12:56:49', '2013-07-05 12:56:49', 1, 9, 229),
	(230, '2013-07-05 12:57:32', '2013-07-05 12:57:32', 1, 9, 230),
	(233, '2013-07-13 13:25:04', '2013-07-13 13:25:04', 2, 3, 1),
	(234, '2013-07-13 13:25:06', '2013-07-13 13:25:06', 2, 4, 4),
	(235, '2013-07-13 13:25:08', '2013-07-13 13:25:08', 2, 4, 5),
	(236, '2013-07-13 13:25:23', '2013-07-13 13:25:23', 2, 3, 6),
	(237, '2013-07-13 13:25:34', '2013-07-13 13:25:34', 2, 4, 7),
	(238, '2013-07-13 13:25:45', '2013-07-13 13:25:45', 2, 3, 8),
	(239, '2013-07-13 13:26:10', '2013-07-13 13:26:10', 2, 4, 10),
	(240, '2013-07-13 13:27:46', '2013-07-13 13:27:46', 2, 3, 11),
	(241, '2013-07-13 13:28:08', '2013-07-13 13:28:08', 2, 3, 12),
	(242, '2013-07-13 13:35:12', '2013-07-13 13:35:12', 2, 3, 15),
	(243, '2013-07-13 13:35:15', '2013-07-13 13:35:15', 2, 4, 13),
	(244, '2013-07-13 13:41:06', '2013-07-13 13:41:06', 2, 3, 52),
	(245, '2013-07-13 13:41:49', '2013-07-13 13:41:49', 2, 4, 56),
	(246, '2013-07-13 13:42:11', '2013-07-13 13:42:11', 2, 3, 61),
	(247, '2013-07-13 13:42:14', '2013-07-13 13:42:14', 2, 3, 65),
	(248, '2013-07-13 13:43:54', '2013-07-13 13:43:54', 2, 4, 70),
	(249, '2013-07-13 13:43:57', '2013-07-13 13:43:57', 2, 4, 72),
	(250, '2013-07-13 13:44:00', '2013-07-13 13:44:00', 2, 4, 75),
	(251, '2013-07-13 13:44:02', '2013-07-13 13:44:02', 2, 3, 79),
	(252, '2013-07-13 13:48:19', '2013-07-13 13:48:19', 2, 6, 2),
	(253, '2013-07-13 13:48:37', '2013-07-13 13:48:37', 2, 6, 14),
	(254, '2013-07-13 13:49:01', '2013-07-13 13:49:01', 2, 6, 16),
	(255, '2013-07-13 13:49:04', '2013-07-13 13:49:04', 2, 5, 17),
	(256, '2013-07-13 13:49:22', '2013-07-13 13:49:22', 2, 5, 19),
	(257, '2013-07-13 13:49:38', '2013-07-13 13:49:38', 2, 6, 20),
	(258, '2013-07-13 13:49:42', '2013-07-13 13:49:42', 2, 4, 83),
	(259, '2013-07-13 13:49:45', '2013-07-13 13:49:45', 2, 3, 90),
	(260, '2013-07-13 13:49:48', '2013-07-13 13:49:48', 2, 4, 95),
	(261, '2013-07-13 13:49:50', '2013-07-13 13:49:50', 2, 4, 99),
	(262, '2013-07-13 13:49:52', '2013-07-13 13:49:52', 2, 4, 102),
	(263, '2013-07-13 13:49:55', '2013-07-13 13:49:55', 2, 4, 107),
	(264, '2013-07-13 13:50:00', '2013-07-13 13:50:00', 2, 6, 21),
	(265, '2013-07-13 13:50:02', '2013-07-13 13:50:02', 2, 3, 110),
	(266, '2013-07-13 13:50:04', '2013-07-13 13:50:04', 2, 3, 114),
	(267, '2013-07-13 13:50:07', '2013-07-13 13:50:07', 2, 4, 117),
	(268, '2013-07-13 13:50:10', '2013-07-13 13:50:10', 2, 4, 121),
	(269, '2013-07-13 13:50:10', '2013-07-13 13:50:10', 2, 5, 22),
	(270, '2013-07-13 13:50:26', '2013-07-13 13:50:26', 2, 6, 24),
	(271, '2013-07-13 13:51:36', '2013-07-13 13:51:36', 2, 5, 25),
	(272, '2013-07-13 13:51:38', '2013-07-13 13:51:38', 2, 5, 26),
	(273, '2013-07-13 13:51:40', '2013-07-13 13:51:40', 2, 6, 28),
	(274, '2013-07-13 13:51:42', '2013-07-13 13:51:42', 2, 5, 29),
	(275, '2013-07-13 13:51:44', '2013-07-13 13:51:44', 2, 6, 31),
	(276, '2013-07-13 13:51:56', '2013-07-13 13:51:56', 2, 6, 32),
	(277, '2013-07-13 13:52:03', '2013-07-13 13:52:03', 2, 5, 33),
	(278, '2013-07-13 13:52:35', '2013-07-13 13:52:35', 2, 4, 125),
	(279, '2013-07-13 13:52:38', '2013-07-13 13:52:38', 2, 4, 138),
	(280, '2013-07-13 13:52:40', '2013-07-13 13:52:40', 2, 4, 139),
	(281, '2013-07-13 13:52:41', '2013-07-13 13:52:41', 2, 6, 35),
	(282, '2013-07-13 13:52:42', '2013-07-13 13:52:42', 2, 6, 36),
	(283, '2013-07-13 13:52:42', '2013-07-13 13:52:42', 2, 4, 140),
	(284, '2013-07-13 13:52:44', '2013-07-13 13:52:44', 2, 5, 37),
	(285, '2013-07-13 13:52:46', '2013-07-13 13:52:46', 2, 4, 141),
	(286, '2013-07-13 13:52:49', '2013-07-13 13:52:49', 2, 3, 142),
	(287, '2013-07-13 13:52:51', '2013-07-13 13:52:51', 2, 3, 143),
	(288, '2013-07-13 13:52:54', '2013-07-13 13:52:54', 2, 3, 144),
	(289, '2013-07-13 13:52:55', '2013-07-13 13:52:55', 2, 3, 145),
	(290, '2013-07-13 13:52:57', '2013-07-13 13:52:57', 2, 3, 146),
	(291, '2013-07-13 13:53:00', '2013-07-13 13:53:00', 2, 4, 147),
	(292, '2013-07-13 13:53:30', '2013-07-13 13:53:30', 2, 6, 39),
	(293, '2013-07-13 13:53:32', '2013-07-13 13:53:32', 2, 6, 40),
	(294, '2013-07-13 13:53:34', '2013-07-13 13:53:34', 2, 6, 41),
	(295, '2013-07-13 13:53:36', '2013-07-13 13:53:36', 2, 5, 43),
	(296, '2013-07-13 13:53:37', '2013-07-13 13:53:37', 2, 6, 44),
	(297, '2013-07-13 13:53:39', '2013-07-13 13:53:39', 2, 5, 49),
	(298, '2013-07-13 13:53:41', '2013-07-13 13:53:41', 2, 5, 50),
	(299, '2013-07-13 13:53:53', '2013-07-13 13:53:53', 2, 5, 51),
	(300, '2013-07-13 13:53:58', '2013-07-13 13:53:58', 2, 5, 53),
	(301, '2013-07-13 13:54:07', '2013-07-13 13:54:07', 2, 5, 54),
	(302, '2013-07-13 13:54:13', '2013-07-13 13:54:13', 2, 6, 55),
	(303, '2013-07-13 13:54:24', '2013-07-13 13:54:24', 2, 5, 57),
	(304, '2013-07-13 13:54:40', '2013-07-13 13:54:40', 1, 3, 231),
	(305, '2013-07-13 13:54:44', '2013-07-13 13:54:44', 2, 6, 58),
	(306, '2013-07-13 13:54:53', '2013-07-13 13:54:53', 2, 6, 59),
	(307, '2013-07-13 13:54:58', '2013-07-13 13:54:58', 2, 5, 60),
	(308, '2013-07-13 13:55:09', '2013-07-13 13:55:09', 2, 5, 62),
	(309, '2013-07-13 13:55:27', '2013-07-13 13:55:27', 2, 5, 63),
	(310, '2013-07-13 13:55:35', '2013-07-13 13:55:35', 2, 6, 64),
	(311, '2013-07-13 13:55:40', '2013-07-13 13:55:40', 2, 5, 66),
	(312, '2013-07-13 13:55:46', '2013-07-13 13:55:46', 2, 5, 67),
	(313, '2013-07-13 13:55:52', '2013-07-13 13:55:52', 2, 6, 68),
	(314, '2013-07-13 13:57:30', '2013-07-13 13:57:30', 2, 9, 148),
	(315, '2013-07-13 13:57:46', '2013-07-13 13:57:46', 2, 9, 149),
	(316, '2013-07-13 13:57:47', '2013-07-13 13:57:47', 2, 9, 150),
	(317, '2013-07-13 13:57:58', '2013-07-13 13:57:58', 2, 9, 151),
	(318, '2013-07-13 13:58:04', '2013-07-13 13:58:04', 2, 10, 152),
	(319, '2013-07-13 13:58:10', '2013-07-13 13:58:10', 2, 10, 153),
	(320, '2013-07-13 13:58:27', '2013-07-13 13:58:27', 2, 9, 154),
	(321, '2013-07-13 13:58:35', '2013-07-13 13:58:35', 2, 10, 155),
	(322, '2013-07-13 14:00:42', '2013-07-13 14:00:42', 2, 9, 156),
	(323, '2013-07-13 14:00:51', '2013-07-13 14:00:51', 2, 9, 157),
	(324, '2013-07-13 14:00:56', '2013-07-13 14:00:56', 2, 9, 158),
	(325, '2013-07-13 14:01:10', '2013-07-13 14:01:10', 2, 10, 159),
	(326, '2013-07-13 14:01:17', '2013-07-13 14:01:17', 2, 10, 160),
	(327, '2013-07-13 14:01:28', '2013-07-13 14:01:28', 2, 10, 161),
	(328, '2013-07-13 14:01:36', '2013-07-13 14:01:36', 2, 9, 162),
	(329, '2013-07-13 14:01:46', '2013-07-13 14:01:46', 2, 10, 163),
	(330, '2013-07-13 14:02:02', '2013-07-13 14:02:02', 2, 10, 164),
	(331, '2013-07-13 14:02:10', '2013-07-13 14:02:10', 2, 10, 165),
	(332, '2013-07-13 14:02:28', '2013-07-13 14:02:28', 2, 10, 166),
	(333, '2013-07-13 14:02:32', '2013-07-13 14:02:32', 2, 7, 69),
	(334, '2013-07-13 14:02:34', '2013-07-13 14:02:34', 2, 10, 167),
	(335, '2013-07-13 14:02:35', '2013-07-13 14:02:35', 2, 8, 71),
	(336, '2013-07-13 14:02:38', '2013-07-13 14:02:38', 2, 7, 73),
	(337, '2013-07-13 14:02:40', '2013-07-13 14:02:40', 2, 10, 168),
	(338, '2013-07-13 14:02:40', '2013-07-13 14:02:40', 2, 8, 74),
	(339, '2013-07-13 14:02:42', '2013-07-13 14:02:42', 2, 7, 76),
	(340, '2013-07-13 14:02:45', '2013-07-13 14:02:45', 2, 8, 77),
	(341, '2013-07-13 14:02:47', '2013-07-13 14:02:47', 2, 7, 78),
	(342, '2013-07-13 14:02:47', '2013-07-13 14:02:47', 2, 9, 169),
	(343, '2013-07-13 14:02:49', '2013-07-13 14:02:49', 2, 7, 80),
	(344, '2013-07-13 14:02:53', '2013-07-13 14:02:53', 2, 8, 81),
	(345, '2013-07-13 14:02:55', '2013-07-13 14:02:55', 2, 7, 82),
	(346, '2013-07-13 14:02:56', '2013-07-13 14:02:56', 2, 9, 170),
	(347, '2013-07-13 14:02:57', '2013-07-13 14:02:57', 2, 8, 84),
	(348, '2013-07-13 14:02:59', '2013-07-13 14:02:59', 2, 8, 85),
	(349, '2013-07-13 14:03:01', '2013-07-13 14:03:01', 2, 9, 171),
	(350, '2013-07-13 14:03:03', '2013-07-13 14:03:03', 2, 8, 86),
	(351, '2013-07-13 14:03:06', '2013-07-13 14:03:06', 2, 8, 87),
	(352, '2013-07-13 14:03:17', '2013-07-13 14:03:17', 2, 9, 172),
	(353, '2013-07-13 14:03:25', '2013-07-13 14:03:25', 2, 9, 173),
	(354, '2013-07-13 14:03:32', '2013-07-13 14:03:32', 2, 9, 174),
	(355, '2013-07-13 14:04:40', '2013-07-13 14:04:40', 2, 10, 175),
	(356, '2013-07-13 14:04:48', '2013-07-13 14:04:48', 2, 9, 176),
	(357, '2013-07-13 14:04:58', '2013-07-13 14:04:58', 2, 10, 177),
	(358, '2013-07-13 14:05:05', '2013-07-13 14:05:05', 2, 10, 178),
	(359, '2013-07-13 14:05:13', '2013-07-13 14:05:13', 2, 9, 179),
	(360, '2013-07-13 14:05:21', '2013-07-13 14:05:21', 2, 9, 180),
	(361, '2013-07-13 14:05:28', '2013-07-13 14:05:28', 2, 10, 181),
	(362, '2013-07-13 14:05:41', '2013-07-13 14:05:41', 2, 10, 182),
	(363, '2013-07-13 14:05:51', '2013-07-13 14:05:51', 2, 10, 183),
	(364, '2013-07-13 14:06:02', '2013-07-13 14:06:02', 2, 9, 184),
	(365, '2013-07-13 14:06:13', '2013-07-13 14:06:13', 2, 10, 185),
	(366, '2013-07-13 14:06:26', '2013-07-13 14:06:26', 2, 9, 186),
	(367, '2013-07-13 14:06:34', '2013-07-13 14:06:34', 2, 10, 187),
	(368, '2013-07-13 14:06:38', '2013-07-13 14:06:38', 2, 8, 88),
	(369, '2013-07-13 14:06:41', '2013-07-13 14:06:41', 2, 7, 89),
	(370, '2013-07-13 14:06:42', '2013-07-13 14:06:42', 2, 9, 188),
	(371, '2013-07-13 14:06:49', '2013-07-13 14:06:49', 2, 7, 91),
	(372, '2013-07-13 14:06:52', '2013-07-13 14:06:52', 2, 7, 92),
	(373, '2013-07-13 14:07:09', '2013-07-13 14:07:09', 2, 7, 93),
	(374, '2013-07-13 14:07:12', '2013-07-13 14:07:12', 2, 7, 94),
	(375, '2013-07-13 14:07:20', '2013-07-13 14:07:20', 2, 8, 96),
	(376, '2013-07-13 14:07:23', '2013-07-13 14:07:23', 2, 8, 97),
	(377, '2013-07-13 14:07:26', '2013-07-13 14:07:26', 2, 8, 98),
	(378, '2013-07-13 14:07:32', '2013-07-13 14:07:32', 2, 7, 100),
	(379, '2013-07-13 14:07:36', '2013-07-13 14:07:36', 2, 8, 101),
	(380, '2013-07-13 14:08:18', '2013-07-13 14:08:18', 2, 13, 189),
	(381, '2013-07-13 14:08:24', '2013-07-13 14:08:24', 2, 13, 190),
	(382, '2013-07-13 14:08:36', '2013-07-13 14:08:36', 2, 12, 191),
	(383, '2013-07-13 14:08:44', '2013-07-13 14:08:44', 2, 13, 192),
	(384, '2013-07-13 14:08:54', '2013-07-13 14:08:54', 2, 13, 193),
	(385, '2013-07-13 14:09:06', '2013-07-13 14:09:06', 2, 12, 194),
	(386, '2013-07-13 14:09:15', '2013-07-13 14:09:15', 2, 13, 195),
	(387, '2013-07-13 14:09:23', '2013-07-13 14:09:23', 2, 13, 196),
	(388, '2013-07-13 14:09:32', '2013-07-13 14:09:32', 2, 12, 197),
	(389, '2013-07-13 14:09:44', '2013-07-13 14:09:44', 2, 13, 198),
	(390, '2013-07-13 14:10:03', '2013-07-13 14:10:03', 2, 13, 199),
	(391, '2013-07-13 14:10:23', '2013-07-13 14:10:23', 2, 12, 200),
	(392, '2013-07-13 14:15:03', '2013-07-13 14:15:03', 2, 8, 126),
	(393, '2013-07-13 14:15:05', '2013-07-13 14:15:05', 2, 7, 124),
	(394, '2013-07-13 14:15:08', '2013-07-13 14:15:08', 2, 7, 123),
	(395, '2013-07-13 14:15:11', '2013-07-13 14:15:11', 2, 7, 122),
	(396, '2013-07-13 14:15:13', '2013-07-13 14:15:13', 2, 7, 120),
	(397, '2013-07-13 14:15:15', '2013-07-13 14:15:15', 2, 7, 118),
	(398, '2013-07-13 14:15:19', '2013-07-13 14:15:19', 2, 7, 116),
	(399, '2013-07-13 14:15:20', '2013-07-13 14:15:20', 2, 13, 221),
	(400, '2013-07-13 14:15:21', '2013-07-13 14:15:21', 2, 8, 115),
	(401, '2013-07-13 14:15:22', '2013-07-13 14:15:22', 2, 12, 220),
	(402, '2013-07-13 14:15:23', '2013-07-13 14:15:23', 2, 8, 113),
	(403, '2013-07-13 14:15:24', '2013-07-13 14:15:24', 2, 12, 219),
	(404, '2013-07-13 14:15:25', '2013-07-13 14:15:25', 2, 7, 112),
	(405, '2013-07-13 14:15:25', '2013-07-13 14:15:25', 2, 13, 218),
	(406, '2013-07-13 14:15:27', '2013-07-13 14:15:27', 2, 13, 217),
	(407, '2013-07-13 14:15:30', '2013-07-13 14:15:30', 2, 7, 111),
	(408, '2013-07-13 14:15:30', '2013-07-13 14:15:30', 2, 13, 216),
	(409, '2013-07-13 14:15:32', '2013-07-13 14:15:32', 2, 8, 109),
	(410, '2013-07-13 14:15:32', '2013-07-13 14:15:32', 2, 12, 215),
	(411, '2013-07-13 14:15:33', '2013-07-13 14:15:33', 2, 12, 214),
	(412, '2013-07-13 14:15:34', '2013-07-13 14:15:34', 2, 8, 108),
	(413, '2013-07-13 14:15:35', '2013-07-13 14:15:35', 2, 12, 213),
	(414, '2013-07-13 14:15:36', '2013-07-13 14:15:36', 2, 7, 106),
	(415, '2013-07-13 14:15:38', '2013-07-13 14:15:38', 2, 7, 105),
	(416, '2013-07-13 14:15:39', '2013-07-13 14:15:39', 2, 12, 201),
	(417, '2013-07-13 14:15:41', '2013-07-13 14:15:41', 2, 12, 202),
	(418, '2013-07-13 14:15:41', '2013-07-13 14:15:41', 2, 7, 104),
	(419, '2013-07-13 14:15:43', '2013-07-13 14:15:43', 2, 12, 203),
	(420, '2013-07-13 14:15:43', '2013-07-13 14:15:43', 2, 7, 103),
	(421, '2013-07-13 14:15:44', '2013-07-13 14:15:44', 2, 13, 204),
	(422, '2013-07-13 14:15:46', '2013-07-13 14:15:46', 2, 13, 205),
	(423, '2013-07-13 14:15:48', '2013-07-13 14:15:48', 2, 12, 206),
	(424, '2013-07-13 14:15:50', '2013-07-13 14:15:50', 2, 13, 207),
	(425, '2013-07-13 14:15:52', '2013-07-13 14:15:52', 2, 13, 208),
	(426, '2013-07-13 14:15:54', '2013-07-13 14:15:54', 2, 12, 209),
	(427, '2013-07-13 14:15:56', '2013-07-13 14:15:56', 2, 12, 210),
	(428, '2013-07-13 14:15:58', '2013-07-13 14:15:58', 2, 13, 211),
	(429, '2013-07-13 14:16:00', '2013-07-13 14:16:00', 2, 13, 212),
	(430, '2013-07-13 14:23:51', '2013-07-13 14:23:51', 2, 12, 222),
	(431, '2013-07-13 14:23:53', '2013-07-13 14:23:53', 2, 12, 223),
	(432, '2013-07-13 14:23:55', '2013-07-13 14:23:55', 2, 13, 224),
	(433, '2013-07-13 14:23:56', '2013-07-13 14:23:56', 2, 12, 225),
	(434, '2013-07-13 14:23:58', '2013-07-13 14:23:58', 2, 13, 226),
	(435, '2013-07-13 14:23:59', '2013-07-13 14:23:59', 2, 12, 227),
	(436, '2013-07-13 14:24:01', '2013-07-13 14:24:01', 2, 12, 228),
	(437, '2013-07-13 14:24:03', '2013-07-13 14:24:03', 2, 12, 229),
	(438, '2013-07-13 14:24:04', '2013-07-13 14:24:04', 2, 13, 230),
	(439, '2013-07-13 14:24:32', '2013-07-13 14:24:32', 2, 7, 134),
	(440, '2013-07-13 14:24:35', '2013-07-13 14:24:35', 2, 8, 133),
	(441, '2013-07-13 14:24:38', '2013-07-13 14:24:38', 2, 8, 132),
	(442, '2013-07-13 14:24:40', '2013-07-13 14:24:40', 2, 8, 131),
	(443, '2013-07-13 14:24:42', '2013-07-13 14:24:42', 2, 8, 130),
	(444, '2013-07-13 14:24:46', '2013-07-13 14:24:46', 2, 8, 129),
	(445, '2013-07-13 14:24:51', '2013-07-13 14:24:51', 2, 8, 128),
	(446, '2013-07-13 14:28:00', '2013-07-13 14:28:00', 2, 10, 232),
	(447, '2013-07-13 14:28:06', '2013-07-13 14:28:06', 2, 7, 135),
	(448, '2013-07-13 14:28:08', '2013-07-13 14:28:08', 2, 8, 136),
	(449, '2013-07-13 14:28:10', '2013-07-13 14:28:10', 2, 8, 137),
	(450, '2013-07-13 14:29:41', '2013-07-13 14:29:41', 2, 8, 233),
	(451, '2013-07-13 14:29:55', '2013-07-13 14:29:55', 2, 2, 234),
	(452, '2013-07-13 14:30:09', '2013-07-13 14:30:09', 2, 2, 235),
	(453, '2013-07-13 14:30:17', '2013-07-13 14:30:17', 2, 7, 236),
	(454, '2013-07-13 14:30:23', '2013-07-13 14:30:23', 2, 2, 237),
	(455, '2013-07-13 14:30:59', '2013-07-13 14:30:59', 2, 2, 238),
	(456, '2013-07-13 14:31:10', '2013-07-13 14:31:10', 2, 2, 239),
	(457, '2013-07-13 14:31:22', '2013-07-13 14:31:22', 2, 2, 240),
	(458, '2013-07-13 14:31:34', '2013-07-13 14:31:34', 2, 2, 241),
	(459, '2013-07-13 14:31:42', '2013-07-13 14:31:42', 2, 2, 242),
	(460, '2013-07-13 14:31:51', '2013-07-13 14:31:51', 2, 2, 243),
	(461, '2013-07-13 14:31:59', '2013-07-13 14:31:59', 2, 1, 244),
	(462, '2013-07-13 14:32:01', '2013-07-13 14:32:01', 2, 2, 245),
	(463, '2013-07-13 14:32:10', '2013-07-13 14:32:10', 2, 2, 246),
	(464, '2013-07-13 14:32:19', '2013-07-13 14:32:19', 2, 2, 247),
	(465, '2013-07-13 14:32:28', '2013-07-13 14:32:28', 2, 2, 248),
	(466, '2013-07-13 14:32:37', '2013-07-13 14:32:37', 2, 2, 249),
	(467, '2013-07-13 14:32:39', '2013-07-13 14:32:39', 2, 1, 250),
	(468, '2013-07-13 14:32:46', '2013-07-13 14:32:46', 2, 2, 251),
	(469, '2013-07-13 14:32:54', '2013-07-13 14:32:54', 2, 2, 252),
	(470, '2013-07-13 14:33:03', '2013-07-13 14:33:03', 2, 2, 253),
	(471, '2013-07-13 14:33:10', '2013-07-13 14:33:10', 2, 1, 254),
	(472, '2013-07-13 14:33:12', '2013-07-13 14:33:12', 2, 2, 255),
	(473, '2013-07-13 14:33:22', '2013-07-13 14:33:22', 2, 2, 256),
	(474, '2013-07-13 14:33:31', '2013-07-13 14:33:31', 2, 2, 257),
	(475, '2013-07-13 14:33:35', '2013-07-13 14:33:35', 2, 1, 258),
	(476, '2013-07-13 14:33:55', '2013-07-13 14:33:55', 2, 1, 259),
	(477, '2013-07-13 14:34:01', '2013-07-13 14:34:01', 2, 14, 260),
	(478, '2013-07-13 14:34:16', '2013-07-13 14:34:16', 2, 1, 261),
	(479, '2013-07-13 14:34:56', '2013-07-13 14:34:56', 2, 1, 262),
	(480, '2013-07-13 14:35:16', '2013-07-13 14:35:16', 2, 1, 263),
	(481, '2013-07-13 14:35:19', '2013-07-13 14:35:19', 2, 14, 264),
	(482, '2013-07-13 14:35:30', '2013-07-13 14:35:30', 2, 14, 265),
	(483, '2013-07-13 14:35:38', '2013-07-13 14:35:38', 2, 1, 266),
	(484, '2013-07-13 14:35:44', '2013-07-13 14:35:44', 2, 14, 267),
	(485, '2013-07-13 14:35:54', '2013-07-13 14:35:54', 2, 14, 268),
	(486, '2013-07-13 14:36:01', '2013-07-13 14:36:01', 2, 1, 269),
	(487, '2013-07-13 14:36:06', '2013-07-13 14:36:06', 2, 14, 270),
	(488, '2013-07-13 14:36:15', '2013-07-13 14:36:15', 2, 14, 271),
	(489, '2013-07-13 14:36:22', '2013-07-13 14:36:22', 2, 1, 272),
	(490, '2013-07-13 14:36:26', '2013-07-13 14:36:26', 2, 14, 273),
	(491, '2013-07-13 14:36:36', '2013-07-13 14:36:36', 2, 14, 274),
	(492, '2013-07-13 14:36:41', '2013-07-13 14:36:41', 2, 1, 275),
	(493, '2013-07-13 14:36:47', '2013-07-13 14:36:47', 2, 14, 276),
	(494, '2013-07-13 14:36:58', '2013-07-13 14:36:58', 2, 14, 277),
	(495, '2013-07-13 14:37:06', '2013-07-13 14:37:06', 2, 14, 278),
	(496, '2013-07-13 14:37:14', '2013-07-13 14:37:14', 2, 1, 279),
	(497, '2013-07-13 14:37:15', '2013-07-13 14:37:15', 2, 14, 280),
	(498, '2013-07-13 14:37:24', '2013-07-13 14:37:24', 2, 14, 281),
	(499, '2013-07-13 14:37:33', '2013-07-13 14:37:33', 2, 1, 282),
	(500, '2013-07-13 14:37:33', '2013-07-13 14:37:33', 2, 14, 283),
	(501, '2013-07-13 14:37:44', '2013-07-13 14:37:44', 2, 14, 284),
	(502, '2013-07-13 14:37:54', '2013-07-13 14:37:54', 2, 1, 285),
	(503, '2013-07-13 14:37:55', '2013-07-13 14:37:55', 2, 14, 286),
	(504, '2013-07-13 14:38:06', '2013-07-13 14:38:06', 2, 14, 287),
	(505, '2013-07-13 14:38:19', '2013-07-13 14:38:19', 2, 14, 288),
	(506, '2013-07-13 14:38:28', '2013-07-13 14:38:28', 2, 14, 289),
	(507, '2013-07-13 14:38:32', '2013-07-13 14:38:32', 2, 1, 290),
	(508, '2013-07-13 14:39:02', '2013-07-13 14:39:02', 2, 1, 291),
	(509, '2013-07-13 14:39:21', '2013-07-13 14:39:21', 2, 1, 292),
	(510, '2013-07-13 14:39:44', '2013-07-13 14:39:44', 2, 1, 293),
	(511, '2013-07-13 14:40:03', '2013-07-13 14:40:03', 2, 1, 294),
	(512, '2013-07-18 08:25:57', '2013-07-18 08:25:57', 2, 5, 297),
	(513, '2013-07-25 06:38:16', '2013-07-25 06:38:16', 2, 7, 298),
	(514, '2013-07-31 10:37:26', '2013-07-31 10:37:26', 2, 6, 299);
/*!40000 ALTER TABLE `rombelsiswa` ENABLE KEYS */;


-- Dumping structure for table simasad.setting
DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nama_skul` varchar(150) DEFAULT NULL,
  `alamat_skul` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.setting: ~1 rows (approximately)
DELETE FROM `setting`;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` (`id`, `created_at`, `updated_at`, `nama_skul`, `alamat_skul`) VALUES
	(1, '2013-05-28 06:26:42', '2013-05-28 06:26:44', 'SEKOLAH DASAR ISLAM SABILIL HUDA', 'Jl. Singokarso 54 Sumorame Candi Sidoarjo 61271 Telp. 031-8061169');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;


-- Dumping structure for table simasad.siswa
DROP TABLE IF EXISTS `siswa`;
CREATE TABLE IF NOT EXISTS `siswa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nisn` varchar(10) DEFAULT NULL,
  `nama` varchar(150) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'Y',
  `jenjang_spp` enum('1','2','3','4','5','6','0') DEFAULT NULL,
  `mutasi` enum('Y','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.siswa: ~339 rows (approximately)
DELETE FROM `siswa`;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` (`id`, `created_at`, `updated_at`, `nisn`, `nama`, `aktif`, `jenjang_spp`, `mutasi`) VALUES
	(1, '2013-07-05 10:56:21', '2013-07-18 08:07:17', '553', 'DEVINA PRAMAWATI', 'Y', '2', 'N'),
	(2, '2013-07-05 10:56:29', '2013-07-18 08:07:17', '501', 'Alifiah Annafisah', 'Y', '3', 'N'),
	(3, '2013-07-05 10:57:04', '2013-07-18 08:07:17', '504', 'Aulia Fitri Rachmania A.', 'Y', '', 'N'),
	(4, '2013-07-05 10:57:17', '2013-07-18 08:07:17', '546', 'ALI NUR RAMADHAN', 'Y', '2', 'N'),
	(5, '2013-07-05 10:57:55', '2013-07-18 08:07:17', '547', 'ALYRA SYAH FARHANI', 'Y', '2', 'N'),
	(6, '2013-07-05 10:58:25', '2013-07-18 08:07:17', '548', 'Andhika Ahmad Dzaky', 'Y', '2', 'N'),
	(7, '2013-07-05 10:58:52', '2013-07-18 08:07:17', '550', 'ARIEYANTO RAHMAN Y. C.', 'Y', '2', 'N'),
	(8, '2013-07-05 10:59:20', '2013-07-18 08:07:17', '551', 'AULIA PUTRI YASINTA', 'Y', '2', 'N'),
	(10, '2013-07-05 11:00:24', '2013-07-18 08:07:17', '554', 'DLIYAUL HAQQIA', 'Y', '2', 'N'),
	(11, '2013-07-05 11:00:52', '2013-07-18 08:07:17', '556', 'ERLANGGA KHARISMA W.', 'Y', '2', 'N'),
	(12, '2013-07-05 11:01:32', '2013-07-18 08:07:17', '558', 'FATHIAN AUZAIE HANZALA', 'Y', '2', 'N'),
	(13, '2013-07-05 11:03:26', '2013-07-18 08:07:18', '562', 'LAILA AL AFIFAH', 'Y', '2', 'N'),
	(14, '2013-07-05 11:03:35', '2013-07-18 08:07:18', '506', 'Daffa Amru Kurniawan', 'Y', '3', 'N'),
	(15, '2013-07-05 11:03:57', '2013-07-18 08:07:18', '564', 'M. HAFIZH ALDO ALFITO', 'Y', '2', 'N'),
	(16, '2013-07-05 11:04:26', '2013-07-18 08:07:18', '507', 'Denisa Iselina S.', 'Y', '3', 'N'),
	(17, '2013-07-05 11:04:48', '2013-07-18 08:07:18', '508', 'Dewangga Kharisma A.', 'Y', '3', 'N'),
	(19, '2013-07-05 11:05:02', '2013-07-18 08:07:18', '532', 'Firly Intan Wahyuningsih', 'Y', '3', 'N'),
	(20, '2013-07-05 11:05:14', '2013-07-18 08:07:18', '510', 'Ilham Ramadhani', 'Y', '3', 'N'),
	(21, '2013-07-05 11:05:28', '2013-07-18 08:07:18', '511', 'Intan Nur\' Aini', 'Y', '3', 'N'),
	(22, '2013-07-05 11:05:40', '2013-07-18 08:07:18', '512', 'M. Adrik Shirod Judin', 'Y', '3', 'N'),
	(24, '2013-07-05 11:05:55', '2013-07-18 08:07:18', '513', 'Moch. Rizky Aflah F.', 'Y', '3', 'N'),
	(25, '2013-07-05 11:06:06', '2013-07-18 08:07:18', '516', 'Muthmainatulia Madani', 'Y', '3', 'N'),
	(26, '2013-07-05 11:06:18', '2013-07-18 08:07:18', '517', 'Nadia Amaliani', 'Y', '3', 'N'),
	(28, '2013-07-05 11:06:30', '2013-07-18 08:07:18', '518', 'Pandhega Rafiif Harandi', 'Y', '3', 'N'),
	(29, '2013-07-05 11:06:42', '2013-07-18 08:07:18', '519', 'Putri Zahra Azri', 'Y', '3', 'N'),
	(31, '2013-07-05 11:06:55', '2013-07-18 08:07:18', '585', 'Reysa Zulfa Hidayah', 'Y', '3', 'N'),
	(32, '2013-07-05 11:07:10', '2013-07-18 08:07:18', '524', 'Sagita Tri Rahma', 'Y', '3', 'N'),
	(33, '2013-07-05 11:07:38', '2013-07-18 08:07:18', '526', 'Silvi Putri Nabila', 'Y', '3', 'N'),
	(35, '2013-07-05 11:07:54', '2013-07-18 08:07:18', '528', 'Syauqi Abdillah Rouf', 'Y', '3', 'N'),
	(36, '2013-07-05 11:08:12', '2013-07-18 08:07:18', '586', 'Umar yasin', 'Y', '3', 'N'),
	(37, '2013-07-05 11:08:24', '2013-07-18 08:07:18', '535', 'Zatayu Fajar Fadila', 'Y', '3', 'N'),
	(39, '2013-07-05 11:08:54', '2013-07-18 08:07:18', '497', 'Adinda Rahmalia Putri', 'Y', '3', 'N'),
	(40, '2013-07-05 11:09:06', '2013-07-18 08:07:18', '498', 'Ahmad Hafizh Zuhliyan H', 'Y', '3', 'N'),
	(41, '2013-07-05 11:09:16', '2013-07-18 08:07:18', '500', 'Alfan Riyanto', 'Y', '3', 'N'),
	(43, '2013-07-05 11:09:26', '2013-07-18 08:07:18', '502', 'Alkhaizaran Syafiyatuddin', 'Y', '3', 'N'),
	(44, '2013-07-05 11:09:36', '2013-07-18 08:07:18', '503', 'Arsirivanda Yulistina M.K.', 'Y', '3', 'N'),
	(49, '2013-07-05 11:13:49', '2013-07-18 08:07:18', '584', 'Arya Agung', 'Y', '3', 'N'),
	(50, '2013-07-05 11:14:00', '2013-07-18 08:07:18', '505', 'Aurel Cynthia Putri Akhsan', 'Y', '3', 'N'),
	(51, '2013-07-05 11:14:10', '2013-07-18 08:07:18', '514', 'Mohamad Rasyd Zahroni', 'Y', '3', 'N'),
	(52, '2013-07-05 11:14:13', '2013-07-18 08:07:18', '566', 'M. ZAINUL MUSTHOFA MUNJI', 'Y', '2', 'N'),
	(53, '2013-07-05 11:14:19', '2013-07-18 08:07:18', '515', 'Muhammad Rifaldi Saputra', 'Y', '3', 'N'),
	(54, '2013-07-05 11:14:32', '2013-07-18 08:07:18', '520', 'Rafli Eka Syahputra', 'Y', '3', 'N'),
	(55, '2013-07-05 11:14:53', '2013-07-18 08:07:18', '521', 'Ramadhan Maulana Yusuf', 'Y', '3', 'N'),
	(56, '2013-07-05 11:14:59', '2013-07-18 08:07:18', '568', 'MEYLANI IRFANA PUTRI', 'Y', '2', 'N'),
	(57, '2013-07-05 11:15:03', '2013-07-18 08:07:18', '522', 'Rizki Nur Ridho', 'Y', '3', 'N'),
	(58, '2013-07-05 11:15:12', '2013-07-18 08:07:18', '523', 'Sabira Nur Izza', 'Y', '3', 'N'),
	(59, '2013-07-05 11:15:23', '2013-07-18 08:07:18', '525', 'Salsabila Kurnia Syandana', 'Y', '3', 'N'),
	(60, '2013-07-05 11:15:34', '2013-07-18 08:07:19', '527', 'Syafira Dewi Nawangsari', 'Y', '3', 'N'),
	(61, '2013-07-05 11:15:40', '2013-07-18 08:07:19', '573', 'MUHAMMAD AGIL P. A.', 'Y', '2', 'N'),
	(62, '2013-07-05 11:15:44', '2013-07-18 08:07:19', '529', 'Syauqi Hadi Maulana', 'Y', '3', 'N'),
	(63, '2013-07-05 11:15:57', '2013-07-18 08:07:19', '530', 'Talitha Septya Damayanti', 'Y', '3', 'N'),
	(64, '2013-07-05 11:16:08', '2013-07-18 08:07:19', '531', 'Taufiqur Rizqi Ramadani', 'Y', '3', 'N'),
	(65, '2013-07-05 11:16:16', '2013-07-18 08:07:19', '574', 'MUHAMMAD JIHAD B. G.', 'Y', '2', 'N'),
	(66, '2013-07-05 11:16:18', '2013-07-18 08:07:19', '533', 'Wahyu Sumbaga Wiratama', 'Y', '3', 'N'),
	(67, '2013-07-05 11:16:26', '2013-07-18 08:07:19', '534', 'Widy Rahma Cahyati', 'Y', '3', 'N'),
	(68, '2013-07-05 11:16:44', '2013-07-18 08:07:19', '536', 'Zida Kamalia', 'Y', '3', 'N'),
	(69, '2013-07-05 11:17:18', '2013-07-18 08:07:19', '437', 'Abdul Haris Setya N.', 'Y', '4', 'N'),
	(70, '2013-07-05 11:17:18', '2013-07-18 08:07:19', '575', 'MUHAMMAD NAUFAL U.', 'Y', '2', 'N'),
	(71, '2013-07-05 11:17:27', '2013-07-18 08:07:19', '488', 'Achfatul Mirojiah', 'Y', '4', 'N'),
	(72, '2013-07-05 11:18:44', '2013-07-18 08:07:19', '578', 'PARAMA ZAIDAN H.', 'Y', '2', 'N'),
	(73, '2013-07-05 11:19:02', '2013-07-18 08:07:19', '438', 'Achmad Bagas Ardiansyah', 'Y', '4', 'N'),
	(74, '2013-07-05 11:19:12', '2013-07-18 08:07:19', '439', 'Agil Putra Yudanto', 'Y', '4', 'N'),
	(75, '2013-07-05 11:19:14', '2013-07-18 08:07:19', '581', 'SITI MAR\'ATUS S.', 'Y', '2', 'N'),
	(76, '2013-07-05 11:19:21', '2013-07-18 08:07:19', '441', 'Alfan Dika Prasetyo', 'Y', '4', 'N'),
	(77, '2013-07-05 11:19:31', '2013-07-18 08:07:19', '443', 'Anggita Aditya Fauzi', 'Y', '4', 'N'),
	(78, '2013-07-05 11:19:41', '2013-07-18 08:07:19', '444', 'Anisa Lita Amalia', 'Y', '4', 'N'),
	(79, '2013-07-05 11:19:47', '2013-07-18 08:07:19', '582', 'ZAKIA AZMI CAHYADEWI', 'Y', '2', 'N'),
	(80, '2013-07-05 11:19:49', '2013-07-18 08:07:19', '445', 'Arimbi B. Aritra', 'Y', '4', 'N'),
	(81, '2013-07-05 11:20:00', '2013-07-18 08:07:19', '452', 'Dita Lestari', 'Y', '4', 'N'),
	(82, '2013-07-05 11:20:10', '2013-07-18 08:07:19', '454', 'Fani Rizkia Nuraimy', 'Y', '4', 'N'),
	(83, '2013-07-05 11:20:19', '2013-07-18 08:07:19', '583', 'ZHUBA ZHAWABI AKHMAD', 'Y', '2', 'N'),
	(84, '2013-07-05 11:20:23', '2013-07-18 08:07:19', '455', 'Giovanni Arsa Maulana', 'Y', '4', 'N'),
	(85, '2013-07-05 11:20:32', '2013-07-18 08:07:19', '543', 'Indra Gosal', 'Y', '4', 'N'),
	(86, '2013-07-05 11:20:41', '2013-07-18 08:07:19', '459', 'Intan Ramadhan Putri N.R.', 'Y', '4', 'N'),
	(87, '2013-07-05 11:20:50', '2013-07-18 08:07:19', '460', 'Jarullah M. H.', 'Y', '4', 'N'),
	(88, '2013-07-05 11:21:02', '2013-07-18 08:07:19', '496', 'Ach. Hafidzurrohman', 'Y', '4', 'N'),
	(89, '2013-07-05 11:21:12', '2013-07-18 08:07:19', '467', 'M. Hanifsyah', 'Y', '4', 'N'),
	(90, '2013-07-05 11:21:15', '2013-07-18 08:07:19', '549', 'A. ANDHIKA RIZKY P. P.', 'Y', '2', 'N'),
	(91, '2013-07-05 11:21:21', '2013-07-18 08:07:19', '468', 'M. Jamaludin', 'Y', '4', 'N'),
	(92, '2013-07-05 11:21:34', '2013-07-18 08:07:19', '495', 'M. Qowwiyus Sullton', 'Y', '4', 'N'),
	(93, '2013-07-05 11:21:42', '2013-07-18 08:07:19', '476', 'Marcella Maharani Irawan', 'Y', '4', 'N'),
	(94, '2013-07-05 11:21:53', '2013-07-18 08:07:19', '480', 'Miftachul Firmansyah', 'Y', '4', 'N'),
	(95, '2013-07-05 11:21:58', '2013-07-18 08:07:19', '545', 'ACH. HASANI T. SANJANI', 'Y', '2', 'N'),
	(96, '2013-07-05 11:22:06', '2013-07-18 08:07:19', '483', 'Naufal Rafif Al Rizal', 'Y', '4', 'N'),
	(97, '2013-07-05 11:22:17', '2013-07-18 08:07:19', '486', 'Ratu Risala F.N.', 'Y', '4', 'N'),
	(98, '2013-07-05 11:22:29', '2013-07-18 08:07:20', '490', 'Salsabila Putri R.', 'Y', '4', 'N'),
	(99, '2013-07-05 11:22:35', '2013-07-18 08:07:20', '552', 'DANASTRI NAILA P. ', 'Y', '2', 'N'),
	(100, '2013-07-05 11:22:47', '2013-07-18 08:07:20', '492', 'Sulthan Rhaka Farid', 'Y', '4', 'N'),
	(101, '2013-07-05 11:22:59', '2013-07-18 08:07:20', '539', 'Syifa Andini Fatinah', 'Y', '4', 'N'),
	(102, '2013-07-05 11:23:10', '2013-07-18 08:07:20', '555', 'DZAKWAN CAECAREO M.', 'Y', '2', 'N'),
	(103, '2013-07-05 11:23:14', '2013-07-18 08:07:20', '493', 'Tiffany Naura R.D.', 'Y', '4', 'N'),
	(104, '2013-07-05 11:23:28', '2013-07-18 08:07:20', '440', 'Aisha Rahmadia Aqilah', 'Y', '4', 'N'),
	(105, '2013-07-05 11:23:48', '2013-07-18 08:07:20', '587', 'Aziyah Tsamratul Insyiroh', 'Y', '4', 'N'),
	(106, '2013-07-05 11:24:02', '2013-07-18 08:07:20', '449', 'Destri Istifani Ivanka', 'Y', '4', 'N'),
	(107, '2013-07-05 11:24:04', '2013-07-18 08:07:20', '557', 'FARIHAH LINA ROFI\'AH', 'Y', '2', 'N'),
	(108, '2013-07-05 11:24:15', '2013-07-18 08:07:20', '450', 'Devina Firda Cahyani', 'Y', '4', 'N'),
	(109, '2013-07-05 11:24:25', '2013-07-18 08:07:20', '453', 'Evelyn Agastya Intani', 'Y', '4', 'N'),
	(110, '2013-07-05 11:24:33', '2013-07-18 08:07:20', '559', 'GHEFIRA NURIZZA', 'Y', '2', 'N'),
	(111, '2013-07-05 11:24:35', '2013-07-18 08:07:20', '456', 'Hanifa Putri P.', 'Y', '4', 'N'),
	(112, '2013-07-05 11:24:44', '2013-07-18 08:07:20', '457', 'Hesha zidni Afif A.', 'Y', '4', 'N'),
	(113, '2013-07-05 11:25:00', '2013-07-18 08:07:20', '458', 'Inayatus Safina', 'Y', '4', 'N'),
	(114, '2013-07-05 11:25:03', '2013-07-18 08:07:20', '560', 'INDAH LESTARI', 'Y', '2', 'N'),
	(115, '2013-07-05 11:25:13', '2013-07-18 08:07:20', '461', 'Jasmine Malaika', 'Y', '4', 'N'),
	(116, '2013-07-05 11:25:22', '2013-07-18 08:07:20', '462', 'Jihan Ihza Nabilla', 'Y', '4', 'N'),
	(117, '2013-07-05 11:25:42', '2013-07-18 08:07:20', '561', 'JAVIN ANANTA ARDAESA', 'Y', '2', 'N'),
	(118, '2013-07-05 11:25:54', '2013-07-18 08:07:20', '463', 'Karisma Auliyah N.R.P.', 'Y', '4', 'N'),
	(119, '2013-07-05 11:26:06', '2013-07-18 08:07:20', '465', 'M. Fajar Budianto', 'Y', '', 'N'),
	(120, '2013-07-05 11:26:15', '2013-07-18 08:07:20', '466', 'M. Farich R.', 'Y', '4', 'N'),
	(121, '2013-07-05 11:26:20', '2013-07-18 08:07:20', '563', 'M.FARHAN SAPUTRA', 'Y', '2', 'N'),
	(122, '2013-07-05 11:26:26', '2013-07-18 08:07:20', '469', 'M. Lutfi Kurniawan', 'Y', '4', 'N'),
	(123, '2013-07-05 11:26:42', '2013-07-18 08:07:20', '470', 'M. Nasekh Muwaffiq', 'Y', '4', 'N'),
	(124, '2013-07-05 11:26:53', '2013-07-18 08:07:20', '471', 'M. Qois Hatta', 'Y', '4', 'N'),
	(125, '2013-07-05 11:27:03', '2013-07-18 08:07:20', '565', 'M. RAHMATULLAH KAUTSARI', 'Y', '2', 'N'),
	(126, '2013-07-05 11:27:07', '2013-07-18 08:07:20', '472', 'M. Rafli Al Hafits', 'Y', '4', 'N'),
	(128, '2013-07-05 11:28:20', '2013-07-18 08:07:20', '473', 'M. Ridho Ashari D.', 'Y', '4', 'N'),
	(129, '2013-07-05 11:28:31', '2013-07-18 08:07:20', '474', 'M. Subanul Kirom', 'Y', '4', 'N'),
	(130, '2013-07-05 11:28:43', '2013-07-18 08:07:20', '477', 'Maria Assyakira', 'Y', '4', 'N'),
	(131, '2013-07-05 11:28:54', '2013-07-18 08:07:20', '478', 'Maulana Ahmad Nur', 'Y', '4', 'N'),
	(132, '2013-07-05 11:29:05', '2013-07-18 08:07:20', '479', 'Maulana A. Sofyan H.A.F.', 'Y', '4', 'N'),
	(133, '2013-07-05 11:29:16', '2013-07-18 08:07:21', '482', 'Nabilah Aisyah P.', 'Y', '4', 'N'),
	(134, '2013-07-05 11:29:35', '2013-07-18 08:07:21', '484', 'Nurma Rahmawati E.', 'Y', '4', 'N'),
	(135, '2013-07-05 11:29:45', '2013-07-18 08:07:21', '487', 'Ridania Mawaddah', 'Y', '4', 'N'),
	(136, '2013-07-05 11:29:57', '2013-07-18 08:07:21', '491', 'Siti Aisyah Fatimah A.', 'Y', '4', 'N'),
	(137, '2013-07-05 11:30:08', '2013-07-18 08:07:21', '494', 'Zuhal Nahwan Al Azmi', 'Y', '4', 'N'),
	(138, '2013-07-05 12:03:05', '2013-07-18 08:07:21', '567', 'M. ZIDAN EKA ', 'Y', '2', 'N'),
	(139, '2013-07-05 12:03:46', '2013-07-18 08:07:21', '569', 'MIIM NABA AMAR A. H. ', 'Y', '2', 'N'),
	(140, '2013-07-05 12:04:20', '2013-07-18 08:07:21', '570', 'MIKAL ALHADIAN', 'Y', '2', 'N'),
	(141, '2013-07-05 12:05:01', '2013-07-18 08:07:21', '571', 'MOCH HISBUN NAZAR', 'Y', '2', 'N'),
	(142, '2013-07-05 12:05:45', '2013-07-18 08:07:21', '572', 'Moch. Rofiq R.', 'Y', '2', 'N'),
	(143, '2013-07-05 12:06:13', '2013-07-18 08:07:21', '576', 'MUTHIA KANAHAYA', 'Y', '2', 'N'),
	(144, '2013-07-05 12:07:05', '2013-07-18 08:07:21', '577', 'NABILA NURIL WAHDANIA', 'Y', '2', 'N'),
	(145, '2013-07-05 12:07:48', '2013-07-18 08:07:21', '579', 'RUSTAM WAHYU ANDIKA', 'Y', '2', 'N'),
	(146, '2013-07-05 12:08:24', '2013-07-18 08:07:21', '580', 'SABIQ FAWWAZ FATHONI', 'Y', '2', 'N'),
	(147, '2013-07-05 12:08:57', '2013-07-18 08:07:21', '588', 'AKIFA KINATA FITRI', 'Y', '2', 'N'),
	(148, '2013-07-05 12:11:41', '2013-07-18 08:07:21', '448', 'Ahmad Zidan F.', 'Y', '5', 'N'),
	(149, '2013-07-05 12:12:22', '2013-07-18 08:07:21', '402', 'Azza Nur Ilfana', 'Y', '5', 'N'),
	(150, '2013-07-05 12:15:49', '2013-07-18 08:07:21', '403', 'Azza Zahro', 'Y', '5', 'N'),
	(151, '2013-07-05 12:16:30', '2013-07-18 08:07:21', '404', 'Bima Kharisma', 'Y', '5', 'N'),
	(152, '2013-07-05 12:17:05', '2013-07-18 08:07:21', '405', 'Cantika Rosdiana P.', 'Y', '5', 'N'),
	(153, '2013-07-05 12:17:46', '2013-07-18 08:07:21', '406', 'Chiara Fuadiatul A.', 'Y', '5', 'N'),
	(154, '2013-07-05 12:18:19', '2013-07-18 08:07:21', '431', 'Hurum Azzahra A.', 'Y', '5', 'N'),
	(155, '2013-07-05 12:19:01', '2013-07-18 08:07:21', '413', 'Jasmine Aisha A.', 'Y', '5', 'N'),
	(156, '2013-07-05 12:19:33', '2013-07-18 08:07:21', '414', 'Lutfiah Sobikhah Y.', 'Y', '5', 'N'),
	(157, '2013-07-05 12:20:09', '2013-07-18 08:07:21', '420', 'M. Agus Rangga P.', 'Y', '5', 'N'),
	(158, '2013-07-05 12:20:59', '2013-07-18 08:07:21', '416', 'M. Fajar Bahrul Ilmi D.', 'Y', '5', 'N'),
	(159, '2013-07-05 12:21:29', '2013-07-18 08:07:21', '393', 'M. Ulin Nuha', 'Y', '5', 'N'),
	(160, '2013-07-05 12:22:16', '2013-07-18 08:07:21', '417', 'Muchammad Yusuf', 'Y', '5', 'N'),
	(161, '2013-07-05 12:22:48', '2013-07-18 08:07:21', '422', 'Nandini Nayfa Ufairoh', 'Y', '5', 'N'),
	(162, '2013-07-05 12:23:36', '2013-07-18 08:07:21', '424', 'Nabila Adien Nirwasih', 'Y', '5', 'N'),
	(163, '2013-07-05 12:24:16', '2013-07-18 08:07:21', '426', 'Nia Silverish Chrysanti', 'Y', '5', 'N'),
	(164, '2013-07-05 12:25:01', '2013-07-18 08:07:21', '540', 'Nila Rahmasari', 'Y', '5', 'N'),
	(165, '2013-07-05 12:25:32', '2013-07-18 08:07:21', '428', 'Nooraini Fajri R. H.', 'Y', '5', 'N'),
	(166, '2013-07-05 12:26:29', '2013-07-18 08:07:21', '430', 'Refin Fajrulfalah', 'Y', '5', 'N'),
	(167, '2013-07-05 12:27:07', '2013-07-18 08:07:22', '432', 'Sam Ahmad Athfar D.', 'Y', '5', 'N'),
	(168, '2013-07-05 12:27:34', '2013-07-18 08:07:22', '434', 'Septian Dwi Prasetyo', 'Y', '5', 'N'),
	(169, '2013-07-05 12:28:06', '2013-07-18 08:07:22', '397', 'Achmad Alawy', 'Y', '5', 'N'),
	(170, '2013-07-05 12:28:37', '2013-07-18 08:07:22', '399', 'Akhroja Lailiyah', 'Y', '5', 'N'),
	(171, '2013-07-05 12:29:31', '2013-07-18 08:07:22', '400', 'Anisah Salsabila I.', 'Y', '5', 'N'),
	(172, '2013-07-05 12:30:05', '2013-07-18 08:07:22', '401', 'A\'thy Ia\'nati', 'Y', '5', 'N'),
	(173, '2013-07-05 12:30:34', '2013-07-18 08:07:22', '398', 'A. Zidni Fadlah', 'Y', '5', 'N'),
	(174, '2013-07-05 12:31:01', '2013-07-18 08:07:22', '407', 'Diniarti Dwi M.', 'Y', '5', 'N'),
	(175, '2013-07-05 12:31:55', '2013-07-18 08:07:22', '408', 'Fachriyatul Fitria', 'Y', '5', 'N'),
	(176, '2013-07-05 12:39:12', '2013-07-18 08:07:22', '410', 'Firnanda Nur R. H.', 'Y', '5', 'N'),
	(177, '2013-07-05 12:39:39', '2013-07-18 08:07:22', '411', 'Hakeem Abdurrasyid', 'Y', '5', 'N'),
	(178, '2013-07-05 12:40:08', '2013-07-18 08:07:22', '415', 'M. Haris Hariyanto', 'Y', '5', 'N'),
	(179, '2013-07-05 12:40:43', '2013-07-18 08:07:22', '412', 'Ilham Adi Permono', 'Y', '5', 'N'),
	(180, '2013-07-05 12:41:26', '2013-07-18 08:07:22', '419', 'M. Esak Muhandis', 'Y', '5', 'N'),
	(181, '2013-07-05 12:41:52', '2013-07-18 08:07:22', '421', 'M. Febriansyah', 'Y', '5', 'N'),
	(182, '2013-07-05 12:42:18', '2013-07-18 08:07:22', '423', 'Nabila Syafa Rofiah', 'Y', '5', 'N'),
	(183, '2013-07-05 12:42:52', '2013-07-18 08:07:22', '425', 'Nisfatur Adiningrum', 'Y', '5', 'N'),
	(184, '2013-07-05 12:43:23', '2013-07-18 08:07:22', '427', 'Nihayatul Husnah A.', 'Y', '5', 'N'),
	(185, '2013-07-05 12:43:51', '2013-07-18 08:07:22', '429', 'Nurarryn Imroatul K.', 'Y', '5', 'N'),
	(186, '2013-07-05 12:44:18', '2013-07-18 08:07:22', '394', 'Rio Hendrawan', 'Y', '5', 'N'),
	(187, '2013-07-05 12:44:42', '2013-07-18 08:07:22', '433', 'Selvia Umi Muhlisoh', 'Y', '5', 'N'),
	(188, '2013-07-05 12:45:12', '2013-07-18 08:07:22', '435', 'Syalma Putri Adiguna', 'Y', '5', 'N'),
	(189, '2013-07-05 12:46:01', '2013-07-18 08:07:22', '388', 'Adisa Ayu Prasandya', 'Y', '6', 'N'),
	(190, '2013-07-05 12:46:49', '2013-07-18 08:07:22', '337', 'Adhelia Novia N.', 'Y', '6', 'N'),
	(191, '2013-07-05 12:46:52', '2013-07-18 08:07:22', '360', 'Afro\' Anzali Nurizzati A.', 'Y', '6', 'N'),
	(192, '2013-07-05 12:47:05', '2013-07-18 08:07:22', '371', 'Afifah Nurulia Agatha', 'Y', '6', 'N'),
	(193, '2013-07-05 12:47:16', '2013-07-18 08:07:22', '390', 'Aulia Hatra Aditya', 'Y', '6', 'N'),
	(194, '2013-07-05 12:47:20', '2013-07-18 08:07:22', '392', 'Alvina Berliani G.', 'Y', '6', 'N'),
	(195, '2013-07-05 12:47:27', '2013-07-18 08:07:22', '378', 'Dito Pratama', 'Y', '6', 'N'),
	(196, '2013-07-05 12:47:36', '2013-07-18 08:07:22', '368', 'Erlangga Dwi Yoga B.R.', 'Y', '6', 'N'),
	(197, '2013-07-05 12:47:46', '2013-07-18 08:07:22', '541', 'Arasy Azka', 'Y', '6', 'N'),
	(198, '2013-07-05 12:47:47', '2013-07-18 08:07:22', '350', 'Hanidah Aulia Nurfiani', 'Y', '6', 'N'),
	(199, '2013-07-05 12:48:01', '2013-07-18 08:07:22', '357', 'Izza Alwy Ika Putri', 'Y', '6', 'N'),
	(200, '2013-07-05 12:48:16', '2013-07-18 08:07:22', '389', 'Kevin Apta Ramadhan', 'Y', '6', 'N'),
	(201, '2013-07-05 12:48:28', '2013-07-18 08:07:22', '377', 'Khoiriah Alfissahroh', 'Y', '6', 'N'),
	(202, '2013-07-05 12:48:30', '2013-07-18 08:07:22', '537', 'Arsyfian Khasa aditya', 'Y', '6', 'N'),
	(203, '2013-07-05 12:48:39', '2013-07-18 08:07:22', '387', 'Khoirun Nisa\'', 'Y', '6', 'N'),
	(204, '2013-07-05 12:48:49', '2013-07-18 08:07:22', '386', 'Limagtu Riski W.', 'Y', '6', 'N'),
	(205, '2013-07-05 12:48:58', '2013-07-18 08:07:23', '356', 'Bagus Ido Laksono', 'Y', '6', 'N'),
	(206, '2013-07-05 12:49:00', '2013-07-18 08:07:23', '362', 'M. Ardhiansya ', 'Y', '6', 'N'),
	(207, '2013-07-05 12:49:12', '2013-07-18 08:07:23', '367', 'M. Firnanda Hidayat', 'Y', '6', 'N'),
	(208, '2013-07-05 12:49:24', '2013-07-18 08:07:23', '383', 'M. Haidar Arya M.', 'Y', '6', 'N'),
	(209, '2013-07-05 12:49:40', '2013-07-18 08:07:23', '338', 'Evanie Zahirah B.', 'Y', '6', 'N'),
	(210, '2013-07-05 12:50:18', '2013-07-18 08:07:23', '351', 'Faiqah Caecaria Merin I.', 'Y', '6', 'N'),
	(211, '2013-07-05 12:50:45', '2013-07-18 08:07:23', '385', 'M. Risky Dwi Septian', 'Y', '6', 'N'),
	(212, '2013-07-05 12:50:55', '2013-07-18 08:07:23', '353', 'Gilang Akbar F.', 'Y', '6', 'N'),
	(213, '2013-07-05 12:50:57', '2013-07-18 08:07:23', '370', 'Putri Fatimatuh Zahro', 'Y', '6', 'N'),
	(214, '2013-07-05 12:51:06', '2013-07-18 08:07:23', '344', 'Raihanah Qotrun Nada', 'Y', '6', 'N'),
	(215, '2013-07-05 12:51:18', '2013-07-18 08:07:23', '346', 'Haikal Wardhana P.', 'Y', '6', 'N'),
	(216, '2013-07-05 12:51:34', '2013-07-18 08:07:23', '340', 'Reva Rahma Maulidah', 'Y', '6', 'N'),
	(217, '2013-07-05 12:51:43', '2013-07-18 08:07:23', '376', 'Risa Yuliana Lestari', 'Y', '6', 'N'),
	(218, '2013-07-05 12:51:47', '2013-07-18 08:07:23', '395', 'Hikmah Dwi Fatmawati', 'Y', '6', 'N'),
	(219, '2013-07-05 12:51:55', '2013-07-18 08:07:23', '382', 'Salsabila Qotrun Nada', 'Y', '6', 'N'),
	(220, '2013-07-05 12:52:07', '2013-07-18 08:07:23', '372', 'Wildan Kamal Alam', 'Y', '6', 'N'),
	(221, '2013-07-05 12:52:11', '2013-07-18 08:07:23', '352', 'Ika Nur Safrilianti', 'Y', '6', 'N'),
	(222, '2013-07-05 12:52:41', '2013-07-18 08:07:24', '358', 'Intan Firdausi Nuzula', 'Y', '6', 'N'),
	(223, '2013-07-05 12:53:08', '2013-07-18 08:07:24', '348', 'Juan Mega Avicenna', 'Y', '6', 'N'),
	(224, '2013-07-05 12:53:33', '2013-07-18 08:07:24', '361', 'Julia Rahmita Yanti', 'Y', '6', 'N'),
	(225, '2013-07-05 12:54:14', '2013-07-18 08:07:24', '341', 'M. Bahrudin Rizal', 'Y', '6', 'N'),
	(226, '2013-07-05 12:54:37', '2013-07-18 08:07:24', '345', 'Malik Abdullah', 'Y', '6', 'N'),
	(227, '2013-07-05 12:55:59', '2013-07-18 08:07:24', '391', 'Nita Yuanita', 'Y', '6', 'N'),
	(228, '2013-07-05 12:56:23', '2013-07-18 08:07:24', '339', 'Rifki Haris Setiantyo', 'Y', '6', 'N'),
	(229, '2013-07-05 12:56:49', '2013-07-18 08:07:24', '355', 'Samudra Al-Akbar A. P.', 'Y', '6', 'N'),
	(230, '2013-07-05 12:57:32', '2013-07-18 08:07:24', '359', 'Zarwandah Asfarani', 'Y', '6', 'N'),
	(231, '2013-07-13 13:54:40', '2013-07-18 08:07:24', '651', 'RIYAN DWI SAPUTRA', 'Y', '', 'N'),
	(232, '2013-07-13 14:28:00', '2013-07-18 08:07:24', '649', 'ALISYA SANDINA KRISHANDINI', 'Y', '5', 'N'),
	(233, '2013-07-13 14:29:41', '2013-07-18 08:07:24', '650', 'IRVAN PUTRA', 'Y', '4', 'N'),
	(234, '2013-07-13 14:29:55', '2013-07-18 08:07:24', '589', 'ADHYASTA MAULANA INDRA', 'Y', '1', 'N'),
	(235, '2013-07-13 14:30:09', '2013-07-18 08:07:24', '590', 'AHMAD ANWAR ZAKKI', 'Y', '1', 'N'),
	(236, '2013-07-13 14:30:17', '2013-07-18 08:07:24', '652', 'VERANTI D.N', 'Y', '4', 'N'),
	(237, '2013-07-13 14:30:23', '2013-07-18 08:07:24', '591', 'AHMAD JAUHARUL JAVIER', 'Y', '1', 'N'),
	(238, '2013-07-13 14:30:59', '2013-07-18 08:07:24', '602', 'AZZAHRA KAMILA AUDINA', 'Y', '1', 'N'),
	(239, '2013-07-13 14:31:10', '2013-07-18 08:07:24', '603', 'BAGUS FEBRIANSYA', 'Y', '1', 'N'),
	(240, '2013-07-13 14:31:22', '2013-07-18 08:07:24', '604', 'CINTA AUGHISTA PUTRI ARIA', 'Y', '1', 'N'),
	(241, '2013-07-13 14:31:34', '2013-07-18 08:07:24', '599', 'ASYRAF HIDAYATULLAH', 'Y', '1', 'N'),
	(242, '2013-07-13 14:31:42', '2013-07-18 08:07:24', '609', 'FARHANUGH MAULAN', 'Y', '1', 'N'),
	(243, '2013-07-13 14:31:51', '2013-07-18 08:07:24', '614', 'GALVIN RASYAD MIRWANSYAH', 'Y', '1', 'N'),
	(244, '2013-07-13 14:31:59', '2013-07-18 08:07:24', '592', 'AHMAD REZA GUSTAFO', 'Y', '1', 'N'),
	(245, '2013-07-13 14:32:01', '2013-07-18 08:07:24', '617', 'INTAN CAHYA CINTA SATRIANI', 'Y', '1', 'N'),
	(246, '2013-07-13 14:32:10', '2013-07-18 08:07:24', '620', 'M. JALALUDDIN AR RUMI', 'Y', '1', 'N'),
	(247, '2013-07-13 14:32:19', '2013-07-18 08:07:24', '621', 'M. ZUHDAN AL FIKRI', 'Y', '1', 'N'),
	(248, '2013-07-13 14:32:28', '2013-07-18 08:07:24', '632', 'MUHAMMAD ZIDANE HABIBURRAHMAN', 'Y', '1', 'N'),
	(249, '2013-07-13 14:32:37', '2013-07-18 08:07:24', '633', 'MUHAMMAD ZIDANE VICTORIAL ANANTO', 'Y', '1', 'N'),
	(250, '2013-07-13 14:32:39', '2013-07-18 08:07:24', '593', 'ALDHAN DENDRA SHAFIANSYAH WIDODO', 'Y', '1', 'N'),
	(251, '2013-07-13 14:32:46', '2013-07-18 08:07:24', '638', 'R. MUHAMMAD BARIQ ATA AMBARA', 'Y', '1', 'N'),
	(252, '2013-07-13 14:32:54', '2013-07-18 08:07:24', '639', 'SALSABIL FAUZIAH ALIYAH', 'Y', '1', 'N'),
	(253, '2013-07-13 14:33:03', '2013-07-18 08:07:24', '640', 'SALSABILA DEWI AGUSTIN', 'Y', '1', 'N'),
	(254, '2013-07-13 14:33:10', '2013-07-18 08:07:24', '596', 'ANTON SUGIOK', 'Y', '1', 'N'),
	(255, '2013-07-13 14:33:12', '2013-07-18 08:07:24', '643', 'SURYA DEWANTARA', 'Y', '1', 'N'),
	(256, '2013-07-13 14:33:22', '2013-07-18 08:07:24', '646', 'CINTA AUGHISTA PUTRI ARIA', 'Y', '1', 'N'),
	(257, '2013-07-13 14:33:31', '2013-07-18 08:07:24', '648', 'ZUHAIRA NAILAL HUSNA', 'Y', '1', 'N'),
	(258, '2013-07-13 14:33:35', '2013-07-18 08:07:24', '600', 'AULIA NASYA DEVINA', 'Y', '1', 'N'),
	(259, '2013-07-13 14:33:55', '2013-07-18 08:07:24', '601', 'AULIA SYIFA\' NUR RASYA', 'Y', '1', 'N'),
	(260, '2013-07-13 14:34:01', '2013-07-18 08:07:24', '597', 'ARRAYYAN GUSTINO ZHAFIR', 'Y', '1', 'N'),
	(261, '2013-07-13 14:34:16', '2013-07-18 08:07:24', '606', 'EDLYN MARDIANSYAH AKHMAD', 'Y', '1', 'N'),
	(262, '2013-07-13 14:34:56', '2013-07-18 08:07:24', '608', 'FAJRIYAH NAJWA PRAYUGI MA\'ARIF', 'Y', '1', 'N'),
	(263, '2013-07-13 14:35:16', '2013-07-18 08:07:25', '611', 'FIQIH FIRMANSYAH SYAIFULLAH', 'Y', '1', 'N'),
	(264, '2013-07-13 14:35:19', '2013-07-18 08:07:25', '594', 'ALIQA KHUMAERA FAJR', 'Y', '1', 'N'),
	(265, '2013-07-13 14:35:30', '2013-07-18 08:07:25', '595', 'ANNISA SITI FAIZATUS ZAHRANI SYAFIQ', 'Y', '1', 'N'),
	(266, '2013-07-13 14:35:38', '2013-07-18 08:07:25', '613', 'GALLANT BAHARUDDIN AHMAD', 'Y', '1', 'N'),
	(267, '2013-07-13 14:35:44', '2013-07-18 08:07:25', '598', 'ARYO SIGIT NUGROHO ABDUL FATTAN', 'Y', '1', 'N'),
	(268, '2013-07-13 14:35:54', '2013-07-18 08:07:25', '605', 'DINDA FATIMAH AZ ZAHRO', 'Y', '1', 'N'),
	(269, '2013-07-13 14:36:01', '2013-07-18 08:07:25', '618', 'LAZUARDIA SHOVYHADI AZ-ZAHRA', 'Y', '1', 'N'),
	(270, '2013-07-13 14:36:06', '2013-07-18 08:07:25', '607', 'EKA PUTRA ISWADI WICAHYO', 'Y', '1', 'N'),
	(271, '2013-07-13 14:36:15', '2013-07-18 08:07:25', '610', 'FARIS SYAUMI MAULANA', 'Y', '1', 'N'),
	(272, '2013-07-13 14:36:22', '2013-07-18 08:07:25', '625', 'MOCHAMMAD SATRIYO WARDHANA', 'Y', '1', 'N'),
	(273, '2013-07-13 14:36:26', '2013-07-18 08:07:25', '612', 'FITA FARAH AL ADIBA', 'Y', '1', 'N'),
	(274, '2013-07-13 14:36:36', '2013-07-18 08:07:25', '615', 'HAIDAR KAYYIS ABDI FADILA', 'Y', '1', 'N'),
	(275, '2013-07-13 14:36:41', '2013-07-18 08:07:25', '626', 'MUHAMMAD AHNAF', 'Y', '1', 'N'),
	(276, '2013-07-13 14:36:47', '2013-07-18 08:07:25', '616', 'HANIYAH AISYAH MULIA', 'Y', '1', 'N'),
	(277, '2013-07-13 14:36:58', '2013-07-18 08:07:25', '619', 'LINTANG FAHRIYAH ARTANTI', 'Y', '1', 'N'),
	(278, '2013-07-13 14:37:06', '2013-07-18 08:07:25', '622', 'MARITZA SALWA AZZAHRA', 'Y', '1', 'N'),
	(279, '2013-07-13 14:37:14', '2013-07-18 08:07:25', '627', 'MUHAMMAD AKMAL', 'Y', '1', 'N'),
	(280, '2013-07-13 14:37:15', '2013-07-18 08:07:25', '623', 'MOCH. FIRMAN MAULANA SYAMSA', 'Y', '1', 'N'),
	(281, '2013-07-13 14:37:24', '2013-07-18 08:07:25', '624', 'MOCHAMMAD AKBAR RAHIMAL IBAD', 'Y', '1', 'N'),
	(282, '2013-07-13 14:37:33', '2013-07-18 08:07:25', '630', 'MUHAMMAD GATTAN SHOLAHUDDIN', 'Y', '1', 'N'),
	(283, '2013-07-13 14:37:33', '2013-07-18 08:07:25', '628', 'MUHAMMAD ATHA RAFIANSYAH', 'Y', '1', 'N'),
	(284, '2013-07-13 14:37:44', '2013-07-18 08:07:25', '629', 'MUHAMMAD FAHMI FAKHRI', 'Y', '1', 'N'),
	(285, '2013-07-13 14:37:54', '2013-07-18 08:07:25', '631', 'MUHAMMAD ROSHIV JIHANY', 'Y', '1', 'N'),
	(286, '2013-07-13 14:37:55', '2013-07-18 08:07:25', '636', 'NAURAH NAVALIA IZZATUL WAFIRAH', 'Y', '1', 'N'),
	(287, '2013-07-13 14:38:06', '2013-07-18 08:07:25', '641', 'SASKARA MARSHAL ENGGAL MAPASHA', 'Y', '1', 'N'),
	(288, '2013-07-13 14:38:19', '2013-07-18 08:07:25', '644', 'SYIFA ROHMA YUWANA', 'Y', '1', 'N'),
	(289, '2013-07-13 14:38:28', '2013-07-18 08:07:25', '645', 'VIRZAHARA', 'Y', '1', 'N'),
	(290, '2013-07-13 14:38:32', '2013-07-18 08:07:25', '634', 'MUTIARA CAHYA KASIH SATRIANI', 'Y', '1', 'N'),
	(291, '2013-07-13 14:39:02', '2013-07-18 08:07:25', '635', 'NAFISA CESVA SASIKIRANA', 'Y', '1', 'N'),
	(292, '2013-07-13 14:39:21', '2013-07-18 08:07:25', '637', 'PASHA NAQIYA ZULFA', 'Y', '1', 'N'),
	(293, '2013-07-13 14:39:44', '2013-07-18 08:07:25', '642', 'SHAFIYYAH SALSABILA', 'Y', '1', 'N'),
	(294, '2013-07-13 14:40:03', '2013-07-18 08:07:25', '647', 'ZAMZARA BALQIST', 'Y', '1', 'N'),
	(297, '2013-07-18 08:25:57', '2013-07-18 08:25:57', '700', 'Hermawan Kertajaya', 'Y', '1', 'Y'),
	(298, '2013-07-25 06:38:16', '2013-07-25 06:38:16', '702', 'Rohingnya', 'Y', '1', 'Y'),
	(299, '2013-07-31 10:37:26', '2013-07-31 10:37:26', '705', 'Roberto Carlos Mancini Subroto', 'Y', '1', 'Y');
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;


-- Dumping structure for table simasad.tahunajaran
DROP TABLE IF EXISTS `tahunajaran`;
CREATE TABLE IF NOT EXISTS `tahunajaran` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT 'N',
  `posisi` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.tahunajaran: ~2 rows (approximately)
DELETE FROM `tahunajaran`;
/*!40000 ALTER TABLE `tahunajaran` DISABLE KEYS */;
INSERT INTO `tahunajaran` (`id`, `created_at`, `updated_at`, `nama`, `aktif`, `posisi`) VALUES
	(1, '2013-07-05 10:13:36', '2013-07-13 13:23:20', '2012 / 2013', 'N', 1),
	(2, '2013-07-05 10:38:19', '2013-07-13 13:23:20', '2013 / 2014', 'Y', 2);
/*!40000 ALTER TABLE `tahunajaran` ENABLE KEYS */;


-- Dumping structure for table simasad.target_bulanan
DROP TABLE IF EXISTS `target_bulanan`;
CREATE TABLE IF NOT EXISTS `target_bulanan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tahunajaran_id` int(10) DEFAULT NULL,
  `jenisbiaya_id` int(10) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__tahunajaran_target` (`tahunajaran_id`),
  KEY `FK__jenisbiaya_target` (`jenisbiaya_id`),
  CONSTRAINT `FK__jenisbiaya_target` FOREIGN KEY (`jenisbiaya_id`) REFERENCES `jenisbiaya` (`id`),
  CONSTRAINT `FK__tahunajaran_target` FOREIGN KEY (`tahunajaran_id`) REFERENCES `tahunajaran` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.target_bulanan: ~2 rows (approximately)
DELETE FROM `target_bulanan`;
/*!40000 ALTER TABLE `target_bulanan` DISABLE KEYS */;
INSERT INTO `target_bulanan` (`id`, `created_at`, `updated_at`, `tahunajaran_id`, `jenisbiaya_id`, `jumlah`) VALUES
	(1, '2013-07-10 12:50:09', '2013-07-28 22:15:24', 1, 1, 30500000),
	(2, '2013-07-10 12:50:16', '2013-07-10 12:50:16', 2, 1, 32600000);
/*!40000 ALTER TABLE `target_bulanan` ENABLE KEYS */;


-- Dumping structure for table simasad.target_pencapaian
DROP TABLE IF EXISTS `target_pencapaian`;
CREATE TABLE IF NOT EXISTS `target_pencapaian` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tahunajaran_id` int(10) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.target_pencapaian: ~1 rows (approximately)
DELETE FROM `target_pencapaian`;
/*!40000 ALTER TABLE `target_pencapaian` DISABLE KEYS */;
INSERT INTO `target_pencapaian` (`id`, `created_at`, `updated_at`, `tahunajaran_id`, `jumlah`) VALUES
	(1, '2013-07-09 12:21:04', '2013-07-09 12:21:04', 1, 1000000);
/*!40000 ALTER TABLE `target_pencapaian` ENABLE KEYS */;


-- Dumping structure for table simasad.transmasuk
DROP TABLE IF EXISTS `transmasuk`;
CREATE TABLE IF NOT EXISTS `transmasuk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `tahunajaran_id` int(10) DEFAULT NULL,
  `siswa_id` int(10) DEFAULT NULL,
  `arus` enum('M','K') DEFAULT 'M',
  `total` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_transmasuk_tahunajaran` (`tahunajaran_id`),
  KEY `FK_transmasuk_siswa` (`siswa_id`),
  CONSTRAINT `FK_transmasuk_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  CONSTRAINT `FK_transmasuk_tahunajaran` FOREIGN KEY (`tahunajaran_id`) REFERENCES `tahunajaran` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.transmasuk: ~65 rows (approximately)
DELETE FROM `transmasuk`;
/*!40000 ALTER TABLE `transmasuk` DISABLE KEYS */;
INSERT INTO `transmasuk` (`id`, `created_at`, `updated_at`, `tanggal`, `tahunajaran_id`, `siswa_id`, `arus`, `total`) VALUES
	(9, '2013-07-18 15:46:27', '2013-07-18 15:46:27', '2013-06-19', 2, 198, 'M', 140000),
	(10, '2013-07-18 15:46:36', '2013-07-18 15:46:36', '2013-06-19', 2, 210, 'M', 140000),
	(11, '2013-07-18 15:46:43', '2013-07-18 15:46:43', '2013-07-18', 2, 221, 'M', 140000),
	(12, '2013-07-18 15:46:51', '2013-07-18 15:46:51', '2013-07-18', 2, 212, 'M', 140000),
	(13, '2013-07-18 15:47:03', '2013-07-18 15:47:03', '2013-07-18', 2, 229, 'M', 140000),
	(14, '2013-07-18 15:47:10', '2013-07-18 15:47:10', '2013-07-18', 2, 205, 'M', 140000),
	(15, '2013-07-18 15:47:18', '2013-07-18 15:47:18', '2013-07-18', 2, 199, 'M', 140000),
	(16, '2013-07-18 15:47:27', '2013-07-18 15:47:27', '2013-07-18', 2, 222, 'M', 140000),
	(17, '2013-07-18 15:47:34', '2013-07-18 15:47:34', '2013-07-18', 2, 230, 'M', 140000),
	(18, '2013-07-18 15:47:43', '2013-07-18 15:47:43', '2013-07-18', 2, 191, 'M', 140000),
	(20, '2013-07-18 15:48:41', '2013-07-18 15:48:41', '2013-07-18', 2, 224, 'M', 140000),
	(21, '2013-07-18 15:48:59', '2013-07-18 15:48:59', '2013-07-18', 2, 207, 'M', 140000),
	(22, '2013-07-18 15:49:09', '2013-07-18 15:49:09', '2013-07-18', 2, 196, 'M', 140000),
	(23, '2013-07-18 15:49:17', '2013-07-18 15:49:17', '2013-07-18', 2, 114, 'M', 230000),
	(24, '2013-07-18 15:49:25', '2013-07-18 15:49:25', '2013-07-18', 2, 117, 'M', 230000),
	(25, '2013-07-18 15:49:35', '2013-07-18 15:49:35', '2013-07-18', 2, 13, 'M', 230000),
	(26, '2013-07-18 15:49:44', '2013-07-18 15:49:44', '2013-07-18', 2, 52, 'M', 230000),
	(27, '2013-07-18 15:49:52', '2013-07-18 15:49:52', '2013-07-18', 2, 138, 'M', 230000),
	(28, '2013-07-18 15:49:59', '2013-07-18 15:49:59', '2013-07-18', 2, 56, 'M', 230000),
	(29, '2013-07-18 15:50:14', '2013-07-18 15:50:14', '2013-07-18', 2, 139, 'M', 230000),
	(30, '2013-07-18 15:50:32', '2013-07-18 15:50:32', '2013-07-18', 2, 140, 'M', 230000),
	(31, '2013-07-18 15:50:45', '2013-07-18 15:50:45', '2013-07-18', 2, 141, 'M', 230000),
	(32, '2013-07-18 15:50:54', '2013-07-18 15:50:54', '2013-07-18', 2, 258, 'M', 230000),
	(33, '2013-07-18 15:51:03', '2013-07-18 15:51:03', '2013-07-18', 2, 259, 'M', 230000),
	(34, '2013-07-18 15:51:12', '2013-07-18 15:51:12', '2013-07-18', 2, 238, 'M', 230000),
	(35, '2013-07-18 15:51:20', '2013-07-18 15:51:20', '2013-07-18', 2, 239, 'M', 230000),
	(36, '2013-07-18 15:51:28', '2013-07-18 15:51:28', '2013-07-18', 2, 240, 'M', 230000),
	(37, '2013-07-18 15:51:36', '2013-07-18 15:51:36', '2013-07-18', 2, 268, 'M', 230000),
	(38, '2013-07-18 15:51:44', '2013-07-18 15:51:44', '2013-07-18', 2, 261, 'M', 230000),
	(39, '2013-07-19 09:30:45', '2013-07-19 09:30:45', '2013-07-19', 2, 183, 'M', 70000),
	(40, '2013-07-19 09:31:10', '2013-07-19 09:31:10', '2013-07-19', 2, 226, 'M', 70000),
	(41, '2013-07-19 09:31:20', '2013-07-19 09:31:20', '2013-07-19', 2, 198, 'M', 140000),
	(42, '2013-07-19 09:31:30', '2013-07-19 09:31:30', '2013-07-19', 2, 210, 'M', 140000),
	(43, '2013-07-19 09:31:38', '2013-07-19 09:31:38', '2013-07-19', 2, 221, 'M', 140000),
	(44, '2013-07-19 09:31:47', '2013-07-19 09:31:47', '2013-07-19', 2, 212, 'M', 140000),
	(45, '2013-07-22 13:20:25', '2013-07-22 13:20:25', '2013-07-22', 2, 198, 'M', 420000),
	(46, '2013-07-22 13:23:32', '2013-07-22 13:23:32', '2013-07-22', 2, 196, 'M', 140000),
	(47, '2013-07-24 15:07:53', '2013-07-24 15:07:53', '2013-07-24', 2, 81, 'M', 105000),
	(48, '2013-07-25 10:14:54', '2013-07-25 10:14:54', '2013-07-25', 2, 131, 'M', 140000),
	(49, '2013-07-25 10:15:03', '2013-07-25 10:15:03', '2013-07-25', 2, 132, 'M', 140000),
	(50, '2013-07-25 10:15:14', '2013-07-25 10:15:14', '2013-07-25', 2, 94, 'M', 140000),
	(51, '2013-07-25 10:15:46', '2013-07-25 10:15:46', '2013-07-25', 2, 133, 'M', 140000),
	(52, '2013-07-26 13:35:39', '2013-07-26 13:35:39', '2013-07-26', 2, NULL, 'M', NULL),
	(53, '2013-07-28 13:15:42', '2013-07-28 13:15:42', '2013-07-28', 2, 183, 'M', 26000),
	(54, '2013-07-28 13:19:17', '2013-07-28 13:19:17', '2013-07-28', 2, NULL, 'K', NULL),
	(55, '2013-07-28 13:19:37', '2013-07-28 13:19:37', '2013-07-28', 2, NULL, 'K', NULL),
	(56, '2013-08-03 05:41:38', '2013-08-03 05:41:38', '2013-08-03', 2, 198, 'M', 140000),
	(57, '2013-08-03 05:58:12', '2013-08-03 05:58:12', '2013-08-03', 2, 178, 'M', 140000),
	(67, '2013-08-03 06:37:35', '2013-08-03 06:37:35', '2013-08-03', 2, 160, 'M', 140000),
	(68, '2013-08-03 06:39:33', '2013-08-03 06:39:33', '2013-08-03', 2, 179, 'M', 140000),
	(69, '2013-08-03 06:40:35', '2013-08-03 06:40:35', '2013-08-03', 2, 178, 'M', 140000),
	(70, '2013-08-03 06:41:03', '2013-08-03 06:41:03', '2013-08-03', 2, 179, 'M', 140000),
	(71, '2013-08-03 06:42:41', '2013-08-03 06:42:41', '2013-08-03', 2, 181, 'M', 140000),
	(72, '2013-08-03 06:50:03', '2013-08-03 06:50:03', '2013-08-03', 2, 177, 'M', 140000),
	(73, '2013-08-03 06:53:52', '2013-08-03 06:53:52', '2013-08-03', 2, 180, 'M', 140000),
	(74, '2013-08-03 06:55:51', '2013-08-03 06:55:51', '2013-08-03', 2, 155, 'M', 140000),
	(75, '2013-08-03 06:56:07', '2013-08-03 06:56:07', '2013-08-03', 2, 156, 'M', 140000),
	(76, '2013-08-03 06:56:19', '2013-08-03 06:56:19', '2013-08-03', 2, 156, 'M', 140000),
	(77, '2013-08-03 06:56:38', '2013-08-03 06:56:38', '2013-08-03', 2, 178, 'M', 140000),
	(78, '2013-08-03 06:57:40', '2013-08-03 06:57:40', '2013-08-03', 2, 158, 'M', 140000),
	(79, '2013-08-03 06:59:02', '2013-08-03 06:59:02', '2013-08-03', 2, 160, 'M', 140000),
	(80, '2013-08-03 06:59:15', '2013-08-03 06:59:15', '2013-08-03', 2, 180, 'M', 140000),
	(81, '2013-08-03 07:21:14', '2013-08-03 07:21:14', '2013-08-03', 2, 157, 'M', 140000),
	(82, '2013-08-03 07:21:41', '2013-08-03 07:21:41', '2013-08-03', 2, 181, 'M', 140000),
	(83, '2013-08-03 16:50:05', '2013-08-03 16:50:05', '2013-08-03', 2, 160, 'M', 140000);
/*!40000 ALTER TABLE `transmasuk` ENABLE KEYS */;


-- Dumping structure for table simasad.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `email` varchar(255) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `disabled` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(250) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_username_index` (`username`),
  KEY `users_password_index` (`password`),
  KEY `users_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.users: ~3 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `salt`, `email`, `verified`, `disabled`, `deleted`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'eries', '$2a$08$bcRj9c3qXX8psBEp9PpNtemSVQOfOlgQwmMTm2d9XLO/WNI/zgUxC', 'c9f169ae899b5f1f2d0f9277d639698b', 'eries@simas.ad', 1, 0, 0, '', '2013-06-12 08:44:01', '2013-06-12 08:46:34'),
	(2, 'admin', '$2a$08$Afz2r1HFDMA8cSoo6GwkCOlAQSHGMMNdO31aDenx10iUfKiANITHO', '8ba5d18b4cd2b70626a912a775f94658', 'admin@simas.ad', 1, 0, 0, 'Administrator', '2013-06-12 08:47:50', '2013-06-26 09:47:04'),
	(8, 'root', '$2a$08$pXkAMimGFRSQr/SEMKcXTufxsABovamU8iWxaadyg3npzmfR3plCe', '3b220f576322c6468c1a9570ec3a5d57', 'root@simas.ad', 1, 0, 0, 'Super Admin', '2013-08-02 12:40:49', '2013-08-02 12:40:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for view simasad.view_siswa
DROP VIEW IF EXISTS `view_siswa`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_siswa` (
	`id` INT(10) NULL,
	`nama` VARCHAR(150) NULL COLLATE 'utf8_general_ci',
	`nisn` VARCHAR(10) NULL COLLATE 'utf8_general_ci',
	`tahunajaran_id` INT(10) NULL,
	`tahunajaran` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`rombel_id` INT(10) NULL,
	`rombel` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`jenjang` ENUM('1','2','3','4','5','6','0') NULL COLLATE 'utf8_general_ci',
	`aktif` ENUM('Y','N') NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view simasad.view_spp
DROP VIEW IF EXISTS `view_spp`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_spp` (
	`id` INT(10) NOT NULL,
	`nisn` VARCHAR(10) NULL COLLATE 'utf8_general_ci',
	`nama` VARCHAR(150) NULL COLLATE 'utf8_general_ci',
	`jenjang_spp` ENUM('1','2','3','4','5','6','0') NULL COLLATE 'utf8_general_ci',
	`mutasi` ENUM('Y','N') NULL COLLATE 'utf8_general_ci',
	`tahunajaran_id` INT(10) NULL,
	`tahunajaran` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`rombel` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`jenjang` ENUM('1','2','3','4','5','6','0') NULL COLLATE 'utf8_general_ci',
	`jumlah` BIGINT(11) NULL,
	`jenisbiaya_id` INT(1) NOT NULL,
	`tipe` VARCHAR(3) NOT NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view simasad.view_transmasuk
DROP VIEW IF EXISTS `view_transmasuk`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `view_transmasuk` (
	`transmasuk_id` INT(10) NOT NULL,
	`detiltransmasuk_id` INT(10) NOT NULL,
	`created_at` DATETIME NULL,
	`updated_at` DATETIME NULL,
	`tanggal` DATE NULL,
	`tahunajaran_id` INT(10) NULL,
	`tahunajaran` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`siswa_id` INT(10) NULL,
	`siswa` VARCHAR(150) NULL COLLATE 'utf8_general_ci',
	`arus` ENUM('M','K') NULL COLLATE 'utf8_general_ci',
	`total` DECIMAL(10,0) NULL,
	`jenisbiaya_id` INT(10) NULL,
	`jenisbiaya` VARCHAR(60) NULL COLLATE 'utf8_general_ci',
	`bulan_id` INT(10) NULL,
	`bulan` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`harus_bayar` DECIMAL(10,0) NULL,
	`jumlah` DECIMAL(10,0) NULL,
	`potongan` DECIMAL(10,0) NULL,
	`ket` VARCHAR(250) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view simasad.vsiswa
DROP VIEW IF EXISTS `vsiswa`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vsiswa` (
	`id` INT(10) NOT NULL,
	`tahunajaran_id` INT(10) NULL,
	`tahunajaran` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`rombel_id` INT(10) NULL,
	`rombel` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`jenjang` ENUM('1','2','3','4','5','6','0') NULL COLLATE 'utf8_general_ci',
	`siswa_id` INT(10) NULL,
	`siswa` VARCHAR(150) NULL COLLATE 'utf8_general_ci',
	`nisn` VARCHAR(10) NULL COLLATE 'utf8_general_ci',
	`aktif` ENUM('Y','N') NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for view simasad.vtargetpencapaian
DROP VIEW IF EXISTS `vtargetpencapaian`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vtargetpencapaian` (
	`id` INT(10) NOT NULL,
	`nama` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`aktif` ENUM('Y','N') NULL COLLATE 'utf8_general_ci',
	`posisi` INT(11) NULL,
	`jumlah` BIGINT(11) NOT NULL,
	`target_id` INT(10) NULL
) ENGINE=MyISAM;


-- Dumping structure for view simasad.vtransmasuk
DROP VIEW IF EXISTS `vtransmasuk`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `vtransmasuk` (
	`id` INT(10) NOT NULL,
	`created_at` DATETIME NULL,
	`updated_at` DATETIME NULL,
	`tanggal` DATE NULL,
	`arus` ENUM('M','K') NULL COLLATE 'utf8_general_ci',
	`tahunajaran_id` INT(10) NULL,
	`tahunajaran` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`posisi_tahunajaran` INT(11) NULL,
	`siswa_id` INT(10) NULL,
	`nisn` VARCHAR(10) NULL COLLATE 'utf8_general_ci',
	`siswa` VARCHAR(150) NULL COLLATE 'utf8_general_ci',
	`detil_id` INT(10) NOT NULL,
	`jenisbiaya_id` INT(10) NULL,
	`jenisbiaya` VARCHAR(60) NULL COLLATE 'utf8_general_ci',
	`tipe` ENUM('ITB','ITC','BBBI','BTBI','IB') NULL COMMENT 'ITB : Iuran Tetap Bulanan, ITC:Iuran Tetap Cicilan, BBBI : Biaya bebas bukan iuran, BTBI: Biaya Tetap Bukan Iuran' COLLATE 'utf8_general_ci',
	`bulan_id` INT(10) NULL,
	`bulan` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`posisi` INT(11) NULL,
	`ket` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`harus_bayar` DECIMAL(10,0) NULL,
	`potongan` DECIMAL(10,0) NULL,
	`jumlah` DECIMAL(10,0) NULL
) ENGINE=MyISAM;


-- Dumping structure for view simasad.view_siswa
DROP VIEW IF EXISTS `view_siswa`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_siswa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `simasad`.`view_siswa` AS select `rs`.`siswa_id` AS `id`,`s`.`nama` AS `nama`,`s`.`nisn` AS `nisn`,`rs`.`tahunajaran_id` AS `tahunajaran_id`,`t`.`nama` AS `tahunajaran`,`rs`.`rombel_id` AS `rombel_id`,`r`.`nama` AS `rombel`,`r`.`jenjang` AS `jenjang`,`s`.`aktif` AS `aktif` from (((`rombelsiswa` `rs` join `siswa` `s` on((`rs`.`siswa_id` = `s`.`id`))) join `rombel` `r` on((`rs`.`rombel_id` = `r`.`id`))) join `tahunajaran` `t` on((`rs`.`tahunajaran_id` = `t`.`id`))) ;


-- Dumping structure for view simasad.view_spp
DROP VIEW IF EXISTS `view_spp`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_spp`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `simasad`.`view_spp` AS select `s`.`id` AS `id`,`s`.`nisn` AS `nisn`,`s`.`nama` AS `nama`,`s`.`jenjang_spp` AS `jenjang_spp`,`s`.`mutasi` AS `mutasi`,`rs`.`tahunajaran_id` AS `tahunajaran_id`,`ta`.`nama` AS `tahunajaran`,`r`.`nama` AS `rombel`,`r`.`jenjang` AS `jenjang`,(select `kb`.`jumlah` from `ketentuanbiaya` `kb` where ((`kb`.`jenjang` = `s`.`jenjang_spp`) and (`kb`.`tahunajaran_id` = `ta`.`id`) and (`kb`.`jenisbiaya_id` = 1))) AS `jumlah`,1 AS `jenisbiaya_id`,'ITB' AS `tipe` from (((`siswa` `s` join `rombelsiswa` `rs` on((`s`.`id` = `rs`.`siswa_id`))) join `tahunajaran` `ta` on((`rs`.`tahunajaran_id` = `ta`.`id`))) join `rombel` `r` on((`rs`.`rombel_id` = `r`.`id`))) order by `s`.`id`,`s`.`nisn`,`ta`.`id` ;


-- Dumping structure for view simasad.view_transmasuk
DROP VIEW IF EXISTS `view_transmasuk`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `view_transmasuk`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `simasad`.`view_transmasuk` AS select `tm`.`id` AS `transmasuk_id`,`dtm`.`id` AS `detiltransmasuk_id`,`tm`.`created_at` AS `created_at`,`tm`.`updated_at` AS `updated_at`,`tm`.`tanggal` AS `tanggal`,`tm`.`tahunajaran_id` AS `tahunajaran_id`,`ta`.`nama` AS `tahunajaran`,`tm`.`siswa_id` AS `siswa_id`,`s`.`nama` AS `siswa`,`tm`.`arus` AS `arus`,`tm`.`total` AS `total`,`dtm`.`jenisbiaya_id` AS `jenisbiaya_id`,`jb`.`nama` AS `jenisbiaya`,`dtm`.`bulan_id` AS `bulan_id`,`b`.`nama` AS `bulan`,`dtm`.`harus_bayar` AS `harus_bayar`,`dtm`.`jumlah` AS `jumlah`,`dtm`.`potongan` AS `potongan`,`dtm`.`ket` AS `ket` from (((((`detiltransmasuk` `dtm` join `transmasuk` `tm` on((`dtm`.`transmasuk_id` = `tm`.`id`))) join `tahunajaran` `ta` on((`tm`.`tahunajaran_id` = `ta`.`id`))) left join `siswa` `s` on((`tm`.`siswa_id` = `s`.`id`))) join `jenisbiaya` `jb` on((`dtm`.`jenisbiaya_id` = `jb`.`id`))) left join `bulan` `b` on((`dtm`.`bulan_id` = `b`.`id`))) ;


-- Dumping structure for view simasad.vsiswa
DROP VIEW IF EXISTS `vsiswa`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vsiswa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `simasad`.`vsiswa` AS select `rs`.`id` AS `id`,`rs`.`tahunajaran_id` AS `tahunajaran_id`,`t`.`nama` AS `tahunajaran`,`rs`.`rombel_id` AS `rombel_id`,`r`.`nama` AS `rombel`,`r`.`jenjang` AS `jenjang`,`rs`.`siswa_id` AS `siswa_id`,`s`.`nama` AS `siswa`,`s`.`nisn` AS `nisn`,`s`.`aktif` AS `aktif` from (((`rombelsiswa` `rs` join `siswa` `s` on((`rs`.`siswa_id` = `s`.`id`))) join `rombel` `r` on((`rs`.`rombel_id` = `r`.`id`))) join `tahunajaran` `t` on((`rs`.`tahunajaran_id` = `t`.`id`))) ;


-- Dumping structure for view simasad.vtargetpencapaian
DROP VIEW IF EXISTS `vtargetpencapaian`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vtargetpencapaian`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `simasad`.`vtargetpencapaian` AS select `ta`.`id` AS `id`,`ta`.`nama` AS `nama`,`ta`.`aktif` AS `aktif`,`ta`.`posisi` AS `posisi`,ifnull(`tp`.`jumlah`,0) AS `jumlah`,`tp`.`id` AS `target_id` from (`tahunajaran` `ta` left join `target_pencapaian` `tp` on((`tp`.`tahunajaran_id` = `ta`.`id`))) ;


-- Dumping structure for view simasad.vtransmasuk
DROP VIEW IF EXISTS `vtransmasuk`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vtransmasuk`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `simasad`.`vtransmasuk` AS select `tm`.`id` AS `id`,`tm`.`created_at` AS `created_at`,`tm`.`updated_at` AS `updated_at`,`tm`.`tanggal` AS `tanggal`,`tm`.`arus` AS `arus`,`tm`.`tahunajaran_id` AS `tahunajaran_id`,`ta`.`nama` AS `tahunajaran`,`ta`.`posisi` AS `posisi_tahunajaran`,`tm`.`siswa_id` AS `siswa_id`,`sw`.`nisn` AS `nisn`,`sw`.`nama` AS `siswa`,`dtm`.`id` AS `detil_id`,`dtm`.`jenisbiaya_id` AS `jenisbiaya_id`,`jb`.`nama` AS `jenisbiaya`,`jb`.`tipe` AS `tipe`,`dtm`.`bulan_id` AS `bulan_id`,`bl`.`nama` AS `bulan`,`bl`.`posisi` AS `posisi`,`dtm`.`ket` AS `ket`,`dtm`.`harus_bayar` AS `harus_bayar`,`dtm`.`potongan` AS `potongan`,`dtm`.`jumlah` AS `jumlah` from (((((`transmasuk` `tm` join `detiltransmasuk` `dtm` on((`dtm`.`transmasuk_id` = `tm`.`id`))) join `jenisbiaya` `jb` on((`dtm`.`jenisbiaya_id` = `jb`.`id`))) left join `siswa` `sw` on((`tm`.`siswa_id` = `sw`.`id`))) left join `bulan` `bl` on((`dtm`.`bulan_id` = `bl`.`id`))) join `tahunajaran` `ta` on((`tm`.`tahunajaran_id` = `ta`.`id`))) ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
