-- --------------------------------------------------------
-- Host                          :localhost
-- Server version                :5.5.27 - MySQL Community Server (GPL)
-- Server OS                     :Win32
-- HeidiSQL Version              :7.0.0.4304
-- Created                       :2013-07-06 08:01:20
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
/*!40000 ALTER TABLE `activator` DISABLE KEYS */;
INSERT INTO `activator` (`id`, `created_at`, `updated_at`, `tanggal`, `lunas`) VALUES
	(3, '2013-06-16 09:59:52', '2013-07-02 15:30:42', '2013-07-09', 'N');
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
/*!40000 ALTER TABLE `appsetting` DISABLE KEYS */;
INSERT INTO `appsetting` (`id`, `created_at`, `updated_at`, `biaya_id`, `mysqldumppath`, `cetaknota`, `printeraddr`, `lunas`, `linekertas`, `spaceprinter`, `charcount`, `sn_key`) VALUES
	(1, '2013-05-31 10:03:45', '2013-07-05 21:19:00', 1, 'C:\\xampp\\mysql\\bin\\', 'Y', '//192.168.0.2/epson_lx_800', 'N', 30, 14, 56, 'TkQtZ3QtTlUtSXQtTXota3QtTVUtTXQtUkQtVXQtT0UtRT0=');
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
  `jumlah` int(10) DEFAULT NULL,
  `ket` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_detiltransmasuk_transmasuk` (`transmasuk_id`),
  KEY `FK_detiltransmasuk_jenisbiaya` (`jenisbiaya_id`),
  KEY `FK_detiltransmasuk_bulan` (`bulan_id`),
  CONSTRAINT `FK_detiltransmasuk_bulan` FOREIGN KEY (`bulan_id`) REFERENCES `bulan` (`id`),
  CONSTRAINT `FK_detiltransmasuk_jenisbiaya` FOREIGN KEY (`jenisbiaya_id`) REFERENCES `jenisbiaya` (`id`),
  CONSTRAINT `FK_detiltransmasuk_transmasuk` FOREIGN KEY (`transmasuk_id`) REFERENCES `transmasuk` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.detiltransmasuk: ~0 rows (approximately)
/*!40000 ALTER TABLE `detiltransmasuk` DISABLE KEYS */;
/*!40000 ALTER TABLE `detiltransmasuk` ENABLE KEYS */;


-- Dumping structure for table simasad.jenisbiaya
DROP TABLE IF EXISTS `jenisbiaya`;
CREATE TABLE IF NOT EXISTS `jenisbiaya` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nama` varchar(60) DEFAULT NULL,
  `perjenjang` enum('Y','N') DEFAULT 'N',
  `tipe` enum('ITB','ITC','BBBI','BTBI') DEFAULT NULL COMMENT 'ITB : Iuran Tetap Bulanan, ITC:Iuran Tetap Cicilan, BBBI : Biaya bebas bukan iuran, BTBI: Biaya Tetap Bukan Iuran',
  `arus` enum('M','K') DEFAULT 'M',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.jenisbiaya: ~1 rows (approximately)
/*!40000 ALTER TABLE `jenisbiaya` DISABLE KEYS */;
INSERT INTO `jenisbiaya` (`id`, `created_at`, `updated_at`, `nama`, `perjenjang`, `tipe`, `arus`) VALUES
	(1, '2013-05-20 21:39:03', '2013-05-20 21:39:03', 'SPP', 'Y', 'ITB', 'M');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.ketentuanbiaya: ~6 rows (approximately)
/*!40000 ALTER TABLE `ketentuanbiaya` DISABLE KEYS */;
INSERT INTO `ketentuanbiaya` (`id`, `created_at`, `updated_at`, `tahunajaran_id`, `jenisbiaya_id`, `jenjang`, `jumlah`) VALUES
	(1, '2013-07-05 21:22:07', '2013-07-05 21:22:07', 1, 1, '1', 55000),
	(2, '2013-07-05 21:22:07', '2013-07-05 21:22:07', 1, 1, '2', 60000),
	(3, '2013-07-05 21:22:07', '2013-07-05 21:22:07', 1, 1, '3', 65000),
	(4, '2013-07-05 21:22:07', '2013-07-05 21:22:07', 1, 1, '4', 70000),
	(5, '2013-07-05 21:22:07', '2013-07-05 21:22:07', 1, 1, '5', 75000),
	(6, '2013-07-05 21:22:07', '2013-07-05 21:22:07', 1, 1, '6', 80000);
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
/*!40000 ALTER TABLE `laravel_migrations` DISABLE KEYS */;
INSERT INTO `laravel_migrations` (`bundle`, `name`, `batch`) VALUES
	('sentry', '2012_08_03_162320_install', 1),
	('sentry', '2012_08_15_001334_database_rules', 1),
	('sentry', '2012_10_08_000000_users_nullable', 1),
	('verify', '2012_06_17_211339_init', 2),
	('verify', '2013_02_24_094926_user_roles_one_to_many', 2);
