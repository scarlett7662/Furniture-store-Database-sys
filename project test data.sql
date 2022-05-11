CREATE database IF NOT exists `dbsys_cs_6250`;
use `dbsys_cs_6250`;
drop table if exists `ChildCare`;
create table `ChildCare` (
	Limit_Time integer primary key
);
#=============================
drop table if exists `product`;
create table `product` (
	PID varchar(255) primary key,
	PName varchar(255) not null,
	price float not null
);
#=============================
drop table if exists `Alldate`;
create table `Alldate` (
	single_Date date primary key
);
#==================================
drop table if exists `category`;
create table `category` (
	cname varchar(255) primary key
);

drop table if exists `City`;
create table `City` (
	State_Name VARCHAR(255) not null,
	Population Integer not null,
	City_Name varchar(255) not null,
	primary key(State_Name,city_name)
);
#==================================
drop table if exists `AD`;
create table `AD` (
	ADname varchar(255) primary key
);

drop table if exists `Store`;
create table `Store`(
	Store_Number Integer primary key,
	Phone_Number varchar(255) not null,
	Address varchar(255) not null,
	Restaurant boolean,
	Snack_bar  boolean,
	State_Name varchar(255) not null,
	City_Name varchar(255) not null,
	limit_time integer,
	foreign key (state_name, City_Name) references City(State_name, City_name),
	foreign key (limit_time) references ChildCare(limit_time)
);

#==============================
drop table if exists `Sales`;
create table `Sales` (
	sell_date Date not null,
	Sell_Quantity Integer not null,
	PID varchar(255) not null,
	Store_Number Integer not null,
	foreign key (sell_date) references Alldate(single_Date),
	foreign key (PID) references product(PID),
	foreign key (Store_Number) references Store(Store_Number)
);
#==============================
drop table if exists `discount`;
create table `discount` (
	percentage integer not null,
	discount_date date not null,
	pid varchar(255) not null,
	foreign key (pid) references product(pid),
	foreign key (discount_date) references alldate(single_Date)
);
alter table `discount` add primary key(pid, discount_date);

#==================================
drop table if exists `assigns`;
create table `assigns` (
	cname varchar(255) not null,
	pid varchar(255) not null,
	foreign key (cname) references category(cname),
	foreign key (pid) references product(pid)
);
#==================================
drop table if exists `festival`;
create table `festival` (
	fname varchar(255) not null,
	festival_date date not null,
	foreign key (festival_date) references alldate(single_date)
);

#==================================
#create table festival_date
drop table if exists `AD_date`;
create table `AD_date` (
	ADname varchar(255) not null,
	ADdate date not null,
	foreign key (ADdate) references alldate(single_date)
);
alter table `ad_date` add primary key (adname, addate);





#==============================================================
# insert data now 
insert into `childcare`(`Limit_Time`) values
		(15),
		(20),
		(25),
		(30),
		(35),
		(40),
		(45),
		(50);
		
insert into `product`(pid, pname, price) values 
		('1', 'long desk', 200),
		('2', 'short desk', 170),
		('3', 'round desk', 150),
		('4', 'baby desk', 80),
		('5', 'long chair', 80),
		('6', 'short chair', 50),
		('7', 'baby chair', 30),
		('8', 'round chair', 40),
		('9', 'large sofa', 300),
		('10', 'middle sofa', 200),
		('11', 'small sofa', 100),
		('12', 'table lamp', 80),
		('13', 'desk lamp', 60),
		('14', 'baby lamp', 40),
		('15', 'large cabinet', 300),
		('16', 'median cabinet', 200),
		('17', 'small cabinet', 100),
		('18', 'large shoe stack', 120),
		('19', 'median shoe stack', 80),
		('20', 'small shoe stack', 60);
insert into `alldate` values 
	('2015/01/01'),
	('2015/02/01'),
	('2015/03/01'),
	('2015/04/01'),
	('2015/05/01'),
	('2015/06/01'),
	('2015/07/01'),
	('2015/08/01'),
	('2015/09/01'),
	('2015/10/01'),
	('2015/11/01'),
	('2015/12/01'),
	('2016/01/01'),
	('2016/02/01'),
	('2016/03/01'),
	('2016/04/01'),
	('2016/05/01'),
	('2016/06/01'),
	('2016/07/01'),
	('2016/08/01'),
	('2016/09/01'),
	('2016/10/01'),
	('2016/11/01'),
	('2016/12/01'),
	('2017/01/01'),
	('2017/02/01'),
	('2017/03/01'),
	('2017/04/01'),
	('2017/05/01'),
	('2017/06/01'),
	('2017/07/01'),
	('2017/08/01'),
	('2017/09/01'),
	('2017/10/01'),
	('2017/11/01'),
	('2017/12/01'),
	('2018/01/01'),
	('2018/02/01'),
	('2018/03/01'),
	('2018/04/01'),
	('2018/05/01'),
	('2018/06/01'),
	('2018/07/01'),
	('2018/08/01'),
	('2018/09/01'),
	('2018/10/01'),
	('2018/11/01'),
	('2018/12/01');

