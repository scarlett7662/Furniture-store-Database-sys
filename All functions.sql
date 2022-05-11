-- CREATE USER 'newuser'@'localhost' IDENTIFIED BY 'password';
CREATE USER IF NOT EXISTS gatechUser@localhost IDENTIFIED BY 'gatech123';
DROP DATABASE IF EXISTS `cs6400_sp21_team056`; 
SET default_storage_engine=InnoDB;
SET NAMES utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE DATABASE IF NOT EXISTS `cs6400_sp21_team056`     
DEFAULT CHARACTER SET utf8mb4    
DEFAULT COLLATE utf8mb4_unicode_ci;
USE `cs6400_sp21_team056`;
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'gatechUser'@'localhost';
GRANT ALL PRIVILEGES ON `gatechuser`.* TO 'gatechUser'@'localhost';
GRANT ALL PRIVILEGES ON `cs6400_sp21_team056`.* TO 'gatechUser'@'localhost';
FLUSH PRIVILEGES;

-- TABLEs 
DROP TABLE IF EXISTS `ChildCare`;
CREATE TABLE `ChildCare` (
	Limit_Time integer PRIMARY KEY
);
#=============================
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
	PID varchar(255) PRIMARY KEY,
	PName varchar(255) NOT NULL,
	price float NOT NULL
);
#=============================
DROP TABLE IF EXISTS `Alldate`;
CREATE TABLE `Alldate` (
	single_Date date PRIMARY KEY
);
#==================================
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
	cname varchar(255) PRIMARY KEY
);

DROP TABLE IF EXISTS `City`;
CREATE TABLE `City` (
	State_Name varchar(255) NOT NULL,
	Population Integer NOT NULL,
	City_Name varchar(255) NOT NULL,
	PRIMARY KEY(State_Name,city_name)
);
#==================================
DROP TABLE IF EXISTS `AD`;
CREATE TABLE `AD` (
	ADname varchar(255) PRIMARY KEY
);

DROP TABLE IF EXISTS `Store`;
CREATE TABLE `Store`(
	Store_Number integer PRIMARY KEY,
	Phone_Number varchar(255) NOT NULL,
	ADDress varchar(255) NOT NULL,
	Restaurant BOOLEAN,
	Snack_bar  BOOLEAN,
	State_Name varchar(255) NOT NULL,
	City_Name varchar(255) NOT NULL,
	limit_time integer,
	FOREIGN KEY (state_name, City_Name) REFERENCES City(State_name, City_name),
	FOREIGN KEY (limit_time) REFERENCES ChildCare(limit_time)
);

#==============================
DROP TABLE IF EXISTS `Sales`;
CREATE TABLE `Sales` (
	sell_date date NOT NULL,
	Sell_Quantity integer NOT NULL,
	PID varchar(255) NOT NULL,
	Store_Number integer NOT NULL,
	FOREIGN KEY (sell_date) REFERENCES Alldate(single_Date),
	FOREIGN KEY (PID) REFERENCES product(PID),
	FOREIGN KEY (Store_Number) REFERENCES Store(Store_Number)
);
#==============================
DROP TABLE IF EXISTS `discount`;
CREATE TABLE `discount` (
	percentage integer NOT NULL,
	discount_date date NOT NULL,
	pid varchar(255) NOT NULL,
	FOREIGN KEY (pid) REFERENCES product(pid),
	FOREIGN KEY (discount_date) REFERENCES alldate(single_Date)
);
ALTER TABLE `discount` ADD PRIMARY KEY(pid, discount_date);

#==================================
DROP TABLE IF EXISTS `assigns`;
CREATE TABLE `assigns` (
	cname varchar(255) NOT NULL,
	pid varchar(255) NOT NULL,
	FOREIGN KEY (cname) REFERENCES category(cname),
	FOREIGN KEY (pid) REFERENCES product(pid)
);
#==================================
DROP TABLE IF EXISTS `festival`;
CREATE TABLE `festival` (
	fname varchar(255) NOT NULL,
	festival_date date NOT NULL,
	FOREIGN KEY (festival_date) REFERENCES alldate(single_date)
);

#==================================
#CREATE TABLE festival_date
DROP TABLE IF EXISTS `AD_date`;
CREATE TABLE `AD_date` (
	ADname varchar(255) NOT NULL,
	ADdate date NOT NULL,
	FOREIGN KEY (ADdate) REFERENCES alldate(single_date)
);
ALTER TABLE `ad_date` ADD PRIMARY KEY (adname, ADdate);
