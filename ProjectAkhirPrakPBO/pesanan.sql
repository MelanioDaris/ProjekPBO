-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Bulan Mei 2022 pada 18.49
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pesanan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `food`
--

CREATE TABLE `food` (
  `FoodId` int(30) NOT NULL,
  `FoodName` varchar(50) NOT NULL,
  `Price` int(11) NOT NULL,
  `Categories` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `food`
--

INSERT INTO `food` (`FoodId`, `FoodName`, `Price`, `Categories`) VALUES
(1, 'Lemon Tea', 4000, 'Drink'),
(2, 'Bread Toast', 22000, 'Eat'),
(3, 'Spagetti', 16000, 'Eat'),
(4, 'Hot Tea', 4000, 'Drink'),
(5, 'Hot Choco', 10000, 'Drink'),
(6, 'Potato Stick', 8000, 'Eat'),
(7, 'Omelet', 4000, 'Eat'),
(8, 'Mie Goreng', 12000, 'Eat'),
(9, 'Orange Juice', 5000, 'Drink'),
(10, 'Milk Shake Vanilla', 12000, 'Drink'),
(11, 'Milk Shake Chocolate', 12000, 'Drink'),
(13, 'Mie Kuah', 17000, 'Eat'),
(14, 'Kopi Luwak', 12000, 'Drink'),
(15, 'Kopi Hitam', 7000, 'Drink'),
(16, 'Teh Tarik', 3000, 'Drink'),
(17, 'mie Ayam', 7000, 'Eat'),
(18, 'Hot Milk', 3000, 'Drink'),
(19, 'Fried Rice', 15000, 'Eat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order`
--

CREATE TABLE `order` (
  `OrderId` int(11) NOT NULL,
  `CustomerName` varchar(50) NOT NULL,
  `OrderAmount` int(11) NOT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `order`
--

INSERT INTO `order` (`OrderId`, `CustomerName`, `OrderAmount`, `Total`) VALUES
(1, 'Asih', 2, 8000),
(8, 'Alep', 2, 18000),
(9, 'Risa', 10, 34000),
(10, 'Bagas', 6, 40000),
(12, 'Belle', 6, 76000),
(13, 'Ilham', 5, 91000),
(14, 'Rini', 3, 27000),
(15, 'Zidan', 2, 8000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orderbasket`
--

CREATE TABLE `orderbasket` (
  `FName` int(11) NOT NULL,
  `jml` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orderdetail`
--

CREATE TABLE `orderdetail` (
  `FoodId` int(30) NOT NULL,
  `AmountOrder` int(11) NOT NULL,
  `OrderId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `orderdetail`
--

INSERT INTO `orderdetail` (`FoodId`, `AmountOrder`, `OrderId`) VALUES
(1, 2, 1),
(5, 1, 8),
(6, 1, 8),
(7, 4, 9),
(5, 1, 9),
(8, 1, 9),
(1, 3, 9),
(4, 1, 9),
(6, 1, 10),
(8, 1, 10),
(3, 2, 10),
(1, 2, 10),
(1, 1, 12),
(6, 1, 12),
(2, 2, 12),
(5, 2, 12),
(10, 1, 13),
(2, 1, 13),
(13, 1, 13),
(14, 1, 13),
(1, 1, 14),
(3, 1, 14),
(15, 1, 14),
(1, 1, 15),
(7, 1, 15);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`FoodId`);

--
-- Indeks untuk tabel `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderId`);

--
-- Indeks untuk tabel `orderbasket`
--
ALTER TABLE `orderbasket`
  ADD KEY `FName` (`FName`);

--
-- Indeks untuk tabel `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD KEY `OrderId` (`OrderId`),
  ADD KEY `FoodId` (`FoodId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `food`
--
ALTER TABLE `food`
  MODIFY `FoodId` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `order`
--
ALTER TABLE `order`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orderbasket`
--
ALTER TABLE `orderbasket`
  ADD CONSTRAINT `orderbasket_ibfk_1` FOREIGN KEY (`FName`) REFERENCES `food` (`FoodId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`OrderId`) REFERENCES `order` (`OrderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderdetail_ibfk_3` FOREIGN KEY (`FoodId`) REFERENCES `food` (`FoodId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