insert 	into `category`(`cname`) values
        ('Couches and Sofas'),
        ('desks'),
        ('chairs'),
        ('cabinets'),
        ('lamp'),
        ('stack'),
        ('AMX50100');

insert into `City`(`State_Name`, `Population`, `City_Name`) values 
		('Alabama', 2700000, 'Montgomery'),
		('Alaska', 6000000,'Juneau'),
		('Florida', 8000000,'Tallahassee'),
		('Florida', 3000000,'Orlando'),
		('Georgia', 17861432, 'Atlanta'),
		('Iowa', 27745382,'Des Moines'),
		('Alabama', 4532165,'Birmingham');
	
insert into `Store` (`Store_Number`, `Phone_Number`, `Address`, `Restaurant`, `Snack_bar`, `State_Name`, `City_Name`, `limit_time`) values 
		(11111111, '5812315', '54241ADASF3S,rd', 1, 1, 'Alabama', 'Montgomery',15),
		(22222222, '4235123', '1KDH1ENDSH21E,RD',1, 0, 'Alaska', 'Juneau',20),
		(33333333, '4241341', '1KDH1DADDASDE,RD',1, 0, 'Florida', 'Tallahassee',30),
		(44444444, '4235123', '1KDH1ENDSH21E,RD',1, 1, 'Florida', 'Orlando', 35),
		(55555555, '4235124', 'ADSAAASFSCZ,RD',1, 1, 'Georgia', 'Atlanta', 50),
		(66666666, '4235125', 'SADASXCSFECS,RD',1, 1, 'Iowa', 'Des Moines',20),
		(77777777, '4235126', 'CAQADAXCQEF,RD',1,0, 'Georgia', 'Atlanta',40),
		(88888888, '4235127', 'AFDASXCEQ,RD',1,1, 'Georgia', 'Atlanta',50),
		(99999999, '4235128', 'VFQASCQEFAA,RD',1, 0, 'Alabama', 'Birmingham',25);
	
insert into `sales`(`sell_date`, `Sell_Quantity`, `PID`,`Store_Number`) values
		('2015/01/01', 20, '1', 11111111),
		('2015/02/01', 17, '3', 22222222),
		('2015/03/01', 23, '5', 33333333),
		('2015/03/01', 14, '6', 44444444),
		('2015/04/01', 23, '7', 55555555),
		('2015/04/01', 30, '8', 66666666),
		('2015/04/01', 55, '9', 77777777),
		('2015/05/01', 56, '3', 88888888),
		('2015/05/01', 37, '12', 88888888),
		('2015/05/01', 70, '15', 99999999),
		('2015/06/01', 47, '17', 99999999),
		('2015/06/01', 62, '20', 22222222),
		('2015/06/01', 85, '20', 11111111),
		('2015/07/01', 101, '6', 33333333),
		('2015/07/01', 80, '4', 55555555),
		('2015/10/01', 47, '10', 66666666),
		('2015/11/01', 26, '13', 11111111),
		('2015/10/01', 76, '14', 22222222),
		('2015/12/01', 92, '16', 55555555),
		('2015/12/01', 76, '11', 44444444),
		('2016/01/01', 69, '11', 77777777),
		('2016/02/01', 72, '15', 77777777),
		('2016/03/01', 134, '18', 99999999),
		('2016/05/01', 42, '20', 22222222),
		('2016/08/01', 5, '1', 11111111),
		('2016/12/01', 8, '2', 22222222),
		('2016/11/01', 132, '3', 33333333),
		('2016/10/01', 38, '4', 44444444),
		('2016/09/01', 62, '5', 55555555),
		('2016/06/01', 56, '6', 77777777),
		('2016/07/01', 48, '7', 66666666),
		('2016/11/01', 35, '8', 55555555),
		('2016/10/01', 77, '9', 33333333),
		('2016/12/01', 74, '10', 44444444),
		('2016/09/01', 81, '11', 88888888),
		('2016/01/01', 83, '12', 88888888),
		('2016/03/01', 85, '13', 99999999),
		('2016/07/01', 87, '13', 66666666),
		('2016/10/01', 89, '14', 11111111),
		('2016/08/01', 91, '16', 22222222),
		('2017/12/01', 8, '2', 22222222),
		('2017/11/01', 132, '3', 33333333),
		('2017/10/01', 38, '4', 44444444),
		('2017/09/01', 62, '5', 55555555),
		('2017/06/01', 56, '6', 77777777),
		('2017/07/01', 48, '7', 66666666),
		('2017/11/01', 35, '8', 55555555),
		('2017/10/01', 77, '9', 33333333),
		('2017/12/01', 74, '10', 44444444),
		('2017/09/01', 81, '11', 88888888),
		('2017/01/01', 83, '12', 88888888),
		('2017/03/01', 85, '13', 99999999),
		('2017/07/01', 87, '13', 66666666),
		('2017/10/01', 89, '14', 11111111),
		('2017/08/01', 91, '16', 22222222),
		('2018/11/01', 35, '8', 55555555),
		('2018/10/01', 77, '9', 33333333),
		('2018/12/01', 74, '10', 44444444),
		('2018/09/01', 81, '11', 88888888),
		('2018/01/01', 83, '12', 88888888),
		('2018/03/01', 85, '13', 99999999),
		('2018/07/01', 87, '13', 66666666),
		('2018/06/01', 89, '14', 11111111),
		('2018/08/01', 91, '16', 22222222);
		

