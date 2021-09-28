-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2018 at 11:08 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(100) NOT NULL,
  `genre` varchar(300) NOT NULL,
  `title` varchar(300) NOT NULL,
  `author` varchar(300) NOT NULL,
  `publication` varchar(300) NOT NULL,
  `edition` int(100) NOT NULL,
  `isbn` varchar(100) NOT NULL primary key,
  `quantity` int(100) NOT NULL
);

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `genre`, `title`, `author`, `publication`, `edition`, `isbn`, `quantity`) VALUES
(1001, 'Horror', 'Zombie Day', 'Kazi Nazrul Islam', 'Nazrul Publications', 3, 'jfklsgsdlg5qw7q87w', 50),
(1002, 'Adventure', 'A Song of Ice & Fire', 'George R. R. Martin', 'Game of Thrones', 8, 'has23dadh123427', 40),
(1003, 'Adventure', 'Harry Potter & The Half Blood Prince', 'J.K Rowling', 'Rowling''s Publications', 4, '31ghf1jk24kjb3l4l1gjh', 60),
(1004, 'Adventure', 'Harry Potter & The Deadly Hallows', 'J.K Rowling', 'Rowling''s Publications', 2, 'agsh32gqkj12bkl134', 55),
(1005, 'Mystery', 'The Mysterious Affair at Styles', 'Agatha Christie', 'Agatha Publications', 2, '4zgdhdv2dfh81v31sdgj', 99),
(1006, 'Modern Literature', 'In Search of Lost Time', 'Marcel Proust', 'NY Publishers', 3, '2j3nsd235habh3dfkj', 26);

-- --------------------------------------------------------

--
-- Table structure for table `books_request`
--

-- CREATE TABLE `books_request` (
--   `request_id` int(10) NOT NULL,
--   `user_id` int(10) NOT NULL,
--   `genre` varchar(300) NOT NULL,
--   `title` varchar(300) NOT NULL,
--   `author` varchar(300) NOT NULL,
--   `edition` int(10) NOT NULL,
--   `isbn` varchar(100) NOT NULL,
--   `date` date NOT NULL
-- );

-- --
-- -- Dumping data for table `books_request`
-- --

-- INSERT INTO `books_request` (`request_id`, `user_id`, `genre`, `title`, `author`, `edition`, `isbn`, `date`) VALUES
-- (1, 2, 'Mystery', 'Murder on the Orient Express', 'Agatha Christie', 3, '12gf3gj1jhr3jklj1ugjkb', '2018-07-10'),
-- (2, 5, 'Mystery', 'The Mysterious Affair at Styles', 'Agatha Christie', 3, '4zgdhdv2dfh81v31sdgj', '2018-07-10'),
-- (3, 4, 'Mystery', 'The Mysterious Affair at Styles', 'Agatha Christie', 3, '4zgdhdv2dfh81v31sdgj', '2018-07-10');

-- --------------------------------------------------------

--
-- Table structure for table `records`
--

CREATE TABLE `records` (
  `issue_id` int(10) NOT NULL primary key,
  `book_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL foreign key REFERENCES users(user_id),
  `date` date NOT NULL,
  `isbn` varchar(100) NOT NULL foreign key REFERENCES books(isbn)
);

--
-- Dumping data for table `records`
--

INSERT INTO `records` (`issue_id`, `book_id`, `user_id`, `date`, `isbn`) VALUES
(1, 1001, 1801038, '2021-01-11', 'jfklsgsdlg5qw7q87w'),
(2, 1002, 1801109, '2021-02-13', 'has23dadh123427'),
(3, 1001, 1801038, '2021-03-09', 'jfklsgsdlg5qw7q87w'),
(4, 1003, 1801004, '2021-04-07', '31ghf1jk24kjb3l4l1gjh'),
(5, 1004, 1801059, '2021-05-24', 'agsh32gqkj12bkl134'),
(6, 1005, 1801004, '2021-06-22', '4zgdhdv2dfh81v31sdgj'),
(7, 1004, 1801109, '2021-07-25', 'agsh32gqkj12bkl134'),
(8, 1006, 1801038, '2021-08-19', '2j3nsd235habh3dfkj'),
(9, 1003, 1801059, '2021-09-10', '31ghf1jk24kjb3l4l1gjh');
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(100) NOT NULL primary key,
  `name` varchar(300) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `email` varchar(300) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `password` varchar(300) NOT NULL
);

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `phone`, `email`, `is_admin`, `password`) VALUES
(101, 'admin', '7896541235', 'admin@gmail.com', 1, '1234'),
(1801038, 'Atul Prakash', '7992299306', 'atul.prakash@iiitg.ac.in', 0, 'apr'),
(1801109, 'Namit Goel', '7644316859', 'namit.goel@iiitg.ac.in', 0, 'namit'),
(1801059, 'Diwakar Bharti', '9241847941', 'diwakar.bharti@iiitg.ac.in', 0, 'diwakar'),
(1801004, 'Abhinav Singh', '7269723864', 'abhinav.singh@iiitg.ac.in', 0, 'abhinav');


--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `books_request`
--
ALTER TABLE `books_request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `issue_date`
--
ALTER TABLE `issue_date`
  ADD PRIMARY KEY (`issue_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `books_request`
--
ALTER TABLE `books_request`
  MODIFY `request_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `issue_date`
--
ALTER TABLE `issue_date`
  MODIFY `issue_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
