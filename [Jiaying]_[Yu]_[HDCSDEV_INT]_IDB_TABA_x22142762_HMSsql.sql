#Q2.
drop database if exists HMS;
create database HMS;
use HMS;
set foreign_key_checks = 0;

create table Doctor(
	D_id  int primary key,
	phone varchar(50),
    salary decimal(10,2),
    address varchar(50),
    D_name varchar(50),
    department varchar(50)
);

create table Room(
	R_id int primary key,
    type varchar(50),
    price int
);

create table Test(
	T_id int primary key,
    T_name varchar(50),
    T_description varchar(50),
    price decimal(10,2),
    T_date varchar(50)
);

create table Patient(
	P_id int primary key,
    P_name varchar(50),
    address varchar(50),
    phone varchar(50),
    age int,
    D_id int,
    R_id int,
    T_id int,
    foreign key(D_id) references Doctor(D_id),
    foreign key(R_id) references Room(R_id),
    foreign key(T_id) references Test(T_id)
);

create table Guardian(
	G_name varchar(20),
    phone varchar(20),
    address varchar(20),
    P_id int,
    foreign key(P_id) references Patient(P_id)
);

#Q3.
#i. Insert a new Doctor with all the relevant information
insert into Doctor (D_id, phone, salary, address, D_name, department) values (16, '306-227-2408', 1529.75, '81949 Gulseth Park', 'Aretha Sebrens', 'Neurology');
insert into Doctor (D_id, phone, salary, address, D_name, department) values (3, '734-372-3834', 108570.58, '7 Rockefeller Point', 'Ruddy Havik', 'Industrial');
insert into Doctor (D_id, phone, salary, address, D_name, department) values (4, '446-874-4249', 76898.19, '0 Sloan Street', 'Johny Dudenie', 'Books');
insert into Doctor (D_id, phone, salary, address, D_name, department) values (5, '140-230-9490', 165283.69, '045 Lake View Place', 'Robert Blackbourn', 'Jewelry');
insert into Doctor (D_id, phone, salary, address, D_name, department) values (6, '205-441-7469', 43394.05, '03 Forest Run Circle', 'Loreen Loyd', 'Shoes');
select*from Doctor;

#ii. Increases the salary of the Doctor by 10%
set sql_safe_updates = 0;
update Doctor
set salary = salary * 1.1;
select*from Doctor;
set sql_safe_updates = 1;

#iii. Display the number of patients who have a guardian
select count(Patient.P_id) as 'the number of patients who have a guardian' 
from Patient inner join Guardian
where Patient.P_id = Guardian.P_id;

#iv. List the name of doctors if they have a salary bigger than 100000
select*from Doctor
where salary > 100000.00
order by D_name DESC;

#v. List the name of patients, the test description and the test date
select Patient.P_id,P_name,
GROUP_CONCAT(CONCAT(T_description, ':', T_date))T_descriptions
from Patient
inner join Test
on Patient.P_id = Test.T_id
group by P_id,P_name;

#vi. List the number of available rooms
select sum(Patient.R_id is null) as 'available room' from Patient;

