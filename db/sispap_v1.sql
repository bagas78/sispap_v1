-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2023 at 09:30 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sispap_v1`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_absen`
--

CREATE TABLE `t_absen` (
  `absen_id` int(11) NOT NULL,
  `absen_karyawan` int(11) DEFAULT NULL,
  `absen_upah` text DEFAULT NULL,
  `absen_jam` time DEFAULT NULL,
  `absen_tanggal` date DEFAULT NULL,
  `absen_status` enum('masuk','tidak') DEFAULT NULL,
  `absen_bayar` enum('sudah','belum') DEFAULT 'belum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_absen`
--

INSERT INTO `t_absen` (`absen_id`, `absen_karyawan`, `absen_upah`, `absen_jam`, `absen_tanggal`, `absen_status`, `absen_bayar`) VALUES
(11, 4, '70000', '05:08:13', '2023-03-30', 'masuk', 'sudah'),
(12, 3, '70000', '05:08:17', '2023-03-30', 'masuk', 'sudah'),
(19, 2, '0', '03:05:28', '2023-03-30', 'tidak', 'belum'),
(21, 4, '70000', '04:37:11', '2023-03-31', 'masuk', 'sudah'),
(23, 2, '0', '04:53:09', '2023-03-31', 'tidak', 'belum'),
(25, 3, '0', '04:53:50', '2023-03-31', 'tidak', 'belum'),
(26, 4, '70000', '05:14:25', '2023-05-13', 'masuk', 'sudah'),
(27, 3, '70000', '05:14:26', '2023-05-13', 'masuk', 'belum'),
(28, 2, '55000', '05:14:28', '2023-05-13', 'masuk', 'belum');

-- --------------------------------------------------------

--
-- Table structure for table `t_bank`
--

CREATE TABLE `t_bank` (
  `bank_id` int(11) NOT NULL,
  `bank_kode` text NOT NULL,
  `bank_nama` text NOT NULL,
  `bank_tanggal` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_bank`
--

INSERT INTO `t_bank` (`bank_id`, `bank_kode`, `bank_nama`, `bank_tanggal`) VALUES
(1, '002', 'BANK BRI', '2022-11-30'),
(2, '003', 'BANK EKSPOR INDONESIA', '2022-11-30'),
(3, '008', 'BANK MANDIRI', '2022-11-30'),
(4, '009', 'BANK BNI', '2022-11-30'),
(5, '427', 'BANK BNI SYARIAH', '2022-11-30'),
(6, '011', 'BANK DANAMON', '2022-11-30'),
(7, '013', 'PERMATA BANK', '2022-11-30'),
(8, '014', 'BANK BCA', '2022-11-30'),
(9, '016', 'BANK BII', '2022-11-30'),
(10, '019', 'BANK PANIN', '2022-11-30'),
(11, '020', 'BANK ARTA NIAGA KENCANA', '2022-11-30'),
(12, '022', 'BANK NIAGA', '2022-11-30'),
(13, '023', 'BANK BUANA IND', '2022-11-30'),
(14, '026', 'BANK LIPPO', '2022-11-30'),
(15, '028', 'BANK NISP', '2022-11-30'),
(16, '030', 'AMERICAN EXPRESS BANK LTD', '2022-11-30'),
(17, '031', 'CITIBANK N.A.', '2022-11-30'),
(18, '032', 'JP. MORGAN CHASE BANK, N.A.', '2022-11-30'),
(19, '033', 'BANK OF AMERICA, N.A', '2022-11-30'),
(20, '034', 'ING INDONESIA BANK', '2022-11-30'),
(21, '036', 'BANK MULTICOR TBK.', '2022-11-30'),
(22, '037', 'BANK ARTHA GRAHA', '2022-11-30'),
(23, '039', 'BANK CREDIT AGRICOLE INDOSUEZ', '2022-11-30'),
(24, '040', 'THE BANGKOK BANK COMP. LTD', '2022-11-30'),
(25, '041', 'THE HONGKONG & SHANGHAI B.C.', '2022-11-30'),
(26, '042', 'THE BANK OF TOKYO MITSUBISHI UFJ LTD', '2022-11-30'),
(27, '045', 'BANK SUMITOMO MITSUI INDONESIA', '2022-11-30'),
(28, '046', 'BANK DBS INDONESIA', '2022-11-30'),
(29, '047', 'BANK RESONA PERDANIA', '2022-11-30'),
(30, '048', 'BANK MIZUHO INDONESIA', '2022-11-30'),
(31, '050', 'STANDARD CHARTERED BANK', '2022-11-30'),
(32, '052', 'BANK ABN AMRO', '2022-11-30'),
(33, '053', 'BANK KEPPEL TATLEE BUANA', '2022-11-30'),
(34, '054', 'BANK CAPITAL INDONESIA, TBK.', '2022-11-30'),
(35, '057', 'BANK BNP PARIBAS INDONESIA', '2022-11-30'),
(36, '058', 'BANK UOB INDONESIA', '2022-11-30'),
(37, '059', 'KOREA EXCHANGE BANK DANAMON', '2022-11-30'),
(38, '060', 'RABOBANK INTERNASIONAL INDONESIA', '2022-11-30'),
(39, '061', 'ANZ PANIN BANK', '2022-11-30'),
(40, '067', 'DEUTSCHE BANK AG.', '2022-11-30'),
(41, '068', 'BANK WOORI INDONESIA', '2022-11-30'),
(42, '069', 'BANK OF CHINA LIMITED', '2022-11-30'),
(43, '076', 'BANK BUMI ARTA', '2022-11-30'),
(44, '087', 'BANK EKONOMI', '2022-11-30'),
(45, '088', 'BANK ANTARDAERAH', '2022-11-30'),
(46, '089', 'BANK HAGA', '2022-11-30'),
(47, '093', 'BANK IFI', '2022-11-30'),
(48, '095', 'BANK CENTURY, TBK.', '2022-11-30'),
(49, '097', 'BANK MAYAPADA', '2022-11-30'),
(50, '110', 'BANK JABAR', '2022-11-30'),
(51, '111', 'BANK DKI', '2022-11-30'),
(52, '112', 'BPD DIY', '2022-11-30'),
(53, '113', 'BANK JATENG', '2022-11-30'),
(54, '114', 'BANK JATIM', '2022-11-30'),
(55, '115', 'BPD JAMBI', '2022-11-30'),
(56, '116', 'BPD ACEH', '2022-11-30'),
(57, '117', 'BANK SUMUT', '2022-11-30'),
(58, '118', 'BANK NAGARI', '2022-11-30'),
(59, '119', 'BANK RIAU', '2022-11-30'),
(60, '120', 'BANK SUMSEL', '2022-11-30'),
(61, '121', 'BANK LAMPUNG', '2022-11-30'),
(62, '122', 'BPD KALSEL', '2022-11-30'),
(63, '123', 'BPD KALIMANTAN BARAT', '2022-11-30'),
(64, '124', 'BPD KALTIM', '2022-11-30'),
(65, '125', 'BPD KALTENG', '2022-11-30'),
(66, '126', 'BPD SULSEL', '2022-11-30'),
(67, '127', 'BANK SULUT', '2022-11-30'),
(68, '128', 'BPD NTB', '2022-11-30'),
(69, '129', 'BPD BALI', '2022-11-30'),
(70, '130', 'BANK NTT', '2022-11-30'),
(71, '131', 'BANK MALUKU', '2022-11-30'),
(72, '132', 'BPD PAPUA', '2022-11-30'),
(73, '133', 'BANK BENGKULU', '2022-11-30'),
(74, '134', 'BPD SULAWESI TENGAH', '2022-11-30'),
(75, '135', 'BANK SULTRA', '2022-11-30'),
(76, '145', 'BANK NUSANTARA PARAHYANGAN', '2022-11-30'),
(77, '146', 'BANK SWADESI', '2022-11-30'),
(78, '147', 'BANK MUAMALAT', '2022-11-30'),
(79, '151', 'BANK MESTIKA', '2022-11-30'),
(80, '152', 'BANK METRO EXPRESS', '2022-11-30'),
(81, '153', 'BANK SHINTA INDONESIA', '2022-11-30'),
(82, '157', 'BANK MASPION', '2022-11-30'),
(83, '159', 'BANK HAGAKITA', '2022-11-30'),
(84, '161', 'BANK GANESHA', '2022-11-30'),
(85, '162', 'BANK WINDU KENTJANA', '2022-11-30'),
(86, '164', 'HALIM INDONESIA BANK', '2022-11-30'),
(87, '166', 'BANK HARMONI INTERNATIONAL', '2022-11-30'),
(88, '167', 'BANK KESAWAN', '2022-11-30'),
(89, '200', 'BANK TABUNGAN NEGARA (PERSERO)', '2022-11-30'),
(90, '212', 'BANK HIMPUNAN SAUDARA 1906, TBK .', '2022-11-30'),
(91, '213', 'BANK TABUNGAN PENSIUNAN NASIONAL', '2022-11-30'),
(92, '405', 'BANK SWAGUNA', '2022-11-30'),
(93, '422', 'BANK JASA ARTA', '2022-11-30'),
(94, '426', 'BANK MEGA', '2022-11-30'),
(95, '427', 'BANK JASA JAKARTA', '2022-11-30'),
(96, '441', 'BANK BUKOPIN', '2022-11-30'),
(97, '451', 'BANK SYARIAH MANDIRI', '2022-11-30'),
(98, '459', 'BANK BISNIS INTERNASIONAL', '2022-11-30'),
(99, '466', 'BANK SRI PARTHA', '2022-11-30'),
(100, '472', 'BANK JASA JAKARTA', '2022-11-30'),
(101, '484', 'BANK BINTANG MANUNGGAL', '2022-11-30'),
(102, '485', 'BANK BUMIPUTERA', '2022-11-30'),
(103, '490', 'BANK YUDHA BHAKTI', '2022-11-30'),
(104, '491', 'BANK MITRANIAGA', '2022-11-30'),
(105, '494', 'BANK AGRO NIAGA', '2022-11-30'),
(106, '498', 'BANK INDOMONEX', '2022-11-30'),
(107, '501', 'BANK ROYAL INDONESIA', '2022-11-30'),
(108, '503', 'BANK ALFINDO', '2022-11-30'),
(109, '506', 'BANK SYARIAH MEGA', '2022-11-30'),
(110, '513', 'BANK INA PERDANA', '2022-11-30'),
(111, '517', 'BANK HARFA', '2022-11-30'),
(112, '520', 'PRIMA MASTER BANK', '2022-11-30'),
(113, '521', 'BANK PERSYARIKATAN INDONESIA', '2022-11-30'),
(114, '525', 'BANK AKITA', '2022-11-30'),
(115, '526', 'LIMAN INTERNATIONAL BANK', '2022-11-30'),
(116, '531', 'ANGLOMAS INTERNASIONAL BANK', '2022-11-30'),
(117, '523', 'BANK DIPO INTERNATIONAL', '2022-11-30'),
(118, '535', 'BANK KESEJAHTERAAN EKONOMI', '2022-11-30'),
(119, '536', 'BANK UIB', '2022-11-30'),
(120, '542', 'BANK ARTOS IND', '2022-11-30'),
(121, '547', 'BANK PURBA DANARTA', '2022-11-30'),
(122, '548', 'BANK MULTI ARTA SENTOSA', '2022-11-30'),
(123, '553', 'BANK MAYORA', '2022-11-30'),
(124, '555', 'BANK INDEX SELINDO', '2022-11-30'),
(125, '566', 'BANK VICTORIA INTERNATIONAL', '2022-11-30'),
(126, '558', 'BANK EKSEKUTIF', '2022-11-30'),
(127, '559', 'CENTRATAMA NASIONAL BANK', '2022-11-30'),
(128, '562', 'BANK FAMA INTERNASIONAL', '2022-11-30'),
(129, '564', 'BANK SINAR HARAPAN BALI', '2022-11-30'),
(130, '567', 'BANK HARDA', '2022-11-30'),
(131, '945', 'BANK FINCONESIA', '2022-11-30'),
(132, '946', 'BANK MERINCORP', '2022-11-30'),
(133, '947', 'BANK MAYBANK INDOCORP', '2022-11-30'),
(134, '948', 'BANK OCBC – INDONESIA', '2022-11-30'),
(135, '949', 'BANK CHINA TRUST INDONESIA', '2022-11-30'),
(136, '950', 'BANK COMMONWEALTH', '2022-11-30'),
(137, '425', 'BANK BJB SYARIAH', '2022-11-30'),
(138, '688', 'BPR KS (KARYAJATNIKA SEDAYA)', '2022-11-30'),
(139, '789', 'INDOSAT DOMPETKU', '2022-11-30'),
(140, '911', 'TELKOMSEL TCASH', '2022-11-30'),
(141, '911', 'LINKAJA', '2022-11-30');

-- --------------------------------------------------------

--
-- Table structure for table `t_barang`
--

CREATE TABLE `t_barang` (
  `barang_id` int(11) NOT NULL,
  `barang_kode` text NOT NULL,
  `barang_kategori` text NOT NULL,
  `barang_stok` text NOT NULL DEFAULT '0',
  `barang_nama` text NOT NULL,
  `barang_satuan` enum('kg','ekor','pcs','tray') NOT NULL,
  `barang_tanggal` date NOT NULL DEFAULT curdate(),
  `barang_hapus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_barang`
--

INSERT INTO `t_barang` (`barang_id`, `barang_kode`, `barang_kategori`, `barang_stok`, `barang_nama`, `barang_satuan`, `barang_tanggal`, `barang_hapus`) VALUES
(7, 'KB001', '1', '0', 'RAHMAT', 'tray', '2023-02-27', 1),
(8, 'KB002', '1', '0', 'TUKUL', 'tray', '2023-02-27', 1),
(9, 'KB003', '1', '0', 'Telur Putihan', 'tray', '2023-02-27', 1),
(11, 'KB005', '2', '0', 'Ayam Mati', 'ekor', '2023-02-27', 1),
(12, 'KB006', '3', '0', 'Layer Concentrate CAL 9 Mash', 'kg', '2023-02-27', 1),
(13, 'KB007', '3', '0', 'Pakan Ayam Sinta', 'kg', '2023-02-27', 1),
(14, 'KB008', '3', '0', 'K62 New Hope', 'kg', '2023-02-27', 1),
(15, 'KB009', '3', '0', 'K36 Malindo', 'kg', '2023-02-27', 1),
(16, 'KB0010', '3', '0', 'Phokpand', 'kg', '2023-02-27', 1),
(17, 'KB0011', '4', '0', 'NEOBRO', 'pcs', '2023-02-27', 1),
(18, 'KB0012', '4', '0', 'Viterna', 'pcs', '2023-02-27', 1),
(19, 'KB0013', '4', '0', 'Masamix Bro Premix', 'pcs', '2023-02-27', 1),
(24, 'KB0014', '2', '0', 'Ayam Afkir', 'ekor', '2023-02-28', 1),
(27, 'KB0014', '5', '0', 'Ayam Petelur Sussex', 'ekor', '2023-05-03', 0),
(28, 'KB0015', '5', '51556', 'Ayam Petelur Coklat/Hibrida', 'ekor', '2023-05-03', 0),
(29, 'KB0016', '5', '0', 'Ayam Petelur Putih', 'ekor', '2023-05-03', 0),
(31, 'KB0017', '4', '500', 'BETTERZYM', 'pcs', '2023-07-27', 0),
(32, 'KB0018', '4', '29', 'MEDIVAC CORYZA', 'pcs', '2023-07-27', 0),
(33, 'KB0019', '4', '800', 'EGG STIMULANT', 'pcs', '2023-07-29', 0),
(34, 'KB0020', '4', '185', 'CYPROTIL PLUS', 'pcs', '2023-07-29', 0),
(35, 'KB0021', '3', '4', 'TOLTRADEX', 'kg', '2023-07-29', 1),
(36, 'KB0022', '4', '3', 'TOLTRADEX', 'pcs', '2023-07-29', 0),
(37, 'KB0023', '3', '0', 'ENDOMIX', 'kg', '2023-07-29', 1),
(38, 'KB0024', '4', '15', 'ENDOMIX', 'pcs', '2023-07-29', 0),
(39, 'KB0025', '4', '420', 'MEDIVAC ND-IB', 'pcs', '2023-07-29', 0),
(40, 'KB0026', '4', '0', 'LD BOTOL ', 'pcs', '2023-07-29', 0),
(41, 'KB0027', '4', '2', 'MULTIIC HC', 'pcs', '2023-07-29', 0),
(42, 'KB0028', '4', '20', 'SUP ELEKTOLIT', 'pcs', '2023-07-29', 0),
(43, 'KB0029', '4', '0', 'MDCP', 'pcs', '2023-07-29', 0),
(44, 'KB0030', '4', '10', 'PITABLOCK', 'pcs', '2023-07-29', 0),
(45, 'KB0031', '4', '40', 'AGNERAL', 'pcs', '2023-07-29', 0),
(46, 'KB0032', '3', '0', 'GUMBONAL', 'kg', '2023-07-29', 1),
(47, 'KB0033', '4', '19', 'MEDIVAC AI', 'pcs', '2023-07-29', 0),
(48, 'KB0034', '4', '7', 'KOLERIDIN-K', 'pcs', '2023-07-29', 0),
(49, 'KB0035', '4', '1300', 'L-MATHE', 'pcs', '2023-07-29', 0),
(50, 'KB0036', '4', '1175', 'LYSHINE', 'pcs', '2023-07-29', 0),
(51, 'KB0037', '4', '0', 'CYPROTHIL', 'pcs', '2023-07-29', 1),
(52, 'KB0038', '1', '0', 'WAWAN', 'tray', '2023-07-30', 1),
(53, 'KB0039', '1', '0', 'IRMAWAN', 'tray', '2023-07-30', 1),
(54, 'KB0040', '1', '0', 'MBAHE', 'tray', '2023-07-30', 1),
(55, 'KB0041', '1', '0', 'SUGI', 'tray', '2023-07-30', 1),
(56, 'KB0042', '1', '0', 'NOVI', 'tray', '2023-07-30', 1),
(57, 'KB0043', '1', '0', 'DONI', 'tray', '2023-07-30', 1),
(58, 'KB0044', '1', '0', 'MAXI', 'tray', '2023-07-30', 1),
(59, 'KB0045', '4', '200', 'SUPER VIT BLEND HC', 'pcs', '2023-08-01', 0),
(60, 'KB0046', '4', '0', 'AGRIMOX', 'pcs', '2023-08-01', 0),
(61, 'KB0047', '4', '0', 'VAKSIMUNE CORYZA L', 'pcs', '2023-08-01', 0),
(62, 'KB0048', '4', '0', 'VAKSIMUNE ND LS IB', 'pcs', '2023-08-01', 0),
(63, 'KB0049', '4', '0', 'AMCOL SUPER PLUS', 'pcs', '2023-08-01', 0),
(64, 'KB0050', '4', '1600', 'SAVERAL HC', 'kg', '2023-08-03', 0),
(65, 'KB0051', '4', '0', 'VAKSINASI KHUSUS', 'pcs', '2023-08-03', 0),
(66, 'KB0052', '3', '0', 'KATUL H. AGUS', 'kg', '2023-08-05', 1),
(67, 'KB0053', '1', '0', 'KATUL H. AGUS', 'kg', '2023-08-05', 1),
(68, 'KB0054', '3', '10122', 'JAGUNG PAK HUSEN', 'kg', '2023-08-05', 0),
(69, 'KB0055', '3', '159060', 'JAGUNG', 'kg', '2023-08-05', 0),
(70, 'KB0056', '3', '41116', 'KATUL', 'kg', '2023-08-05', 0),
(71, 'KB0057', '3', '8020', 'BKK', 'kg', '2023-08-05', 0),
(72, 'KB0058', '3', '10639', 'MBM', 'kg', '2023-08-05', 0),
(73, 'KB0059', '3', '0', 'MENIR BATU', 'kg', '2023-08-05', 0),
(74, 'KB0060', '2', '0', 'MAXI', 'ekor', '2023-08-05', 1),
(75, 'KB0061', '2', '0', 'AYAM HIDUP', 'ekor', '2023-08-05', 1),
(76, 'KB0062', '2', '0', 'AYAM MATI', 'ekor', '2023-08-05', 0),
(77, 'KB0063', '2', '0', 'AYAM AFKIR', 'kg', '2023-08-05', 0),
(78, 'KB0064', '1', '-124005', 'TELUR MERAH', 'tray', '2023-08-05', 0),
(79, 'KB0065', '4', '2', 'NOZZLE SOCOREX', 'pcs', '2023-08-14', 0),
(80, 'KB0066', '4', '2', 'SOCOREX SPARE VALVE', 'pcs', '2023-08-14', 0),
(81, 'KB0067', '4', '2', 'VALVE', 'pcs', '2023-08-14', 0),
(82, 'KB0068', '4', '250', 'ND IB LIVE', 'pcs', '2023-08-14', 0),
(83, 'KB0069', '4', '14', 'LT.IVAX + DIIL', 'pcs', '2023-08-14', 0),
(84, 'KB0070', '4', '2000', 'BIOFOS', 'kg', '2023-08-17', 0),
(85, 'KB0071', '4', '10', 'IMUSTIM', 'pcs', '2023-08-17', 0),
(86, 'KB0072', '4', '4', 'MULTIMIX HC', 'pcs', '2023-08-24', 0),
(87, 'KB0073', '4', '170025', 'DELSTAR PLUS', 'pcs', '2023-08-24', 0),
(88, 'KB0074', '4', '2', 'BIO AQUA', 'pcs', '2023-08-24', 0),
(89, 'KB0075', '4', '19', 'MEDIVAC POX', 'pcs', '2023-08-28', 0),
(90, 'KB0076', '4', '275', 'L-THREONINE', 'kg', '2023-09-04', 0),
(91, 'KB0077', '4', '160', 'L-THRYPTOFAN', 'kg', '2023-09-04', 0),
(92, 'KB0078', '4', '20', 'VITALINK', 'kg', '2023-09-04', 0),
(93, 'KB0079', '4', '100', 'PHYPROZIME', 'kg', '2023-09-04', 0),
(94, 'KB0080', '4', '10', 'MEDIVAC ND-GUMBOLO', 'pcs', '2023-09-06', 0),
(95, 'KB0081', '4', '1', 'NAMPAN RANSUM MERAH', 'pcs', '2023-09-06', 0),
(96, 'KB0082', '4', '0', 'MEDIVAC CORYZA', 'pcs', '2023-09-06', 0),
(97, 'KB0083', '4', '4', 'GUMBONAL', 'pcs', '2023-09-06', 0),
(98, 'KB0084', '4', '20', 'MEDIVAC GUMBORO', 'pcs', '2023-09-18', 0),
(99, 'KB0085', '4', '2', 'RHISOMIX 208', 'pcs', '2023-09-18', 0),
(100, 'KB0086', '4', '12', 'INTROVIT ECCLEN', 'pcs', '2023-09-18', 0),
(101, 'KB0087', '4', '1', 'PARAGIN', 'pcs', '2023-09-18', 0),
(102, 'KB0088', '4', '50', 'TUTUP DOC FEEDER', 'pcs', '2023-09-22', 0),
(103, 'KB0089', '4', '0', 'SUPER ELEKTROLIT', 'pcs', '2023-09-22', 0),
(104, 'KB0090', '4', '6', 'STRONG N FIT', 'pcs', '2023-09-22', 0),
(105, 'KB0091', '4', '11', 'UJI RANSUM KADAR PROTEIN', 'pcs', '2023-09-22', 0),
(106, 'KB0092', '4', '10', 'KOCCINE ST', 'pcs', '2023-09-22', 0),
(107, 'KB0093', '4', '0', 'INNOPHOS', 'pcs', '2023-09-24', 0),
(108, 'KB0094', '4', '1000', 'MCP', 'pcs', '2023-09-24', 0),
(109, 'KB0095', '4', '1000', 'CHOLINE CLORIDE', 'pcs', '2023-09-24', 0),
(110, 'KB0096', '4', '20', 'ENFLOSINORAL SOLUTION', 'pcs', '2023-09-29', 0),
(111, 'KB0097', '4', '175', 'MYCOSORB', 'pcs', '2023-10-10', 0),
(112, 'KB0098', '4', '50', 'ALLZYM', 'pcs', '2023-10-10', 0),
(113, 'KB0099', '4', '500', 'MEITICIA', 'kg', '2023-10-10', 0),
(114, 'KB00100', '4', '150', 'HIMMVAC ND IB LIVE', 'pcs', '2023-10-10', 0),
(115, 'KB00101', '4', '100', 'EXAL_H', 'pcs', '2023-10-11', 0),
(116, 'KB00102', '4', '0', 'PHYROZIME', 'pcs', '2023-10-11', 0),
(117, 'KB00103', '4', '5', 'IMUSTIM', 'pcs', '2023-10-19', 0),
(118, 'KB00104', '4', '6', 'IJKTIV B_PLEX', 'pcs', '2023-10-19', 0),
(119, 'KB00105', '4', '1', 'NEO ANTISEP', 'pcs', '2023-10-23', 0),
(120, 'KB00106', '4', '200', 'Lysintas', 'kg', '2023-11-02', 0),
(121, 'KB00107', '4', '32', 'WORMELES', 'pcs', '2023-11-02', 0),
(122, 'KB00108', '4', '10', 'AMPROLIUM', 'kg', '2023-11-02', 0),
(123, 'KB00109', '4', '100', 'SOBI', 'kg', '2023-11-02', 0),
(124, 'KB00110', '4', '100', 'ALGIMUN', 'pcs', '2023-11-04', 0),
(125, 'KB00111', '4', '50', 'VIT.C COASTED', 'kg', '2023-11-06', 0),
(126, 'KB00112', '4', '102050', 'BIOPLEX.B', 'kg', '2023-11-08', 0),
(127, 'KB00113', '4', '60', 'Vita stress', 'pcs', '2023-11-13', 0),
(128, 'KB00114', '4', '1', 'UJI KADAR KALSIUM', 'pcs', '2023-11-13', 0),
(129, 'KB00115', '4', '1', 'UJI RANSUM KADAR ABU', 'pcs', '2023-11-13', 0),
(130, 'KB00116', '4', '10', 'MEDIVAC ND- EDS- IB', 'pcs', '2023-11-13', 0),
(131, 'KB00117', '4', '0', 'MEDIVAC ND GMB', 'pcs', '2023-11-13', 0),
(132, 'KB00118', '4', '25', 'SODIUM BIKARBONAT', 'kg', '2023-11-13', 0),
(133, 'KB00119', '4', '60', 'FORTEVIT', 'pcs', '2023-11-19', 0),
(134, 'KB00120', '3', '0', 'GANDUM', 'kg', '2023-11-21', 0),
(135, 'KB00120', '3', '5787', 'GANDUM', 'kg', '2023-11-21', 0),
(136, 'KB00122', '4', '20', 'FLAVOR', 'kg', '2023-11-22', 0),
(137, 'KB00123', '4', '2', 'DIATOMITE SPECTRA', 'kg', '2023-11-25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_barang_kategori`
--

CREATE TABLE `t_barang_kategori` (
  `barang_kategori_id` int(11) NOT NULL,
  `barang_kategori_nama` text NOT NULL,
  `barang_kategori_satuan` enum('kg','ekor','pcs','tray','butir') NOT NULL,
  `barang_kategori_tanggal` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_barang_kategori`
--

INSERT INTO `t_barang_kategori` (`barang_kategori_id`, `barang_kategori_nama`, `barang_kategori_satuan`, `barang_kategori_tanggal`) VALUES
(1, 'telur', 'tray', '2023-02-27'),
(2, 'ayam', 'ekor', '2023-02-27'),
(3, 'pakan', 'kg', '2023-02-27'),
(4, 'obat', 'pcs', '2023-02-27'),
(5, 'doc', 'ekor', '2023-05-03'),
(6, 'butir', 'butir', '2023-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `t_detail_user`
--

CREATE TABLE `t_detail_user` (
  `detail_id` int(11) NOT NULL,
  `detail_id_user` int(11) DEFAULT NULL,
  `detail_jabatan` varchar(50) DEFAULT NULL,
  `detail_pendidikan` text DEFAULT NULL,
  `detail_alamat` text DEFAULT NULL,
  `detail_biodata` text DEFAULT NULL,
  `detail_hapus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_detail_user`
--

INSERT INTO `t_detail_user` (`detail_id`, `detail_id_user`, `detail_jabatan`, `detail_pendidikan`, `detail_alamat`, `detail_biodata`, `detail_hapus`) VALUES
(1, 2, 'BOS', '-', 'Pandanarum ', '-', 0),
(12, 3, NULL, NULL, NULL, NULL, 0),
(13, 4, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_gaji`
--

CREATE TABLE `t_gaji` (
  `gaji_id` int(11) NOT NULL,
  `gaji_karyawan` text NOT NULL,
  `gaji_nominal` text DEFAULT NULL,
  `gaji_keterangan` text DEFAULT NULL,
  `gaji_tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_gaji`
--

INSERT INTO `t_gaji` (`gaji_id`, `gaji_karyawan`, `gaji_nominal`, `gaji_keterangan`, `gaji_tanggal`) VALUES
(4, '4', '70000', 'Ambil butuh uang', '2023-03-30'),
(5, '3', '70000', 'Waktunya bayaran', '2023-03-30'),
(6, '4', '140000', '-', '2023-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `t_hutang`
--

CREATE TABLE `t_hutang` (
  `hutang_id` int(11) NOT NULL,
  `hutang_nomor` text DEFAULT NULL,
  `hutang_keterangan` text DEFAULT NULL,
  `hutang_tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_hutang`
--

INSERT INTO `t_hutang` (`hutang_id`, `hutang_nomor`, `hutang_keterangan`, `hutang_tanggal`) VALUES
(8, 'PB-130523-1', NULL, NULL),
(9, 'PB-130523-2', NULL, NULL),
(10, 'PB-130523-3', 'DI bayar cash', '2023-05-13'),
(11, 'PB-280723-4', NULL, NULL),
(12, 'PB-280723-5', NULL, NULL),
(13, 'PB-300723-6', NULL, NULL),
(14, 'PB-300723-7', NULL, NULL),
(15, 'PB-300723-8', NULL, NULL),
(16, 'PB-300723-9', NULL, NULL),
(17, 'PB-300723-10', NULL, NULL),
(18, 'PB-300723-11', NULL, NULL),
(19, 'PB-300723-12', NULL, NULL),
(20, 'PB-300723-15', NULL, NULL),
(21, 'PB-300723-17', NULL, NULL),
(22, 'PB-300723-18', NULL, NULL),
(23, 'PB-300723-19', NULL, NULL),
(24, 'PB-300723-20', 'lunas transferr', '2023-08-11'),
(25, 'PB-300723-21', NULL, NULL),
(26, 'PB-300723-22', NULL, NULL),
(27, 'PB-300723-23', NULL, NULL),
(28, 'PB-300723-24', NULL, NULL),
(29, 'PB-300723-25', NULL, NULL),
(30, 'PB-300723-26', 'lunas transfer', '2023-11-08'),
(31, 'PB-300723-27', 'lunas trnsfer', '2023-11-08'),
(32, 'PB-300723-28', 'SUDH DITANDAI LUNAS ', '2023-07-30'),
(33, 'PB-300723-29', 'LUNASTRNSFER', '2023-08-31'),
(34, 'PB-300723-30', NULL, NULL),
(35, 'PB-300723-31', 'tf bca', '2023-09-27'),
(36, 'PB-300723-32', 'SUDAH LUNAS DI TRANSFER ', '2023-09-26'),
(37, 'PB-010823-33', 'LUNAS TF', '2023-11-23'),
(38, 'PB-020823-34', NULL, NULL),
(39, 'PB-040823-36', 'LUNAS TF', '2023-10-26'),
(40, 'PB-060823-39', 'SUDAH LUNAS JAGUNG', '2023-08-29'),
(41, 'PB-100823-44', 'LUNAS TF', '2023-10-26'),
(42, 'PB-120823-45', NULL, NULL),
(43, 'PB-150823-46', NULL, NULL),
(44, 'PB-150823-47', 'tf bca', '2023-10-14'),
(45, 'PB-180823-48', NULL, NULL),
(46, 'PB-180823-49', 'tf bca', '2023-10-14'),
(47, 'PB-250823-50', 'LUNAS TF', '2023-11-11'),
(48, 'PB-250823-51', NULL, NULL),
(49, 'PB-250823-52', 'lunas transfer', '2023-11-08'),
(50, 'PB-250823-53', 'lunas tf bca', '2023-11-02'),
(51, 'PB-260823-54', 'LUNAS TF', '2023-11-10'),
(52, 'PB-260823-55', 'LUNAS TF', '2023-10-26'),
(53, 'PB-290823-56', 'tf bca', '2023-10-14'),
(54, 'PB-030923-57', 'tf bca', '2023-10-14'),
(55, 'PB-030923-58', NULL, NULL),
(56, 'PB-030923-59', 'LUNAS TRANSFER ', '2023-08-24'),
(57, 'PB-050923-60', 'SUDAH LUNAS', '2023-11-05'),
(58, 'PB-050923-61', 'LUNAS TF', '2023-10-26'),
(59, 'PB-070923-62', 'tf bca', '2023-10-14'),
(60, 'PB-070923-63', 'TRANSFER', '2023-11-08'),
(61, 'PB-070923-64', 'TRANSFER BCA', '2023-11-08'),
(62, 'PB-070923-65', 'TRANSFER BCA', '2023-08-11'),
(63, 'PB-070923-66', 'TRANSFER', '2023-08-11'),
(64, 'PB-120923-67', 'LUNAS TF', '2023-10-11'),
(65, 'PB-190923-69', 'TRANSFER BCA', '2023-11-07'),
(66, 'PB-190923-70', 'TF BCA', '2023-11-07'),
(67, 'PB-190923-71', NULL, NULL),
(68, 'PB-190923-72', 'lunas tf ', '2023-10-25'),
(69, 'PB-190923-73', 'LUNAS TF', '2023-11-24'),
(70, 'PB-190923-74', 'LUNAS TF', '2023-11-24'),
(71, 'PB-230923-75', 'TF BCA', '2023-11-07'),
(72, 'PB-230923-76', 'TF BCA', '2023-11-07'),
(73, 'PB-230923-77', 'tf bc ', '2023-09-27'),
(74, 'PB-230923-78', 'TF BCA', '2023-11-07'),
(75, 'PB-230923-79', 'TF BCA', '2023-11-07'),
(76, 'PB-230923-80', 'TRANSFER BCA', '2023-11-10'),
(77, 'PB-250923-81', 'LUNAS TF', '2023-10-23'),
(78, 'PB-250923-82', 'LUNAS TF BCA', '2023-11-23'),
(79, 'PB-250923-83', 'LUNAS TF', '2023-11-23'),
(80, 'PB-300923-84', NULL, NULL),
(81, 'PB-041023-85', 'LUNS TF BCA\r\n', '2023-11-02'),
(82, 'PB-101023-86', NULL, NULL),
(83, 'PB-101023-87', 'LUNAS TF', '2023-10-09'),
(84, 'PB-111023-88', 'total Rp. 6.300.000 sudah  termasuk pajak', '2023-10-07'),
(85, 'PB-121023-89', NULL, NULL),
(86, 'PB-121023-90', NULL, NULL),
(87, 'PB-121023-91', NULL, NULL),
(88, 'PB-191023-95', NULL, NULL),
(89, 'PB-241023-99', NULL, NULL),
(90, 'PB-241023-100', NULL, NULL),
(91, 'PB-311023-102', 'LUNAS TF', '2023-11-13'),
(92, 'PB-311023-103', 'LUNAS TF', '2023-10-15'),
(93, 'PB-311023-104', NULL, NULL),
(94, 'PB-311023-105', NULL, NULL),
(95, 'PB-031123-110', 'LUNAS TF', '2023-10-28'),
(96, 'PB-031123-111', 'lunas transfer', '2023-11-02'),
(97, 'PB-031123-112', NULL, NULL),
(98, 'PB-031123-116', NULL, NULL),
(99, 'PB-051123-124', NULL, NULL),
(100, 'PB-051123-125', NULL, NULL),
(101, 'PB-051123-126', NULL, NULL),
(102, 'PB-051123-127', NULL, NULL),
(103, 'PB-071123-129', NULL, NULL),
(104, 'PB-071123-130', NULL, NULL),
(105, 'PB-071123-131', NULL, NULL),
(106, 'PB-071123-133', NULL, NULL),
(107, 'PB-071123-134', NULL, NULL),
(108, 'PB-091123-135', NULL, NULL),
(109, 'PB-091123-136', NULL, NULL),
(110, 'PB-091123-137', NULL, NULL),
(111, 'PB-151123-146', NULL, NULL),
(112, 'PB-201123-147', NULL, NULL),
(113, 'PB-201123-148', NULL, NULL),
(114, 'PB-201123-149', NULL, NULL),
(115, 'PB-201123-150', NULL, NULL),
(116, 'PB-201123-151', NULL, NULL),
(117, 'PB-231123-156', NULL, NULL),
(118, 'PB-231123-157', NULL, NULL),
(119, 'PB-231123-158', NULL, NULL),
(120, 'PB-261123-159', NULL, NULL),
(121, 'PB-261123-161', NULL, NULL),
(122, 'PB-261123-164', NULL, NULL),
(123, 'PB-261123-165', NULL, NULL),
(124, 'PB-261123-166', NULL, NULL),
(125, 'PB-271123-167', NULL, NULL),
(126, 'PB-271123-168', NULL, NULL),
(127, 'PB-271123-169', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_kandang`
--

CREATE TABLE `t_kandang` (
  `kandang_id` int(11) NOT NULL,
  `kandang_kode` text NOT NULL,
  `kandang_nama` text NOT NULL,
  `kandang_alamat` text NOT NULL,
  `kandang_luas` text NOT NULL,
  `kandang_keterangan` text NOT NULL,
  `kandang_ayam` text NOT NULL DEFAULT '0',
  `kandang_tanggal` date NOT NULL DEFAULT curdate(),
  `kandang_hapus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_kandang`
--

INSERT INTO `t_kandang` (`kandang_id`, `kandang_kode`, `kandang_nama`, `kandang_alamat`, `kandang_luas`, `kandang_keterangan`, `kandang_ayam`, `kandang_tanggal`, `kandang_hapus`) VALUES
(4, 'KD001', 'Kandang timur', 'Plumpung rejo', '1000', '-', '150', '2023-05-13', 0),
(5, 'KD002', 'Kandang barat', 'Plumpung rejo', '1500', '-', '50', '2023-05-13', 1),
(6, 'KD003', 'IRMAWAN', 'KADEMANGAN', '5', 'BESAR', '554', '2023-08-01', 1),
(7, 'KD004', 'MAXI', 'MANADO', '5', 'UNTUK LUAS DIISI DENGA JULAH KANDANG', '1789', '2023-08-04', 1),
(8, 'KD005', 'P.DONI', 'MANADO', '4', 'LUAS KANDAG ADALHH JULAH KANDANG\r\n', '136', '2023-08-04', 1),
(9, 'KD006', 'WAWAN', 'WLINGI', '5', 'LUAS KANDAG ADALAH LUAS KADANG', '215', '2023-08-04', 1),
(10, 'KD007', 'RAHMAT', 'KANIGORO', '2', 'LUAS KANDANG ADALAH JULAH KANDANG', '181', '2023-08-04', 1),
(11, 'KD008', 'WAHID', 'JATEN KADEMANGAN', '3', 'LUAS KANDANG ADALAH JUMLAH KANDANG', '274', '2023-08-04', 1),
(12, 'KD009', 'HARI', 'PLUMPUNG', '0', 'KELILING', '0', '2023-08-04', 1),
(13, 'KD0010', 'TUKUL', 'TENGGONG', '9', 'LUAS KANDANG ADALAH JUMLAHH KANDANG', '14268', '2023-08-04', 1),
(14, 'KD0011', 'SUGIONO', 'PLUMPUNGREJO', '1', 'LUAS KANDANG  ADALAH JULAHH KANDANG', '0', '2023-08-04', 1),
(15, 'KD0012', 'SUGIONO', 'PLUMPUNGREJO', '1', 'LUAS KANDANG  ADALAH JULAHH KANDANG', '0', '2023-08-04', 1),
(16, 'KD0013', 'MAXI', 'MANADO', '5', 'LUAS KANDANG ADALAH JUMLAH KANDANG', '7304', '2023-08-07', 1),
(17, 'KD0014', 'KANDANG RUMAH', 'PLUMPUNGREJO', '000', 'LUAS TIDAK DIKETAHUI', '50000', '2023-08-07', 1),
(18, 'KD0015', 'KANDANG TIMUR', 'dsn.plumpungrejo ', '0000', 'kandang mas novi ', '12000', '2023-10-19', 1),
(19, 'KD0016', 'kandang azis', 'barat ma triani', '000', 'di pakan  aazies', '4000', '2023-10-19', 1),
(20, 'KD0017', 'mas novi timur', 'plumpungrejo ', '000', 'kandang depan lapangan bagian timur', '4757', '2023-11-05', 0),
(21, 'KD0018', 'mas novi tengah', 'plumpungrejo', '000', 'kandang depan lapangan sebelah barat', '5389', '2023-11-05', 0),
(22, 'KD0019', 'azies ', 'plumpungrejo', '000', 'kulon mbak triani', '3816', '2023-11-05', 0),
(23, 'KD0020', 'mas doni Q', 'plumpungrejo', '000', 'bagian Q', '5608', '2023-11-05', 1),
(24, 'KD0021', 'mas doni O', 'PLUMPUNGREJO', '000', 'MAS DONI BAGIAN O', '5608', '2023-11-05', 1),
(25, 'KD0022', 'mas doni O', 'PLUMPUNGREJO', '000', 'BAGIAN Q', '1284', '2023-11-05', 0),
(26, 'KD0023', 'mas doni U', 'plumpungrejo ', '000', 'bagian U', '1120', '2023-11-05', 0),
(27, 'KD0024', 'mas doni M', 'PLUMPUNGREJO', '000', 'bagian M', '3204', '2023-11-05', 0),
(28, 'KD0025', ' mas wawan K', 'PLUMPUNGREJO', '000', 'BAGIAN K', '2590', '2023-11-05', 0),
(29, 'KD0026', 'mas wawan L', 'PLUMPUNGREJO ', '000', 'BAGIAN L', '920', '2023-11-05', 0),
(30, 'KD0027', 'mas wawan J', 'PLUMPUNGREJO', '000', 'BAGIAN J', '896', '2023-11-05', 0),
(31, 'KD0028', 'mas wawan F', 'PLUMPUNGREJO', '000', 'BAGIAN F', '1840', '2023-11-05', 1),
(32, 'KD0029', 'mas wawan V', 'PLUMPUNGREJO', '000', 'BAGIAN V', '1840', '2023-11-05', 0),
(33, 'KD0030', 'pak wahid H', 'PLUMPUNGREJO', '000', 'BAGIAN H', '1360', '2023-11-05', 0),
(34, 'KD0031', 'pak wahid A', 'PLUMPUNGREJO', '000', 'BAGIAN A', '1000', '2023-11-05', 0),
(35, 'KD0032', 'pak wahid B', 'PLUMPUNGREJO', '000', 'BAGIAN B', '1792', '2023-11-05', 0),
(36, 'KD0033', 'irmawan G', 'PLUMPUNGREJO', '000', 'BAGIAN G', '480', '2023-11-05', 0),
(37, 'KD0034', 'irmawan C', 'PLUMPUNGREJO', '000', 'BAGIAN C', '1000', '2023-11-05', 0),
(38, 'KD0035', 'irmawan D', 'PLUMPUNGREJO', '000', 'BAGIAN D', '1816', '2023-11-05', 0),
(39, 'KD0036', 'irmawan T', 'PLUMPUNGREJO', '000', 'BAGIAN T', '754', '2023-11-05', 0),
(40, 'KD0037', 'irmawan S', 'PLUMPUNGREJO', '000', 'BAGIAN S', '840', '2023-11-05', 0),
(41, 'KD0038', 'rahmat I', 'PLUMPUNGREJO ', '000', 'BAGIAN I', '560', '2023-11-05', 0),
(42, 'KD0039', 'rahmat N', 'PLUMPUNGREJO', '000', 'BAGIAN N', '3240', '2023-11-05', 0),
(43, 'KD0040', 'rahmat E', 'PLUMPUNGREJO', '000', 'BAGIAN E', '820', '2023-11-05', 0),
(44, 'KD0041', 'maksi A', 'PLUMPUNGREJO', '000', 'BAGIAN A', '972', '2023-11-05', 0),
(45, 'KD0042', 'maksi B', 'PLUMPUNGREJO', '000', 'BAGIAN B', '1904', '2023-11-05', 0),
(46, 'KD0043', 'maksi C', 'PLUMPUNGREJO', '000', 'BAGIAN C', '1896', '2023-11-05', 0),
(47, 'KD0044', 'maksi H', 'PLUMPUNGREJO', '000', 'BAGIAN H', '1500', '2023-11-05', 0),
(48, 'KD0045', 'maksi I', 'plumpungrejo', '000', 'BAGIAN I', '1500', '2023-11-05', 0),
(49, 'KD0046', 'pak tukul A', 'PLUMPUNGREJO', '000', 'BAGIAN A', '2210', '2023-11-05', 0),
(50, 'KD0047', 'pak tukul B', 'PLUMPUNGREJO ', '000', 'BAGIAN B', '1840', '2023-11-05', 0),
(51, 'KD0048', 'pak tukul C', 'PLUMPUNGREJO', '000', 'BAGIAN C', '2230', '2023-11-05', 0),
(52, 'KD0049', 'pak tukul D', 'PLUMPUNGREJO', '000', 'BAGIAN D', '0', '2023-11-05', 0),
(53, 'KD0050', 'pak tukul E', 'plumpungrejo', '000', 'bagian E', '1336', '2023-11-05', 0),
(54, 'KD0051', 'pak tukul F', 'PLUMPUNGREJO', '000', 'BAGIAN F', '1428', '2023-11-05', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_kandang_log`
--

CREATE TABLE `t_kandang_log` (
  `kandang_log_id` int(11) NOT NULL,
  `kandang_log_user` text DEFAULT NULL,
  `kandang_log_kandang` text DEFAULT NULL,
  `kandang_log_barang` text DEFAULT NULL,
  `kandang_log_stok` text DEFAULT NULL,
  `kandang_log_jumlah` text DEFAULT NULL,
  `kandang_log_umur` text DEFAULT NULL,
  `kandang_log_vaksin` text DEFAULT NULL,
  `kandang_log_tanggal` date DEFAULT curdate(),
  `kandang_log_hapus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_kandang_log`
--

INSERT INTO `t_kandang_log` (`kandang_log_id`, `kandang_log_user`, `kandang_log_kandang`, `kandang_log_barang`, `kandang_log_stok`, `kandang_log_jumlah`, `kandang_log_umur`, `kandang_log_vaksin`, `kandang_log_tanggal`, `kandang_log_hapus`) VALUES
(6, '2', '5', '27', '100', '50', NULL, NULL, '2023-05-13', 0),
(7, '2', '4', '28', '100', '50', NULL, NULL, '2023-05-13', 0),
(8, '2', '6', '27', '50', '50', NULL, NULL, '2023-08-03', 0),
(10, '2', '13', '28', '0', '14268', NULL, NULL, '2023-08-04', 0),
(11, '2', '7', '28', '0', '742', NULL, NULL, '2023-08-05', 0),
(12, '2', '7', '28', '-742', '343', NULL, NULL, '2023-08-05', 0),
(13, '2', '7', '28', '-1085', '704', NULL, NULL, '2023-08-05', 0),
(14, '2', '6', '28', '-1789', '504', NULL, NULL, '2023-08-05', 0),
(15, '2', '8', '28', '-2293', '136', NULL, NULL, '2023-08-05', 0),
(16, '2', '9', '28', '-2429', '215', NULL, NULL, '2023-08-05', 0),
(17, '2', '10', '28', '-2644', '181', NULL, NULL, '2023-08-05', 0),
(18, '2', '11', '28', '-2825', '274', NULL, NULL, '2023-08-05', 0),
(19, '2', '14', '28', '-3099', '348', NULL, NULL, '2023-08-05', 1),
(20, '2', '16', '28', '10000', '7304', NULL, NULL, '2023-08-07', 0),
(21, '2', '17', '28', '52696', '50000', NULL, NULL, '2023-08-07', 0),
(22, '2', '18', '28', '30000', '12000', NULL, NULL, '2023-10-19', 0),
(23, '2', '19', '28', '18000', '4000', NULL, NULL, '2023-10-19', 0),
(24, '2', '20', '28', '14000', '4757', NULL, NULL, '2023-11-05', 0),
(25, '2', '21', '28', '13243', '5389', NULL, NULL, '2023-11-05', 0),
(26, '2', '22', '28', '7854', '3816', NULL, NULL, '2023-11-05', 0),
(27, '2', '23', '28', '114038', '5608', NULL, NULL, '2023-11-05', 0),
(28, '2', '24', '28', '108430', '5608', NULL, NULL, '2023-11-05', 0),
(29, '2', '25', '28', '88430', '1284', NULL, NULL, '2023-11-05', 0),
(30, '2', '26', '28', '92754', '1120', NULL, NULL, '2023-11-05', 0),
(31, '2', '27', '28', '91634', '3204', NULL, NULL, '2023-11-05', 0),
(32, '2', '28', '28', '88430', '2590', NULL, NULL, '2023-11-05', 0),
(33, '2', '29', '28', '85840', '920', NULL, NULL, '2023-11-05', 0),
(34, '2', '30', '28', '84920', '896', NULL, NULL, '2023-11-05', 0),
(35, '2', '31', '28', '84024', '1840', NULL, NULL, '2023-11-05', 0),
(36, '2', '32', '28', '82184', '1840', NULL, NULL, '2023-11-05', 0),
(37, '2', '33', '28', '82184', '1360', NULL, NULL, '2023-11-05', 0),
(38, '2', '34', '28', '80824', '1000', NULL, NULL, '2023-11-05', 0),
(39, '2', '35', '28', '79824', '1792', NULL, NULL, '2023-11-05', 0),
(40, '2', '36', '28', '78032', '480', NULL, NULL, '2023-11-05', 0),
(41, '2', '37', '28', '77552', '1000', NULL, NULL, '2023-11-05', 0),
(42, '2', '38', '28', '76552', '1816', NULL, NULL, '2023-11-05', 0),
(43, '2', '39', '28', '74736', '754', NULL, NULL, '2023-11-05', 0),
(44, '2', '40', '28', '73982', '840', NULL, NULL, '2023-11-05', 0),
(45, '2', '41', '28', '73142', '560', NULL, NULL, '2023-11-05', 0),
(46, '2', '42', '28', '72582', '3240', NULL, NULL, '2023-11-05', 0),
(47, '2', '43', '28', '69342', '820', NULL, NULL, '2023-11-05', 0),
(48, '2', '44', '28', '68522', '972', NULL, NULL, '2023-11-05', 0),
(49, '2', '45', '28', '67550', '1904', NULL, NULL, '2023-11-05', 0),
(50, '2', '46', '28', '65646', '1896', NULL, NULL, '2023-11-05', 0),
(51, '2', '47', '28', '63750', '1500', NULL, NULL, '2023-11-05', 0),
(52, '2', '48', '28', '62250', '1500', NULL, NULL, '2023-11-05', 0),
(53, '2', '49', '28', '60750', '2210', NULL, NULL, '2023-11-05', 0),
(54, '2', '50', '28', '58540', '1840', NULL, NULL, '2023-11-05', 0),
(55, '2', '51', '28', '56700', '2230', NULL, NULL, '2023-11-05', 0),
(56, '2', '53', '28', '54470', '1336', NULL, NULL, '2023-11-05', 0),
(57, '2', '54', '28', '53134', '1328', NULL, NULL, '2023-11-05', 0),
(58, '2', '54', '28', '51806', '100', '20', '1', '2023-12-22', 0),
(59, '2', '4', '28', '51806', '100', '20', '2', '2023-12-25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_karyawan`
--

CREATE TABLE `t_karyawan` (
  `karyawan_id` int(11) NOT NULL,
  `karyawan_kode` text NOT NULL,
  `karyawan_pekerjaan` text NOT NULL,
  `karyawan_nama` text NOT NULL,
  `karyawan_alamat` text NOT NULL,
  `karyawan_telp` text NOT NULL,
  `karyawan_kandang` text NOT NULL,
  `karyawan_jenis` enum('b','h') NOT NULL COMMENT 'b = borongan h = harian',
  `karyawan_upah` text NOT NULL,
  `karyawan_tanggal` date NOT NULL DEFAULT curdate(),
  `karyawan_hapus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_karyawan`
--

INSERT INTO `t_karyawan` (`karyawan_id`, `karyawan_kode`, `karyawan_pekerjaan`, `karyawan_nama`, `karyawan_alamat`, `karyawan_telp`, `karyawan_kandang`, `karyawan_jenis`, `karyawan_upah`, `karyawan_tanggal`, `karyawan_hapus`) VALUES
(2, 'KR001', '3', 'David latumahina', '-', '085855011542', '4', 'h', '55000', '2023-02-25', 0),
(3, 'KR002', '2', 'Mario dandi satrio', '-', '085234567890', '4', 'b', '70000', '2023-02-25', 0),
(4, 'KR003', '1', 'Agnes gracia haryanto', '-', '085676443232', '4', 'b', '70000', '2023-02-26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_kontak`
--

CREATE TABLE `t_kontak` (
  `kontak_id` int(11) NOT NULL,
  `kontak_jenis` set('s','p') NOT NULL DEFAULT '',
  `kontak_kode` text NOT NULL,
  `kontak_nama` text NOT NULL,
  `kontak_alamat` text NOT NULL,
  `kontak_tlp` text NOT NULL,
  `kontak_bank` text NOT NULL,
  `kontak_rek` text NOT NULL,
  `kontak_tanggal` date NOT NULL DEFAULT curdate(),
  `kontak_hapus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_kontak`
--

INSERT INTO `t_kontak` (`kontak_id`, `kontak_jenis`, `kontak_kode`, `kontak_nama`, `kontak_alamat`, `kontak_tlp`, `kontak_bank`, `kontak_rek`, `kontak_tanggal`, `kontak_hapus`) VALUES
(2, 's', 'SP001', 'Setiawan Nugroho', '-', '085775334552', '1', '763201007520530', '2023-02-22', 1),
(3, 's', 'SP002', 'Heru Setiawan ', '-', '085700600500', '1', '733601013479531', '2023-02-22', 1),
(4, 'p', 'PL001', 'Bagas Pramono', '-', '085855011542', '1', '016601020870538', '2023-02-22', 1),
(5, 'p', 'PL002', 'Suroto AS', '-', '087666444333', '1', '478201003567778', '2023-02-22', 1),
(7, 's', 'SP003', 'MEDION ARDHIKA PRATAMA', 'BLITAR', '000', '8', '0083806777', '2023-07-27', 0),
(8, 's', 'SP004', 'PT.SARANA VETERINARIA JAYA ABADI', 'TAMAN TEKNO BSD SEKTOR XI BLOK J2/5 TANGGERANG SELATAN', '02175880369', '8', '8990301612', '2023-07-29', 0),
(9, 's', 'SP005', 'PT MULTIFARMA SATWA MAJU', 'JL.AYA PAUNG PAMJANG NO.81 LEGO-TANGGERANG', '0215979876', '8', '000', '2023-07-29', 0),
(10, 's', 'SP006', 'MULTI EDITAS UTAMA', 'JL.PERINTIS KEMERDEKAAN KOMMP.RUKO PERTAMA BORDI TEXTILL CENTRE BLOK A-4 TASIKMALAYA ', '026532794', '8', '0540401888', '2023-07-29', 0),
(11, 's', 'SP007', 'AHMAD LUDOYO', 'LUDOYO', '000', '8', '0901314399', '2023-07-29', 0),
(12, 's', 'SP008', 'PT.AGRINUSA JAYA SENTOSA', 'JL.RAYA JUANDA SEDATIAGUNG.SIDOARJO', '0318671623', '8', '000', '2023-07-29', 0),
(13, 's', 'SP009', 'PT.LEWI MANUNGGAL', 'BLITAR', '000', '8', '000', '2023-07-29', 0),
(14, 's', 'SP0010', 'PT.SAVETA', 'BLITAR', '000', '8', '000', '2023-07-29', 1),
(15, 's', 'SP0011', 'PT.BCAF', 'BLITAR', '000', '8', '000', '2023-08-01', 0),
(16, 's', 'SP0012', 'PAK KHUSEN', 'BLITAR', '00', '8', '00', '2023-08-05', 0),
(17, 's', 'SP0013', 'PA NOR', 'BLITAR', '00', '8', '00', '2023-08-05', 0),
(18, 's', 'SP0014', 'PAK BUDI', 'BLITAR', '000', '8', '000', '2023-08-05', 0),
(19, 's', 'SP0015', 'PA AGUS', 'BLITAR', '00', '8', '00', '2023-08-05', 0),
(20, 's', 'SP0016', 'DOC', 'BLITAR', '999999', '8', '999999', '2023-08-07', 0),
(21, 's', 'SP0017', 'PT.PIMAIMAS CITRA   ', ' MUGI GRIYA JAKARTA', '8308471', '8', '000', '2023-08-14', 0),
(22, 's', 'SP0018', 'PT.BINA CITRA AGRO FARMA', 'TANGGERANG SELATAN-INDONESIA', '082112408105', '8', '7314424939', '2023-08-17', 0),
(23, 's', 'SP0019', 'PT.PAKAN SERASI', 'JAKARTA', '5480686', '8', '000', '2023-08-17', 0),
(24, 'p', 'PL003', 'BIOTEK SARANATAMA', 'BLITAR', '000', '8', '000', '2023-08-25', 1),
(25, 's', 'SP0020', 'BIOTEK SARANATAMA', 'BLITAR', '000', '8', '000', '2023-08-25', 0),
(26, 's', 'SP0021', 'AGRO MAKMUR SENTOSA', 'BLITAR-JAKARTA', '00', '8', '7020307719', '2023-09-02', 0),
(27, 's', 'SP0022', 'JAYA MANDIRI AGRINDO', 'SUMBER SANAN KULON BLITAR', '085236750872', '1', '626401011716537', '2023-09-04', 1),
(28, 'p', 'PL004', 'JUM', 'BLITAR', '00', '1', '00', '2023-09-06', 0),
(29, 'p', 'PL005', 'HERI', 'BLITAR', '00', '1', '00', '2023-09-06', 0),
(30, 'p', 'PL006', 'SODERI', 'BLITAR', '00', '1', '00', '2023-09-06', 0),
(31, 'p', 'PL007', 'MIMING', 'BLITAR', '00', '1', '00', '2023-09-06', 0),
(32, 's', 'SP0023', 'JAYA MANDIRI AGRINDO', 'SUMBER SANANKULON BLITAR', '085236750872', '1', '626401011716537', '2023-09-11', 0),
(33, 'p', 'PL008', 'JUMA', 'BLITAR', '000', '8', '000', '2023-09-13', 0),
(34, 's', 'SP0024', 'PT.SREEYA SEWU INDONESIA', 'JL.RAYA PARUNG KM19 DESA:  PEMEGARSARI PARUNG-OGOR JAWA BARAT', '000', '8', '000', '2023-09-18', 0),
(35, 's', 'SP0025', 'PT.ANUGERAH PANJI JAYA  MANDIRI', 'KAWASAN INDUSTRI  MEKAR RAYA BANDUNG', '02263725181', '8', '00', '2023-09-18', 0),
(36, 's', 'SP0026', 'PT TEKAD MANDIRI CITRA', 'BANDUNG', '0227322827', '8', '000', '2023-09-18', 0),
(37, 's', 'SP0027', 'PT ISSU MEDIKA VETERINDO', 'BANDUNG INDONESIA', '0227835746', '8', '000', '2023-09-22', 0),
(38, 's', 'SP0028', 'PT.YUNG SHIN  PHARMACEUTICAL INDONESIA', 'TANGGERANG BANTEN', '087720040602', '8', '00', '2023-09-29', 0),
(39, 's', 'SP0029', 'CV.MITRA BHUWANA MANDIRI', 'JL.KRTINI  NO.11 DOKO KEDIRI', '0354694414', '8', '000', '2023-10-10', 0),
(40, 's', 'SP0030', 'PAK BROTO', 'BLITAR', '000', '8', '000', '2023-10-30', 0),
(41, 's', 'SP0031', 'PAK DASAR', 'BLITAR', '000', '8', '000', '2023-10-30', 0),
(42, 's', 'SP0032', 'PAK HARI', 'BLITAR', '000', '8', '000', '2023-10-30', 0),
(43, 's', 'SP0033', 'PA ARIF', 'BLITAR', '000', '8', '000', '2023-11-02', 1),
(44, 's', 'SP0034', 'PAK FANDY', 'BLITAR', '000', '8', '000', '2023-11-02', 1),
(45, 's', 'SP0035', 'PT.CHAROEN POKPHAND INDONESIA', ' Kp. Cilubang,, Bencoy, Kec. Cireunghas, Kabupaten Sukabumi, Jawa Barat 43193', '0216919999', '8', '0', '2023-11-07', 0),
(46, 'p', 'PL009', 'PAK NANANG', 'BLITAR', '000', '8', '000', '2023-11-08', 0),
(47, 's', 'SP0036', 'PAK UZI', 'BLITAR', '000', '8', '000', '2023-11-08', 0),
(48, 'p', 'PL0010', 'MBAK ARI', 'BLITAR', '000', '8', '000', '2023-11-09', 0),
(49, 'p', 'PL0011', 'PAK LINGGA', 'BLITAR', '000', '8', '000', '2023-11-13', 0),
(50, 's', 'SP0037', 'BATU INDAH RAYA', 'JIMBE -BLITAR', '000', '8', '000', '2023-11-14', 0),
(51, 's', 'SP0038', 'PAK KHODER', 'BLITAR', '000', '1', '000', '2023-11-21', 0),
(52, 's', 'SP0039', 'PAK KALIM', 'BLITAR', '000', '1', '000', '2023-11-21', 0),
(53, 's', 'SP0040', 'PAK YOYOK', 'BLITAR', '000', '1', '000', '2023-11-21', 0),
(54, 's', 'SP0041', 'PAK SUYUT', 'BLITAR', '000', '8', '000', '2023-11-25', 0),
(55, 's', 'SP0042', 'PAK MISDI', 'BLITAR', '000', '8', '000', '2023-11-25', 0),
(56, 's', 'SP0043', 'PAK IQRA', 'BLITAR', '000', '8', '000', '2023-11-25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_level`
--

CREATE TABLE `t_level` (
  `level_id` int(11) NOT NULL,
  `level_nama` text NOT NULL,
  `level_doc` text NOT NULL,
  `level_telur` text DEFAULT '0',
  `level_ayam` text DEFAULT '0',
  `level_pakan` text DEFAULT '0',
  `level_obat` text DEFAULT '0',
  `level_hapus` int(11) DEFAULT 0,
  `level_tanggal` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_level`
--

INSERT INTO `t_level` (`level_id`, `level_nama`, `level_doc`, `level_telur`, `level_ayam`, `level_pakan`, `level_obat`, `level_hapus`, `level_tanggal`) VALUES
(1, 'Admin', '1', '1', '1', '1', '1', 0, '2023-05-13'),
(6, 'Gudang', '0', '0', '1', '0', '0', 0, '2023-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `t_pakan`
--

CREATE TABLE `t_pakan` (
  `pakan_id` int(11) NOT NULL,
  `pakan_kode` text NOT NULL,
  `pakan_nama` text DEFAULT NULL,
  `pakan_satuan` text DEFAULT NULL,
  `pakan_stok` text DEFAULT NULL,
  `pakan_keterangan` text DEFAULT NULL,
  `pakan_tanggal` date DEFAULT curdate(),
  `pakan_hapus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_pakan`
--

INSERT INTO `t_pakan` (`pakan_id`, `pakan_kode`, `pakan_nama`, `pakan_satuan`, `pakan_stok`, `pakan_keterangan`, `pakan_tanggal`, `pakan_hapus`) VALUES
(12, 'PC001', 'Pakan campur 100% HALAL', 'kg', '400', '-', '2023-10-26', 1),
(13, 'PC002', 'pak eko', 'kg', '1335', '', '2023-11-10', 0),
(14, 'PC003', 'pak eko stater', 'kg', '1220', 'formula stater', '2023-11-10', 0),
(15, 'PC004', 'pak mui', 'kg', '2040', 'tgl 2 november\r\nkandang timur', '2023-11-10', 0),
(16, 'PC005', 'PAK EKO LAYER', 'kg', '1380', '', '2023-11-11', 0),
(17, 'PC006', 'pak eko stater', 'kg', '1405', '', '2023-11-11', 0),
(20, 'PC001', 'Pakan Harga Tercantum', 'kg', '400', '-', '2023-11-27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pakan_barang`
--

CREATE TABLE `t_pakan_barang` (
  `pakan_barang_id` int(11) NOT NULL,
  `pakan_barang_kode` text NOT NULL,
  `pakan_barang_barang` text NOT NULL,
  `pakan_barang_qty` text NOT NULL,
  `pakan_barang_stok` text NOT NULL,
  `pakan_barang_harga` text NOT NULL DEFAULT '0',
  `pakan_barang_subtotal` text NOT NULL DEFAULT '0',
  `pakan_barang_tanggal` date NOT NULL DEFAULT curdate(),
  `pakan_barang_hapus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_pakan_barang`
--

INSERT INTO `t_pakan_barang` (`pakan_barang_id`, `pakan_barang_kode`, `pakan_barang_barang`, `pakan_barang_qty`, `pakan_barang_stok`, `pakan_barang_harga`, `pakan_barang_subtotal`, `pakan_barang_tanggal`, `pakan_barang_hapus`) VALUES
(24, 'PC001', '69', '100', '16250', '0', '0', '2023-11-27', 0),
(25, 'PC001', '68', '100', '10322', '0', '0', '2023-11-27', 0),
(26, 'PC001', '69', '100', '16150', '0', '0', '2023-11-27', 0),
(27, 'PC001', '68', '100', '10222', '0', '0', '2023-11-27', 0),
(28, 'PC002', '71', '300', '9250', '0', '0', '2023-11-27', 0),
(29, 'PC002', '70', '225', '33314', '0', '0', '2023-11-27', 0),
(30, 'PC002', '72', '70', '11019', '0', '0', '2023-11-27', 0),
(31, 'PC002', '69', '740', '94263', '0', '0', '2023-11-27', 0),
(32, 'PC003', '71', '370', '8950', '0', '0', '2023-11-27', 0),
(33, 'PC003', '69', '850', '93723', '0', '0', '2023-11-27', 0),
(34, 'PC004', '70', '210', '33089', '0', '0', '2023-11-27', 0),
(35, 'PC004', '72', '70', '10949', '0', '0', '2023-11-27', 0),
(36, 'PC004', '69', '740', '92873', '0', '0', '2023-11-27', 0),
(37, 'PC004', '70', '210', '32879', '0', '0', '2023-11-27', 0),
(38, 'PC004', '72', '70', '10879', '0', '0', '2023-11-27', 0),
(39, 'PC004', '69', '740', '92133', '0', '0', '2023-11-27', 0),
(40, 'PC005', '71', '290', '8580', '0', '0', '2023-11-27', 0),
(41, 'PC005', '72', '85', '10809', '0', '0', '2023-11-27', 0),
(42, 'PC005', '70', '225', '32669', '0', '0', '2023-11-27', 0),
(43, 'PC005', '69', '780', '91393', '0', '0', '2023-11-27', 0),
(44, 'PC006', '70', '300', '32444', '0', '0', '2023-11-27', 0),
(45, 'PC006', '72', '85', '10724', '0', '0', '2023-11-27', 0),
(46, 'PC006', '71', '270', '8290', '0', '0', '2023-11-27', 0),
(47, 'PC006', '69', '750', '90613', '0', '0', '2023-11-27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pakan_campur`
--

CREATE TABLE `t_pakan_campur` (
  `pakan_campur_id` int(11) NOT NULL,
  `pakan_campur_kode` text NOT NULL,
  `pakan_campur_barang` text DEFAULT NULL,
  `pakan_campur_qty` text DEFAULT NULL,
  `pakan_campur_tanggal` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_pakan_campur`
--

INSERT INTO `t_pakan_campur` (`pakan_campur_id`, `pakan_campur_kode`, `pakan_campur_barang`, `pakan_campur_qty`, `pakan_campur_tanggal`) VALUES
(9, 'PC001', '69', '100', '2023-10-26'),
(10, 'PC001', '68', '100', '2023-10-26'),
(11, 'PC002', '71', '300', '2023-11-10'),
(12, 'PC002', '70', '225', '2023-11-10'),
(13, 'PC002', '72', '70', '2023-11-10'),
(14, 'PC002', '69', '740', '2023-11-10'),
(15, 'PC003', '71', '370', '2023-11-10'),
(16, 'PC003', '69', '850', '2023-11-10'),
(17, 'PC004', '70', '210', '2023-11-10'),
(18, 'PC004', '72', '70', '2023-11-10'),
(19, 'PC004', '69', '740', '2023-11-10'),
(20, 'PC005', '71', '290', '2023-11-11'),
(21, 'PC005', '72', '85', '2023-11-11'),
(22, 'PC005', '70', '225', '2023-11-11'),
(23, 'PC005', '69', '780', '2023-11-11'),
(24, 'PC006', '70', '300', '2023-11-11'),
(25, 'PC006', '72', '85', '2023-11-11'),
(26, 'PC006', '71', '270', '2023-11-11'),
(27, 'PC006', '69', '750', '2023-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `t_pakan_qty`
--

CREATE TABLE `t_pakan_qty` (
  `pakan_qty_id` int(11) NOT NULL,
  `pakan_qty_kode` text DEFAULT NULL,
  `pakan_qty_qty` text DEFAULT NULL,
  `pakan_qty_tanggal` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_pakan_qty`
--

INSERT INTO `t_pakan_qty` (`pakan_qty_id`, `pakan_qty_kode`, `pakan_qty_qty`, `pakan_qty_tanggal`) VALUES
(15, 'PC001', '400', '2023-11-27'),
(16, 'PC002', '1335', '2023-11-27'),
(17, 'PC003', '1220', '2023-11-27'),
(18, 'PC004', '2040', '2023-11-27'),
(19, 'PC005', '1380', '2023-11-27'),
(20, 'PC006', '1405', '2023-11-27');

-- --------------------------------------------------------

--
-- Table structure for table `t_pekerjaan`
--

CREATE TABLE `t_pekerjaan` (
  `pekerjaan_id` int(11) NOT NULL,
  `pekerjaan_kode` text DEFAULT NULL,
  `pekerjaan_nama` text DEFAULT NULL,
  `pekerjaan_tanggal` date DEFAULT curdate(),
  `pekerjaan_hapus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_pekerjaan`
--

INSERT INTO `t_pekerjaan` (`pekerjaan_id`, `pekerjaan_kode`, `pekerjaan_nama`, `pekerjaan_tanggal`, `pekerjaan_hapus`) VALUES
(1, 'PK001', 'Bersihin Telur', '2023-12-29', 0),
(2, 'PK002', 'Nimbang Telur', '2023-12-29', 0),
(3, 'PK003', 'Service Kandang', '2023-12-29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pembelian`
--

CREATE TABLE `t_pembelian` (
  `pembelian_id` int(11) NOT NULL,
  `pembelian_user` int(11) DEFAULT NULL,
  `pembelian_nomor` text DEFAULT NULL,
  `pembelian_faktur` text DEFAULT NULL,
  `pembelian_kontak` int(11) DEFAULT NULL,
  `pembelian_sales` text DEFAULT NULL,
  `pembelian_status` enum('lunas','belum') DEFAULT NULL,
  `pembelian_jatuh_tempo` date DEFAULT NULL,
  `pembelian_keterangan` text DEFAULT NULL,
  `pembelian_qty` text DEFAULT NULL,
  `pembelian_ppn` text DEFAULT NULL,
  `pembelian_total` text DEFAULT NULL,
  `pembelian_tanggal` date DEFAULT curdate(),
  `pembelian_hapus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_pembelian`
--

INSERT INTO `t_pembelian` (`pembelian_id`, `pembelian_user`, `pembelian_nomor`, `pembelian_faktur`, `pembelian_kontak`, `pembelian_sales`, `pembelian_status`, `pembelian_jatuh_tempo`, `pembelian_keterangan`, `pembelian_qty`, `pembelian_ppn`, `pembelian_total`, `pembelian_tanggal`, `pembelian_hapus`) VALUES
(25, 2, 'PB-130523-1', 'PT001111', 2, 'Mas Bro', 'belum', '2023-05-10', 'pembelian DOC', '300', NULL, '3400000', '2023-05-13', 1),
(26, 2, 'PB-130523-2', 'PT001112', 3, 'Mas Bro', 'belum', '2023-05-10', 'pembelian obat', '150', NULL, '1200000', '2023-05-13', 1),
(27, 2, 'PB-130523-3', 'PT001113', 2, 'Mas Bro', 'lunas', '2023-05-13', 'pembelian pakan', '300', NULL, '3400000', '2023-05-13', 1),
(28, 2, 'PB-280723-4', '120723000962', 7, '-', 'belum', '2023-12-09', '', '25', NULL, '616875', '2023-07-27', 1),
(29, 2, 'PB-280723-5', '120723001039', 7, 'BAMBANG ATAU RIZKY', 'belum', '2023-12-09', 'BELUM BAYAR', '9', NULL, '4501575', '2023-07-27', 1),
(30, 2, 'PB-300723-6', '120723001831', 7, 'RIFKY/BAMBANG', 'belum', '2023-02-09', 'UNTUK JATUH TEMPO SAYA TULIS H-5', '200', NULL, '7350000', '2023-07-29', 1),
(31, 2, 'PB-300723-7', '80JM2307077', 8, 'PAK LAN/BENY', 'belum', '0009-02-01', 'UNTUK SATUAN SEBENARMYA ADALAH KG TAPI DI DATA PCS KAERENA TIDAK DAPAT DIGANTI', '50', NULL, '14950000', '2023-07-29', 1),
(32, 2, 'PB-300723-8', '12723000530', 7, 'RIFKY/BAMBANG', 'belum', '2023-05-09', 'UNTUK JATUH TEMPO SAYA BUAT H-3 DAN UNTUK SATUAN SEHARUSNYA PCS TAPI DISINI TIDAK BISA DIGANTI', '4', NULL, '2562000', '2023-07-29', 1),
(33, 2, 'PB-300723-9', '120723001207', 7, 'RIVKY/BAMBANG', 'belum', '2023-12-09', 'JAUH TEMPO SAYA UAT H-3', '15', NULL, '13464000', '2023-07-29', 1),
(34, 2, 'PB-300723-10', '1207230015', 7, 'RIVKY/BAMBANG', 'belum', '2023-12-09', 'JATUH TEMPO SAYA  H-3', '201', NULL, '3440275', '2023-07-29', 1),
(35, 2, 'PB-300723-11', '1013591', 9, 'PURWOKO/AKSAN ROSIDI', 'belum', '2023-12-08', 'JATUH TEMPOO SAYA BUAT H-2', '2', NULL, '12500000', '2023-07-29', 1),
(36, 2, 'PB-300723-12', '000120', 10, 'PEGGYMA', 'belum', '2023-02-09', '', '20', NULL, '4000000', '2023-07-29', 1),
(37, 2, 'PB-300723-13', 'PUR14.07.2023', 11, 'AHMAD', 'lunas', '2023-03-07', 'LUNAS TRANSFER', '500', NULL, '5750000', '2023-07-29', 1),
(38, 2, 'PB-300723-14', 'PUR27.7.2023', 11, 'AHMAD LUDOYO', 'lunas', '2023-03-01', 'LUNAS TRANSFER', '500', NULL, '5750000', '2023-07-29', 1),
(39, 2, 'PB-300723-15', '1013538', 9, 'PURWOK/AKHSAN ROSIDI', 'belum', '2023-02-09', 'JATUH TEMPO SAYA BUAT H-3', '10', NULL, '4350000', '2023-07-29', 1),
(40, 2, 'PB-300723-16', 'PR 06230032', 12, 'PAK SOPIR', 'lunas', '2023-07-07', 'SUDAH LUNAS ', '20', NULL, '12000000', '2023-07-29', 1),
(41, 2, 'PB-300723-17', '120623001184', 7, 'RIVKY/BAMBANG', 'belum', '2023-12-08', 'JATUH TEMPO DIBUAT H-8 KARENA DDIUBAHH YG LAIN TIDAK BBISA', '2', NULL, '1453950', '2023-07-29', 1),
(42, 2, 'PB-300723-18', '120623001224', 7, 'RIVKY/BAMBANG', 'belum', '2023-12-08', 'Jatuh tempo H-8 KARENAa tidak bisa diubah', '150', NULL, '4410000', '2023-07-29', 1),
(43, 2, 'PB-300723-19', 'LEWI7JULY2023', 13, 'RAFAEL', 'belum', '2023-05-09', 'Noe faktur saya tidak tau karena nota belu kketemuu mohon maav ada kekeliruan karena niota tiak ada', '1600', NULL, '66450000', '2023-07-29', 1),
(44, 2, 'PB-300723-20', '12062301184', 7, 'RIVKY/BAMBANG', 'lunas', '2023-08-20', '', '2', NULL, '1453950', '2023-07-29', 0),
(45, 2, 'PB-300723-21', '120723000962', 7, 'RIVKY/BAMBANG', 'belum', '2023-09-15', '', '25', NULL, '616875', '2023-07-29', 0),
(46, 2, 'PB-300723-22', '120723000131', 7, 'RIVKY/BAMBANG', 'belum', '2023-09-29', '', '200', NULL, '7350000', '2023-07-29', 0),
(47, 2, 'PB-300723-23', '120723001039', 7, 'IVKY/BAMBANG', 'belum', '2023-09-17', '', '9', NULL, '4501575', '2023-07-29', 0),
(48, 2, 'PB-300723-24', '12023001255', 7, 'RIVKY/BAMBANG', 'belum', '2023-09-20', '', '101', NULL, '3440175', '2023-07-29', 0),
(49, 2, 'PB-300723-25', '120723001207', 7, 'RRIVKY/BAMBANG', 'belum', '2023-09-20', '', '15', NULL, '13464000', '2023-07-29', 0),
(50, 2, 'PB-300723-26', '120723000530', 7, 'RRIVKY/BAMBANG', 'lunas', '2023-09-08', '', '4', NULL, '2562000', '2023-07-29', 0),
(51, 2, 'PB-300723-27', '12062301224', 7, 'RIVKY/BAMBANG', 'lunas', '2023-09-20', '', '150', NULL, '4410000', '2023-07-29', 0),
(52, 2, 'PB-300723-28', 'PR06230032', 12, 'AGINUSA', 'lunas', '2023-08-08', '', '20', NULL, '12000000', '2023-07-29', 0),
(53, 2, 'PB-300723-29', '1013533', 9, 'PURWOKO/AKHSAN', 'lunas', '0003-08-23', '', '10', NULL, '4350000', '2023-07-29', 0),
(54, 2, 'PB-300723-30', '1013591', 9, 'PURWOKO/AKHSAN', 'belum', '2023-08-14', '', '2', NULL, '12500000', '2023-07-29', 0),
(55, 2, 'PB-300723-31', '000120', 10, 'PEGGYNA', 'lunas', '2023-08-22', '', '20', NULL, '4000000', '2023-07-29', 0),
(56, 2, 'PB-300723-32', 'IVJM23307077', 8, 'PAK LAN/BENY', 'lunas', '2023-09-25', 'SAVETA ', '50', NULL, '14950000', '2023-07-29', 0),
(57, 2, 'PB-010823-33', '000251', 10, 'Peggyma', 'lunas', '2023-08-31', 'Nama obat Amcol Super Plus 10gr', '40', NULL, '15800000', '2023-07-31', 0),
(58, 2, 'PB-020823-34', 'KDR 000251', 10, 'PEGGYMA', 'belum', '2023-09-30', '-', '40', NULL, '15800000', '2023-08-01', 1),
(59, 2, 'PB-030823-35', 'CONTOH', 7, 'Mas Bro', 'lunas', '2023-08-03', '-', '50', NULL, '500000', '2023-08-03', 1),
(60, 2, 'PB-040823-36', 'SOJM2308006', 8, 'ARIF', 'lunas', '2023-10-03', '', '400', NULL, '10400000', '2023-08-03', 0),
(61, 2, 'PB-060823-37', 'JAGUNG5AGUS23', 16, 'KHUSEN', 'lunas', '2023-08-05', 'LUNAS TRANSFER', '10322', NULL, '57803200', '2023-08-05', 0),
(62, 2, 'PB-060823-38', 'JAGUNGNOR5AGUS2023', 17, 'NOR', 'lunas', '2023-08-05', 'LUNAS TRANSFER', '7612', NULL, '42627200', '2023-08-05', 0),
(63, 2, 'PB-060823-39', 'KATULAGUS2AGUS23', 19, 'AGUS', 'lunas', '2023-08-16', 'JATUH TEMPO 2 MINGGU', '14342', NULL, '69558700', '2023-08-05', 0),
(64, 2, 'PB-080823-40', 'BUDI6AGUS23', 18, 'BUDI', 'lunas', '2023-08-06', 'LUNAS TRANSFER', '8638', NULL, '47509000', '2023-08-07', 0),
(65, 2, 'PB-080823-41', 'DOC8AGS23', 20, 'DOC', 'lunas', '2023-08-08', 'CONTOH', '10000', NULL, '80000000', '2023-08-07', 1),
(66, 2, 'PB-080823-42', 'DOC2', 20, 'DOC', 'lunas', '2023-08-08', 'CONTOH', '50000', NULL, '400000000', '2023-08-07', 0),
(67, 2, 'PB-080823-43', 'DOC3', 20, 'DOC', 'lunas', '2023-08-08', 'CNNTOHLAGI', '10000', NULL, '80000000', '2023-08-07', 1),
(68, 2, 'PB-100823-44', 'SOJM2308049', 8, 'BENY', 'lunas', '2023-08-10', '', '20', NULL, '5980000', '2023-08-09', 0),
(69, 2, 'PB-120823-45', '1 3626', 7, 'bambang', 'belum', '2023-09-01', '', '225', NULL, '5551875', '2023-08-11', 1),
(70, 2, 'PB-150823-46', '120723000685', 7, 'bambang', 'belum', '2023-09-01', '', '225', NULL, '5551875', '2023-08-14', 0),
(71, 2, 'PB-150823-47', '12023000875', 7, 'BAMBANG', 'lunas', '2023-10-14', '', '6', NULL, '1482000', '2023-08-14', 0),
(72, 2, 'PB-180823-48', 'PAKANSERASI2AGUS23', 23, 'WIDYA', 'belum', '2023-10-02', '', '1000', NULL, '15540000', '2023-08-17', 0),
(73, 2, 'PB-180823-49', '120823000722', 7, 'BAMBANG', 'lunas', '2023-10-11', '', '5', NULL, '411000', '2023-08-17', 0),
(74, 2, 'PB-250823-50', '13690', 9, 'AKHSAN ROSIDI', 'lunas', '0088-10-18', '', '2', NULL, '12500000', '2023-08-24', 0),
(75, 2, 'PB-250823-51', 'SOJM230078', 8, 'ARIFIN', 'belum', '2023-10-21', 'HARGA ELUM DIKETAHUI', '600', NULL, '60000', '2023-08-24', 0),
(76, 2, 'PB-250823-52', '120823000238', 7, 'BAMBANG', 'lunas', '2023-10-03', '', '2', NULL, '1453950', '2023-08-24', 1),
(77, 2, 'PB-250823-53', 'OB 08230255', 12, '000', 'lunas', '2023-10-24', '', '2', NULL, '1776000', '2023-08-24', 0),
(78, 2, 'PB-260823-54', '292/N/BSI/VIII/2', 25, 'IDIN', 'lunas', '2023-10-23', '', '20', NULL, '3400000', '2023-08-25', 0),
(79, 2, 'PB-260823-55', 'SOJM2308078', 8, 'ARIFIN', 'lunas', '2023-10-21', '', '600', NULL, '15600000', '2023-08-25', 0),
(80, 2, 'PB-290823-56', '1208230001689', 7, 'BAMBANG', 'lunas', '2023-10-27', '', '9', NULL, '547425', '2023-08-28', 0),
(81, 2, 'PB-030923-57', '120923000021', 7, 'bambang', 'lunas', '2023-09-01', '', '250', NULL, '6168750', '2023-09-02', 0),
(82, 2, 'PB-030923-58', '1208230001928', 7, 'bambang', 'belum', '0001-08-31', '', '200', NULL, '7350000', '2023-09-02', 0),
(83, 2, 'PB-030923-59', 'PR 06230032', 26, 'AJS', 'lunas', '2023-08-08', '', '20', NULL, '12000000', '2023-09-02', 0),
(84, 2, 'PB-050923-60', '04092301', 27, 'RAMLI', 'lunas', '2023-10-04', '', '90', NULL, '11055000', '2023-09-04', 0),
(85, 2, 'PB-050923-61', 'SAVETA 1 SEPTEMBER 2023', 8, 'NIAM', 'lunas', '2023-10-01', 'TIDAK ADA NOMER  FAKTUR', '25', NULL, '7475000', '2023-09-04', 0),
(86, 2, 'PB-070923-62', '120823000238', 7, 'bambang', 'lunas', '2023-10-03', '', '2', NULL, '1453950', '2023-09-06', 0),
(87, 2, 'PB-070923-63', '120623000457', 7, 'BAMBANG', 'lunas', '0008-08-08', '', '5', NULL, '2605875', '2023-09-06', 0),
(88, 2, 'PB-070923-64', '120623000614', 7, 'BAMBANG', 'lunas', '2023-08-10', '', '1', NULL, '14175', '2023-09-06', 0),
(89, 2, 'PB-070923-65', '120623001436', 7, 'BAMBANG', 'lunas', '2023-08-23', '', '19', NULL, '7279725', '2023-09-06', 0),
(90, 2, 'PB-070923-66', '1206223001560', 7, 'BAMBANG', 'lunas', '2023-08-26', '', '4', NULL, '541200', '2023-09-06', 0),
(91, 2, 'PB-120923-67', '11092301', 32, 'RAMLI', 'lunas', '0001-10-11', '', '500', NULL, '17875000', '2023-09-11', 0),
(92, 2, 'PB-190923-68', 'PSD2309000095918', 34, 'SREEYA SEWU', 'lunas', '2023-09-14', '', '10000', NULL, '80000000', '2023-09-18', 0),
(93, 2, 'PB-190923-69', '120923000805', 7, 'BAMBANG', 'lunas', '2023-09-14', '', '5', NULL, '1476000', '2023-09-18', 0),
(94, 2, 'PB-190923-70', '120923000980', 7, 'BAMBANG', 'lunas', '2023-09-18', '', '25', NULL, '3726375', '2023-09-18', 0),
(95, 2, 'PB-190923-71', 'PR 09230060', 26, 'AGRO MAKMUR SENTOSA', 'belum', '2023-09-18', '', '2', NULL, '15270000', '2023-09-18', 0),
(96, 2, 'PB-190923-72', '13853//03/PM/VI/1997', 23, 'PAKAN SERASI', 'lunas', '2023-09-11', '', '1000', NULL, '15540000', '2023-09-18', 0),
(97, 2, 'PB-190923-73', '415895', 36, 'MAHDI', 'lunas', '2023-09-14', '1 Pail=10  kg', '1', NULL, '1724940', '2023-09-18', 0),
(98, 2, 'PB-190923-74', '016755', 35, 'mahdi', 'lunas', '2023-09-14', 'i kg an', '12', NULL, '2853144', '2023-09-18', 0),
(99, 2, 'PB-230923-75', '120923001293', 7, 'bambang', 'lunas', '2023-09-22', '', '150', NULL, '4410000', '2023-09-22', 0),
(100, 2, 'PB-230923-76', '120923001300', 7, 'BAMBANG', 'lunas', '2023-09-22', '', '50', NULL, '270000', '2023-09-22', 0),
(101, 2, 'PB-230923-77', '000120', 10, 'PEGGYINA', 'lunas', '2023-09-23', '', '20', NULL, '4000000', '2023-09-22', 1),
(102, 2, 'PB-230923-78', '12092300187', 7, 'BAMBANG', 'lunas', '2023-09-21', '', '6', NULL, '327600', '2023-09-22', 0),
(103, 2, 'PB-230923-79', 'J120923000400', 7, 'BAMBANG', 'lunas', '2023-09-18', '', '2', NULL, '210000', '2023-09-22', 0),
(104, 2, 'PB-230923-80', '13/IX/2023 ISSU-BLITAR', 37, 'ALOLIP', 'lunas', '2023-09-21', '', '10', NULL, '3696000', '2023-09-22', 0),
(105, 2, 'PB-250923-81', '23092301', 32, 'RAMLI', 'lunas', '2023-09-23', 'RAND INNOPHOS ADA 40 bag', '1000', NULL, '12500000', '2023-09-24', 0),
(106, 2, 'PB-250923-82', '8850/R/IX-23', 13, 'RAFAEL', 'lunas', '2023-09-23', '', '500', NULL, '6750000', '2023-09-24', 0),
(107, 2, 'PB-250923-83', 'SAVETA 23 SEPP 2023', 8, 'ARIFIN', 'lunas', '2023-09-23', '', '50', NULL, '14950000', '2023-09-24', 0),
(108, 2, 'PB-300923-84', 'ULA-09-0038', 38, 'UBAID', 'belum', '2023-09-26', '', '20', NULL, '3200000', '2023-09-29', 0),
(109, 2, 'PB-041023-85', 'agro 2 oktoer 2023', 26, 'ARSYA', 'lunas', '2023-11-02', 'LYSINTAS', '200', NULL, '6400000', '2023-10-03', 0),
(110, 2, 'PB-101023-86', ' 10035672/MBM/P/X/23', 39, 'FERI', 'belum', '2023-10-10', '', '100', NULL, '14600000', '2023-10-10', 0),
(111, 2, 'PB-101023-87', '09102301', 32, 'RAMLI', 'lunas', '2023-10-09', '', '500', NULL, '19650000', '2023-10-10', 0),
(112, 2, 'PB-111023-88', '004 2306 inv 0005', 21, 'mbk', 'lunas', '2023-08-05', 'pajak 11% = 624.324\r\njadi total  semua: ;; 6.300.000', '150', NULL, '5675700', '2023-10-10', 0),
(113, 2, 'PB-121023-89', '12102300665', 7, 'bambang', 'belum', '2023-10-11', '', '3', NULL, '2180925', '2023-10-11', 0),
(114, 2, 'PB-121023-90', '121023000709', 7, 'bambang', 'belum', '2023-10-11', '', '10', NULL, '3833250', '2023-10-11', 0),
(115, 2, 'PB-121023-91', '13591', 9, 'akhsan rosidi', 'belum', '2023-07-14', '', '200', NULL, '25000000', '2023-10-11', 0),
(116, 2, 'PB-191023-92', '15092301', 32, 'ramli', 'lunas', '2023-10-16', 'lunas tf\r\nbonus exal-h 20kg', '20', NULL, '3720000', '2023-10-18', 0),
(117, 2, 'PB-191023-93', 'CVLM/VII/23/5305', 13, 'rafael', 'lunas', '2023-10-10', 'di keterangan sudah lunas ada stampelnya.', '1600', NULL, '60450000', '2023-10-18', 0),
(118, 2, 'PB-191023-94', 'CVLM/VI/23/5329', 7, 'RAFAEL', 'lunas', '2023-10-10', 'ad stampel lunas', '500', NULL, '7000000', '2023-10-18', 0),
(119, 2, 'PB-191023-95', 'j121023000368', 7, 'bambang', 'belum', '2023-10-17', '', '1', NULL, '140000', '2023-10-18', 0),
(120, 2, 'PB-201023-96', 'j120823000018', 7, 'bambang', 'lunas', '2023-10-14', 'lunas tf bca', '3', NULL, '420000', '2023-10-19', 0),
(121, 2, 'PB-201023-97', '120823001227', 7, 'bambang', 'lunas', '2023-10-14', 'bayar  tf bca', '11', NULL, '1825200', '2023-10-19', 0),
(122, 2, 'PB-201023-98', '120823001928', 7, 'bambang', 'lunas', '2023-10-14', 'lunas tf bca', '200', NULL, '7350000', '2023-10-19', 0),
(123, 2, 'PB-241023-99', '1210123001433', 7, 'bambang', 'belum', '2023-12-23', '', '9', NULL, '4501575', '2023-10-23', 0),
(124, 2, 'PB-241023-100', '121023001412', 7, 'bambang', 'belum', '2023-12-23', '', '1', NULL, '1818000', '2023-10-23', 0),
(125, 2, 'PB-311023-101', '004.2308.SOP.0039', 21, 'PIMAIMAS CITRA', 'lunas', '2023-10-25', 'LUNAS TF ADA BIAYA KENA PAJAK 10% JADI TOTAL PEMBAYARAN 6.210.000', '110', NULL, '5594610', '2023-10-30', 0),
(126, 2, 'PB-311023-102', '12102301', 32, 'RAMLI', 'lunas', '2023-10-12', 'NOMER FAKTUR TIDAK ADA, YG ADA NOMER DO', '200', NULL, '5700000', '2023-10-30', 0),
(127, 2, 'PB-311023-103', '15092301', 32, 'RAMLI', 'lunas', '2023-09-15', 'NO FAKTUR SAY KARANG KARENA TIDAK TERCANTUM', '100', NULL, '3720000', '2023-10-30', 0),
(128, 2, 'PB-311023-104', '1013890', 9, 'PAK AKHSAN', 'belum', '2023-10-27', '', '2', NULL, '12500000', '2023-10-30', 0),
(129, 2, 'PB-311023-105', 'J121023000254', 7, 'BAMBANG', 'belum', '0001-10-12', '', '1', NULL, '105000', '2023-10-30', 0),
(130, 2, 'PB-311023-106', 'MBM 061023', 40, 'BROTO', 'lunas', '2023-10-06', 'SUDAH BAYAR', '10019', NULL, '105199500', '2023-10-30', 0),
(131, 2, 'PB-311023-107', 'JAGUNG 111023', 41, 'DASAR', 'lunas', '2023-10-19', 'SUDAH DIBAYAR', '10351', NULL, '65211300', '2023-10-30', 0),
(132, 2, 'PB-311023-108', 'JAGUNG 121023', 42, 'HARI', 'lunas', '2023-10-13', '', '9415', NULL, '59314500', '2023-10-30', 0),
(133, 2, 'PB-311023-109', 'JAGUNG 121023', 41, 'DASAR', 'lunas', '2023-10-19', '', '10683', NULL, '67569975', '2023-10-30', 0),
(134, 2, 'PB-031123-110', '28092301', 32, 'ramli', 'lunas', '2023-11-28', '', '75', NULL, '7500000', '2023-11-02', 0),
(135, 2, 'PB-031123-111', 'agrp 2nov23', 26, 'arsia', 'lunas', '2024-01-02', '', '200', NULL, '6400000', '2023-11-02', 0),
(136, 2, 'PB-031123-112', '1006745', 9, 'PAK AKHSAN', 'belum', '2023-10-27', '', '10', NULL, '6500000', '2023-11-02', 0),
(137, 2, 'PB-031123-113', 'JAGUNG 12OKT23', 18, 'BUDI', 'lunas', '2023-10-12', 'LUNAS TF \r\ntotal sebenrnya adlah 3220,5 ', '3220', NULL, '20125000', '2023-11-02', 0),
(138, 2, 'PB-031123-114', 'jagung 13okt23', 41, 'dasar', 'lunas', '2023-11-19', 'lunas tf', '10518', NULL, '66789300', '2023-11-02', 0),
(139, 2, 'PB-031123-115', 'AHMAD 13OKT23', 11, 'ahmad', 'lunas', '2023-10-15', 'lunas tf bca', '100', NULL, '15000000', '2023-11-02', 0),
(140, 2, 'PB-031123-116', 'ARIF 28OKT23', 43, 'PAK ARIF', 'belum', '2023-12-28', '', '32', NULL, '6400000', '2023-11-02', 0),
(141, 2, 'PB-031123-117', 'JAGUNG 14OKT23', 41, 'PAK DASAR', 'lunas', '2023-10-19', '', '10615', NULL, '67405250', '2023-11-02', 0),
(142, 2, 'PB-031123-118', 'JAGUNG 15OKT23', 41, 'PAK DASAR', 'lunas', '2023-10-19', '', '10711', NULL, '68014850', '2023-11-02', 0),
(143, 2, 'PB-031123-119', 'JAGUNG 15OKT23 II', 41, 'PAK DASAR', 'lunas', '2023-10-19', '', '6350', NULL, '66071750', '2023-11-02', 0),
(144, 2, 'PB-031123-120', 'JAGUNG 15OKT23 III', 17, 'PAK NOR', 'lunas', '2023-10-16', '', '6350', NULL, '63252350', '2023-11-02', 0),
(145, 2, 'PB-031123-121', 'BKK 18OKT23', 44, 'PAK FANDY', 'lunas', '2023-10-19', '', '10000', NULL, '92500000', '2023-11-02', 0),
(146, 2, 'PB-031123-122', 'BKK 19OKT23 II', 44, 'PAK FANDY', 'lunas', '2023-10-20', '', '9250', NULL, '370000000', '2023-11-02', 0),
(147, 2, 'PB-031123-123', 'MBM 25OKT23', 44, 'PAK FANDY', 'lunas', '2023-10-25', '', '1000', NULL, '10000000', '2023-11-02', 0),
(148, 2, 'PB-051123-124', 'CVLM/XI/2023/9087', 13, 'RAFAEL', 'belum', '2023-01-01', '', '100', NULL, '6500000', '2023-11-04', 1),
(149, 2, 'PB-051123-125', '27102301', 32, 'RAMLI', 'belum', '2023-12-10', '', '100', NULL, '4200000', '2023-11-04', 1),
(150, 2, 'PB-051123-126', 'CVLM/XI/2023/9087', 13, 'RAFAEL', 'belum', '2023-11-02', '', '100', NULL, '6500000', '2023-11-04', 1),
(151, 2, 'PB-051123-127', 'CVLM/XI/2023/9087', 13, 'RAFAEL', 'belum', '2024-01-02', '', '100', NULL, '6500000', '2023-11-04', 0),
(152, 2, 'PB-051123-128', 'DOC STOK 2 NOV23', 20, 'ANISSA', 'lunas', '2023-10-31', '', '48000', NULL, '384000000', '2023-11-05', 0),
(153, 2, 'PB-071123-129', '121123000330', 7, 'bambang', 'belum', '2023-11-06', '', '10', '0', '2481000', '2023-11-06', 0),
(154, 2, 'PB-071123-130', 'j121123000013', 7, 'bambang', 'belum', '2023-11-02', '', '1', '0', '105000', '2023-11-06', 0),
(155, 2, 'PB-071123-131', '5002757', 15, 'SUGIANTO', 'belum', '2023-11-02', '', '50', '0', '4250000', '2023-11-06', 0),
(156, 4, 'PB-071123-132', '01890488', 22, 'yoga', 'lunas', '2023-11-07', '', '393', '0', '29475000', '2023-11-07', 1),
(157, 4, 'PB-071123-133', '001212992', 45, 'ALAND', 'belum', '2023-11-05', 'Baru dibayar Dp nya', '393', '0', '29475000', '2023-11-07', 1),
(158, 4, 'PB-071123-134', '001212921', 45, 'aland', 'belum', '2023-11-08', 'baru di bayar DP ', '393', '0', '29475000', '2023-11-07', 1),
(159, 2, 'PB-091123-135', '9018', 13, 'rafael', 'belum', '2023-12-19', '', '200', '0', '11321000', '2023-11-08', 0),
(160, 2, 'PB-091123-136', '100356721/MBM/P/X/23', 39, 'XXX', 'belum', '2023-12-12', '', '102000', '0', '5100000', '2023-11-08', 0),
(161, 2, 'PB-091123-137', 'PIMAIMAS 9NOV23', 21, 'MBAK', 'belum', '2023-11-09', '', '154', '0', '7104000', '2023-11-08', 0),
(162, 2, 'PB-091123-138', 'KATOL 7NOV23', 47, 'UZI', 'lunas', '2023-11-08', '', '8972', '0', '51589000', '2023-11-08', 0),
(163, 2, 'PB-141123-139', '05102301', 32, 'RAMLI', 'lunas', '2023-10-05', 'LUNAS TF', '100', '0', '4700000', '2023-11-13', 0),
(164, 2, 'PB-141123-140', '120923000289', 7, 'bambang', 'lunas', '2023-11-07', 'lunas tf', '60', '0', '1368000', '2023-11-13', 0),
(165, 2, 'PB-141123-141', 'j120923000123', 7, 'bambang', 'lunas', '2023-11-07', 'lunas tf', '2', '0', '210000', '2023-11-13', 0),
(166, 2, 'PB-141123-142', 'J120923000158', 7, 'BAMBANG', 'lunas', '2023-11-07', 'LUNAS TF', '2', '0', '180300', '2023-11-13', 0),
(167, 2, 'PB-141123-143', '120923000554', 7, 'BAMBANG', 'lunas', '2023-11-07', 'LUNAS TF', '20', '0', '6564750', '2023-11-13', 0),
(168, 2, 'PB-141123-144', '120923000980', 7, 'BAMBANG', 'lunas', '2023-11-07', 'LUNAS TF', '25', '0', '3726375', '2023-11-13', 1),
(169, 2, 'PB-141123-145', '11102301', 32, 'RAMLI', 'lunas', '2023-11-13', 'LUNAS TF', '70', '0', '5032500', '2023-11-13', 0),
(170, 2, 'PB-151123-146', '121123000875', 7, 'BAMBANG', 'belum', '2023-11-13', '', '200', '0', '7350000', '2023-11-14', 0),
(171, 2, 'PB-201123-147', '121023001662', 7, 'BAMBANG', 'belum', '2023-10-27', '', '3', '0', '1921500', '2023-11-19', 1),
(172, 2, 'PB-201123-148', '121023001662', 7, 'BAMBANG', 'belum', '2023-12-27', '', '3', '0', '1921500', '2023-11-19', 0),
(173, 2, 'PB-201123-149', '121023001866', 7, 'BAMBANG', 'belum', '2023-12-30', '', '60', '0', '8325000', '2023-11-19', 0),
(174, 2, 'PB-201123-150', '100356831/MBM/P/XI/23', 39, 'PARMIN', 'belum', '2024-01-20', '', '125', '11', '9990000', '2023-11-19', 0),
(175, 2, 'PB-201123-151', '100356831/MBM/P/XI/23', 39, 'PARMIN', 'belum', '2024-01-20', '', '50', '11', '5661000', '2023-11-19', 0),
(176, 2, 'PB-221123-152', 'KATOL 7NOV23/II', 19, 'AGUS', 'lunas', '2023-11-08', '', '8972', '0', '51589000', '2023-11-21', 0),
(177, 2, 'PB-221123-153', 'JAGUNG 17NOV23', 53, 'YOYOK', 'lunas', '2023-11-18', '', '2689', '0', '15865100', '2023-11-21', 0),
(178, 2, 'PB-221123-154', 'GANDUM 17NOV23', 53, 'YOYOK', 'lunas', '2023-11-18', 'ONGKOS KULI 150.000', '5787', '0', '28356300', '2023-11-21', 0),
(179, 2, 'PB-221123-155', 'JAGUNG 21NOV23', 52, 'KALIM', 'lunas', '2023-11-21', '', '9364', '0', '56184000', '2023-11-21', 0),
(180, 2, 'PB-231123-156', '21112301', 32, 'RAMLI', 'belum', '2023-12-21', '', '20', '0', '1620000', '2023-11-22', 0),
(181, 2, 'PB-231123-157', '408/BST/N/XI/23', 25, 'DESTA AYU', 'belum', '2024-01-16', '', '5', '0', '850000', '2023-11-22', 0),
(182, 2, 'PB-231123-158', '202/N/BST/SLO/XI/23', 25, 'DESITA AYU', 'belum', '2024-01-14', '', '170000', '0', '3400000', '2023-11-22', 0),
(183, 2, 'PB-261123-159', '022261/FL', 35, 'MAHDI', 'belum', '2023-12-23', 'TIDAK TAU JATUH TEMPONYA', '2', '0', '3441000', '2023-11-25', 0),
(184, 2, 'PB-261123-160', 'JAGUNG 22NOV23/I', 52, 'KALIM', 'lunas', '2023-11-22', 'LANGSUN G BAYAR', '9364', '0', '56184000', '2023-11-25', 0),
(185, 2, 'PB-261123-161', 'JAGUNG 22NOV23/II', 17, 'NOR', 'belum', '2023-11-28', '67,393,975', '11139', '0', '67390950', '2023-11-25', 0),
(186, 2, 'PB-261123-162', 'JAGUNG 23NOV23', 54, 'SUYUT', 'lunas', '2023-11-23', '3,899.225', '644', '0', '3896200', '2023-11-25', 0),
(187, 2, 'PB-261123-163', 'JAGUNG 24NOV23', 55, 'MISDI', 'lunas', '2023-11-24', '', '9461', '0', '58658200', '2023-11-25', 0),
(188, 2, 'PB-261123-164', 'JAGUNG 24NOV23/II', 56, 'IQRA', 'belum', '2023-11-30', '52.316.650', '8576', '0', '52313600', '2023-11-25', 0),
(189, 2, 'PB-261123-165', 'JAGUNG 25NOV23/I', 17, 'NOR', 'belum', '2023-11-30', '60.665.625', '9706', '0', '60662500', '2023-11-25', 0),
(190, 2, 'PB-261123-166', 'JAGUNG 25NOV23/II', 52, 'KALIM', 'belum', '2023-11-30', '', '8452', '0', '52825000', '2023-11-25', 0),
(191, 2, 'PB-271123-167', 'J121123000431', 7, 'BAMBANG', 'belum', '2023-01-23', '', '1', '0', '114000', '2023-11-26', 1),
(192, 2, 'PB-271123-168', '1211230001561', 7, 'BAMBANG', 'belum', '2024-01-23', '', '10', '0', '608250', '2023-11-26', 0),
(193, 2, 'PB-271123-169', 'J121123000431', 7, 'BAMBANG', 'belum', '2024-01-20', '', '1', '0', '114000', '2023-11-26', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pembelian_barang`
--

CREATE TABLE `t_pembelian_barang` (
  `pembelian_barang_id` int(11) NOT NULL,
  `pembelian_barang_nomor` text DEFAULT NULL,
  `pembelian_barang_kategori` text DEFAULT NULL,
  `pembelian_barang_barang` text DEFAULT NULL,
  `pembelian_barang_harga` text DEFAULT NULL,
  `pembelian_barang_diskon` text DEFAULT NULL,
  `pembelian_barang_qty` text DEFAULT NULL,
  `pembelian_barang_subtotal` text DEFAULT NULL,
  `pembelian_barang_tanggal` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_pembelian_barang`
--

INSERT INTO `t_pembelian_barang` (`pembelian_barang_id`, `pembelian_barang_nomor`, `pembelian_barang_kategori`, `pembelian_barang_barang`, `pembelian_barang_harga`, `pembelian_barang_diskon`, `pembelian_barang_qty`, `pembelian_barang_subtotal`, `pembelian_barang_tanggal`) VALUES
(39, 'PB-130523-1', '5', '29', '12000', '0', '100', '1200000', '2023-05-13'),
(40, 'PB-130523-1', '5', '28', '10000', '0', '100', '1000000', '2023-05-13'),
(41, 'PB-130523-1', '5', '27', '12000', '0', '100', '1200000', '2023-05-13'),
(42, 'PB-130523-2', '4', '19', '9000', '0', '50', '450000', '2023-05-13'),
(43, 'PB-130523-2', '4', '18', '8000', '0', '50', '400000', '2023-05-13'),
(44, 'PB-130523-2', '4', '17', '7000', '0', '50', '350000', '2023-05-13'),
(45, 'PB-130523-3', '3', '14', '12000', '0', '100', '1200000', '2023-05-13'),
(46, 'PB-130523-3', '3', '13', '10000', '0', '100', '1000000', '2023-05-13'),
(47, 'PB-130523-3', '3', '12', '12000', '0', '100', '1200000', '2023-05-13'),
(48, 'PB-280723-4', '4', '31', '32900', '25', '25', '616875', '2023-07-27'),
(49, 'PB-280723-5', '4', '32', '666900', '25', '9', '4501575', '2023-07-27'),
(50, 'PB-300723-6', '4', '33', '49000', '25', '200', '7350000', '2023-07-29'),
(51, 'PB-300723-7', '4', '34', '299000', '0', '50', '14950000', '2023-07-29'),
(52, 'PB-300723-8', '4', '36', '854000', '25', '4', '2562000', '2023-07-29'),
(53, 'PB-300723-9', '4', '38', '1196800', '25', '15', '13464000', '2023-07-29'),
(54, 'PB-300723-10', '4', '40', '1', '0', '100', '100', '2023-07-29'),
(55, 'PB-300723-10', '4', '39', '39200', '25', '100', '2940000', '2023-07-29'),
(56, 'PB-300723-10', '4', '32', '666900', '25', '1', '500175', '2023-07-29'),
(57, 'PB-300723-11', '4', '41', '6250000', '0', '2', '12500000', '2023-07-29'),
(58, 'PB-300723-12', '4', '42', '200000', '0', '20', '4000000', '2023-07-29'),
(59, 'PB-300723-13', '4', '43', '11500', '0', '500', '5750000', '2023-07-29'),
(60, 'PB-300723-14', '4', '43', '11500', '0', '500', '5750000', '2023-07-29'),
(61, 'PB-300723-15', '4', '44', '435000', '0', '10', '4350000', '2023-07-29'),
(62, 'PB-300723-16', '4', '45', '600000', '0', '20', '12000000', '2023-07-29'),
(63, 'PB-300723-17', '4', '48', '969300', '25', '2', '1453950', '2023-07-29'),
(64, 'PB-300723-18', '4', '39', '39200', '25', '150', '4410000', '2023-07-29'),
(65, 'PB-300723-19', '4', '50', '33000', '0', '600', '19800000', '2023-07-29'),
(66, 'PB-300723-19', '4', '49', '46650', '0', '1000', '46650000', '2023-07-29'),
(67, 'PB-300723-20', '4', '48', '969300', '25', '2', '1453950', '2023-07-29'),
(68, 'PB-300723-21', '4', '31', '32900', '25', '25', '616875', '2023-07-29'),
(69, 'PB-300723-22', '4', '33', '49000', '25', '200', '7350000', '2023-07-29'),
(70, 'PB-300723-23', '4', '32', '666900', '25', '9', '4501575', '2023-07-29'),
(71, 'PB-300723-24', '4', '39', '39200', '25', '100', '2940000', '2023-07-29'),
(72, 'PB-300723-24', '4', '32', '666900', '25', '1', '500175', '2023-07-29'),
(73, 'PB-300723-25', '4', '38', '1196800', '25', '15', '13464000', '2023-07-29'),
(74, 'PB-300723-26', '4', '35', '854000', '25', '4', '2562000', '2023-07-29'),
(75, 'PB-300723-27', '4', '39', '39200', '25', '150', '4410000', '2023-07-29'),
(76, 'PB-300723-28', '4', '45', '600000', '0', '20', '12000000', '2023-07-29'),
(77, 'PB-300723-29', '4', '44', '435000', '0', '10', '4350000', '2023-07-29'),
(78, 'PB-300723-30', '4', '41', '6250000', '0', '2', '12500000', '2023-07-29'),
(79, 'PB-300723-31', '4', '42', '200000', '0', '20', '4000000', '2023-07-29'),
(80, 'PB-300723-32', '4', '34', '299000', '0', '50', '14950000', '2023-07-29'),
(81, 'PB-010823-33', '4', '34', '395000', '0', '40', '15800000', '2023-07-31'),
(82, 'PB-020823-34', '4', '63', '395000', '0', '40', '15800000', '2023-08-01'),
(83, 'PB-030823-35', '5', '27', '10000', '0', '50', '500000', '2023-08-03'),
(84, 'PB-040823-36', '4', '64', '26000', '0', '400', '10400000', '2023-08-03'),
(85, 'PB-060823-37', '3', '68', '5600', '0', '10322', '57803200', '2023-08-05'),
(86, 'PB-060823-38', '3', '69', '5600', '0', '7612', '42627200', '2023-08-05'),
(87, 'PB-060823-39', '3', '70', '4850', '0', '14342', '69558700', '2023-08-05'),
(88, 'PB-080823-40', '3', '69', '5500', '0', '8638', '47509000', '2023-08-07'),
(89, 'PB-080823-41', '5', '28', '8000', '0', '10000', '80000000', '2023-08-07'),
(90, 'PB-080823-42', '5', '28', '8000', '0', '50000', '400000000', '2023-08-07'),
(91, 'PB-080823-43', '5', '28', '8000', '0', '10000', '80000000', '2023-08-07'),
(92, 'PB-100823-44', '4', '34', '299000', '0', '20', '5980000', '2023-08-09'),
(93, 'PB-120823-45', '4', '31', '32900', '25', '225', '5551875', '2023-08-11'),
(94, 'PB-150823-46', '4', '31', '32900', '25', '225', '5551875', '2023-08-14'),
(95, 'PB-150823-47', '4', '81', '416000', '25', '2', '624000', '2023-08-14'),
(96, 'PB-150823-47', '4', '80', '196000', '25', '2', '294000', '2023-08-14'),
(97, 'PB-150823-47', '4', '79', '376000', '25', '2', '564000', '2023-08-14'),
(98, 'PB-180823-48', '4', '84', '15540', '0', '1000', '15540000', '2023-08-17'),
(99, 'PB-180823-49', '4', '85', '109600', '25', '5', '411000', '2023-08-17'),
(100, 'PB-250823-50', '4', '86', '6250000', '0', '2', '12500000', '2023-08-24'),
(101, 'PB-250823-51', '4', '64', '100', '0', '600', '60000', '2023-08-24'),
(102, 'PB-250823-52', '4', '48', '969300', '25', '2', '1453950', '2023-08-24'),
(103, 'PB-250823-53', '4', '88', '888000', '0', '2', '1776000', '2023-08-24'),
(104, 'PB-260823-54', '4', '87', '170000', '0', '20', '3400000', '2023-08-25'),
(105, 'PB-260823-55', '4', '64', '26000', '0', '600', '15600000', '2023-08-25'),
(106, 'PB-290823-56', '4', '89', '81100', '25', '9', '547425', '2023-08-28'),
(107, 'PB-030923-57', '4', '31', '32900', '25', '250', '6168750', '2023-09-02'),
(108, 'PB-030923-58', '4', '33', '49000', '25', '200', '7350000', '2023-09-02'),
(109, 'PB-030923-59', '4', '45', '600000', '0', '20', '12000000', '2023-09-02'),
(110, 'PB-050923-60', '4', '93', '100000', '0', '25', '2500000', '2023-09-04'),
(111, 'PB-050923-60', '4', '92', '195000', '0', '20', '3900000', '2023-09-04'),
(112, 'PB-050923-60', '4', '91', '184000', '0', '20', '3680000', '2023-09-04'),
(113, 'PB-050923-60', '4', '90', '39000', '0', '25', '975000', '2023-09-04'),
(114, 'PB-050923-61', '4', '34', '299000', '0', '25', '7475000', '2023-09-04'),
(115, 'PB-070923-62', '4', '48', '969300', '25', '2', '1453950', '2023-09-06'),
(116, 'PB-070923-63', '4', '94', '694900', '25', '5', '2605875', '2023-09-06'),
(117, 'PB-070923-64', '4', '95', '18900', '25', '1', '14175', '2023-09-06'),
(118, 'PB-070923-65', '4', '47', '475700', '25', '9', '3210975', '2023-09-06'),
(119, 'PB-070923-65', '4', '32', '542500', '25', '10', '4068750', '2023-09-06'),
(120, 'PB-070923-66', '4', '97', '180400', '25', '4', '541200', '2023-09-06'),
(121, 'PB-120923-67', '4', '90', '38000', '0', '125', '4750000', '2023-09-11'),
(122, 'PB-120923-67', '4', '50', '35000', '0', '375', '13125000', '2023-09-11'),
(123, 'PB-190923-68', '5', '28', '8000', '0', '10000', '80000000', '2023-09-18'),
(124, 'PB-190923-69', '4', '85', '393600', '25', '5', '1476000', '2023-09-18'),
(125, 'PB-190923-70', '4', '94', '694900', '25', '5', '2605875', '2023-09-18'),
(126, 'PB-190923-70', '4', '98', '74700', '25', '20', '1120500', '2023-09-18'),
(127, 'PB-190923-71', '4', '99', '7635000', '0', '2', '15270000', '2023-09-18'),
(128, 'PB-190923-72', '4', '84', '15540', '0', '1000', '15540000', '2023-09-18'),
(129, 'PB-190923-73', '4', '101', '1724940', '0', '1', '1724940', '2023-09-18'),
(130, 'PB-190923-74', '4', '100', '237762', '0', '12', '2853144', '2023-09-18'),
(131, 'PB-230923-75', '4', '39', '39200', '25', '150', '4410000', '2023-09-22'),
(132, 'PB-230923-76', '4', '102', '7200', '25', '50', '270000', '2023-09-22'),
(133, 'PB-230923-77', '4', '103', '200000', '0', '20', '4000000', '2023-09-22'),
(134, 'PB-230923-78', '4', '104', '72800', '25', '6', '327600', '2023-09-22'),
(135, 'PB-230923-79', '4', '105', '140000', '25', '2', '210000', '2023-09-22'),
(136, 'PB-230923-80', '4', '106', '369600', '0', '10', '3696000', '2023-09-22'),
(137, 'PB-250923-81', '4', '108', '12500', '0', '1000', '12500000', '2023-09-24'),
(138, 'PB-250923-82', '4', '109', '13500', '0', '500', '6750000', '2023-09-24'),
(139, 'PB-250923-83', '4', '34', '299000', '0', '50', '14950000', '2023-09-24'),
(140, 'PB-300923-84', '4', '110', '160000', '0', '20', '3200000', '2023-09-29'),
(141, 'PB-041023-85', '4', '50', '32000', '0', '200', '6400000', '2023-10-03'),
(142, 'PB-101023-86', '4', '112', '220000', '0', '50', '11000000', '2023-10-10'),
(143, 'PB-101023-86', '4', '111', '72000', '0', '50', '3600000', '2023-10-10'),
(144, 'PB-101023-87', '4', '113', '39300', '0', '500', '19650000', '2023-10-10'),
(145, 'PB-111023-88', '4', '114', '37838', '0', '150', '5675700', '2023-10-10'),
(146, 'PB-121023-89', '4', '48', '969300', '25', '3', '2180925', '2023-10-11'),
(147, 'PB-121023-90', '4', '47', '511100', '25', '10', '3833250', '2023-10-11'),
(148, 'PB-121023-91', '4', '59', '125000', '0', '200', '25000000', '2023-10-11'),
(149, 'PB-191023-92', '4', '91', '186000', '0', '20', '3720000', '2023-10-18'),
(150, 'PB-191023-93', '4', '49', '40650', '0', '1000', '40650000', '2023-10-18'),
(151, 'PB-191023-93', '4', '50', '33000', '0', '600', '19800000', '2023-10-18'),
(152, 'PB-191023-94', '4', '109', '14000', '0', '500', '7000000', '2023-10-18'),
(153, 'PB-191023-95', '4', '105', '140000', '0', '1', '140000', '2023-10-18'),
(154, 'PB-201023-96', '4', '105', '140000', '0', '3', '420000', '2023-10-19'),
(155, 'PB-201023-97', '4', '118', '77600', '25', '6', '349200', '2023-10-19'),
(156, 'PB-201023-97', '4', '117', '393600', '25', '5', '1476000', '2023-10-19'),
(157, 'PB-201023-98', '4', '33', '49000', '25', '200', '7350000', '2023-10-19'),
(158, 'PB-241023-99', '4', '32', '666900', '25', '9', '4501575', '2023-10-23'),
(159, 'PB-241023-100', '4', '119', '2424000', '25', '1', '1818000', '2023-10-23'),
(160, 'PB-311023-101', '4', '83', '181081', '0', '10', '1810810', '2023-10-30'),
(161, 'PB-311023-101', '4', '82', '37838', '0', '100', '3783800', '2023-10-30'),
(162, 'PB-311023-102', '4', '115', '15000', '0', '100', '1500000', '2023-10-30'),
(163, 'PB-311023-102', '4', '90', '42000', '0', '100', '4200000', '2023-10-30'),
(164, 'PB-311023-103', '4', '91', '37200', '0', '100', '3720000', '2023-10-30'),
(165, 'PB-311023-104', '4', '86', '6250000', '0', '2', '12500000', '2023-10-30'),
(166, 'PB-311023-105', '4', '105', '140000', '25', '1', '105000', '2023-10-30'),
(167, 'PB-311023-106', '3', '72', '10500', '0', '10019', '105199500', '2023-10-30'),
(168, 'PB-311023-107', '3', '69', '6300', '0', '10351', '65211300', '2023-10-30'),
(169, 'PB-311023-108', '3', '69', '6300', '0', '9415', '59314500', '2023-10-30'),
(170, 'PB-311023-109', '3', '69', '6325', '0', '10683', '67569975', '2023-10-30'),
(171, 'PB-031123-110', '4', '93', '100000', '0', '75', '7500000', '2023-11-02'),
(172, 'PB-031123-111', '4', '120', '32000', '0', '200', '6400000', '2023-11-02'),
(173, 'PB-031123-112', '4', '122', '650000', '0', '10', '6500000', '2023-11-02'),
(174, 'PB-031123-113', '3', '69', '6250', '0', '3220', '20125000', '2023-11-02'),
(175, 'PB-031123-114', '3', '69', '6350', '0', '10518', '66789300', '2023-11-02'),
(176, 'PB-031123-115', '4', '123', '150000', '0', '100', '15000000', '2023-11-02'),
(177, 'PB-031123-116', '4', '121', '200000', '0', '32', '6400000', '2023-11-02'),
(178, 'PB-031123-117', '3', '69', '6350', '0', '10615', '67405250', '2023-11-02'),
(179, 'PB-031123-118', '3', '69', '6350', '0', '10711', '68014850', '2023-11-02'),
(180, 'PB-031123-119', '3', '69', '10405', '0', '6350', '66071750', '2023-11-02'),
(181, 'PB-031123-120', '3', '69', '9961', '0', '6350', '63252350', '2023-11-02'),
(182, 'PB-031123-121', '3', '70', '9250', '0', '10000', '92500000', '2023-11-02'),
(183, 'PB-031123-122', '3', '71', '40000', '0', '9250', '370000000', '2023-11-02'),
(184, 'PB-031123-123', '3', '72', '10000', '0', '1000', '10000000', '2023-11-02'),
(185, 'PB-051123-124', '4', '124', '65000', '0', '100', '6500000', '2023-11-04'),
(186, 'PB-051123-125', '4', '90', '42000', '0', '100', '4200000', '2023-11-04'),
(187, 'PB-051123-126', '4', '124', '65000', '0', '100', '6500000', '2023-11-04'),
(188, 'PB-051123-127', '4', '124', '65000', '0', '100', '6500000', '2023-11-04'),
(189, 'PB-051123-128', '5', '28', '8000', '0', '48000', '384000000', '2023-11-05'),
(190, 'PB-071123-129', '4', '39', '330800', '25', '10', '2481000', '2023-11-06'),
(191, 'PB-071123-130', '4', '105', '140000', '25', '1', '105000', '2023-11-06'),
(192, 'PB-071123-131', '4', '125', '85000', '0', '50', '4250000', '2023-11-06'),
(193, 'PB-071123-132', '5', '28', '75000', '0', '393', '29475000', '2023-11-07'),
(194, 'PB-071123-133', '5', '28', '75000', '0', '393', '29475000', '2023-11-07'),
(195, 'PB-071123-134', '5', '28', '75000', '0', '393', '29475000', '2023-11-07'),
(196, 'PB-091123-135', '4', '49', '56605', '0', '200', '11321000', '2023-11-08'),
(197, 'PB-091123-136', '4', '126', '50', '0', '102000', '5100000', '2023-11-08'),
(198, 'PB-091123-137', '4', '83', '201000', '0', '4', '804000', '2023-11-08'),
(199, 'PB-091123-137', '4', '82', '42000', '0', '150', '6300000', '2023-11-08'),
(200, 'PB-091123-138', '3', '70', '5750', '0', '8972', '51589000', '2023-11-08'),
(201, 'PB-141123-139', '4', '49', '47000', '0', '100', '4700000', '2023-11-13'),
(202, 'PB-141123-140', '4', '127', '30400', '25', '60', '1368000', '2023-11-13'),
(203, 'PB-141123-141', '4', '105', '140000', '25', '2', '210000', '2023-11-13'),
(204, 'PB-141123-142', '4', '129', '80300', '25', '1', '60225', '2023-11-13'),
(205, 'PB-141123-142', '4', '128', '160100', '25', '1', '120075', '2023-11-13'),
(206, 'PB-141123-143', '4', '39', '330800', '25', '10', '2481000', '2023-11-13'),
(207, 'PB-141123-143', '4', '130', '544500', '25', '10', '4083750', '2023-11-13'),
(208, 'PB-141123-144', '4', '131', '694900', '25', '5', '2605875', '2023-11-13'),
(209, 'PB-141123-144', '4', '98', '74700', '25', '20', '1120500', '2023-11-13'),
(210, 'PB-141123-145', '4', '132', '10500', '0', '25', '262500', '2023-11-13'),
(211, 'PB-141123-145', '4', '90', '42000', '0', '25', '1050000', '2023-11-13'),
(212, 'PB-141123-145', '4', '91', '186000', '0', '20', '3720000', '2023-11-13'),
(213, 'PB-151123-146', '4', '33', '49000', '25', '200', '7350000', '2023-11-14'),
(214, 'PB-201123-147', '4', '36', '854000', '25', '3', '1921500', '2023-11-19'),
(215, 'PB-201123-148', '4', '36', '854000', '25', '3', '1921500', '2023-11-19'),
(216, 'PB-201123-149', '4', '133', '185000', '25', '60', '8325000', '2023-11-19'),
(217, 'PB-201123-150', '4', '111', '72000', '0', '125', '9000000', '2023-11-19'),
(218, 'PB-201123-151', '4', '126', '102000', '0', '50', '5100000', '2023-11-19'),
(219, 'PB-221123-152', '3', '70', '5750', '0', '8972', '51589000', '2023-11-21'),
(220, 'PB-221123-153', '3', '69', '5900', '0', '2689', '15865100', '2023-11-21'),
(221, 'PB-221123-154', '3', '135', '4900', '0', '5787', '28356300', '2023-11-21'),
(222, 'PB-221123-155', '3', '69', '6000', '0', '9364', '56184000', '2023-11-21'),
(223, 'PB-231123-156', '4', '136', '81000', '0', '20', '1620000', '2023-11-22'),
(224, 'PB-231123-157', '4', '87', '170000', '0', '5', '850000', '2023-11-22'),
(225, 'PB-231123-158', '4', '87', '20', '0', '170000', '3400000', '2023-11-22'),
(226, 'PB-261123-159', '4', '137', '1720500', '0', '2', '3441000', '2023-11-25'),
(227, 'PB-261123-160', '3', '69', '6000', '0', '9364', '56184000', '2023-11-25'),
(228, 'PB-261123-161', '3', '69', '6050', '0', '11139.5', '67390950', '2023-11-25'),
(229, 'PB-261123-162', '3', '69', '6050', '0', '644.5', '3896200', '2023-11-25'),
(230, 'PB-261123-163', '3', '69', '6200', '0', '9461', '58658200', '2023-11-25'),
(231, 'PB-261123-164', '3', '69', '6100', '0', '8576.5', '52313600', '2023-11-25'),
(232, 'PB-261123-165', '3', '69', '6250', '0', '9706.5', '60662500', '2023-11-25'),
(233, 'PB-261123-166', '3', '69', '6250', '0', '8452', '52825000', '2023-11-25'),
(234, 'PB-271123-167', '4', '105', '152000', '25', '1', '114000', '2023-11-26'),
(235, 'PB-271123-168', '4', '89', '81100', '25', '10', '608250', '2023-11-26'),
(236, 'PB-271123-169', '4', '105', '152000', '25', '1', '114000', '2023-11-26');

-- --------------------------------------------------------

--
-- Table structure for table `t_penjualan`
--

CREATE TABLE `t_penjualan` (
  `penjualan_id` int(11) NOT NULL,
  `penjualan_user` int(11) DEFAULT NULL,
  `penjualan_kontak` text DEFAULT NULL,
  `penjualan_nomor` text DEFAULT NULL,
  `penjualan_status` enum('lunas','belum') DEFAULT NULL,
  `penjualan_jatuh_tempo` text DEFAULT NULL,
  `penjualan_keterangan` text DEFAULT NULL,
  `penjualan_qty` text DEFAULT NULL,
  `penjualan_ppn` int(11) DEFAULT NULL,
  `penjualan_total` text DEFAULT NULL,
  `penjualan_tanggal` date DEFAULT curdate(),
  `penjualan_hapus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_penjualan`
--

INSERT INTO `t_penjualan` (`penjualan_id`, `penjualan_user`, `penjualan_kontak`, `penjualan_nomor`, `penjualan_status`, `penjualan_jatuh_tempo`, `penjualan_keterangan`, `penjualan_qty`, `penjualan_ppn`, `penjualan_total`, `penjualan_tanggal`, `penjualan_hapus`) VALUES
(4, 2, '4', 'PJ-130523-1', 'belum', '2023-05-10', 'penjualan telur', '70', NULL, '740000', '2023-05-13', 1),
(5, 2, '5', 'PJ-130523-2', 'lunas', '2023-05-13', 'penjualan ayam', '10', NULL, '45000', '2023-05-13', 1),
(6, 2, '28', 'PJ-070923-3', 'lunas', '2023-08-02', '', '5100', NULL, '134640000', '2023-09-06', 0),
(7, 2, '28', 'PJ-070923-4', 'lunas', '2023-08-04', '', '5100', NULL, '131070000', '2023-09-06', 0),
(8, 2, '29', 'PJ-070923-5', 'lunas', '2023-08-08', '', '5040', NULL, '126504000', '2023-09-06', 0),
(9, 2, '29', 'PJ-070923-6', 'lunas', '2023-08-11', '', '5040', NULL, '123480000', '2023-09-06', 0),
(10, 2, '30', 'PJ-070923-7', 'lunas', '2023-08-08', '', '5040', NULL, '132552000', '2023-09-06', 0),
(11, 2, '29', 'PJ-070923-8', 'lunas', '2023-08-13', '', '5040', NULL, '123480000', '2023-09-06', 0),
(12, 2, '29', 'PJ-070923-9', 'lunas', '2023-08-15', '', '5040', NULL, '121464000', '2023-09-06', 0),
(13, 2, '29', 'PJ-070923-10', 'lunas', '2023-08-18', '', '3000', NULL, '67800000', '2023-09-06', 0),
(14, 2, '30', 'PJ-070923-11', 'lunas', '2023-08-19', '', '5040', NULL, '115920000', '2023-09-06', 0),
(15, 2, '29', 'PJ-070923-12', 'lunas', '2023-08-20', '', '5040', NULL, '113904000', '2023-09-06', 0),
(16, 2, '31', 'PJ-070923-13', 'lunas', '2023-08-23', '-  KULI  510.000', '5040', NULL, '119448000', '2023-09-06', 0),
(17, 2, '31', 'PJ-070923-14', 'lunas', '2023-08-24', '', '5040', NULL, '114408000', '2023-09-06', 0),
(18, 2, '29', 'PJ-070923-15', 'lunas', '2023-08-26', '', '5040', NULL, '108360000', '2023-09-06', 0),
(19, 2, '30', 'PJ-070923-16', 'lunas', '2023-08-29', '', '5040', NULL, '103320000', '2023-09-06', 0),
(20, 2, '29', 'PJ-070923-17', 'lunas', '2023-08-30', '', '5040', NULL, '100800000', '2023-09-06', 0),
(21, 2, '29', 'PJ-070923-18', 'lunas', '2023-08-31', '', '2250', NULL, '48375000', '2023-09-06', 0),
(22, 2, '29', 'PJ-070923-19', 'lunas', '2023-09-02', '', '2790', NULL, '59985000', '2023-09-06', 0),
(23, 2, '28', 'PJ-070923-20', 'lunas', '2023-09-04', '', '5100', NULL, '118320000', '2023-09-06', 0),
(24, 2, '29', 'PJ-070923-21', 'lunas', '2023-09-06', '', '5040', NULL, '109368000', '2023-09-06', 0),
(25, 2, '30', 'PJ-140923-22', 'lunas', '2023-09-07', '', '5040', NULL, '114408000', '2023-09-13', 0),
(26, 2, '28', 'PJ-031123-23', 'lunas', '2023-11-03', 'test', '10', 10, '1100000', '2023-11-03', 1),
(27, 2, '30', 'PJ-061123-24', 'lunas', '2023-11-02', 'sudah bayar', '4845', 0, '104167500', '2023-11-05', 0),
(28, 2, '30', 'PJ-091123-25', 'lunas', '2023-11-02', 'sudah bayar lunas', '4845', 0, '104167500', '2023-11-08', 1),
(29, 2, '28', 'PJ-091123-26', 'lunas', '2023-11-05', 'sudah bayar', '5100', 0, '118830000', '2023-11-08', 0),
(30, 2, '46', 'PJ-091123-27', 'lunas', '2023-11-07', 'SUDAH LUNAS', '5040', 0, '119952000', '2023-11-08', 0),
(31, 2, '48', 'PJ-141123-28', 'lunas', '2023-11-10', 'SUDAH LUNAS', '5040', 0, '114912000', '2023-11-13', 0),
(32, 2, '30', 'PJ-141123-29', 'lunas', '2023-11-12', 'SUDAH LUNAS', '5040', 0, '120960000', '2023-11-13', 0),
(33, 2, '49', 'PJ-141123-30', 'lunas', '2023-11-14', 'LUNAS TF', '5040', 0, '118944000', '2023-11-13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_penjualan_barang`
--

CREATE TABLE `t_penjualan_barang` (
  `penjualan_barang_id` int(11) NOT NULL,
  `penjualan_barang_nomor` text NOT NULL,
  `penjualan_barang_kategori` text NOT NULL,
  `penjualan_barang_barang` text NOT NULL,
  `penjualan_barang_harga` text NOT NULL,
  `penjualan_barang_diskon` text NOT NULL,
  `penjualan_barang_stok` text NOT NULL,
  `penjualan_barang_qty` text NOT NULL,
  `penjualan_barang_subtotal` text NOT NULL,
  `penjualan_barang_tanggal` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_penjualan_barang`
--

INSERT INTO `t_penjualan_barang` (`penjualan_barang_id`, `penjualan_barang_nomor`, `penjualan_barang_kategori`, `penjualan_barang_barang`, `penjualan_barang_harga`, `penjualan_barang_diskon`, `penjualan_barang_stok`, `penjualan_barang_qty`, `penjualan_barang_subtotal`, `penjualan_barang_tanggal`) VALUES
(7, 'PJ-130523-1', '1', '8', '7000', '0', '  70', '20', '140000', '2023-05-13'),
(8, 'PJ-130523-1', '1', '7', '12000', '0', '  150', '50', '600000', '2023-05-13'),
(9, 'PJ-130523-2', '2', '24', '7000', '0', '  13', '5', '35000', '2023-05-13'),
(10, 'PJ-130523-2', '2', '11', '2000', '0', '  12', '5', '10000', '2023-05-13'),
(11, 'PJ-070923-3', '1', '78', '26400', '0', '  25694', '5100', '134640000', '2023-09-06'),
(12, 'PJ-070923-4', '1', '78', '25700', '0', '  20594', '5100', '131070000', '2023-09-06'),
(13, 'PJ-070923-5', '1', '78', '25100', '0', '  15494', '5040', '126504000', '2023-09-06'),
(14, 'PJ-070923-6', '1', '78', '24500', '0', '  10454', '5040', '123480000', '2023-09-06'),
(15, 'PJ-070923-7', '1', '78', '26300', '0', '  5414', '5040', '132552000', '2023-09-06'),
(16, 'PJ-070923-8', '1', '78', '24500', '0', '  84494', '5040', '123480000', '2023-09-06'),
(17, 'PJ-070923-9', '1', '78', '24100', '0', '  79454', '5040', '121464000', '2023-09-06'),
(18, 'PJ-070923-10', '1', '78', '22600', '0', '  74414', '3000', '67800000', '2023-09-06'),
(19, 'PJ-070923-11', '1', '78', '23000', '0', '  71414', '5040', '115920000', '2023-09-06'),
(20, 'PJ-070923-12', '1', '78', '22600', '0', '  66374', '5040', '113904000', '2023-09-06'),
(21, 'PJ-070923-13', '1', '78', '23700', '0', '  61334', '5040', '119448000', '2023-09-06'),
(22, 'PJ-070923-14', '1', '78', '22700', '0', '  56294', '5040', '114408000', '2023-09-06'),
(23, 'PJ-070923-15', '1', '78', '21500', '0', '  51254', '5040', '108360000', '2023-09-06'),
(24, 'PJ-070923-16', '1', '78', '20500', '0', '  46214', '5040', '103320000', '2023-09-06'),
(25, 'PJ-070923-17', '1', '78', '20000', '0', '  41174', '5040', '100800000', '2023-09-06'),
(26, 'PJ-070923-18', '1', '78', '21500', '0', '  36134', '2250', '48375000', '2023-09-06'),
(27, 'PJ-070923-19', '1', '78', '21500', '0', '  33884', '2790', '59985000', '2023-09-06'),
(28, 'PJ-070923-20', '1', '78', '23200', '0', '  31094', '5100', '118320000', '2023-09-06'),
(29, 'PJ-070923-21', '1', '78', '21700', '0', '  25994', '5040', '109368000', '2023-09-06'),
(30, 'PJ-140923-22', '1', '78', '22700', '0', '  28860', '5040', '114408000', '2023-09-13'),
(31, 'PJ-031123-23', '1', '78', '100000', '0', '  68973', '10', '1000000', '2023-11-03'),
(32, 'PJ-061123-24', '1', '78', '21500', '0', '  73479', '4845', '104167500', '2023-11-05'),
(33, 'PJ-091123-25', '1', '78', '21500', '0', '  71323', '4845', '104167500', '2023-11-08'),
(34, 'PJ-091123-26', '1', '78', '23300', '0', '  71323', '5100', '118830000', '2023-11-08'),
(35, 'PJ-091123-27', '1', '78', '23800', '0', '  66223', '5040', '119952000', '2023-11-08'),
(36, 'PJ-141123-28', '1', '78', '22800', '0', '  61183', '5040', '114912000', '2023-11-13'),
(37, 'PJ-141123-29', '1', '78', '24000', '0', '  56143', '5040', '120960000', '2023-11-13'),
(38, 'PJ-141123-30', '1', '78', '23600', '0', '  51103', '5040', '118944000', '2023-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `t_piutang`
--

CREATE TABLE `t_piutang` (
  `piutang_id` int(11) NOT NULL,
  `piutang_nomor` text DEFAULT NULL,
  `piutang_keterangan` text DEFAULT NULL,
  `piutang_tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_piutang`
--

INSERT INTO `t_piutang` (`piutang_id`, `piutang_nomor`, `piutang_keterangan`, `piutang_tanggal`) VALUES
(3, 'PJ-130523-1', NULL, NULL),
(4, 'PJ-130523-2', 'Di bayar cash', '2023-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `t_premix`
--

CREATE TABLE `t_premix` (
  `premix_id` int(11) NOT NULL,
  `premix_kode` text NOT NULL,
  `premix_nama` text DEFAULT NULL,
  `premix_satuan` text DEFAULT NULL,
  `premix_stok` text DEFAULT NULL,
  `premix_keterangan` text DEFAULT NULL,
  `premix_tanggal` date DEFAULT curdate(),
  `premix_hapus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_premix_barang`
--

CREATE TABLE `t_premix_barang` (
  `premix_barang_id` int(11) NOT NULL,
  `premix_barang_kode` text NOT NULL,
  `premix_barang_barang` text NOT NULL,
  `premix_barang_qty` text NOT NULL,
  `premix_barang_stok` text NOT NULL,
  `premix_barang_harga` text NOT NULL DEFAULT '0',
  `premix_barang_subtotal` text NOT NULL DEFAULT '0',
  `premix_barang_tanggal` date NOT NULL DEFAULT curdate(),
  `premix_barang_hapus` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_premix_campur`
--

CREATE TABLE `t_premix_campur` (
  `premix_campur_id` int(11) NOT NULL,
  `premix_campur_kode` text NOT NULL,
  `premix_campur_barang` text DEFAULT NULL,
  `premix_campur_qty` text DEFAULT NULL,
  `premix_campur_tanggal` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_premix_qty`
--

CREATE TABLE `t_premix_qty` (
  `premix_qty_id` int(11) NOT NULL,
  `premix_qty_kode` text DEFAULT NULL,
  `premix_qty_qty` text DEFAULT NULL,
  `premix_qty_tanggal` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_recording`
--

CREATE TABLE `t_recording` (
  `recording_id` int(11) NOT NULL,
  `recording_nomor` text NOT NULL,
  `recording_user` text NOT NULL,
  `recording_tanggal` date DEFAULT NULL,
  `recording_kandang` text NOT NULL,
  `recording_bobot` text NOT NULL,
  `recording_populasi` text NOT NULL,
  `recording_hapus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_recording_barang`
--

CREATE TABLE `t_recording_barang` (
  `recording_barang_id` int(11) NOT NULL,
  `recording_barang_nomor` text DEFAULT NULL,
  `recording_barang_barang` text DEFAULT '0',
  `recording_barang_stok` text DEFAULT '0',
  `recording_barang_jumlah` text DEFAULT '0',
  `recording_barang_kategori` set('ayam','telur','pakan','premix') DEFAULT NULL,
  `recording_barang_tanggal` date DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL,
  `user_nama` text DEFAULT NULL,
  `user_email` text DEFAULT NULL,
  `user_password` text DEFAULT NULL,
  `user_level` int(11) DEFAULT 1,
  `user_foto` text DEFAULT NULL,
  `user_hapus` int(11) DEFAULT 0,
  `user_tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`user_id`, `user_nama`, `user_email`, `user_password`, `user_level`, `user_foto`, `user_hapus`, `user_tanggal`) VALUES
(2, 'Admin SPAP', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', 1, 'Admin-Profile-PNG-Clipart.png', 0, '2020-05-10');

-- --------------------------------------------------------

--
-- Table structure for table `t_vaksin`
--

CREATE TABLE `t_vaksin` (
  `vaksin_id` int(11) NOT NULL,
  `vaksin_log` text DEFAULT NULL,
  `vaksin_vaksin` text DEFAULT NULL,
  `vaksin_ayam` text DEFAULT NULL,
  `vaksin_kandang` text DEFAULT NULL,
  `vaksin_status` int(11) DEFAULT 0,
  `vaksin_tanggal` date DEFAULT curdate(),
  `vaksin_hapus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_vaksin`
--

INSERT INTO `t_vaksin` (`vaksin_id`, `vaksin_log`, `vaksin_vaksin`, `vaksin_ayam`, `vaksin_kandang`, `vaksin_status`, `vaksin_tanggal`, `vaksin_hapus`) VALUES
(10, '58', '1', '28', '54', 0, '2023-12-29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_vaksin_jadwal`
--

CREATE TABLE `t_vaksin_jadwal` (
  `vaksin_jadwal_id` int(11) NOT NULL,
  `vaksin_jadwal_kode` text DEFAULT NULL,
  `vaksin_jadwal_nama` text DEFAULT NULL,
  `vaksin_jadwal_hari` text DEFAULT NULL,
  `vaksin_jadwal_keterangan` text DEFAULT NULL,
  `vaksin_jadwal_tanggal` date DEFAULT curdate(),
  `vaksin_jadwal_hapus` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_vaksin_jadwal`
--

INSERT INTO `t_vaksin_jadwal` (`vaksin_jadwal_id`, `vaksin_jadwal_kode`, `vaksin_jadwal_nama`, `vaksin_jadwal_hari`, `vaksin_jadwal_keterangan`, `vaksin_jadwal_tanggal`, `vaksin_jadwal_hapus`) VALUES
(1, 'VK001', 'vaksin seminggu sekali', '7', '-', '2023-12-23', 0),
(2, 'VK002', 'vaksin sepuluh hari sekali', '10', '-', '2023-12-23', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_absen`
--
ALTER TABLE `t_absen`
  ADD PRIMARY KEY (`absen_id`);

--
-- Indexes for table `t_bank`
--
ALTER TABLE `t_bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `t_barang`
--
ALTER TABLE `t_barang`
  ADD PRIMARY KEY (`barang_id`);

--
-- Indexes for table `t_barang_kategori`
--
ALTER TABLE `t_barang_kategori`
  ADD PRIMARY KEY (`barang_kategori_id`);

--
-- Indexes for table `t_detail_user`
--
ALTER TABLE `t_detail_user`
  ADD PRIMARY KEY (`detail_id`);

--
-- Indexes for table `t_gaji`
--
ALTER TABLE `t_gaji`
  ADD PRIMARY KEY (`gaji_id`);

--
-- Indexes for table `t_hutang`
--
ALTER TABLE `t_hutang`
  ADD PRIMARY KEY (`hutang_id`);

--
-- Indexes for table `t_kandang`
--
ALTER TABLE `t_kandang`
  ADD PRIMARY KEY (`kandang_id`);

--
-- Indexes for table `t_kandang_log`
--
ALTER TABLE `t_kandang_log`
  ADD PRIMARY KEY (`kandang_log_id`);

--
-- Indexes for table `t_karyawan`
--
ALTER TABLE `t_karyawan`
  ADD PRIMARY KEY (`karyawan_id`);

--
-- Indexes for table `t_kontak`
--
ALTER TABLE `t_kontak`
  ADD PRIMARY KEY (`kontak_id`);

--
-- Indexes for table `t_level`
--
ALTER TABLE `t_level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `t_pakan`
--
ALTER TABLE `t_pakan`
  ADD PRIMARY KEY (`pakan_id`) USING BTREE;

--
-- Indexes for table `t_pakan_barang`
--
ALTER TABLE `t_pakan_barang`
  ADD PRIMARY KEY (`pakan_barang_id`);

--
-- Indexes for table `t_pakan_campur`
--
ALTER TABLE `t_pakan_campur`
  ADD PRIMARY KEY (`pakan_campur_id`);

--
-- Indexes for table `t_pakan_qty`
--
ALTER TABLE `t_pakan_qty`
  ADD PRIMARY KEY (`pakan_qty_id`);

--
-- Indexes for table `t_pekerjaan`
--
ALTER TABLE `t_pekerjaan`
  ADD PRIMARY KEY (`pekerjaan_id`);

--
-- Indexes for table `t_pembelian`
--
ALTER TABLE `t_pembelian`
  ADD PRIMARY KEY (`pembelian_id`);

--
-- Indexes for table `t_pembelian_barang`
--
ALTER TABLE `t_pembelian_barang`
  ADD PRIMARY KEY (`pembelian_barang_id`);

--
-- Indexes for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  ADD PRIMARY KEY (`penjualan_id`);

--
-- Indexes for table `t_penjualan_barang`
--
ALTER TABLE `t_penjualan_barang`
  ADD PRIMARY KEY (`penjualan_barang_id`);

--
-- Indexes for table `t_piutang`
--
ALTER TABLE `t_piutang`
  ADD PRIMARY KEY (`piutang_id`);

--
-- Indexes for table `t_premix`
--
ALTER TABLE `t_premix`
  ADD PRIMARY KEY (`premix_id`) USING BTREE;

--
-- Indexes for table `t_premix_barang`
--
ALTER TABLE `t_premix_barang`
  ADD PRIMARY KEY (`premix_barang_id`);

--
-- Indexes for table `t_premix_campur`
--
ALTER TABLE `t_premix_campur`
  ADD PRIMARY KEY (`premix_campur_id`);

--
-- Indexes for table `t_premix_qty`
--
ALTER TABLE `t_premix_qty`
  ADD PRIMARY KEY (`premix_qty_id`);

--
-- Indexes for table `t_recording`
--
ALTER TABLE `t_recording`
  ADD PRIMARY KEY (`recording_id`);

--
-- Indexes for table `t_recording_barang`
--
ALTER TABLE `t_recording_barang`
  ADD PRIMARY KEY (`recording_barang_id`) USING BTREE;

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `t_vaksin`
--
ALTER TABLE `t_vaksin`
  ADD PRIMARY KEY (`vaksin_id`);

--
-- Indexes for table `t_vaksin_jadwal`
--
ALTER TABLE `t_vaksin_jadwal`
  ADD PRIMARY KEY (`vaksin_jadwal_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_absen`
--
ALTER TABLE `t_absen`
  MODIFY `absen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `t_bank`
--
ALTER TABLE `t_bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `t_barang`
--
ALTER TABLE `t_barang`
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `t_barang_kategori`
--
ALTER TABLE `t_barang_kategori`
  MODIFY `barang_kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_detail_user`
--
ALTER TABLE `t_detail_user`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `t_gaji`
--
ALTER TABLE `t_gaji`
  MODIFY `gaji_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `t_hutang`
--
ALTER TABLE `t_hutang`
  MODIFY `hutang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `t_kandang`
--
ALTER TABLE `t_kandang`
  MODIFY `kandang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `t_kandang_log`
--
ALTER TABLE `t_kandang_log`
  MODIFY `kandang_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `t_karyawan`
--
ALTER TABLE `t_karyawan`
  MODIFY `karyawan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_kontak`
--
ALTER TABLE `t_kontak`
  MODIFY `kontak_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `t_level`
--
ALTER TABLE `t_level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_pakan`
--
ALTER TABLE `t_pakan`
  MODIFY `pakan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `t_pakan_barang`
--
ALTER TABLE `t_pakan_barang`
  MODIFY `pakan_barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `t_pakan_campur`
--
ALTER TABLE `t_pakan_campur`
  MODIFY `pakan_campur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `t_pakan_qty`
--
ALTER TABLE `t_pakan_qty`
  MODIFY `pakan_qty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `t_pekerjaan`
--
ALTER TABLE `t_pekerjaan`
  MODIFY `pekerjaan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_pembelian`
--
ALTER TABLE `t_pembelian`
  MODIFY `pembelian_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `t_pembelian_barang`
--
ALTER TABLE `t_pembelian_barang`
  MODIFY `pembelian_barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `t_penjualan`
--
ALTER TABLE `t_penjualan`
  MODIFY `penjualan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `t_penjualan_barang`
--
ALTER TABLE `t_penjualan_barang`
  MODIFY `penjualan_barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `t_piutang`
--
ALTER TABLE `t_piutang`
  MODIFY `piutang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_premix`
--
ALTER TABLE `t_premix`
  MODIFY `premix_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `t_premix_barang`
--
ALTER TABLE `t_premix_barang`
  MODIFY `premix_barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `t_premix_campur`
--
ALTER TABLE `t_premix_campur`
  MODIFY `premix_campur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `t_premix_qty`
--
ALTER TABLE `t_premix_qty`
  MODIFY `premix_qty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `t_recording`
--
ALTER TABLE `t_recording`
  MODIFY `recording_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=276;

--
-- AUTO_INCREMENT for table `t_recording_barang`
--
ALTER TABLE `t_recording_barang`
  MODIFY `recording_barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=475;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_vaksin`
--
ALTER TABLE `t_vaksin`
  MODIFY `vaksin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_vaksin_jadwal`
--
ALTER TABLE `t_vaksin_jadwal`
  MODIFY `vaksin_jadwal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