/*!40000 ALTER TABLE `laravel_migrations` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.permissions: ~15 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'manage_user', 'Mengelola Data User (tambah,edit,hapus)', '2013-06-11 17:59:12', '2013-06-11 17:59:12'),
	(2, 'manage_user_group', 'Mengelola Data User Group (tambah,edit,hapus)', '2013-06-11 17:59:12', '2013-06-11 17:59:12'),
	(3, 'manage_tahun_ajaran', 'Mengelola Data Tahun Ajaran (tambah,edit,hapus)', '2013-06-11 17:59:12', '2013-06-11 17:59:12'),
	(4, 'manage_bulan', 'Mengelola Data Urutan Bulan (tambah,edit,hapus)', '2013-06-11 18:00:33', '2013-06-11 18:00:33'),
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
	(15, 'manage_rekapitulasi_tahunan', 'Mengelola Data Rekapitulasi Keuangan Tahunan', '2013-06-26 05:41:33', '2013-06-26 05:41:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.permission_role: ~28 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(12, 1, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(13, 2, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(14, 3, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
	(15, 4, 1, '2013-06-11 18:19:22', '2013-06-11 18:19:22'),
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
	(45, 15, 1, '2013-06-26 05:41:57', '2013-06-26 05:41:57'),
	(46, 15, 4, '2013-06-26 05:42:07', '2013-06-26 05:42:07');
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;


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
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `description`, `level`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin', NULL, 10, '2013-06-11 17:07:25', '2013-06-11 17:07:25'),
	(4, 'Bagian Keuangan', NULL, 0, '2013-06-11 19:09:43', '2013-06-11 19:09:43'),
	(5, 'Kasir', NULL, 0, '2013-06-11 19:09:59', '2013-06-11 19:09:59');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.role_user: ~3 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2013-06-12 08:44:17', '2013-06-12 08:44:17'),
	(2, 2, 1, '2013-06-12 08:47:50', '2013-06-12 08:47:50'),
	(6, 6, 4, '2013-07-05 10:32:36', '2013-07-05 10:32:36');
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
	(9, '2013-07-05 10:49:11', '2013-07-05 10:49:11', 'V - Ki Hajar Dewantara', '5'),
	(10, '2013-07-05 10:50:41', '2013-07-05 10:50:41', 'V - Ahmad Yani', '5'),
	(12, '2013-07-05 21:20:48', '2013-07-05 21:20:48', 'VI - Ir Sukarno', '6'),
	(13, '2013-07-05 21:20:58', '2013-07-05 21:20:58', 'VI - Mohammad Hatta', '6'),
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
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.rombelsiswa: ~218 rows (approximately)
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
	(127, '2013-07-05 11:27:07', '2013-07-05 11:27:07', 1, 6, 127),
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
	(230, '2013-07-05 12:57:32', '2013-07-05 12:57:32', 1, 9, 230);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.siswa: ~218 rows (approximately)
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` (`id`, `created_at`, `updated_at`, `nisn`, `nama`, `aktif`) VALUES
	(1, '2013-07-05 10:56:21', '2013-07-05 10:56:21', '553', 'DEVINA PRAMAWATI', 'Y'),
	(2, '2013-07-05 10:56:29', '2013-07-05 10:56:29', '501', 'Alifiah Annafisah', 'Y'),
	(3, '2013-07-05 10:57:04', '2013-07-05 10:57:04', '504', 'Aulia Fitri Rachmania A.', 'Y'),
	(4, '2013-07-05 10:57:17', '2013-07-05 10:57:17', '546', 'ALI NUR RAMADHAN', 'Y'),
	(5, '2013-07-05 10:57:55', '2013-07-05 10:57:55', '547', 'ALYRA SYAH FARHANI', 'Y'),
	(6, '2013-07-05 10:58:25', '2013-07-05 10:58:25', '548', 'ANDHIKA AHMAD DZAKY', 'Y'),
	(7, '2013-07-05 10:58:52', '2013-07-05 10:58:52', '550', 'ARIEYANTO RAHMAN Y. C.', 'Y'),
	(8, '2013-07-05 10:59:20', '2013-07-05 10:59:20', '551', 'AULIA PUTRI YASINTA', 'Y'),
	(10, '2013-07-05 11:00:24', '2013-07-05 11:00:24', '554', 'DLIYAUL HAQQIA', 'Y'),
	(11, '2013-07-05 11:00:52', '2013-07-05 11:00:52', '556', 'ERLANGGA KHARISMA W.', 'Y'),
	(12, '2013-07-05 11:01:32', '2013-07-05 11:01:32', '558', 'FATHIAN AUZAIE HANZALA', 'Y'),
	(13, '2013-07-05 11:03:26', '2013-07-05 11:03:26', '562', 'LAILA AL AFIFAH', 'Y'),
	(14, '2013-07-05 11:03:35', '2013-07-05 11:03:35', '506', 'Daffa Amru Kurniawan', 'Y'),
	(15, '2013-07-05 11:03:57', '2013-07-05 11:03:57', '564', 'M. HAFIZH ALDO ALFITO', 'Y'),
	(16, '2013-07-05 11:04:26', '2013-07-05 11:04:26', '507', 'Denisa Iselina S.', 'Y'),
	(17, '2013-07-05 11:04:48', '2013-07-05 11:04:48', '508', 'Dewangga Kharisma A.', 'Y'),
	(19, '2013-07-05 11:05:02', '2013-07-05 11:05:02', '532', 'Firly Intan Wahyuningsih', 'Y'),
	(20, '2013-07-05 11:05:14', '2013-07-05 11:05:14', '510', 'Ilham Ramadhani', 'Y'),
	(21, '2013-07-05 11:05:28', '2013-07-05 11:05:28', '511', 'Intan Nur\' Aini', 'Y'),
	(22, '2013-07-05 11:05:40', '2013-07-05 11:05:40', '512', 'M. Adrik Shirod Judin', 'Y'),
	(24, '2013-07-05 11:05:55', '2013-07-05 11:05:55', '513', 'Moch. Rizky Aflah F.', 'Y'),
	(25, '2013-07-05 11:06:06', '2013-07-05 11:06:06', '516', 'Muthmainatulia Madani', 'Y'),
	(26, '2013-07-05 11:06:18', '2013-07-05 11:06:18', '517', 'Nadia Amaliani', 'Y'),
	(28, '2013-07-05 11:06:30', '2013-07-05 11:06:30', '518', 'Pandhega Rafiif Harandi', 'Y'),
	(29, '2013-07-05 11:06:42', '2013-07-05 11:06:42', '519', 'Putri Zahra Azri', 'Y'),
	(31, '2013-07-05 11:06:55', '2013-07-05 11:06:55', '585', 'Reysa Zulfa Hidayah', 'Y'),
	(32, '2013-07-05 11:07:10', '2013-07-05 11:07:10', '524', 'Sagita Tri Rahma', 'Y'),
	(33, '2013-07-05 11:07:38', '2013-07-05 11:07:38', '526', 'Silvi Putri Nabila', 'Y'),
	(35, '2013-07-05 11:07:54', '2013-07-05 11:07:54', '528', 'Syauqi Abdillah Rouf', 'Y'),
	(36, '2013-07-05 11:08:12', '2013-07-05 11:08:12', '586', 'Umar yasin', 'Y'),
	(37, '2013-07-05 11:08:24', '2013-07-05 11:08:24', '535', 'Zatayu Fajar Fadila', 'Y'),
	(39, '2013-07-05 11:08:54', '2013-07-05 11:08:54', '497', 'Adinda Rahmalia Putri', 'Y'),
	(40, '2013-07-05 11:09:06', '2013-07-05 11:09:06', '498', 'Ahmad Hafizh Zuhliyan H', 'Y'),
	(41, '2013-07-05 11:09:16', '2013-07-05 11:09:16', '500', 'Alfan Riyanto', 'Y'),
	(43, '2013-07-05 11:09:26', '2013-07-05 11:09:26', '502', 'Alkhaizaran Syafiyatuddin', 'Y'),
	(44, '2013-07-05 11:09:36', '2013-07-05 11:09:36', '503', 'Arsirivanda Yulistina M.K.', 'Y'),
	(49, '2013-07-05 11:13:49', '2013-07-05 11:13:49', '584', 'Arya Agung', 'Y'),
	(50, '2013-07-05 11:14:00', '2013-07-05 11:14:00', '505', 'Aurel Cynthia Putri Akhsan', 'Y'),
	(51, '2013-07-05 11:14:10', '2013-07-05 11:14:10', '514', 'Mohamad Rasyd Zahroni', 'Y'),
	(52, '2013-07-05 11:14:13', '2013-07-05 11:14:13', '566', 'M. ZAINUL MUSTHOFA MUNJI', 'Y'),
	(53, '2013-07-05 11:14:19', '2013-07-05 11:14:19', '515', 'Muhammad Rifaldi Saputra', 'Y'),
	(54, '2013-07-05 11:14:32', '2013-07-05 11:14:32', '520', 'Rafli Eka Syahputra', 'Y'),
	(55, '2013-07-05 11:14:53', '2013-07-05 11:14:53', '521', 'Ramadhan Maulana Yusuf', 'Y'),
	(56, '2013-07-05 11:14:59', '2013-07-05 11:14:59', '568', 'MEYLANI IRFANA PUTRI', 'Y'),
	(57, '2013-07-05 11:15:03', '2013-07-05 11:15:03', '522', 'Rizki Nur Ridho', 'Y'),
	(58, '2013-07-05 11:15:12', '2013-07-05 11:15:12', '523', 'Sabira Nur Izza', 'Y'),
	(59, '2013-07-05 11:15:23', '2013-07-05 11:15:23', '525', 'Salsabila Kurnia Syandana', 'Y'),
	(60, '2013-07-05 11:15:34', '2013-07-05 11:15:34', '527', 'Syafira Dewi Nawangsari', 'Y'),
	(61, '2013-07-05 11:15:40', '2013-07-05 11:15:40', '573', 'MUHAMMAD AGIL P. A.', 'Y'),
	(62, '2013-07-05 11:15:44', '2013-07-05 11:15:44', '529', 'Syauqi Hadi Maulana', 'Y'),
	(63, '2013-07-05 11:15:57', '2013-07-05 11:15:57', '530', 'Talitha Septya Damayanti', 'Y'),
	(64, '2013-07-05 11:16:08', '2013-07-05 11:16:08', '531', 'Taufiqur Rizqi Ramadani', 'Y'),
	(65, '2013-07-05 11:16:16', '2013-07-05 11:16:16', '574', 'MUHAMMAD JIHAD B. G.', 'Y'),
	(66, '2013-07-05 11:16:18', '2013-07-05 11:16:18', '533', 'Wahyu Sumbaga Wiratama', 'Y'),
	(67, '2013-07-05 11:16:26', '2013-07-05 11:16:26', '534', 'Widy Rahma Cahyati', 'Y'),
	(68, '2013-07-05 11:16:44', '2013-07-05 11:16:44', '536', 'Zida Kamalia', 'Y'),
	(69, '2013-07-05 11:17:18', '2013-07-05 11:17:18', '437', 'Abdul Haris Setya N.', 'Y'),
	(70, '2013-07-05 11:17:18', '2013-07-05 11:17:18', '575', 'MUHAMMAD NAUFAL U.', 'Y'),
	(71, '2013-07-05 11:17:27', '2013-07-05 11:17:27', '488', 'Achfatul Mirojiah', 'Y'),
	(72, '2013-07-05 11:18:44', '2013-07-05 11:18:44', '578', 'PARAMA ZAIDAN H.', 'Y'),
	(73, '2013-07-05 11:19:02', '2013-07-05 11:19:02', '438', 'Achmad Bagas Ardiansyah', 'Y'),
	(74, '2013-07-05 11:19:12', '2013-07-05 11:19:12', '439', 'Agil Putra Yudanto', 'Y'),
	(75, '2013-07-05 11:19:14', '2013-07-05 11:19:14', '581', 'SITI MAR\'ATUS S.', 'Y'),
	(76, '2013-07-05 11:19:21', '2013-07-05 11:19:21', '441', 'Alfan Dika Prasetyo', 'Y'),
	(77, '2013-07-05 11:19:31', '2013-07-05 11:19:31', '443', 'Anggita Aditya Fauzi', 'Y'),
	(78, '2013-07-05 11:19:41', '2013-07-05 11:19:41', '444', 'Anisa Lita Amalia', 'Y'),
	(79, '2013-07-05 11:19:47', '2013-07-05 11:19:47', '582', 'ZAKIA AZMI CAHYADEWI', 'Y'),
	(80, '2013-07-05 11:19:49', '2013-07-05 11:19:49', '445', 'Arimbi B. Aritra', 'Y'),
	(81, '2013-07-05 11:20:00', '2013-07-05 11:20:00', '452', 'Dita Lestari', 'Y'),
	(82, '2013-07-05 11:20:10', '2013-07-05 11:20:10', '454', 'Fani Rizkia Nuraimy', 'Y'),
	(83, '2013-07-05 11:20:19', '2013-07-05 11:20:19', '583', 'ZHUBA ZHAWABI AKHMAD', 'Y'),
	(84, '2013-07-05 11:20:23', '2013-07-05 11:20:23', '455', 'Giovanni Arsa Maulana', 'Y'),
	(85, '2013-07-05 11:20:32', '2013-07-05 11:20:32', '543', 'Indra Gosal', 'Y'),
	(86, '2013-07-05 11:20:41', '2013-07-05 11:20:41', '459', 'Intan Ramadhan Putri N.R.', 'Y'),
	(87, '2013-07-05 11:20:50', '2013-07-05 11:20:50', '460', 'Jarullah M. H.', 'Y'),
	(88, '2013-07-05 11:21:02', '2013-07-05 11:21:02', '496', 'Ach. Hafidzurrohman', 'Y'),
	(89, '2013-07-05 11:21:12', '2013-07-05 11:21:12', '467', 'M. Hanifsyah', 'Y'),
	(90, '2013-07-05 11:21:15', '2013-07-05 11:21:15', '549', 'A. ANDHIKA RIZKY P. P.', 'Y'),
	(91, '2013-07-05 11:21:21', '2013-07-05 11:21:21', '468', 'M. Jamaludin', 'Y'),
	(92, '2013-07-05 11:21:34', '2013-07-05 11:21:34', '495', 'M. Qowwiyus Sullton', 'Y'),
	(93, '2013-07-05 11:21:42', '2013-07-05 11:21:42', '476', 'Marcella Maharani Irawan', 'Y'),
	(94, '2013-07-05 11:21:53', '2013-07-05 11:21:53', '480', 'Miftachul Firmansyah', 'Y'),
	(95, '2013-07-05 11:21:58', '2013-07-05 11:21:58', '545', 'ACH. HASANI T. SANJANI', 'Y'),
	(96, '2013-07-05 11:22:06', '2013-07-05 11:22:06', '483', 'Naufal Rafif Al Rizal', 'Y'),
	(97, '2013-07-05 11:22:17', '2013-07-05 11:22:17', '486', 'Ratu Risala F.N.', 'Y'),
	(98, '2013-07-05 11:22:29', '2013-07-05 11:22:29', '490', 'Salsabila Putri R.', 'Y'),
	(99, '2013-07-05 11:22:35', '2013-07-05 11:22:35', '552', 'DANASTRI NAILA P. ', 'Y'),
	(100, '2013-07-05 11:22:47', '2013-07-05 11:22:47', '492', 'Sulthan Rhaka Farid', 'Y'),
	(101, '2013-07-05 11:22:59', '2013-07-05 11:22:59', '539', 'Syifa Andini Fatinah', 'Y'),
	(102, '2013-07-05 11:23:10', '2013-07-05 11:23:10', '555', 'DZAKWAN CAECAREO M.', 'Y'),
	(103, '2013-07-05 11:23:14', '2013-07-05 11:23:14', '493', 'Tiffany Naura R.D.', 'Y'),
	(104, '2013-07-05 11:23:28', '2013-07-05 11:23:28', '440', 'Aisha Rahmadia Aqilah', 'Y'),
	(105, '2013-07-05 11:23:48', '2013-07-05 11:23:48', '587', 'Aziyah Tsamratul Insyiroh', 'Y'),
	(106, '2013-07-05 11:24:02', '2013-07-05 11:24:02', '449', 'Destri Istifani Ivanka', 'Y'),
	(107, '2013-07-05 11:24:04', '2013-07-05 11:24:04', '557', 'FARIHAH LINA ROFI\'AH', 'Y'),
	(108, '2013-07-05 11:24:15', '2013-07-05 11:24:15', '450', 'Devina Firda Cahyani', 'Y'),
	(109, '2013-07-05 11:24:25', '2013-07-05 11:24:25', '453', 'Evelyn Agastya Intani', 'Y'),
	(110, '2013-07-05 11:24:33', '2013-07-05 11:24:33', '559', 'GHEFIRA NURIZZA', 'Y'),
	(111, '2013-07-05 11:24:35', '2013-07-05 11:24:35', '456', 'Hanifa Putri P.', 'Y'),
	(112, '2013-07-05 11:24:44', '2013-07-05 11:24:44', '457', 'Hesha zidni Afif A.', 'Y'),
	(113, '2013-07-05 11:25:00', '2013-07-05 11:25:00', '458', 'Inayatus Safina', 'Y'),
	(114, '2013-07-05 11:25:03', '2013-07-05 11:25:03', '560', 'INDAH LESTARI', 'Y'),
	(115, '2013-07-05 11:25:13', '2013-07-05 11:25:13', '461', 'Jasmine Malaika', 'Y'),
	(116, '2013-07-05 11:25:22', '2013-07-05 11:25:22', '462', 'Jihan Ihza Nabilla', 'Y'),
	(117, '2013-07-05 11:25:42', '2013-07-05 11:25:42', '561', 'JAVIN ANANTA ARDAESA', 'Y'),
	(118, '2013-07-05 11:25:54', '2013-07-05 11:25:54', '463', 'Karisma Auliyah N.R.P.', 'Y'),
	(119, '2013-07-05 11:26:06', '2013-07-05 11:26:06', '465', 'M. Fajar Budianto', 'Y'),
	(120, '2013-07-05 11:26:15', '2013-07-05 11:26:15', '466', 'M. Farich R.', 'Y'),
	(121, '2013-07-05 11:26:20', '2013-07-05 11:26:20', '563', 'M.FARHAN SAPUTRA', 'Y'),
	(122, '2013-07-05 11:26:26', '2013-07-05 11:26:26', '469', 'M. Lutfi Kurniawan', 'Y'),
	(123, '2013-07-05 11:26:42', '2013-07-05 11:26:42', '470', 'M. Nasekh Muwaffiq', 'Y'),
	(124, '2013-07-05 11:26:53', '2013-07-05 11:26:53', '471', 'M. Qois Hatta', 'Y'),
	(125, '2013-07-05 11:27:03', '2013-07-05 11:27:03', '565', 'M. RAHMATULLAH KAUTSARI', 'Y'),
	(126, '2013-07-05 11:27:07', '2013-07-05 11:27:07', '472', 'M. Rafli Al Hafits', 'Y'),
	(127, '2013-07-05 11:27:07', '2013-07-05 11:27:07', '472', 'M. Rafli Al Hafits', 'Y'),
	(128, '2013-07-05 11:28:20', '2013-07-05 11:28:20', '473', 'M. Ridho Ashari D.', 'Y'),
	(129, '2013-07-05 11:28:31', '2013-07-05 11:28:31', '474', 'M. Subanul Kirom', 'Y'),
	(130, '2013-07-05 11:28:43', '2013-07-05 11:28:43', '477', 'Maria Assyakira', 'Y'),
	(131, '2013-07-05 11:28:54', '2013-07-05 11:28:54', '478', 'Maulana Ahmad Nur', 'Y'),
	(132, '2013-07-05 11:29:05', '2013-07-05 11:29:05', '479', 'Maulana A. Sofyan H.A.F.', 'Y'),
	(133, '2013-07-05 11:29:16', '2013-07-05 11:29:16', '482', 'Nabilah Aisyah P.', 'Y'),
	(134, '2013-07-05 11:29:35', '2013-07-05 11:29:35', '484', 'Nurma Rahmawati E.', 'Y'),
	(135, '2013-07-05 11:29:45', '2013-07-05 11:29:45', '487', 'Ridania Mawaddah', 'Y'),
	(136, '2013-07-05 11:29:57', '2013-07-05 11:29:57', '491', 'Siti Aisyah Fatimah A.', 'Y'),
	(137, '2013-07-05 11:30:08', '2013-07-05 11:30:08', '494', 'Zuhal Nahwan Al Azmi', 'Y'),
	(138, '2013-07-05 12:03:05', '2013-07-05 12:03:05', '567', 'M. ZIDAN EKA ', 'Y'),
	(139, '2013-07-05 12:03:46', '2013-07-05 12:03:46', '569', 'MIIM NABA AMAR A. H. ', 'Y'),
	(140, '2013-07-05 12:04:20', '2013-07-05 12:04:20', '570', 'MIKAL ALHADIAN', 'Y'),
	(141, '2013-07-05 12:05:01', '2013-07-05 12:05:01', '571', 'MOCH HISBUN NAZAR', 'Y'),
	(142, '2013-07-05 12:05:45', '2013-07-05 12:05:45', '572', 'MOCH. ROFIQ R.', 'Y'),
	(143, '2013-07-05 12:06:13', '2013-07-05 12:06:13', '576', 'MUTHIA KANAHAYA', 'Y'),
	(144, '2013-07-05 12:07:05', '2013-07-05 12:07:05', '577', 'NABILA NURIL WAHDANIA', 'Y'),
	(145, '2013-07-05 12:07:48', '2013-07-05 12:07:48', '579', 'RUSTAM WAHYU ANDIKA', 'Y'),
	(146, '2013-07-05 12:08:24', '2013-07-05 12:08:24', '580', 'SABIQ FAWWAZ FATHONI', 'Y'),
	(147, '2013-07-05 12:08:57', '2013-07-05 12:08:57', '588', 'AKIFA KINATA FITRI', 'Y'),
	(148, '2013-07-05 12:11:41', '2013-07-05 12:11:41', '448', 'Ahmad Zidan F.', 'Y'),
	(149, '2013-07-05 12:12:22', '2013-07-05 12:12:22', '402', 'Azza Nur Ilfana', 'Y'),
	(150, '2013-07-05 12:15:49', '2013-07-05 12:15:49', '403', 'Azza Zahro', 'Y'),
	(151, '2013-07-05 12:16:30', '2013-07-05 12:16:30', '404', 'Bima Kharisma', 'Y'),
	(152, '2013-07-05 12:17:05', '2013-07-05 12:17:05', '405', 'Cantika Rosdiana P.', 'Y'),
	(153, '2013-07-05 12:17:46', '2013-07-05 12:17:46', '406', 'Chiara Fuadiatul A.', 'Y'),
	(154, '2013-07-05 12:18:19', '2013-07-05 12:18:19', '431', 'Hurum Azzahra A.', 'Y'),
	(155, '2013-07-05 12:19:01', '2013-07-05 12:19:01', '413', 'Jasmine Aisha A.', 'Y'),
	(156, '2013-07-05 12:19:33', '2013-07-05 12:19:33', '414', 'Lutfiah Sobikhah Y.', 'Y'),
	(157, '2013-07-05 12:20:09', '2013-07-05 12:20:09', '420', 'M. Agus Rangga P.', 'Y'),
	(158, '2013-07-05 12:20:59', '2013-07-05 12:20:59', '416', 'M. Fajar Bahrul Ilmi D.', 'Y'),
	(159, '2013-07-05 12:21:29', '2013-07-05 12:21:29', '393', 'M. Ulin Nuha', 'Y'),
	(160, '2013-07-05 12:22:16', '2013-07-05 12:22:16', '417', 'Muchammad Yusuf', 'Y'),
	(161, '2013-07-05 12:22:48', '2013-07-05 12:22:48', '422', 'Nandini Nayfa Ufairoh', 'Y'),
	(162, '2013-07-05 12:23:36', '2013-07-05 12:23:36', '424', 'Nabila Adien Nirwasih', 'Y'),
	(163, '2013-07-05 12:24:16', '2013-07-05 12:24:16', '426', 'Nia Silverish Chrysanti', 'Y'),
	(164, '2013-07-05 12:25:01', '2013-07-05 12:25:01', '540', 'Nila Rahmasari', 'Y'),
	(165, '2013-07-05 12:25:32', '2013-07-05 12:25:32', '428', 'Nooraini Fajri R. H.', 'Y'),
	(166, '2013-07-05 12:26:29', '2013-07-05 12:26:29', '430', 'Refin Fajrulfalah', 'Y'),
	(167, '2013-07-05 12:27:07', '2013-07-05 12:27:07', '432', 'Sam Ahmad Athfar D.', 'Y'),
	(168, '2013-07-05 12:27:34', '2013-07-05 12:27:34', '434', 'Septian Dwi Prasetyo', 'Y'),
	(169, '2013-07-05 12:28:06', '2013-07-05 12:28:06', '397', 'Achmad Alawy', 'Y'),
	(170, '2013-07-05 12:28:37', '2013-07-05 12:28:37', '399', 'Akhroja Lailiyah', 'Y'),
	(171, '2013-07-05 12:29:31', '2013-07-05 12:29:31', '400', 'Anisah Salsabila I.', 'Y'),
	(172, '2013-07-05 12:30:05', '2013-07-05 12:30:05', '401', 'A\'thy Ia\'nati', 'Y'),
	(173, '2013-07-05 12:30:34', '2013-07-05 12:30:34', '398', 'A. Zidni Fadlah', 'Y'),
	(174, '2013-07-05 12:31:01', '2013-07-05 12:31:01', '407', 'Diniarti Dwi M.', 'Y'),
	(175, '2013-07-05 12:31:55', '2013-07-05 12:31:55', '408', 'Fachriyatul Fitria', 'Y'),
	(176, '2013-07-05 12:39:12', '2013-07-05 12:39:12', '410', 'Firnanda Nur R. H.', 'Y'),
	(177, '2013-07-05 12:39:39', '2013-07-05 12:39:39', '411', 'Hakeem Abdurrasyid', 'Y'),
	(178, '2013-07-05 12:40:08', '2013-07-05 12:40:08', '415', 'M. Haris Hariyanto', 'Y'),
	(179, '2013-07-05 12:40:43', '2013-07-05 12:40:43', '412', 'Ilham Adi Permono', 'Y'),
	(180, '2013-07-05 12:41:26', '2013-07-05 12:41:26', '419', 'M. Esak Muhandis', 'Y'),
	(181, '2013-07-05 12:41:52', '2013-07-05 12:41:52', '421', 'M. Febriansyah', 'Y'),
	(182, '2013-07-05 12:42:18', '2013-07-05 12:42:18', '423', 'Nabila Syafa Rofiah', 'Y'),
	(183, '2013-07-05 12:42:52', '2013-07-05 12:42:52', '425', 'Nisfatur Adiningrum', 'Y'),
	(184, '2013-07-05 12:43:23', '2013-07-05 12:43:23', '427', 'Nihayatul Husnah A.', 'Y'),
	(185, '2013-07-05 12:43:51', '2013-07-05 12:43:51', '429', 'Nurarryn Imroatul K.', 'Y'),
	(186, '2013-07-05 12:44:18', '2013-07-05 12:44:18', '394', 'Rio Hendrawan', 'Y'),
	(187, '2013-07-05 12:44:42', '2013-07-05 12:44:42', '433', 'Selvia Umi Muhlisoh', 'Y'),
	(188, '2013-07-05 12:45:12', '2013-07-05 12:45:12', '435', 'Syalma Putri Adiguna', 'Y'),
	(189, '2013-07-05 12:46:01', '2013-07-05 12:46:01', '388', 'Adisa Ayu Prasandya', 'Y'),
	(190, '2013-07-05 12:46:49', '2013-07-05 12:46:49', '337', 'Adhelia Novia N.', 'Y'),
	(191, '2013-07-05 12:46:52', '2013-07-05 12:46:52', '360', 'Afro\' Anzali Nurizzati A.', 'Y'),
	(192, '2013-07-05 12:47:05', '2013-07-05 12:47:05', '371', 'Afifah Nurulia Agatha', 'Y'),
	(193, '2013-07-05 12:47:16', '2013-07-05 12:47:16', '390', 'Aulia Hatra Aditya', 'Y'),
	(194, '2013-07-05 12:47:20', '2013-07-05 12:47:20', '392', 'Alvina Berliani G.', 'Y'),
	(195, '2013-07-05 12:47:27', '2013-07-05 12:47:27', '378', 'Dito Pratama', 'Y'),
	(196, '2013-07-05 12:47:36', '2013-07-05 12:47:36', '368', 'Erlangga Dwi Yoga B.R.', 'Y'),
	(197, '2013-07-05 12:47:46', '2013-07-05 12:47:46', '541', 'Arasy Azka', 'Y'),
	(198, '2013-07-05 12:47:47', '2013-07-05 12:47:47', '350', 'Hanidah Aulia Nurfiani', 'Y'),
	(199, '2013-07-05 12:48:01', '2013-07-05 12:48:01', '357', 'Izza Alwy Ika Putri', 'Y'),
	(200, '2013-07-05 12:48:16', '2013-07-05 12:48:16', '389', 'Kevin Apta Ramadhan', 'Y'),
	(201, '2013-07-05 12:48:28', '2013-07-05 12:48:28', '377', 'Khoiriah Alfissahroh', 'Y'),
	(202, '2013-07-05 12:48:30', '2013-07-05 12:48:30', '537', 'Arsyfian Khasa aditya', 'Y'),
	(203, '2013-07-05 12:48:39', '2013-07-05 12:48:39', '387', 'Khoirun Nisa\'', 'Y'),
	(204, '2013-07-05 12:48:49', '2013-07-05 12:48:49', '386', 'Limagtu Riski W.', 'Y'),
	(205, '2013-07-05 12:48:58', '2013-07-05 12:48:58', '356', 'Bagus Ido Laksono', 'Y'),
	(206, '2013-07-05 12:49:00', '2013-07-05 12:49:00', '362', 'M. Ardhiansya ', 'Y'),
	(207, '2013-07-05 12:49:12', '2013-07-05 12:49:12', '367', 'M. Firnanda Hidayat', 'Y'),
	(208, '2013-07-05 12:49:24', '2013-07-05 12:49:24', '383', 'M. Haidar Arya M.', 'Y'),
	(209, '2013-07-05 12:49:40', '2013-07-05 12:49:40', '338', 'Evanie Zahirah B.', 'Y'),
	(210, '2013-07-05 12:50:18', '2013-07-05 12:50:18', '351', 'Faiqah Caecaria Merin I.', 'Y'),
	(211, '2013-07-05 12:50:45', '2013-07-05 12:50:45', '385', 'M. Risky Dwi Septian', 'Y'),
	(212, '2013-07-05 12:50:55', '2013-07-05 12:50:55', '353', 'Gilang Akbar F.', 'Y'),
	(213, '2013-07-05 12:50:57', '2013-07-05 12:50:57', '370', 'Putri Fatimatuh Zahro', 'Y'),
	(214, '2013-07-05 12:51:06', '2013-07-05 12:51:06', '344', 'Raihanah Qotrun Nada', 'Y'),
	(215, '2013-07-05 12:51:18', '2013-07-05 12:51:18', '346', 'Haikal Wardhana P.', 'Y'),
	(216, '2013-07-05 12:51:34', '2013-07-05 12:51:34', '340', 'Reva Rahma Maulidah', 'Y'),
	(217, '2013-07-05 12:51:43', '2013-07-05 12:51:43', '376', 'Risa Yuliana Lestari', 'Y'),
	(218, '2013-07-05 12:51:47', '2013-07-05 12:51:47', '395', 'Hikmah Dwi Fatmawati', 'Y'),
	(219, '2013-07-05 12:51:55', '2013-07-05 12:51:55', '382', 'Salsabila Qotrun Nada', 'Y'),
	(220, '2013-07-05 12:52:07', '2013-07-05 12:52:07', '372', 'Wildan Kamal Alam', 'Y'),
	(221, '2013-07-05 12:52:11', '2013-07-05 12:52:11', '352', 'Ika Nur Safrilianti', 'Y'),
	(222, '2013-07-05 12:52:41', '2013-07-05 12:52:41', '358', 'Intan Firdausi Nuzula', 'Y'),
	(223, '2013-07-05 12:53:08', '2013-07-05 12:53:08', '348', 'Juan Mega Avicenna', 'Y'),
	(224, '2013-07-05 12:53:33', '2013-07-05 12:53:33', '361', 'Julia Rahmita Yanti', 'Y'),
	(225, '2013-07-05 12:54:14', '2013-07-05 12:54:14', '341', 'M. Bahrudin Rizal', 'Y'),
	(226, '2013-07-05 12:54:37', '2013-07-05 12:54:37', '345', 'Malik Abdullah', 'Y'),
	(227, '2013-07-05 12:55:59', '2013-07-05 12:55:59', '391', 'Nita Yuanita', 'Y'),
	(228, '2013-07-05 12:56:23', '2013-07-05 12:56:23', '339', 'Rifki Haris Setiantyo', 'Y'),
	(229, '2013-07-05 12:56:49', '2013-07-05 12:56:49', '355', 'Samudra Al-Akbar A. P.', 'Y'),
	(230, '2013-07-05 12:57:32', '2013-07-05 12:57:32', '359', 'Zarwandah Asfarani', 'Y');
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
/*!40000 ALTER TABLE `tahunajaran` DISABLE KEYS */;
INSERT INTO `tahunajaran` (`id`, `created_at`, `updated_at`, `nama`, `aktif`, `posisi`) VALUES
	(1, '2013-07-05 10:13:36', '2013-07-05 10:13:36', '2012 / 2013', 'Y', 1),
	(2, '2013-07-05 10:38:19', '2013-07-05 10:38:19', '2013 / 2014', 'N', 2);
