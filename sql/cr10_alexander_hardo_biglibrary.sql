-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 23, 2018 at 04:55 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr10_alexander_hardo_biglibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_author`
--

CREATE TABLE `tbl_author` (
  `author_id` int(11) NOT NULL,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_author`
--

INSERT INTO `tbl_author` (`author_id`, `first_name`, `last_name`) VALUES
(1, 'William ', 'Stallings'),
(2, 'Andrew  ', ' Tanenbaum'),
(3, 'Thomas', ' Floyd'),
(4, 'gilbert ', 'strang');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_books`
--

CREATE TABLE `tbl_books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `ISBN` varchar(22) COLLATE utf8_bin DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `fk_publisher_id` int(11) NOT NULL,
  `img` varchar(300) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_books`
--

INSERT INTO `tbl_books` (`book_id`, `title`, `ISBN`, `publish_date`, `description`, `fk_publisher_id`, `img`) VALUES
(31, 'Computer Organization and Architecture: International Editio', '0273775316', '2013-12-26', 'Computer Organization and Architecture', 4, 'https://images-na.ssl-images-amazon.com/images/I/51k%2BYFMWXTL._SX360_BO1,204,203,200_.jpg'),
(32, 'Computer Networks', '9780133072624', '2012-06-15', 'a structured approach to explaining how networks work', 4, 'https://images-na.ssl-images-amazon.com/images/I/51%2BWGwXNHQL._SX357_BO1,204,203,200_.jpg'),
(33, 'Digital Fundamentals, Global Edition', '9781292075983', '2014-05-17', 'Provides a strong foundation in the core fundamentals of digital technology.', 4, 'https://images-na.ssl-images-amazon.com/images/I/81RgTj0g4ML.jpg'),
(34, 'calculus', '0961408820', '1991-04-17', 'a good introduction to calculation', 3, 'https://ocw.mit.edu/resources/res-18-001-calculus-online-textbook-spring-2005/res-18-001s05.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_book_author`
--

CREATE TABLE `tbl_book_author` (
  `fk_book_ID` int(11) NOT NULL,
  `fk_author_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_book_author`
--

INSERT INTO `tbl_book_author` (`fk_book_ID`, `fk_author_ID`) VALUES
(31, 1),
(32, 2),
(33, 3),
(34, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_publisher`
--

CREATE TABLE `tbl_publisher` (
  `publisher_ID` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `tbl_publisher`
--

INSERT INTO `tbl_publisher` (`publisher_ID`, `name`, `address`) VALUES
(3, 'wellesley cambridge press', 'cambridge'),
(4, 'Pearson Education', 'New York');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(60) COLLATE utf8_bin NOT NULL,
  `useremail` varchar(60) COLLATE utf8_bin NOT NULL,
  `userpass` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `useremail`, `userpass`) VALUES
(1, 'alex', 'alex@book.com', 'ba530a3de516671e75365bf3c1c29d866038eefe9e7a16caf8456986e0809bb1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_author`
--
ALTER TABLE `tbl_author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `tbl_books`
--
ALTER TABLE `tbl_books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `fk_publisher_id` (`fk_publisher_id`);

--
-- Indexes for table `tbl_book_author`
--
ALTER TABLE `tbl_book_author`
  ADD PRIMARY KEY (`fk_book_ID`,`fk_author_ID`),
  ADD KEY `fk_author_ID` (`fk_author_ID`);

--
-- Indexes for table `tbl_publisher`
--
ALTER TABLE `tbl_publisher`
  ADD PRIMARY KEY (`publisher_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_author`
--
ALTER TABLE `tbl_author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_books`
--
ALTER TABLE `tbl_books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `tbl_publisher`
--
ALTER TABLE `tbl_publisher`
  MODIFY `publisher_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_books`
--
ALTER TABLE `tbl_books`
  ADD CONSTRAINT `tbl_books_ibfk_1` FOREIGN KEY (`fk_publisher_id`) REFERENCES `tbl_publisher` (`publisher_ID`);

--
-- Constraints for table `tbl_book_author`
--
ALTER TABLE `tbl_book_author`
  ADD CONSTRAINT `tbl_book_author_ibfk_1` FOREIGN KEY (`fk_author_ID`) REFERENCES `tbl_author` (`author_id`),
  ADD CONSTRAINT `tbl_book_author_ibfk_2` FOREIGN KEY (`fk_book_ID`) REFERENCES `tbl_books` (`book_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