insert into `discount`(`percentage`, `discount_date`,`pid`) values 
		(80, '2015/08/01', '1'),
		(80, '2015/08/01', '3'),	
		(80, '2015/08/01', '4'),
		(80, '2015/08/01', '7'),		
		(80, '2015/08/01', '12'),		
		(80, '2015/08/01', '15'),		
		(80, '2015/08/01', '20'),
		(70, '2015/10/01', '6'),
		(70, '2015/10/01', '9'),	
		(80, '2015/06/01', '4'),
		(90, '2015/06/01', '8'),		
		(80, '2015/07/01', '6'),		
		(70, '2015/07/01', '11'),		
		(60, '2015/04/01', '15'),
		(50, '2015/03/01', '17'),
		(40, '2015/02/01', '20'),	
		(10, '2015/09/01', '18'),
		(20, '2015/10/01', '12'),		
		(30, '2015/10/01', '14'),		
		(50, '2015/11/01', '13'),		
		(60, '2015/12/01', '12'),
		
		(30, '2016/08/01', '1'),
		(50, '2016/08/01', '3'),	
		(60, '2016/08/01', '4'),
		(50, '2016/08/01', '7'),		
		(30, '2016/08/01', '12'),		
		(45, '2016/08/01', '15'),		
		(46, '2016/08/01', '20'),
		(54, '2016/10/01', '6'),
		(46, '2016/10/01', '9'),	
		(64, '2016/06/01', '4'),
		(24, '2016/06/01', '8'),		
		(54, '2016/07/01', '6'),		
		(70, '2016/07/01', '11'),		
		(49, '2016/04/01', '15'),
		(50, '2016/03/01', '17'),
		(40, '2016/02/01', '20'),	
		(10, '2016/09/01', '18'),
		(20, '2016/10/01', '12'),		
		(30, '2016/10/01', '14'),		
		(50, '2016/11/01', '13'),		
		(60, '2016/12/01', '12'),
		
		(65, '2017/08/01', '1'),
		(31, '2017/08/01', '3'),	
		(21, '2017/08/01', '4'),
		(85, '2017/08/01', '7'),		
		(46, '2017/08/01', '12'),		
		(64, '2017/08/01', '15'),		
		(80, '2017/08/01', '20'),
		(70, '2017/10/01', '6'),
		(70, '2017/10/01', '9'),	
		(80, '2017/06/01', '4'),
		(90, '2017/06/01', '8'),		
		(80, '2017/07/01', '6'),		
		(70, '2017/07/01', '11'),		
		(60, '2017/04/01', '15'),
		(50, '2017/03/01', '17'),
		(40, '2017/02/01', '10'),	
		(10, '2017/09/01', '18'),
		(20, '2017/10/01', '2'),		
		(30, '2017/10/01', '14'),		
		(50, '2017/11/01', '13'),		
		(60, '2017/12/01', '12'),
		
		(80, '2018/08/01', '1'),
		(80, '2018/08/01', '3'),	
		(80, '2018/08/01', '4'),
		(80, '2018/08/01', '7'),		
		(80, '2018/08/01', '12'),		
		(80, '2018/08/01', '15'),		
		(80, '2018/08/01', '20'),
		(70, '2018/10/01', '6'),
		(70, '2018/10/01', '9'),	
		(80, '2018/06/01', '4'),
		(90, '2018/06/01', '8'),		
		(80, '2018/07/01', '6'),		
		(70, '2018/07/01', '11'),		
		(60, '2018/04/01', '15'),
		(50, '2018/03/01', '17'),
		(40, '2018/02/01', '10'),	
		(10, '2018/09/01', '18'),
		(20, '2018/10/01', '2'),		
		(30, '2018/10/01', '14'),		
		(50, '2018/11/01', '13'),		
		(60, '2018/12/01', '12');
	
        