/*!40000 ALTER TABLE `tahunajaran` ENABLE KEYS */;


-- Dumping structure for table simasad.target_pencapaian
DROP TABLE IF EXISTS `target_pencapaian`;
CREATE TABLE IF NOT EXISTS `target_pencapaian` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tahunajaran_id` int(10) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.target_pencapaian: ~0 rows (approximately)
/*!40000 ALTER TABLE `target_pencapaian` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `FK_transmasuk_tahunajaran` (`tahunajaran_id`),
  KEY `FK_transmasuk_siswa` (`siswa_id`),
  CONSTRAINT `FK_transmasuk_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  CONSTRAINT `FK_transmasuk_tahunajaran` FOREIGN KEY (`tahunajaran_id`) REFERENCES `tahunajaran` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.transmasuk: ~0 rows (approximately)
/*!40000 ALTER TABLE `transmasuk` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table simasad.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `salt`, `email`, `verified`, `disabled`, `deleted`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'eries', '$2a$08$bcRj9c3qXX8psBEp9PpNtemSVQOfOlgQwmMTm2d9XLO/WNI/zgUxC', 'c9f169ae899b5f1f2d0f9277d639698b', 'eries@simas.ad', 1, 0, 0, '', '2013-06-12 08:44:01', '2013-06-12 08:46:34'),
	(2, 'admin', '$2a$08$Afz2r1HFDMA8cSoo6GwkCOlAQSHGMMNdO31aDenx10iUfKiANITHO', '8ba5d18b4cd2b70626a912a775f94658', 'admin@simas.ad', 1, 0, 0, 'Administrator', '2013-06-12 08:47:50', '2013-06-26 09:47:04'),
	(6, 'queen', '$2a$08$WnBzM1pjMFlxZGxweXhiSeH4N6Is5p1sX4MmVofEqBugo8GbbHEXK', 'c102976addb71ccf4de3e555402cdf61', 'queen@simas.ad', 1, 0, 0, 'Ayu Candra', '2013-07-05 10:32:35', '2013-07-05 12:56:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


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
	`tipe` ENUM('ITB','ITC','BBBI','BTBI') NULL COMMENT 'ITB : Iuran Tetap Bulanan, ITC:Iuran Tetap Cicilan, BBBI : Biaya bebas bukan iuran, BTBI: Biaya Tetap Bukan Iuran' COLLATE 'utf8_general_ci',
	`bulan_id` INT(10) NULL,
	`bulan` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`posisi` INT(11) NULL,
	`ket` VARCHAR(250) NULL COLLATE 'utf8_general_ci',
	`jumlah` INT(10) NULL
) ENGINE=MyISAM;


-- Dumping structure for view simasad.vsiswa
DROP VIEW IF EXISTS `vsiswa`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vsiswa`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vsiswa` AS select `rs`.`id` AS `id`,`rs`.`tahunajaran_id` AS `tahunajaran_id`,`t`.`nama` AS `tahunajaran`,`rs`.`rombel_id` AS `rombel_id`,`r`.`nama` AS `rombel`,`r`.`jenjang` AS `jenjang`,`rs`.`siswa_id` AS `siswa_id`,`s`.`nama` AS `siswa`,`s`.`nisn` AS `nisn`,s.aktif from (((`rombelsiswa` `rs` join `siswa` `s` on((`rs`.`siswa_id` = `s`.`id`))) join `rombel` `r` on((`rs`.`rombel_id` = `r`.`id`))) join `tahunajaran` `t` on((`rs`.`tahunajaran_id` = `t`.`id`))) ;


-- Dumping structure for view simasad.vtargetpencapaian
DROP VIEW IF EXISTS `vtargetpencapaian`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vtargetpencapaian`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vtargetpencapaian` AS select ta.id, ta.nama,ta.aktif,ta.posisi, ifnull(tp.jumlah,0) as jumlah, tp.id as target_id
from tahunajaran ta left join target_pencapaian tp on tp.tahunajaran_id = ta.id ;


-- Dumping structure for view simasad.vtransmasuk
DROP VIEW IF EXISTS `vtransmasuk`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `vtransmasuk`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `vtransmasuk` AS select `tm`.`id` AS `id`,`tm`.`created_at` AS `created_at`,`tm`.`updated_at` AS `updated_at`,`tm`.`tanggal` AS `tanggal`,`tm`.`arus` AS `arus`,`tm`.`tahunajaran_id` AS `tahunajaran_id`,`ta`.`nama` AS `tahunajaran`,ta.posisi as posisi_tahunajaran,`tm`.`siswa_id` AS `siswa_id`,`sw`.`nisn` AS `nisn`,`sw`.`nama` AS `siswa`,`dtm`.`id` AS `detil_id`,`dtm`.`jenisbiaya_id` AS `jenisbiaya_id`,`jb`.`nama` AS `jenisbiaya`,`jb`.`tipe` AS `tipe`,`dtm`.`bulan_id` AS `bulan_id`,`bl`.`nama` AS `bulan`,`bl`.`posisi` AS `posisi`,`dtm`.`ket` AS `ket`,`dtm`.`jumlah` AS `jumlah` from (((((`transmasuk` `tm` join `detiltransmasuk` `dtm` on((`dtm`.`transmasuk_id` = `tm`.`id`))) join `jenisbiaya` `jb` on((`dtm`.`jenisbiaya_id` = `jb`.`id`))) left join `siswa` `sw` on((`tm`.`siswa_id` = `sw`.`id`))) left join `bulan` `bl` on((`dtm`.`bulan_id` = `bl`.`id`))) join `tahunajaran` `ta` on((`tm`.`tahunajaran_id` = `ta`.`id`))) ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
