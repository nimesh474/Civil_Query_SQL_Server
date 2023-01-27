-- create database
create database citizen;

-- see databse in databases
select * from master.sys.databases;

-- create table named civil
create table nation.civil(
	civil_id int identity(1,1),
	first_name varchar(50) not null,
	last_name varchar(50),
	DOB date,
	address varchar(100) not null constraint con_def default 'Kathmandu',
	email varchar(100) unique,
	constraint pk_id primary key(civil_id)
	);

/*
find the table created
*/
select * from nation.civil;

-- drop table
drop table dbo.civil;

-- create schema for table database object
create schema nation;
go

-- insert 10 people data in nation.civil table
insert into nation.civil(first_name, last_name, DOB, address, email)
values('Pasang', 'Sherpa', '02-14-1993', 'Solukhumbu', 'pasang.lhamu@gmail.com'),
('Bhakti', 'Thapa', '10-29-1995', 'Lamjung', 'bhakti.chhetri@gmail.com'),
('Prithvi','Singh', '02-16-1999', 'Bajhang', 'prithvi.singh@gmail.com'),
('Prithvi', 'Shah', '03-14-2000', 'Gorkha', 'prithvi.shah@gmail.com')
;

-- truncate nation.civil
truncate table nation.civil;

insert into nation.civil(first_name, DOB, email)
values('Nimesh', '04-27-1996', 'nimesh.bhattarai@gmail.com'),
('Saroj', '01-30-1995', 'saroj.khatri@gmail.com'),
('Sushil', '09-21-1985', 'sushil.bhattarai@gmail.com'),
('Rohit', '03-17-1986', 'roohit.pandey@gmail.com'),
('Ashwin', '08-12-1997', 'ashwin.sharma@gmail.com'),
('Asbin', '09-12-1997', 'asbin.sharma@gmail.com')
;
insert into nation.civil(first_name, DOB, email)
values('Nimesh', '1996-08-31', 'nimesh.bhattarai13@gmail.com');

-- distinct
select distinct first_name from nation.civil;

-- top 4
select top(4) first_name, year(DOB)Birth_Year from nation.civil 
order by year(DOB) desc;

-- select only civil born in 'Kathmandu'
select * from nation.civil
	where address='Kathmandu';

-- show the list of civil that were born later than 1990-01-01
select first_name, DOB, email from nation.civil
	where DOB >'1990-01-01'
	order by DOB desc;

-- show the list of the civil that were born between 1995 and 2000
select distinct first_name, year(DOB)birth_year from nation.civil
	where year(DOB) between 1995 and 2000
	order by birth_year;

-- show the list of civil that were born in gorkha and kathmandu
select first_name, address from nation.civil
	where address in('gorkha', 'kathmandu')
	order by first_name desc;

-- select people from table 'civil' whose first name starts with 's'
select first_name from nation.civil
	where first_name like 's%'
	order by first_name desc;

-- select people from table 'civil' whose last name ends with 'a'
select first_name, last_name from nation.civil
	where last_name like '%a'
	order by first_name desc;

-- shhow only the people details with no data for 'last_name'
select * from nation.civil
	where last_name is null
	order by first_name;

-- show only the name and age of each records.
select distinct (first_name+ ' ' +last_name)Name, datediff(year, DOB, getdate())Age
	from nation.civil
	order by age;