insert into `assigns`(`cname`, `pid`) values
        ('desks', '1'),
        ('desks', '2'),
        ('desks', '3'),
        ('desks', '4'),
        ('chairs', '5'),
        ('chairs', '6'),
        ('chairs', '7'),
        ('chairs', '8'),
        ('Couches and Sofas', '9'),
        ('Couches and Sofas', '10'),
        ('Couches and Sofas', '11'),
        ('lamp', '12'),
        ('lamp', '13'),
        ('lamp', '14'),
        ('cabinets', '15'),
        ('cabinets', '16'),
        ('cabinets', '17'),
        ('stack', '18'),
        ('stack', '19'),
        ('stack', '20'),
        
        ('Couches and Sofas', '1'),
        ('Couches and Sofas', '2'),
        ('Couches and Sofas', '3'),
        ('lamp', '6'),
        ('lamp', '7'),
        ('lamp', '8'),
        ('cabinets', '12'),
        ('cabinets', '13'),
        ('cabinets', '14'),
        ('stack', '1'),
        ('stack', '2'),
        ('stack', '3');

        
insert into `festival`(`fname`, `festival_date`) values
		('christmas day', '2015/12/01'),
		('christmas day', '2016/12/01'),
		('christmas day', '2017/12/01'),
		('christmas day', '2018/12/01'),
		('independant day', '2015/07/01'),
		('independant day', '2016/07/01'),
		('independant day', '2017/07/01'),
		('independant day', '2018/07/01'),
		('Groundhog day', '2015/10/01'),
		('Groundhog day', '2016/10/01'),
		('Groundhog day', '2017/10/01'),
		('Groundhog day', '2018/10/01'),
		('Groundhog day', '2015/11/01'),
		('Groundhog day', '2016/11/01'),
		('Groundhog day', '2017/11/01'),
		('Groundhog day', '2018/11/01'),
		('spring festival day', '2015/01/01'),
		('spring festival day', '2016/01/01'),
		('spring festival day', '2017/01/01'),
		('spring festival day', '2018/01/01'),
		('mid autumn day', '2015/09/01'),
		('mid autumn day', '2016/09/01'),
		('mid autumn day', '2017/09/01'),
		('mid autumn day', '2018/09/01'),
		('yuanxiao day', '2015/02/01'),
		('yuanxiao day', '2016/02/01'),
		('yuanxiao day', '2017/02/01'),
		('yuanxiao day', '2018/02/01'),
		('nvshen day', '2015/03/01'),
		('nvshen day', '2016/03/01'),
		('nvshen day', '2017/03/01'),
		('nvshen day', '2018/03/01'),
		('danshengou day', '2015/06/01'),
		('danshengou day', '2016/06/01'),
		('danshengou day', '2017/06/01'),
		('danshengou day', '2018/06/01');
		
insert into `AD`(`adname`) values
  		('shuaihuo day'),
  		('laba day'),
  		('blackfriday day'),
  		('jimo day');
  		
insert into `Ad_date`(`ADname`, `ADdate`) values
		('shuaihuo day', '2015/09/01'),
		('shuaihuo day', '2016/09/01'),
		('shuaihuo day', '2017/09/01'),
		('shuaihuo day', '2018/09/01'),
		('laba day', '2015/02/01'),
		('laba day', '2016/02/01'),
		('laba day', '2017/02/01'),
		('laba day', '2018/02/01'),
		('blackfriday day', '2015/03/01'),
		('blackfriday day', '2016/03/01'),
		('blackfriday day', '2017/03/01'),
		('blackfriday day', '2018/03/01'),
		('jimo day', '2015/06/01'),
		('jimo day', '2016/06/01'),
		('jimo day', '2017/06/01'),
		('jimo day', '2018/06/01');

		